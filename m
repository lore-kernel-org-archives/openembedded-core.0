Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8C4A171A92
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 09:43:34 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id c85so92021553wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2017 01:43:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=49djZ1tCtYz4p1Jb+cAvEnKs/LjcVXSpWBuPlllcad0=;
	b=ftTV6olzGBEuNimQjjVmrulSgzgqbhFdKHZlu6aumEGZhlYpsz4QZNM0pRVCttn3AJ
	Hd0d/xTSXDdsXHW3VcK2WOwef0C0kjF2T+qn8utN1M9PXQE2lhFo3trz+v4fTRIyza7/
	92tUpqSCIQe6Dlw2sHNItjKbXfyW8FweBT5UJXkgqkrt+p9mYUV+oKRdhLmUEE44qQcU
	0O7h5pf2LDdwjAOrlH4tCPqlS/TTVyx53TPPKHXY4Zxr/DheT5wKqkCrOcZ0NWwKnqo2
	k3XHzNwk75cgIGmSwJ+ove67wFLskxGRKvKg/rcYMZzZIjZebdwGP7oe3ySf1onGscWW
	Z4MQ==
X-Gm-Message-State: AIkVDXKSVS7ZICoIX9BQsuwwSD8gRxfaE9VlTqtmZomroMHyevV1MkdgkuYmvkRQ7Sv9Lw==
X-Received: by 10.223.128.77 with SMTP id 71mr11419381wrk.48.1483955014443;
	Mon, 09 Jan 2017 01:43:34 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	x188sm17824940wmx.4.2017.01.09.01.43.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 09 Jan 2017 01:43:33 -0800 (PST)
Message-ID: <1483955012.7594.4.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Mon, 09 Jan 2017 09:43:32 +0000
In-Reply-To: <alpine.LFD.2.20.1701060831140.32403@ca624034.mitel.com>
References: <alpine.LFD.2.20.1701060831140.32403@ca624034.mitel.com>
X-Mailer: Evolution 3.22.3-1 
Mime-Version: 1.0
Subject: Re: could OE maybe point out when a recipe has upper case letters in it?
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
X-List-Received-Date: Mon, 09 Jan 2017 09:43:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-01-06 at 08:34 -0500, Robert P. J. Day wrote:
>   in a fit of silliness, i created some packagegroup recipes and,
> without thinking, had the string "OE" as part of the recipe file name,
> and was baffled when i kept getting errors that trying to add that
> packagegroup to my image was failing due to an "empty" package.
> 
>   it was doubly mystifying since i had been using wind river linux
> where the packagegroup names contained the string "WRL" and that
> worked just fine. changing the "OE" to "oe" appears to have solved the
> problem.
> 
>   thoughts? why "WRL" worked with wind river linux, and "OE" failed
> with a poky build? i don't plan on making that mistake again.

I think this depends on the package format used - AFAIR rpm allows capital
letters in package names, whereas ipk and deb don't.

Cheers,
A.


