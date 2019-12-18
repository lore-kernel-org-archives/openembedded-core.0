Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 15C2A90DD5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 21:02:55 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id dc19so2799160edb.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 13:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bSUJRNepL0Cq5Z8Xs4HMDyQWNE1sKcjspx+4LXNbEr8=;
	b=rvx3DcsLK6ASl2JBXcplUx4LqpGlnRFlb46U656H7GQOlKeeFDyqlfEdUlzTxDALRi
	br2JKkyfGnLUSj4pSQuMhv0ELVU3O4Q2AtFTxOjs3gH2PcO8IRyVU99l7XHyHMQAzNMk
	y6ibm3T8XKDjhx749qQKn/402Gj7Oxrl8iDWkXB8eUVGv6mJh2Op9SWURrnUJzKiWTr+
	h6QY0Z0kIIdUOIr72H/eviUPptfbMGh793Xyzg3kppHGrhTaH6DYdREoguEUWB5A6yRK
	jaO11Abqga/Kmqlknx+NEnVuUJF98vsbN53ArgYP9GrNKjsnalvg6q9CiVqf6+/J+YWh
	McsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bSUJRNepL0Cq5Z8Xs4HMDyQWNE1sKcjspx+4LXNbEr8=;
	b=pJXsu/s5vtJEmT307ewFvNowIJjhpuVP5aHeGgtxAWpuE0y5JWlUbHhqZIXj+ozu7B
	fe5VsqSslHGWS4XXg76gl9PYyydILkX6spWEXOciwsHnq0GpxFQphSaR2qitK/KYYBKX
	YdkoaFcj8bKM0RTgKilmnqyT5JCk28ASqYdmDwoy5J0Cs3xMqtcjanm9qLegaO1xl9Qb
	FdfbDPegmzhXT4Yylt1bzC9YnTWXbgW1XLumlPUOsSeHfmraXVLG3TGWxxIYmfS3pD6v
	xuU90y9RmG/0kXqIyr5E2uygWd1eFilnB23/tJEH/qDR0HXWGIM4rIL3Z9V9LMVn9sbN
	zfag==
X-Gm-Message-State: APjAAAWgOM8VmqQMagZ/g0QSmkUdTGK3d8kIh9+P8wUcGFGrOZUZB9Er
	0mn6lN+L0SyOWSUlFLSsyKjMPtrcSsDkiwDLses=
X-Google-Smtp-Source: APXvYqyn4PK1F7df/AnohjZK0NJ9x8zOQL4TswSmbdxB1BtLZJindp0Wgq1SX+h3Kv+aqBFy5AdY6Sveu3Ndjk0ROK8=
X-Received: by 2002:a50:9f4d:: with SMTP id b71mr4903662edf.179.1576702976674; 
	Wed, 18 Dec 2019 13:02:56 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576677592.git.bruce.ashfield@gmail.com>
	<fa2bc2d58f4a1cf9de5322b6aacf1362aa47e044.1576677592.git.bruce.ashfield@gmail.com>
	<8722bcef-d607-b061-394e-5585bfde7dab@gmail.com>
	<CADkTA4Pc1Q7c-zW1udQryVOsvgga74wfQd=O=sc_jiDmdyzA4w@mail.gmail.com>
	<41b44fed-0739-cd1a-6fc1-070e73c50e98@gmail.com>
In-Reply-To: <41b44fed-0739-cd1a-6fc1-070e73c50e98@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 18 Dec 2019 16:02:45 -0500
Message-ID: <CADkTA4McL0c2ZKx96Oa4BoYj6LGvHT0oni5Z0=PtBt6Y8BNZzQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/9] linux-yocto-dev: bump to v5.4+
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
X-List-Received-Date: Wed, 18 Dec 2019 21:02:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 18, 2019 at 3:07 PM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 12/18/19 11:48 AM, Bruce Ashfield wrote:
> > On Wed, Dec 18, 2019 at 2:11 PM akuster808 <akuster808@gmail.com> wrote:
> >>
> >>
> >> On 12/18/19 6:07 AM, bruce.ashfield@gmail.com wrote:
> >>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >>>
> >>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >>> ---
> >>>  meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> >>> index 163f280560..3b5c9ddc59 100644
> >>> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> >>> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> >>> @@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
> >>>  SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
> >>>  SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
> >>>
> >>> -LINUX_VERSION ?= "5.3-rc+"
> >>> +LINUX_VERSION ?= "5.4-rc+"
> >> Why is this not 5.5 ? 5.4 is the next stable and @ 5.4.5
> > Check the date on the commit ;) I had sent this much earlier in the
> > year and it fell through the cracks.
> so it has. My apologies.
>
> >
> > -dev will be 5.5 shortly, once I've sorted out the mips64 boot issue
> Not sure if its related but when I updated thuds 4.18 kernel to the
> latest and it failed on mips too. So something between 4.18.33 to .45
> introduced an issue.
>

Interesting!

Thanks for the data point, I'll have a look to see if anything is common.

Bruce

> I have not had the time to dig into it.
>
> - armin
> > with 5.4 (and if you check linux-yocto-dev, it is already 5.4.5)
> >
> > Bruce
> >
> >> - armin
> >>>  LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
> >>>  PV = "${LINUX_VERSION}+git${SRCPV}"
> >>>
> >
>
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

