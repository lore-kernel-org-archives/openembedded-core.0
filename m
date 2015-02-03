Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id DFE7D601DC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 11:56:19 +0000 (UTC)
Received: by mail-qc0-f169.google.com with SMTP id b13so34780837qcw.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Feb 2015 03:56:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=SZFtaCjSHmx9S2uvbwtKHN961/KCdg8F45+yVDxq9LU=;
	b=FNdtxpodb4n7LdcBkB6thL5cdymosjwFv8dWlJ+J06mx2t4oPg2m5ep05H04rSiY3u
	ATiMyghKgvzQICbEWpTsypcVk3GWhfFMzcIOTMKZ9Y+5iD/1Rh/7jIe5voWx31JL7FzE
	tmAYTfDehnLL1+MeDFX81bVWeChwZ+cR3NM/mtsNfe+2fwjcbCmJIbEs2A1J3jyoK6KO
	fuPfJQTadCRdisXHkvSwXR4gf2DOSf5QaEsZk4cxWzHzbMjPfJXp2PC/JLMoAnbjBWFr
	FrwhyGzN+alOmoz/6Vrh0NNoy7wc902s84OerX0+MnmULVXHUIG2tM8hOB2BUC2VwIUb
	zOhw==
X-Gm-Message-State: ALoCoQmYyb3A1AJkIXV3VZrmacEfEcNnLLWUZq5c60EdQSSazTrxc4TeZ4DAWeCwZeUyv37MsGwI
X-Received: by 10.229.51.201 with SMTP id e9mr8519936qcg.4.1422964575894; Tue,
	03 Feb 2015 03:56:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 3 Feb 2015 03:55:55 -0800 (PST)
In-Reply-To: <CAMKF1sr7bYpKqzTmvX5rCuYc-Rb2se7Vsrr4aYA43E_b1Z=vWA@mail.gmail.com>
References: <CAMKF1souj1-FLTjkQb0y8myTiKMJyNeAa7wiM5-pW1fz0EtheA@mail.gmail.com>
	<CAJTo0LaN3HMhjrpii2pPbJw5zWbywgr1keZe=iQmuKFMFFf=gQ@mail.gmail.com>
	<CAMKF1sq8NsuNYZDQRPtXruBeRndOP+0qwBuTO2ahb6q-fS8XGw@mail.gmail.com>
	<CAJTo0LYpKbwOHg-DBMJycy+KNayTCsnhToJR8K-REKZ2jxhnhw@mail.gmail.com>
	<EA0C9DE9-9E5F-4B74-8464-138895268F2F@gmail.com>
	<CAJTo0LbSFesauhA_H39Znd07SR5JCs45izy2us=cFWVGXtW8hg@mail.gmail.com>
	<80920FD0-CA08-45D7-9A41-3971FB2D58D7@gmail.com>
	<CAJTo0LbqTrQzk0KeHDxYnmtZrrFdZD12DWrjA=Y4RtbQzwM0ow@mail.gmail.com>
	<CAMKF1sr7bYpKqzTmvX5rCuYc-Rb2se7Vsrr4aYA43E_b1Z=vWA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 3 Feb 2015 11:55:55 +0000
Message-ID: <CAJTo0LZJwGxPLa5eLB8dymDqBYtFZkVdyknU7wtbj014dWoO9w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [RFT] upcoming glibc 2.21 and gcc 4.9 upgrade
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
X-List-Received-Date: Tue, 03 Feb 2015 11:56:23 -0000
Content-Type: multipart/alternative; boundary=089e0168133e131a59050e2dc29f

--089e0168133e131a59050e2dc29f
Content-Type: text/plain; charset=UTF-8

On 3 February 2015 at 05:03, Khem Raj <raj.khem@gmail.com> wrote:

> I think this issue was there even with older version of glibc for i7
> but it was flagged as a warning, glibc 2.21 now uses -Werror by
> default. Can you confirm that via inspecting 2.20 glibc build logs for
> this machine ?
>

dl-caller.c:1:0: warning: SSE instruction set disabled, using 387
arithmetics
 /* Check whether caller comes from the right place.
 ^
../sysdeps/unix/sysv/linux/dl-execstack.c:1:0: warning: SSE instruction set
disabled, using 387 arithmetics
 /* Stack executability handling for GNU dynamic linker.  Linux version.
 ^

You're right.  I'll test the new branch shortly.

Ross

--089e0168133e131a59050e2dc29f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 February 2015 at 05:03, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-sty=
le:solid;padding-left:1ex"><div id=3D":492" class=3D"" style=3D"overflow:hi=
dden">I think this issue was there even with older version of glibc for i7<=
br>
but it was flagged as a warning, glibc 2.21 now uses -Werror by<br>
default. Can you confirm that via inspecting 2.20 glibc build logs for<br>
this machine ?</div></blockquote></div><br><div class=3D"gmail_extra">dl-ca=
ller.c:1:0: warning: SSE instruction set disabled, using 387 arithmetics</d=
iv><div class=3D"gmail_extra">=C2=A0/* Check whether caller comes from the =
right place.</div><div class=3D"gmail_extra">=C2=A0^</div><div class=3D"gma=
il_extra">../sysdeps/unix/sysv/linux/dl-execstack.c:1:0: warning: SSE instr=
uction set disabled, using 387 arithmetics</div><div class=3D"gmail_extra">=
=C2=A0/* Stack executability handling for GNU dynamic linker.=C2=A0 Linux v=
ersion.</div><div class=3D"gmail_extra">=C2=A0^</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">You&#39;re right.=C2=A0 I&#39;ll =
test the new branch shortly.</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">Ross</div></div></div>

--089e0168133e131a59050e2dc29f--
