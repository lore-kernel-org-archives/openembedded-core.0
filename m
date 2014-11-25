Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id BEBE772051
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 21:01:11 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id s7so1010611qap.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 13:01:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=gkFc8Qji6z+ifJlZg6cvlUiKFLrI+MLfohvPToVWHaI=;
	b=Zmlnc61jHcK3vlSqxrETQNd++GYNPPRZkDDslYy7wlBYeiXo+rFMVXOYNuBDv+VPDs
	/4VZe/44ADnKf5Sy9eL3P0D7hYVNMRbRWXkQ2swpp28E3lUuU56dwEWa7pwLFqEzoF9h
	89b9R+idaINQAiOXuxgCG1q6428FBDf/n8VCs4Zh0KtfydOuxkgoIwm99MmiAl+CiPkh
	8veSabwCzAyLjnPZRleCycjGp4/25lhrZ/E2aiW5v9VCU+Ka+srYuVVo6RIim40HcyZt
	S9e3UD43q0bpSdx0OoSqPuxW6FaG40NMNuLtNBrgnoB2y9cE8AXRZPUWtqINUyLkYe8X
	H0JQ==
X-Gm-Message-State: ALoCoQk9kJRZOyiO5L9wak4+Z1MnrUQijJdCMQQl6JaYxQ17kMnGf9J4b56szJzp7Zlrd3ZwnWEE
X-Received: by 10.140.94.233 with SMTP id g96mr39848314qge.77.1416949272344;
	Tue, 25 Nov 2014 13:01:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Tue, 25 Nov 2014 13:00:52 -0800 (PST)
In-Reply-To: <042E875E1B5D414CA9BB78B7D4FA691C13CE6FEE@IRSMSX102.ger.corp.intel.com>
References: <042E875E1B5D414CA9BB78B7D4FA691C13CE6FEE@IRSMSX102.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 25 Nov 2014 21:00:52 +0000
Message-ID: <CAJTo0LbQ2VO-J2tmJ0GVpWjKSqCpHqp8Kg47m1a9wX0JMK3b6w@mail.gmail.com>
To: "Musat, George L" <george.l.musat@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta-yocto/distro: Updated SANITY_TESTED_DISTROS.
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
X-List-Received-Date: Tue, 25 Nov 2014 21:01:15 -0000
Content-Type: multipart/alternative; boundary=001a113a7bd00b104b0508b5366f

--001a113a7bd00b104b0508b5366f
Content-Type: text/plain; charset=UTF-8

Hi George,

This patch got totally mangled - can you resend it (or push to a repo)?

Ross

On 19 November 2014 at 07:43, Musat, George L <george.l.musat@intel.com>
wrote:

