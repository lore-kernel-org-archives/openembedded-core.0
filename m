Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2D56F607BB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jul 2015 11:09:59 +0000 (UTC)
Received: by qgeg89 with SMTP id g89so31058171qge.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jul 2015 04:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=y9AHqSpMVR4SNWMpw65KMU4uciXA2yx/ccdLwf3n8h4=;
	b=dodiDLUU6j08nNiT/RbQLy+DXUhVXyBeNo32k7jsmcZlhvXbZCVd1NDWosAIArepIZ
	GAqypxQXuSKeHdz1nOZ+njrHD+7AQHGpdBQADEAbPKN5XjKDeK4CbY+/4Vf4kKoNeuc8
	WM3ERofoYxVOFuX0Np1kMDLGeh37qXbLfkMs39Mf9P5+aLFM/WbtrgQmV3hwZZJ/PCfe
	h1s7Bk/U8yaDxHNRiJs4eTIqt7//uAjuHP1neHo1472K8w6MFekAvBJWh3ZCcghQs8ce
	O9qY9F/UoFzthfPTdLMvSCCCxBJE/s7cRXuQFuvH8UG29k0rNoyYc0F1jqwv/jsXvwlA
	VRgA==
X-Gm-Message-State: ALoCoQnq2z0k15g61xFKo3vB5igL9QH+ujcnb06pkEcj1nuVikLCISjM2M2cX+lv+8LhFdRRNOxx
X-Received: by 10.140.88.5 with SMTP id s5mr40650136qgd.59.1435835399876; Thu,
	02 Jul 2015 04:09:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 2 Jul 2015 04:09:40 -0700 (PDT)
In-Reply-To: <1435805153-1631-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1435805153-1631-1-git-send-email-lixin.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 Jul 2015 12:09:40 +0100
Message-ID: <CAJTo0LbkWxCnc05b+y3MFPL3U5Y00wuVRPYgUgDjy_1pDh-VoQ@mail.gmail.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa-demos: add "inherit update-alternatives" to avoid conflicts
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
X-List-Received-Date: Thu, 02 Jul 2015 11:10:01 -0000
Content-Type: multipart/alternative; boundary=001a11c11874f746ce0519e27a53

--001a11c11874f746ce0519e27a53
Content-Type: text/plain; charset=UTF-8

On 2 July 2015 at 03:45, Li xin <lixin.fnst@cn.fujitsu.com> wrote:

> multiple sources 'busybox ncurses mesa-demos' provide same
> command 'clear',so rename 'clear' like recipe ncurses do.
>

Mesa's clear is in no way compatible with the ncurses clear, so this isn't
appropriate.  Simply rename the binary to mesa-clear or something similar.

Ross

--001a11c11874f746ce0519e27a53
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 July 2015 at 03:45, Li xin <span dir=3D"ltr">&lt;<a href=3D"mailto:lix=
in.fnst@cn.fujitsu.com" target=3D"_blank">lixin.fnst@cn.fujitsu.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":sw" class=3D"a=
3s" style=3D"overflow:hidden">multiple sources &#39;busybox ncurses mesa-de=
mos&#39; provide same<br>
command &#39;clear&#39;,so rename &#39;clear&#39; like recipe ncurses do.<b=
r></div></blockquote><div><br></div><div>Mesa&#39;s clear is in no way comp=
atible with the ncurses clear, so this isn&#39;t appropriate.=C2=A0 Simply =
rename the binary to mesa-clear or something similar.</div><div><br></div><=
div>Ross</div></div></div></div>

--001a11c11874f746ce0519e27a53--
