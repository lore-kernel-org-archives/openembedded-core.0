Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id BB99D73243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 14:12:43 +0000 (UTC)
Received: by qkcf65 with SMTP id f65so4260769qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 07:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qChYNlLa7e9gli3QeZZp6HKCKHQNkMmMoQN9FpTrFhY=;
	b=UjtdXa3+iwo8Jtc7h63zjaaCV/GQ4DoDOdQQPdDQZ9459teanRQue50+epNBN/uyG1
	CH22M7VGY4G4qFn2MPHCEnXDWoNYz+c+VcAwe9whM6BhDUuvNeKEv+Ju2OJyglY1acrY
	zCqK/tHkVqXIfgjqOpwiBfVyfQwVeAPhqKi6Y1MyW+izrb/o2iCcCpXuhMxOVA4cXIcY
	oggxVgQHF5CMTR8JL/E/HgxJZZJfBCjfMOWvC2JB7vEmIUKmPyZScmvR6T9WbCRYjKiG
	824ufpMiLtJ/wX8NV3PfDTlg7lBSyFUOaiopV99xXg+YxGI7mnQMduDjhmerFxUC0++Q
	V4RA==
X-Gm-Message-State: ALoCoQk9iuzHWUTgMzohPUJazg5e/MO/RIUuL4hP4xaehc/aRfWxU3sg7YE0BSXvi8hhYogDIvkb
X-Received: by 10.55.195.86 with SMTP id a83mr29364569qkj.72.1442931163129;
	Tue, 22 Sep 2015 07:12:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Tue, 22 Sep 2015 07:12:23 -0700 (PDT)
In-Reply-To: <5600BFB9.1060401@windriver.com>
References: <cover.1442370259.git.liezhi.yang@windriver.com>
	<90e4a1064ea7dfa9be458d306bba765136b50306.1442370259.git.liezhi.yang@windriver.com>
	<CAHiDW_Gij3wQ0daYSBetKgBmz-E=DncKUvtP_WJ+O_g-T4vn_w@mail.gmail.com>
	<55F945B5.9060007@windriver.com>
	<CAJTo0LYZ+mcOxm0Tu3E7-sqG08pmtzpkqr3+-r6vESkqOx4S8A@mail.gmail.com>
	<5600BFB9.1060401@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Sep 2015 15:12:23 +0100
Message-ID: <CAJTo0Lb8mqZNZymU1GBFTmnR+oD=a5XgKe51Tpa-nJO04on9Lw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] gtk+/cairo: enable x11 or directfb
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
X-List-Received-Date: Tue, 22 Sep 2015 14:12:46 -0000
Content-Type: multipart/alternative; boundary=001a1142b9506a3aa5052056977f

--001a1142b9506a3aa5052056977f
Content-Type: text/plain; charset=UTF-8

On 22 September 2015 at 03:40, Robert Yang <liezhi.yang@windriver.com>
wrote:

> If I understand correctly, how about we add a sanity check when do world
> build? Either X11 or directfb should be in DISTRO_FEATURES. But gtk+ is
> the only one which requires this, others can be built without both of them.
>

I don't think we need a sanity test for that.  If you want to do a world
build a limited set of DISTRO_FEATURES then we need to path in more
required_distro_features checks and/or you exclude recipes from world
builds (using EXCLUDE_FROM_WORLD).

Ross

--001a1142b9506a3aa5052056977f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 September 2015 at 03:40, Robert Yang <span dir=3D"ltr">&lt;<a href=3D=
"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":23q=
" class=3D"a3s" style=3D"overflow:hidden">If I understand correctly, how ab=
out we add a sanity check when do world<br>
build? Either X11 or directfb should be in DISTRO_FEATURES. But gtk+ is<br>
the only one which requires this, others can be built without both of them.=
<br></div></blockquote></div><br>I don&#39;t think we need a sanity test fo=
r that.=C2=A0 If you want to do a world build a limited set of DISTRO_FEATU=
RES then we need to path in more required_distro_features checks and/or you=
 exclude recipes from world builds (using EXCLUDE_FROM_WORLD).</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1142b9506a3aa5052056977f--
