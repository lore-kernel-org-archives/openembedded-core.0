Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 3FC286C0F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 10:31:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47HzWl6kzvz3y;
	Wed, 20 Nov 2019 11:31:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1574245908;
	bh=nmmfJYW3jzSlfT5NkY8efZ/DZOkQ3dauURBBQnhGEyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FvYBOuf1B78nLmM/E3Rgrqxb1VB1bOsKZl5mWgGMC0CXlxW0sf5gqWTa+VW86sJTr
	drZGenNvL73XhrNAqp1lyB1FRykfuW6QYIyquawNF8wRI3tBkTvcpCBHBXFKwbaBZc
	TRYakj/MeMiX32clyTzjYnxR83U96ayZun3BoGSH+gHCNTDt2h0EtFOzmoxZYrowgT
	xS6MyaLt1T5O49ZY+J0eVVQz19DxfPB9v7tdMDk715qA1vDSoYsn+Yi/iyrHe+NU1W
	5i5sSSoajggnl3BZK72ZbfKl0/rgxVn27Kna4L18kW2j6jfAySWQLqMX5wWo3fvgM5
	4bIXlii/Wc9Xqeg8PaYQYWNmqwVwx5TRPlRkrCTAs4Am2KQGOTwqEV2JiH7bzXKiS0
	0vIQXIAqqAZOYYfbhaPqU4nfwgAsih+JRARnQ1ftjD4auELGko7fEzw9i3ZqkAYFND
	xuRKspAzwpwWxzriYRZI3ngZtFC4YpkMowAhdMwYMg/iYA31B5o2+Tvdkd30+5Qbah
	hXk6sLRjMnIDx7/7U2gGPge64uIJ4CQtTs/FKKOn+TFlXGSPnKGtyktAq5vEzlashZ
	WvbbWTSQtU7El/OsLfztglhGt3Gh03W2YGbWAg240twPnV5i/ILf8JS9rELa1rs9pq
	ImYRaQZt/3DVhtTaGniTDgtg=
Date: Wed, 20 Nov 2019 12:31:45 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20191120103145.GA23054@localhost>
References: <20191120091258.30350-1-stefan@agner.ch>
	<20191120091258.30350-2-stefan@agner.ch>
MIME-Version: 1.0
In-Reply-To: <20191120091258.30350-2-stefan@agner.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4 2/2] image_types: add Zstandard conversion support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Nov 2019 10:31:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Nov 20, 2019 at 09:12:58AM +0000, Stefan Agner wrote:
>...
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -59,6 +59,8 @@ XZ_INTEGRITY_CHECK ?= "crc32"
>  
>  ZIP_COMPRESSION_LEVEL ?= "-9"
>  
> +ZSTD_COMPRESSION_LEVEL ?= "-3"
> +
>...

Why -3 and not -19 ?

Compression speed is not a real issue, and AFAIR decompression
tends to be slightly faster with smaller compressed size.
Plus the benefit that smaller images are faster to load
from network/storage.

cu
Adrian

