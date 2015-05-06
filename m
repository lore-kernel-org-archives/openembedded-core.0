Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id CBDBA6AC3E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 10:59:59 +0000 (UTC)
Received: by qgfi89 with SMTP id i89so2338650qgf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 May 2015 04:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9ymY2taO1ldgl4gRHRTwtEwFQVV0vXEKbj0KR7VTIZg=;
	b=EdLPZWyFb25YVqDTVTuazBsBkZQRui2DdaRub+9l/Uoe74+QYZPNm50JC42bxgFG/K
	DV72ED3H6eTmnd6UnWtLtRu/Xhi9sUktbS9E/TK/tA8WFU4vk76VnLxlBZVr2eBVNS6x
	ynYj6z+hQ/jHTgqTpf+CnyAEvMqo1SgK5bcQeFTHLMcezyM4v6CUJ2/XcpIRQeS+XbUd
	dwr15yokQFzGicjcWQpW47riv4vDEHj1tGJ0TKXHX4WRkm4I6wODZFwYBExuskeFVaee
	Dr7WJYQTpYt7rCSVA0CkW1gUNwtHEo/vjFhXKgTGq+DRpwaZTGDeJeijOOh9Jsj5J+OX
	w9ZA==
X-Gm-Message-State: ALoCoQlJl8pQBCZKr6/B8o4wNIM9SsbQXlADQ4vhpz4WH0fgIKVr5RHu03zjPXTVBoWsDyq2siNW
X-Received: by 10.140.39.164 with SMTP id v33mr38391390qgv.80.1430910000229;
	Wed, 06 May 2015 04:00:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 6 May 2015 03:59:39 -0700 (PDT)
In-Reply-To: <255b008af3c6dbe562d8e114d17a9ed72b7709da.1430895556.git.raj.khem@gmail.com>
References: <cover.1430895556.git.raj.khem@gmail.com>
	<255b008af3c6dbe562d8e114d17a9ed72b7709da.1430895556.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 6 May 2015 11:59:39 +0100
Message-ID: <CAJTo0La59b8UcCjwmLcKkQY82A484EfAoKU2i94OYXKiaZut4w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] libart-lgpl: Fix cross compiling
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
X-List-Received-Date: Wed, 06 May 2015 11:00:00 -0000
Content-Type: multipart/alternative; boundary=001a11c14eae45080e051567b2a2

--001a11c14eae45080e051567b2a2
Content-Type: text/plain; charset=UTF-8

On 6 May 2015 at 08:04, Khem Raj <raj.khem@gmail.com> wrote:

> We use standard ISO C data types and get rid of configure guess work
> which is iffy in cross compiled environment. Cleans up the re-build as well
> since we were deleting art_config.h without considering if the file is
> there in first place or not.
>

FWIW, modern autoconf has working size detection for types in cross builds.

Still can't argue against using modern types being the right thing though.
:)

Oh, once this is merged I'll be moving libart_lgpl to meta-oe as nothing in
oe-core uses this very old library.

Ross

--001a11c14eae45080e051567b2a2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 May 2015 at 08:04, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:ra=
j.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><div id=3D":g5a" class=3D"a3s" style=3D=
"overflow:hidden">We use standard ISO C data types and get rid of configure=
 guess work<br>
which is iffy in cross compiled environment. Cleans up the re-build as well=
<br>
since we were deleting art_config.h without considering if the file is<br>
there in first place or not.</div></blockquote></div><br>FWIW, modern autoc=
onf has working size detection for types in cross builds.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Still can&#39;t argue=
 against using modern types being the right thing though. :)</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Oh, once this is mer=
ged I&#39;ll be moving libart_lgpl to meta-oe as nothing in oe-core uses th=
is very old library.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a11c14eae45080e051567b2a2--
