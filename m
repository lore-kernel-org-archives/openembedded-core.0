Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id E5D9560557
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 14:55:14 +0000 (UTC)
Received: by qgeg89 with SMTP id g89so116254197qge.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jul 2015 07:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=cW0t19PkN/xmxaBFvAEDw0+d1g0WL2R/emxxHruNFpk=;
	b=PPaiJFsWmtwbjo+ptb4pYkdE8PBZYMqiJtQCuaIvRobgBb3FKNmLA/eTmen20PQWfR
	XKO5ecjn+dR8GE87D6LjYj2YUcH62lD2eX7i8ChFKE/3/O4CUCbet8YisoWGU9AVwkyX
	v6L7M69fyc36ghtqxYzrtpjTnQ7Lo/3QC/lNNA4H9FkFE/pcC94KoP05iJu6PxB7lIzq
	2niOoMWCNePA+iCCDIiF+uxpCbm2uUjdQro5YxFI+iUp/JDNdzzucS8XrWmLfTeuRyj0
	dxULs69UJQQn7Gg9bh+PK37CMtk9biV/5y74DxqX04aTNT9Z0IM722ZrHN100u7/TkB4
	EVQg==
X-Gm-Message-State: ALoCoQnOuy4p4hnltDtEXSCajmHqE9nt6lDX/1grC824oZ46phq098blSaHjBE5D+ymy0Zcw13Ux
X-Received: by 10.140.231.19 with SMTP id b19mr25412429qhc.22.1436453714674;
	Thu, 09 Jul 2015 07:55:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 9 Jul 2015 07:54:55 -0700 (PDT)
In-Reply-To: <3a571bfe258bda28dd34a61b2a6bf323a06ca911.1436178756.git.liezhi.yang@windriver.com>
References: <cover.1436178756.git.liezhi.yang@windriver.com>
	<3a571bfe258bda28dd34a61b2a6bf323a06ca911.1436178756.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Jul 2015 15:54:55 +0100
Message-ID: <CAJTo0LZYJEmmPsgiQc8R2whGkOH3vQdAXn9vwXz7W8nYA9KUyA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gcc-target 5.1: fix for libcc1
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
X-List-Received-Date: Thu, 09 Jul 2015 14:55:16 -0000
Content-Type: multipart/alternative; boundary=001a11c12f006661e7051a727158

--001a11c12f006661e7051a727158
Content-Type: text/plain; charset=UTF-8

On 6 July 2015 at 11:35, Robert Yang <liezhi.yang@windriver.com> wrote:

> * Install libcc1.so and libcc1plugin.so to
>   $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version) as lto-plugin
> did.
>

Why are plugin libraries going into $libexecdir?  libexecdir is for
"binaries that the user doesn't directly execute", not for libraries or
plugins.

Ross

--001a11c12f006661e7051a727158
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 July 2015 at 11:35, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3cy" clas=
s=3D"a3s" style=3D"overflow:hidden">* Install libcc1.so and libcc1plugin.so=
 to<br>
=C2=A0 $(libexecdir)/gcc/$(target_noncanonical)/$(gcc_version) as lto-plugi=
n did.</div></blockquote></div><br>Why are plugin libraries going into $lib=
execdir? =C2=A0libexecdir is for &quot;binaries that the user doesn&#39;t d=
irectly execute&quot;, not for libraries or plugins.</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c12f006661e7051a727158--
