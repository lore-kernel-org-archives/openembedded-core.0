Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id E0562601A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jun 2014 17:30:51 +0000 (UTC)
Received: by mail-yk0-f173.google.com with SMTP id 142so2166476ykq.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jun 2014 10:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=5iAnqOMAJy1YiA62nhebGHeuPZz4pyEOYa17xUGEtAM=;
	b=Ejq/14iAbSxuDAckyY1SSVSef6XCSRbemtAqFoE3FaA5yunxZem+BO1H5Pc7V05Obh
	wvZNOnBaMMrf97NYU789xivpBemGUuvaed16MRufQELYmTLfSwjD9IvG2mV2TCORAJRj
	iZa9756Wp6Mx/nYgy73Jf/4zxQxwf5IIoqKcoNI6LWlhCcqbTrYSm5RMxiwWsvSTqq26
	v9FttwYbYdsRtxsJO/C4rrnwR98BwbI9Rwxh3Yg9GO5ZB9x2AE8s/NuY78HQAeiVhn6V
	AV4to3P7i5Q5xEP9TZmzIwjHv3YJvTRijz7KqMeAvQ+rZXZoBAItodtvMCYFuRFbahhi
	WRFw==
MIME-Version: 1.0
X-Received: by 10.236.207.225 with SMTP id n61mr16267738yho.148.1403803852036; 
	Thu, 26 Jun 2014 10:30:52 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.209.68 with HTTP; Thu, 26 Jun 2014 10:30:51 -0700 (PDT)
In-Reply-To: <1403713196-22214-1-git-send-email-denis@denix.org>
References: <1403713196-22214-1-git-send-email-denis@denix.org>
Date: Thu, 26 Jun 2014 14:30:51 -0300
X-Google-Sender-Auth: 71zAvNqsdWFW4E_Jc2ukSPj7Mhk
Message-ID: <CAP9ODKrur+543TNia1UH1KhioWVHAD=fSN1QYLh272jrq8LzgA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [daisy][PATCH 1/2] udev: update init script for conditional probing of platform bus
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
X-List-Received-Date: Thu, 26 Jun 2014 17:30:58 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 25, 2014 at 1:19 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Make probing of "platform" bus conditional based on PROBE_PLATFORM_BUS
> variable from /etc/default/udev-cache on subsequent boots when udev
> cache is used. PROBE_PLATFORM_BUS has to be set to "yes" in order to
> force probing on every boot, otherwise it uses the old default behaviour
> of probing it just the first time.
>
> This is helpful on modern SoCs where most of the low level peripheral
> drivers are registered on the platform bus and need to be probed to load
> the necessary modules and enable the connected buses and subsystems.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> [Backport from OE-Core/master 70a695735e0a7d14448f2f5a9986bfe105210a91]
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

