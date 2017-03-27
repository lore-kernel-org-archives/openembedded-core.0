Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f177.google.com (mail-ot0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 87B1772F94
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 13:19:27 +0000 (UTC)
Received: by mail-ot0-f177.google.com with SMTP id y88so30034876ota.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 06:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=itsm1+3mPnpBgXb4eB2F2Dm3FNjEkKY/529ogR3HJkA=;
	b=i0LKTwrCL/Z3kaHzJM8SUnGzCYSip0udg1JV9JPj11fKvEa9xwxeag5i4MmZwDppat
	9qUEz3nrKPQ7oUvNMnUfUigiPxaywB5cLu4AMb9CmZ6iE0wesSs4w4xsXTSdxCVZay3e
	JyJ7bXfmhNJSmPN3x4ZGHqUeymnXhMy2HEvO5PfIwU7J7LAxGczdJ2jIuNY8SQBTGoJY
	3/Skr00Fnck70v+15L8trVaYIB4EuDMiB2nT25C+8x2c9W3oZCsRBIFF4YZHaLrS9ODa
	kc8Dauz2g4Q9d3IKL1ppTrrwBtTR4xTtl5MteCDsYy0FGvyjYZ5x+HY6DrFhcXXfpuIZ
	jgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=itsm1+3mPnpBgXb4eB2F2Dm3FNjEkKY/529ogR3HJkA=;
	b=ngKHmd5f8slnWbDkKjjqrbqmXJ5yFtPA8yZITKxfJW/H6WpZBdljeY4Y63is4c0DDV
	liQLou/zUsX6SAorSV/EkPtAtReE822ZoMOLsx+EONdJr6prZWp9yvFhuyB2lDfIWefu
	usa3QbPBbq/ua8St2ur5Ukj9XLHq1ToZoPRIbE258wGlOmb6YP2mi/Q4v/ceuw230w+b
	GMWqty2egn4D0csCmgScu1u2ZdW3iVX/Fh7C/s/YsdNXis6lMUxd/TWhks4AHMdSHCOm
	1+Be/2i9ELuh48zbZba5ujP2695eSdWRthGeXNVBQje+mg1gPi600GWoxfdIw8sDLi9s
	Ro2Q==
X-Gm-Message-State: AFeK/H17ixuJFsThgI9QVz0jFL7qfSc3sYByCiapVdL5wnYPigLx/rKEdaI26+jUBnB/rw==
X-Received: by 10.157.61.202 with SMTP id l68mr12405859otc.242.1490620768192; 
	Mon, 27 Mar 2017 06:19:28 -0700 (PDT)
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com.
	[209.85.218.50])
	by smtp.gmail.com with ESMTPSA id h55sm202137otd.1.2017.03.27.06.19.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Mar 2017 06:19:27 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f50.google.com with SMTP id r203so22780521oib.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 06:19:26 -0700 (PDT)
X-Received: by 10.202.196.71 with SMTP id u68mr11141275oif.210.1490620766636; 
	Mon, 27 Mar 2017 06:19:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.79.203 with HTTP; Mon, 27 Mar 2017 06:19:26 -0700 (PDT)
In-Reply-To: <20170326211438.GI15664@denix.org>
References: <20170326200813.23705-1-otavio@ossystems.com.br>
	<20170326211438.GI15664@denix.org>
Date: Mon, 27 Mar 2017 10:19:26 -0300
X-Gmail-Original-Message-ID: <CAP9ODKprtiWwTEYucC72P6Q3tvrEeqKeKnCMrcnKTdZ+J8mCVQ@mail.gmail.com>
Message-ID: <CAP9ODKprtiWwTEYucC72P6Q3tvrEeqKeKnCMrcnKTdZ+J8mCVQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to 2017.03 release
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
X-List-Received-Date: Mon, 27 Mar 2017 13:19:27 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Mar 26, 2017 at 6:14 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Sun, Mar 26, 2017 at 05:08:13PM -0300, Otavio Salvador wrote:
>> Ths 2017.03 release is out since March 13th 2017 and is the latest
>> stable release prior Pyro release.
>
> At least 2 typos in the description...

Sent a v2.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

