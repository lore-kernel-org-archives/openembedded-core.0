Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 145C576F9D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Oct 2015 20:09:42 +0000 (UTC)
Received: by qkcf65 with SMTP id f65so73976034qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Oct 2015 13:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HhPTfDCOVGzIOMl0awFOuqEspqbyeQrTD06IE0sCJUg=;
	b=WQvhY2tgJyFBnMvmwC0coCwr+qlAxBGKknsSNF2JR320FJJ5LrDiNDBfsNvV/qtGE8
	8SaI6Lra9S0IKSFPEkhh3On7w1V2M0VI+RYfV9xJc/8XqnEgiC86cAZDjlFCrV6snqQ9
	b3ayoy/5ZX3xvFLN+oGBaG8omKdxuUwDgCqWdm8TDmqn8LAQIuATb5i4y2moVT4GQRzM
	fBP/KcuowmwxYPqMYOTPbG4ZFJaIuun3T7Ti40B/iW62Td2gj3oyxVQ/EOA+4OSPoOaj
	/gds9/0mhiI3VY9IVHlJxusDe/jJdyXADv/ynNHGZzBKeo25UfAVjlF3U9E2P5jxTCBZ
	BWRA==
X-Gm-Message-State: ALoCoQlKDBEl/RO7RiU3liZH/BJEVTMaUSOeXpBO+fyqTgB7++faEOPrwX6TtGlIU0MY/rq1QubH
X-Received: by 10.55.43.132 with SMTP id r4mr42323786qkr.104.1444075781936;
	Mon, 05 Oct 2015 13:09:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Mon, 5 Oct 2015 13:09:22 -0700 (PDT)
In-Reply-To: <CAJTo0LYwQiw5a0_nkBM5erDgbtNgzW54sU+3Cn5x=5EViS0uTg@mail.gmail.com>
References: <cover.1443600210.git.wenzong.fan@windriver.com>
	<bcac24a99fee9f86d5692e7a457e51c41c9208b7.1443600210.git.wenzong.fan@windriver.com>
	<CAJTo0LYwQiw5a0_nkBM5erDgbtNgzW54sU+3Cn5x=5EViS0uTg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Oct 2015 21:09:22 +0100
Message-ID: <CAJTo0La9VFS5B=qG37HWi+U3BRJMcDMnjsZAk_AkHFx4aeAuow@mail.gmail.com>
To: wenzong fan <wenzong.fan@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3 v2] glib-2.0: cleanup buildpaths from pkgconfig files
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
X-List-Received-Date: Mon, 05 Oct 2015 20:09:43 -0000
Content-Type: multipart/alternative; boundary=001a1147af6a02f46805216118df

--001a1147af6a02f46805216118df
Content-Type: text/plain; charset=UTF-8

On 30 September 2015 at 10:45, Burton, Ross <ross.burton@intel.com> wrote:

> For multilib build, PKG_CONFIG_SYSROOT_DIR will be injected in values
>> that are returned by 'pkg-config --libs xxx', such as for zlib:
>>
>
> So why isn't this fixed in pkg-config?
>

I've just replicated this with a minimal test (build zlib, run pkg-config
--libs zlib in a devshell) for "normal" and multilib configurations and
this is clearly a bug in pkgconfig.  Please fix pkgconfig instead of
playing whack-a-mole with where the bug causes problems.

Ross

--001a1147af6a02f46805216118df
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 September 2015 at 10:45, Burton, Ross <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_=
extra"><span class=3D""><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><div style=3D"overflow:hidden">For multilib build, PKG_CONFIG_SYSROO=
T_DIR will be injected in values<br>
that are returned by &#39;<span class=3D"il">pkg</span>-<span class=3D"il">=
config</span> --libs xxx&#39;, such as for zlib:<br></div></blockquote></di=
v><br></span>So why isn&#39;t this fixed in <span class=3D"il">pkg</span>-<=
span class=3D"il">config</span>?</div></blockquote><div><br></div><div>I&#3=
9;ve just replicated this with a minimal test (build zlib, run pkg-config -=
-libs zlib in a devshell) for &quot;normal&quot; and multilib configuration=
s and this is clearly a bug in pkgconfig.=C2=A0 Please fix pkgconfig instea=
d of playing whack-a-mole with where the bug causes problems.</div><div><br=
></div><div>Ross=C2=A0</div></div></div></div>

--001a1147af6a02f46805216118df--