>  Removed Poky-1.4, Poky-1.5, Ubuntu-13.10, Fedora-19,
> CentOs-6.4,Suse-LINUX-12.2. Replaced the list of Debian-7.x with wildcard.
>
>
>
> Signed-off-by: Lucian Musat <george.l.musat@intel.com>
>
> ---
>
> meta-yocto/conf/distro/poky.conf | 14 +-------------
>
> 1 file changed, 1 insertion(+), 13 deletions(-)
>
>
>
> diff --git a/meta-yocto/conf/distro/poky.conf
> b/meta-yocto/conf/distro/poky.conf
>
> index eaf06d3..295895f 100644
>
> --- a/meta-yocto/conf/distro/poky.conf
>
> +++ b/meta-yocto/conf/distro/poky.conf
>
> @@ -73,25 +73,13 @@ CONNECTIVITY_CHECK_URIS ?= " \
>
>               http://bugzilla.yoctoproject.org/report.cgi"
>
>
>
>  SANITY_TESTED_DISTROS ?= " \
>
> -            Poky-1.4 \n \
>
> -            Poky-1.5 \n \
>
>              Poky-1.6 \n \
>
>              Poky-1.7 \n \
>
>              Ubuntu-12.04 \n \
>
> -            Ubuntu-13.10 \n \
>
>              Ubuntu-14.04 \n \
>
> -            Fedora-19 \n \
>
>              Fedora-20 \n \
>
> -            CentOS-6.4 \n \
>
>              CentOS-6.5 \n \
>
> -            Debian-7.0 \n \
>
> -            Debian-7.1 \n \
>
> -            Debian-7.2 \n \
>
> -            Debian-7.3 \n \
>
> -            Debian-7.4 \n \
>
> -            Debian-7.5 \n \
>
> -            Debian-7.6 \n \
>
> -            SUSE-LINUX-12.2 \n \
>
> +            Debian-7.* \n \
>
>              openSUSE-project-12.3 \n \
>
>              openSUSE-project-13.1 \n \
>
>              "
>
> --
>
> 1.9.1
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a113a7bd00b104b0508b5366f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi George,<div><br></div><div>This patch got totally mangl=
ed - can you resend it (or push to a repo)?</div><div><br></div><div>Ross</=
div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 19 N=
ovember 2014 at 07:43, Musat, George L <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:george.l.musat@intel.com" target=3D"_blank">george.l.musat@intel.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div>
<p>Removed Poky-1.4, Poky-1.5, Ubuntu-13.10, Fedora-19, CentOs-6.4,Suse-LIN=
UX-12.2. Replaced the list of Debian-7.x with wildcard.<u></u><u></u></p>
<p><u></u>=C2=A0<u></u></p>
<p>Signed-off-by: Lucian Musat &lt;<a href=3D"mailto:george.l.musat@intel.c=
om" target=3D"_blank">george.l.musat@intel.com</a>&gt;<u></u><u></u></p>
<p>---<u></u><u></u></p>
<p>meta-yocto/conf/distro/poky.conf | 14 +-------------<u></u><u></u></p>
<p>1 file changed, 1 insertion(+), 13 deletions(-)<u></u><u></u></p>
<p><u></u>=C2=A0<u></u></p>
<p>diff --git a/meta-yocto/conf/distro/poky.conf b/meta-yocto/conf/distro/p=
oky.conf<u></u><u></u></p>
<p>index eaf06d3..295895f 100644<u></u><u></u></p>
<p>--- a/meta-yocto/conf/distro/poky.conf<u></u><u></u></p>
<p>+++ b/meta-yocto/conf/distro/poky.conf<u></u><u></u></p>
<p>@@ -73,25 +73,13 @@ CONNECTIVITY_CHECK_URIS ?=3D &quot; \<u></u><u></u><=
/p>
<p>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 <a href=3D"http://bugzilla.yoctoproject.org/report.cgi" target=3D"_b=
lank">
http://bugzilla.yoctoproject.org/report.cgi</a>&quot;<u></u><u></u></p>
<p><u></u>=C2=A0<u></u></p>
<p>=C2=A0SANITY_TESTED_DISTROS ?=3D &quot; \<u></u><u></u></p>
<p>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Poky=
-1.4 \n \<u></u><u></u></p>
<p>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Poky=
-1.5 \n \<u></u><u></u></p>
<p>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 Poky-1.6 \n \<u></u><u></u></p>
<p>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 Poky-1.7 \n \<u></u><u></u></p>
<p>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 Ubuntu-12.04 \n \<u></u><u></u></p>
<p>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ubun=
tu-13.10 \n \<u></u><u></u></p>
<p>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 Ubuntu-14.04 \n \<u></u><u></u></p>
<p>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Fedo=
ra-19 \n \<u></u><u></u></p>
<p>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 Fedora-20 \n \<u></u><u></u></p>
<p>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Cent=
OS-6.4 \n \<u></u><u></u></p>
<p>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 CentOS-6.5 \n \<u></u><u></u></p>
<p>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Debi=
an-7.0 \n \<u></u><u></u></p>
<p>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Debi=
an-7.1 \n \<u></u><u></u></p>
<p>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Debi=
an-7.2 \n \<u></u><u></u></p>
<p>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Debi=
an-7.3 \n \<u></u><u></u></p>
<p>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Debi=
an-7.4 \n \<u></u><u></u></p>
<p>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Debi=
an-7.5 \n \<u></u><u></u></p>
<p>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Debi=
an-7.6 \n \<u></u><u></u></p>
<p>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SUSE=
-LINUX-12.2 \n \<u></u><u></u></p>
<p>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Debi=
an-7.* \n \<u></u><u></u></p>
<p>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 openSUSE-project-12.3 \n \<u></u><u></u></p>
<p>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 openSUSE-project-13.1 \n \<u></u><u></u></p>
<p>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 &quot;<u></u><u></u></p>
<p>-- <u></u><u></u></p>
<p>1.9.1<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>

<br>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
<br></blockquote></div><br></div>

--001a113a7bd00b104b0508b5366f--
