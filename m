Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id B075465D6E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 17:09:28 +0000 (UTC)
Received: by qkx62 with SMTP id 62so9176111qkx.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jun 2015 10:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=w99cmneQfFDPZ631nJ3jxMiE6K3WNvhhTgAslnCGjy4=;
	b=RvhfIKNovgDLzTYzFIZGWFJz2aEx6Csy5R9mE++4r9LFHpKGGc9+5gZTum+XGz6lut
	dAUkbgLRXbsG3j+flQA9rBRKD5R8rd853yahydaSwJQ1pEissxx9E4sVGiDxGGhoAk9D
	bIX4g2d+ju7qkf/ve9szcVlO3v55c3lmdPjU97vtFebNXlRW3bFhHCad3bmYrkSwAhXi
	q2oTReAITf8DuW2BLNk8R4H6ZAiJ5WBdiKHelZuthMfbGjhNBjBKduPssgHca6Q7SMST
	j99Ehm8nArFs7aMLSy3kgSbeb/jyeaCVRvzR1zebYTMYY1E8WOY4pdolAZK3G7Oz/2dT
	EVOQ==
X-Gm-Message-State: ALoCoQnEvUxs+/CRUqTA5Vn/IMqrihuKLvBv0wxitZO2QkM8Zq2UutEzV1rGPAgIkNjLGNYJewCZ
X-Received: by 10.140.235.19 with SMTP id g19mr38644092qhc.52.1433351369556;
	Wed, 03 Jun 2015 10:09:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 3 Jun 2015 10:09:09 -0700 (PDT)
In-Reply-To: <0d3de82d935f6408e5c04ff980a2b3fd4a9e4ac3.1433349512.git.raj.khem@gmail.com>
References: <cover.1433349512.git.raj.khem@gmail.com>
	<0d3de82d935f6408e5c04ff980a2b3fd4a9e4ac3.1433349512.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Jun 2015 18:09:09 +0100
Message-ID: <CAJTo0LanFDJR+AteOHRQ5hNd0T9bMNAa+Z4b9xfZe2kdP+28aA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] wayland/weston/libinput: Upgrade to 1.6.0 -> 1.8.0
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
X-List-Received-Date: Wed, 03 Jun 2015 17:09:28 -0000
Content-Type: multipart/alternative; boundary=001a11376dac38c0360517a01f68

--001a11376dac38c0360517a01f68
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 3 June 2015 at 17:41, Khem Raj <raj.khem@gmail.com> wrote:

> Use git for repo for SRC_URI
>
> copyright year changed for weston compositor.c
>
> - * Copyright =C2=A9 2012 Collabora, Ltd.
> + * Copyright =C2=A9 2012-2014 Collabora, Ltd.
>
> libinput license changes are
> - COPYING: note that having linux/input.h in the tree does not make
> libinput GPL
> - Updated to 2015 where appropriate, added where missing.
> - filter: add Simon's copyright
>   This code was largely lifted from the X server in
>   bb25b2ad297891430606c367bfabc but didn't take the copyright messages
>   that applied to that code.
>
> upgrade libinput to > 0.8.0 (0.16.0) which is needed for 1.7.0+ wayland
> For x86 emulators use fbdev backend
>
> Change-Id: I49c12853699a3a764d86869ec4d43b10ecda3379
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>

Please split this into three patches.

Ross

--001a11376dac38c0360517a01f68
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 June 2015 at 17:41, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div id=3D":34l" class=3D"a3s" style=
=3D"overflow:hidden">Use git for repo for SRC_URI<br>
<br>
copyright year changed for weston compositor.c<br>
<br>
- * Copyright =C2=A9 2012 Collabora, Ltd.<br>
+ * Copyright =C2=A9 2012-2014 Collabora, Ltd.<br>
<br>
libinput license changes are<br>
- COPYING: note that having linux/input.h in the tree does not make libinpu=
t GPL<br>
- Updated to 2015 where appropriate, added where missing.<br>
- filter: add Simon&#39;s copyright<br>
=C2=A0 This code was largely lifted from the X server in<br>
=C2=A0 bb25b2ad297891430606c367bfabc but didn&#39;t take the copyright mess=
ages<br>
=C2=A0 that applied to that code.<br>
<br>
upgrade libinput to &gt; 0.8.0 (0.16.0) which is needed for 1.7.0+ wayland<=
br>
For x86 emulators use fbdev backend<br>
<br>
Change-Id: I49c12853699a3a764d86869ec4d43b10ecda3379<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;</div></blockquote></div><br>Please split this into three =
patches.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Ross</div></div>

--001a11376dac38c0360517a01f68--
