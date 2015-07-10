Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 619657589F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 22:37:04 +0000 (UTC)
Received: by qkdv3 with SMTP id v3so21214189qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 15:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zkfT0ybvMvTkqu67k/1dcQDEqbXC7OJb3CV+zkWTRLw=;
	b=ZermuM9/bMYy1a8+PhgMRjpGFpNCcrLIgrorqgf0gvjQZhMKzVOSCK5JuKf8Hrbz5T
	URKQZMECEOP6LT3iTpyeC5B4SB/MwsEDN1K532yW6etl92ZpPHL8TF+oWkjayVqgUSjZ
	qt7/d0xrmrnj3pNUw599o9xjhPl6H4mQdO/7FAR9yC3845KWCiZ+w+cg5/ps2lYEdt/t
	WEghAtb+2aQB6ky3MAKt5I0ZXhyg9FH+tLiN9gnPwxVIrGaQc9IdierHyoU4M/jd2a5g
	i10n8gERT1LMl/tXjbD5/jJN/6m14H57y+Ne1qnJvERUnbGVBIOtfnn9z7nzmdKWSxir
	fUNg==
X-Gm-Message-State: ALoCoQlaSYMEFBJlCA50UhqiM9m1rbmviMt63TrK0urLrXDz5X72lEMypIdVN/XGvJ9Q8/GaNgoI
X-Received: by 10.55.18.197 with SMTP id 66mr37110393qks.13.1436567824728;
	Fri, 10 Jul 2015 15:37:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 10 Jul 2015 15:36:45 -0700 (PDT)
In-Reply-To: <1436537056-4626-1-git-send-email-pau.espin@aweurope.be>
References: <1436537056-4626-1-git-send-email-pau.espin@aweurope.be>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Jul 2015 23:36:45 +0100
Message-ID: <CAJTo0LbpxBHh8mv7qqKMkVmBcoQ=ckjt3+4ipahMwtqUUkZr1A@mail.gmail.com>
To: Pau Espin Pedrol <pau.espin@aweurope.be>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] pulseaudio: add systemd to PACKAGECONFIG if enabled in DISTRO_FEATURES
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
X-List-Received-Date: Fri, 10 Jul 2015 22:37:07 -0000
Content-Type: multipart/alternative; boundary=001a11474faae38f7e051a8d02c8

--001a11474faae38f7e051a8d02c8
Content-Type: text/plain; charset=UTF-8

On 10 July 2015 at 15:04, Pau Espin Pedrol <pau.espin@aweurope.be> wrote:

> +FILES_${PN}-server = "${bindir}/pulseaudio ${bindir}/start-*
> ${sysconfdir} ${bindir}/pactl */udev/rules.d/*.rules
> ${libdir}/systemd/user/*"
>

That's going to break in multiarch builds, ie systemd units go into
$prefix/lib even if $libdir is $prefix/lib64.

(looks like we should add nonarch_libdir to bitbake.conf to codify this)

Ross

--001a11474faae38f7e051a8d02c8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 July 2015 at 15:04, Pau Espin Pedrol <span dir=3D"ltr">&lt;<a href=3D=
"mailto:pau.espin@aweurope.be" target=3D"_blank">pau.espin@aweurope.be</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1on" class=
=3D"a3s" style=3D"overflow:hidden">+FILES_${PN}-server =3D &quot;${bindir}/=
pulseaudio ${bindir}/start-* ${sysconfdir} ${bindir}/pactl */udev/rules.d/*=
.rules ${libdir}/systemd/user/*&quot;<br></div></blockquote></div><br>That&=
#39;s going to break in multiarch builds, ie systemd units go into $prefix/=
lib even if $libdir is $prefix/lib64.</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">(looks like we should add nonarch_libdir to=
 bitbake.conf to codify this)</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Ross</div></div>

--001a11474faae38f7e051a8d02c8--
