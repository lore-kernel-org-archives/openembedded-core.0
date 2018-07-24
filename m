Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id A20C2747E9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 14:14:05 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id e19-v6so4206738qtp.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 07:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RlePOjU8UKmYmxdCowlkzbaaixs+Nbv/DhU64qK9u1g=;
	b=KcOTPL35fgYAdc7g5hBox7N7RAnWnnDOG6F1I1ijfaDx+ESquEIzeDli/g50f0xf3u
	RuHW0cpALyrOAkUNeIbE+YR3bN4+el2vAMvwJCeU6+TyQoFcQ+b5/ZBRhl/IdbZzKyhc
	sTGZGM+2TSnankwDIYkom51+hJW/CpwENsF4i8/WMus7dvCOBJ0C9yGRWw0hjjc87f4x
	2jwNDVot+jAN5UlroqAPvJWGWnEfnceO4ZRRBXJW28zbfie6k0VaUi9SgrMxCTq0sVoE
	YbfWRT/L7NXei9NHEZiNeU61hP6OzPBqYE7zJNGOOHC+XcIxgj/k5abWnBTupf51g0Tu
	lglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RlePOjU8UKmYmxdCowlkzbaaixs+Nbv/DhU64qK9u1g=;
	b=UGjjC9ob6ep5Fd2ECYRAXyQnhbsbrcZWokjYfiXSdxkT1SQ3MmVvf83VFIvKCqGSFM
	Wv18wpGn4qIiQqbqBYSSB8f8iyEcyp6WUbVj5EfqyryPQVILZbM7N2jg/oVKWFiYNUHs
	DfDn3WsxjU50d7EHPqiDqSuATVFL0cvVhEx5h9peGOjtSvQFHLxzJaJR0GW07JkUVxKe
	0Wcj8mdHLYYlO0Nc87qlZFH6tQ8wLhmaYnJEQssuJLBQptM1jStH712yMunn+M5cUoxA
	mdgDF6kIcQLOVjc8fRvgji+rwDxAC+tfwXjA7PYsGCOijnXucj3ByGG6YOKGxCFzpWlm
	hbEA==
X-Gm-Message-State: AOUpUlG3qh0oqmRP7/h7nbCeQBUrc7ItGnddlzcqusmFRNPVOAFS2y6u
	qx5Cgs6K/k63IK9Yx2YMtsqjm8MjPNFNBV/09yAgAg==
X-Google-Smtp-Source: AAOMgpcamB53v3N/kmVS7OwcKJ/OhjZOPbGjsHSn8WO5khmKbPf2Zjyph5G0rFXjFw9D9BB1plUXZ6+pHttvW/AHUSw=
X-Received: by 2002:ac8:2ad8:: with SMTP id
	c24-v6mr16744140qta.117.1532441646280; 
	Tue, 24 Jul 2018 07:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <20180723190928.27368-1-raj.khem@gmail.com>
	<d73b4b20-e8e4-658c-bef9-769142560e19@intel.com>
In-Reply-To: <d73b4b20-e8e4-658c-bef9-769142560e19@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Jul 2018 07:13:39 -0700
Message-ID: <CAMKF1sr8XxcjcSupKeeCPdZksfE8obesp4uj+U1nf=WDYxxP8w@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] defaultsetup.conf: Enable security flags+pie by default
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
X-List-Received-Date: Tue, 24 Jul 2018 14:14:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 23, 2018 at 11:42 PM Anuj Mittal <anuj.mittal@intel.com> wrote:
>
> On 07/24/2018 03:09 AM, Khem Raj wrote:
> > This has been an opt-in for so long, some distributions e.g.
> > poky-lsb uses it by default however, since most of linux
> > distros have started to default to these settings for security
> > enhancements, time has come for OE to make it default too
>
> Should be removed from poky-lsb in that case otherwise gives duplicate
> inclusion warnings.
>

yes. after this patch lands we can do that.

> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/conf/distro/defaultsetup.conf | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
> > index ca2f9178d2..352e279596 100644
> > --- a/meta/conf/distro/defaultsetup.conf
> > +++ b/meta/conf/distro/defaultsetup.conf
> > @@ -1,6 +1,7 @@
> >  include conf/distro/include/default-providers.inc
> >  include conf/distro/include/default-versions.inc
> >  include conf/distro/include/default-distrovars.inc
> > +require conf/distro/include/security_flags.inc
> >  include conf/distro/include/world-broken.inc
> >
> >  TCMODE ?= "default"
> >
>

