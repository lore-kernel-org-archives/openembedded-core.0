Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8FFAF60169
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 23:31:13 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id j5so11974444qga.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Dec 2014 15:31:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=VbBvkKDPgAKeHuZ3sVx4apeUU41jm0gZtO0OYie33PI=;
	b=eLoH6xn6LY/Pm3FLfQuISZufXrznJTKVG3oW5CNJg8eZCzzPNaBBZkiFtnhtY70J+Z
	dSGCsHUtoGl1NCDzdh2elkaf4M4VHldeH6064ge8QsgrQN7drP4MmooEUt6UYiVhFqql
	bj4rhkcdRS5/mWgrJ641m+uEJNuvfWFlUS3JO816xAM+Z1DWgMbyWeNjGnRf/++CHdPc
	UJnqIVJ8AyxRLKe0plWkW3dxSTekQNvpEIWaiwpCjW6VW7627RT8Krnfkcu19Q2neMcv
	KvQ9ua7yCcBNr8dpSL69tDAZ3PuFb0roYG/cuG9yXUJc1PnKPolTCmdnybAji7kPRp0Y
	Cong==
X-Gm-Message-State: ALoCoQmP5SJG8oMhSyj160YDkbGG2oESo4/xOLpNHcPUef10YJ/BwZl9lE5lqwkfZEFlMZ/MIc6L
X-Received: by 10.224.92.205 with SMTP id s13mr12040564qam.52.1417649474344;
	Wed, 03 Dec 2014 15:31:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Wed, 3 Dec 2014 15:30:54 -0800 (PST)
In-Reply-To: <fef682ae2a0028af5d14a4cc82e83208c6a440aa.1417466734.git.anibal.limon@linux.intel.com>
References: <cover.1417466732.git.anibal.limon@linux.intel.com>
	<fef682ae2a0028af5d14a4cc82e83208c6a440aa.1417466734.git.anibal.limon@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Dec 2014 23:30:54 +0000
Message-ID: <CAJTo0LZ6b0SYW7GY5KZ+zC-UGx8+afDif9y5iGTumj7Yycjr_A@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] libdrm: Upgrade to 2.4.58.
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
X-List-Received-Date: Wed, 03 Dec 2014 23:31:23 -0000
Content-Type: multipart/alternative; boundary=089e015375e455df770509583d0d

--089e015375e455df770509583d0d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 1 December 2014 at 22:36, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.int=
el.com>
wrote:

> Remove GNU_SOURCE_definition patch because is already integrated in
> upstream.
>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
>

There must have been some documentation changes as this is failing on the
autobuilder:

 | I/O error : Attempt to load network entity
http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
| warning: failed to load external entity "
http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl"
| cannot parse
http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
| Makefile:612: recipe for target 'drmAvailable.3' failed

https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/1=
14/steps/BuildImages_1/logs/stdio

I guess it found some documentation tools at configure time and is
attempting to build the docs, but not enough was present.  An easy solution
for now would be to disable the documentation with either a configure
option or patch.

Ross

--089e015375e455df770509583d0d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 December 2014 at 22:36, An=C3=ADbal Lim=C3=B3n <span dir=3D"ltr">&lt;<=
a href=3D"mailto:anibal.limon@linux.intel.com" target=3D"_blank">anibal.lim=
on@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-colo=
r:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D":7v=
0" class=3D"" style=3D"overflow:hidden">Remove GNU_SOURCE_definition patch =
because is already integrated in upstream.<br>
<br>
Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@li=
nux.intel.com">anibal.limon@linux.intel.com</a>&gt;</div></blockquote><div>=
<br></div><div>There must have been some documentation changes as this is f=
ailing on the autobuilder:</div><div><br></div><div>=C2=A0| I/O error : Att=
empt to load network entity <a href=3D"http://docbook.sourceforge.net/relea=
se/xsl/current/manpages/docbook.xsl">http://docbook.sourceforge.net/release=
/xsl/current/manpages/docbook.xsl</a></div><div>| warning: failed to load e=
xternal entity &quot;<a href=3D"http://docbook.sourceforge.net/release/xsl/=
current/manpages/docbook.xsl">http://docbook.sourceforge.net/release/xsl/cu=
rrent/manpages/docbook.xsl</a>&quot;</div><div>| cannot parse <a href=3D"ht=
tp://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl">http=
://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl</a></di=
v><div>| Makefile:612: recipe for target &#39;drmAvailable.3&#39; failed</d=
iv><div><br></div><div><a href=3D"https://autobuilder.yoctoproject.org/main=
/builders/build-appliance/builds/114/steps/BuildImages_1/logs/stdio">https:=
//autobuilder.yoctoproject.org/main/builders/build-appliance/builds/114/ste=
ps/BuildImages_1/logs/stdio</a><br></div><div><br></div><div>I guess it fou=
nd some documentation tools at configure time and is attempting to build th=
e docs, but not enough was present.=C2=A0 An easy solution for now would be=
 to disable the documentation with either a configure option or patch.</div=
><div><br></div><div>Ross</div></div></div></div>

--089e015375e455df770509583d0d--
