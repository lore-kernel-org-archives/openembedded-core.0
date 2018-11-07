Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9FD6479DBC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Nov 2018 13:55:20 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id b7-v6so22893870itd.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Nov 2018 05:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IoStT6hpY/TH8rKpsA7HAyyk5XmUuKOU7gsBkXGBoDQ=;
	b=DjMCU1Q2S/Ye1uYM89zCbxOWyvWd7qOVfq+JXJ02m2G4ZMsBdFhGRd02EdZ0C0qWU8
	5z2d5n7vt0FqG5scmfdb238uHdeYBUV/ccrnrObM5lgdNtttJzes/vb1g3Eue9XY87ri
	VTxoxK7N8SiPqEzD0OMQzHf+RZKKMl0nJBjkc7PuqohgRKBzvGuxLPtCGAUWCz9DjMdg
	6/7Hz5lWYOhypNtTSt1XDGfMmocWeMlNencxKWzYjRJfwzwM0LBKmwjD4fBWL2Zwxar4
	Fjp/js3iM1JPpfCV0yKiJFFyanrxXmzMXsuYtuGCLj/VhpNqlycfr4tiwpjUpeOnzl30
	HdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IoStT6hpY/TH8rKpsA7HAyyk5XmUuKOU7gsBkXGBoDQ=;
	b=b69xmjy7t7EQt1JxbfGuSpd78yLBgekQDsdPD9UDLJ4l36hkZSP/JFZIbHCzdFxknZ
	aIof5ea6TNZbG+WsOAZlTAKAImW4ZuezIe2PS3ogYiszOKxRrcHUn/lMyCG5xkR2SUKv
	3S3AusvVoH37RI2a45DJO9OYpIFyCibsZjhmddmDXZwqPsIO/VyZdr1f03pdaWo/EJsD
	kbKbc6H8n08Ne6QY5Ythg3rbXymsM0S2ezEXVb0RkYcmwhttkEyH21LEjQISoY8Zu3Be
	D5rIPpHk6GKclS34dwbfdcjgqbAydAslA3mgSaKoHGQvZGsOn0xkC0xohgbWgqfLnzmE
	rWBQ==
X-Gm-Message-State: AGRZ1gKSJEBW0ND+xaRgv/W7Fx1NLT1tXnLFm9TEIDH6vzqz7FrkDmC4
	gzCuo05UgiVpRagzrXDIkfPSQ0VxTVFvL1TMdOxk+A==
X-Google-Smtp-Source: AJdET5fTbV4LP2/3wTf2TCbi9QoGqdFVtSGWAF+LwvIjIRzGmehEl7INPdpVvY7XSeYe0Yv3P12rg6z5s1tNlNTzPwI=
X-Received: by 2002:a24:9142:: with SMTP id
	i63-v6mr287292ite.130.1541598921759; 
	Wed, 07 Nov 2018 05:55:21 -0800 (PST)
MIME-Version: 1.0
References: <20181009110019.16171-1-ross.burton@intel.com>
	<162e1306-d521-ebe9-c969-f55fe86afa9e@vaisala.com>
In-Reply-To: <162e1306-d521-ebe9-c969-f55fe86afa9e@vaisala.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 7 Nov 2018 13:55:10 +0000
Message-ID: <CAJTo0LYHaKjCNqMpkcdPFTUtAYXKk13JPRdyWXK50gQaF7wKNA@mail.gmail.com>
To: Niko Mauno <niko.mauno@vaisala.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: add missing locale dependencies to PN-ptest
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
X-List-Received-Date: Wed, 07 Nov 2018 13:55:21 -0000
Content-Type: text/plain; charset="UTF-8"

Sounds about right.  Not sure what would count as a solution here?

Ross
On Wed, 7 Nov 2018 at 12:40, Mauno Niko <niko.mauno@vaisala.com> wrote:
>
> On 10/09/2018 02:00 PM, Ross Burton wrote:
> > The test suite skips several tests if the required locales are not found, so add
> > them as dependencies of glib-2.0-ptest.
> >
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >   meta/recipes-core/glib-2.0/glib.inc | 13 +++++++++++++
> >   1 file changed, 13 insertions(+)
> >
> > diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
> > index ad4f2aebd71..f78aa9bfe6d 100644
> > --- a/meta/recipes-core/glib-2.0/glib.inc
> > +++ b/meta/recipes-core/glib-2.0/glib.inc
> > @@ -152,6 +152,19 @@ RDEPENDS_${PN}-ptest_append_libc-glibc = "\
> >               glibc-gconv-iso8859-15 \
> >               glibc-charmap-invariant \
> >               glibc-localedata-translit-cjk-variants \
> > +            locale-base-tr-tr \
> > +            locale-base-lt-lt \
> > +            locale-base-ja-jp.euc-jp \
> > +            locale-base-fa-ir \
> > +            locale-base-ru-ru \
> > +            locale-base-de-de \
> > +            locale-base-pl-pl \
> > +            locale-base-hr-hr \
> > +            locale-base-el-gr \
> > +            locale-base-fr-fr \
> > +            locale-base-fr-fr \
> > +            locale-base-es-es \
> > +            locale-base-en-gb \
> >              "
> >
> >   INSANE_SKIP_${PN}-ptest += "libdir"
> >
>
> Having GLIBC_GENERATE_LOCALES = "en_US.UTF-8" and 'ptest' in DISTRO_FEATURES, it would seem after this commit I'm seeing following warnings during bitbake:
>
>   WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-de-de, but it isn't a build dependency? [build-deps]
>   WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-el-gr, but it isn't a build dependency? [build-deps]
>   WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-en-gb, but it isn't a build dependency? [build-deps]
>   WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-es-es, but it isn't a build dependency? [build-deps]
>   WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-fa-ir, but it isn't a build dependency? [build-deps]
>   WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-fr-fr, but it isn't a build dependency? [build-deps]
>   WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-hr-hr, but it isn't a build dependency? [build-deps]
>   WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-ja-jp.euc-jp, but it isn't a build dependency? [build-deps]
>   WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-lt-lt, but it isn't a build dependency? [build-deps]
>   WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-ru-ru, but it isn't a build dependency? [build-deps]
>   WARNING: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-tr-tr, but it isn't a build dependency? [build-deps]
>
> If I switch GLIBC_GENERATE_LOCALES to 'all' these warnings no longer appear.
>
> -Niko

