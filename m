Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7BCE86E630
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 21:03:23 +0000 (UTC)
Received: by qged69 with SMTP id d69so33368537qge.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 14:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=i1L8rywtYg9noDOp3JoOOzbRlTBWr0lRe/Q1BsI/Axk=;
	b=YzHN9bFSwgEB0Iw+3WkvU+ID3y7J4kbIEg0Sfj5CM0IqIy6hkK88xO5s7WlERDk4vX
	m59wRgJddUfXIyq0lXhSMo5QZ1XWjQMyVEDeKaOV1dOERBfXrHBeYu6asFa9ZZX6WrIa
	B5GeQk/fd9PdtlLiqEqatDCoLCRfcUINBNZ3MY/OoS8G6nueEdfe3anoZIEDAz4aMlDp
	jz97+3gzZJOLw3IhqrQ7tul90tWitK0vkSdo08kTMJOrU6SmVQyD2tP6CGr9WobqDMvk
	8umXakEarpTOctV+JpGCViCibOwog3ZlkQeSUXMf+BpSjzJ3RRiF8Hal7znQ/mE6hNq2
	KKIw==
X-Gm-Message-State: ALoCoQnKHu739Df53EGakrjSgFiUp5BH2IYwhrCyHMRsXAtbIii0Gklm66r5yh3MNgep1IUBXwtA
X-Received: by 10.140.235.71 with SMTP id g68mr8852567qhc.22.1438290203468;
	Thu, 30 Jul 2015 14:03:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Thu, 30 Jul 2015 14:03:04 -0700 (PDT)
In-Reply-To: <7e913adcb2e7b58b542d038e8e7fc01191e6dd69.1438262915.git.alexander.kanavin@linux.intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<7e913adcb2e7b58b542d038e8e7fc01191e6dd69.1438262915.git.alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Jul 2015 22:03:04 +0100
Message-ID: <CAJTo0LZi2otbONADOQj-gV0AoExTKL=x-h-Rp5dmXS+6uy0XXQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 19/26] xf86-video-omapfb: switch SRC_URI to debian git repo
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
X-List-Received-Date: Thu, 30 Jul 2015 21:03:27 -0000
Content-Type: multipart/alternative; boundary=001a1135620ea98b43051c1e086a

--001a1135620ea98b43051c1e086a
Content-Type: text/plain; charset=UTF-8

On 30 July 2015 at 14:31, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> @@ -13,7 +13,7 @@ SRCREV = "28c006c94e57ea71df11ec4fff79d7ffcfc4860f"
>  PR = "${INC_PR}.7"
>  PV = "0.1.1+gitr${SRCPV}"
>
> -SRC_URI = "git://git.pingu.fi/xf86-video-omapfb;protocol=http \
> +SRC_URI = "git://anonscm.debian.org/collab-maint/xf86-video-omapfb.git \
>

Produces this on the autobuilder:

ERROR: Fetcher failure: Unable to find revision
28c006c94e57ea71df11ec4fff79d7ffcfc4860f in branch master even from upstream

(attempting to pack right now, so can't check if thats transient or a
genuine failure)

Ross

--001a1135620ea98b43051c1e086a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 July 2015 at 14:31, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.k=
anavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div id=3D":2xn" class=3D"a3s" style=3D"overflow:hidden">@@ -13,7 +13,7=
 @@ SRCREV =3D &quot;28c006c94e57ea71df11ec4fff79d7ffcfc4860f&quot;<br>
=C2=A0PR =3D &quot;${INC_PR}.7&quot;<br>
=C2=A0PV =3D &quot;0.1.1+gitr${SRCPV}&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://git.pingu.fi/xf86-video-omapfb;p=
rotocol=3Dhttp" rel=3D"noreferrer" target=3D"_blank">git.pingu.fi/<span cla=
ss=3D"il">xf86</span>-video-omapfb;protocol=3Dhttp</a> \<br>
+SRC_URI =3D &quot;git://<a href=3D"http://anonscm.debian.org/collab-maint/=
xf86-video-omapfb.git" rel=3D"noreferrer" target=3D"_blank">anonscm.debian.=
org/collab-maint/<span class=3D"il">xf86</span>-video-omapfb.git</a> \</div=
></blockquote></div><div class=3D"gmail_extra"><br></div>Produces this on t=
he autobuilder:<br><br>ERROR: Fetcher failure: Unable to find revision 28c0=
06c94e57ea71df11ec4fff79d7ffcfc4860f in branch master even from upstream<br=
></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">(att=
empting to pack right now, so can&#39;t check if thats transient or a genui=
ne failure)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--001a1135620ea98b43051c1e086a--
