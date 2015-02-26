Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 86D2360670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 20:08:17 +0000 (UTC)
Received: by qcqi8 with SMTP id i8so10457632qcq.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 12:08:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YE3CbK9bhZ/ar5WIhaAPxKpt0jICiYEngDpHi92oirQ=;
	b=WpQZCjmZw1Rvw+KnOcjPk+Z7CTvDCg1qKDf6sWV1aMJiu8T2t9pAwrRNkA1+263H2f
	8sEMWxpoUb58FuByVkLJy1F6dLQh7nTWno3ioOWPeV29BaTmBY7af/kJjDkCi484Dwuz
	6fMgSGAz+BTglmMljcKL+TLbwm4t2UrxL7H06HQ0SZKHyLEGnhSbNOztT9BgxfPWx9oO
	H+bvpQvCNLEVHwnUpPd3LLHpSm4jR6tF80rUVLWLikXE1ltg/LC4aX4M6wwLZFItz52z
	qX9YyGr5EyULxB8u1BhyUVf5n5G4z12P7Q0aiX5wuuPRjUZjkYMvn5eQ87I3PvEX1Mp4
	6jhQ==
X-Gm-Message-State: ALoCoQmbm1fg1pspZji9Ryd1sRZAOdFymvW2rzQu5dl7ITI3qhINLdzELeqtcAjRePhaio2IiVWH
X-Received: by 10.140.85.9 with SMTP id m9mr20596085qgd.7.1424981299046; Thu,
	26 Feb 2015 12:08:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Thu, 26 Feb 2015 12:07:57 -0800 (PST)
In-Reply-To: <84f2bc2ad049dd54b4bc62f8810de014ff223f6b.1424877305.git.cristian.iorga@intel.com>
References: <cover.1424877305.git.cristian.iorga@intel.com>
	<84f2bc2ad049dd54b4bc62f8810de014ff223f6b.1424877305.git.cristian.iorga@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Feb 2015 20:07:57 +0000
Message-ID: <CAJTo0LYy7G3d=YbBDfwScqv6SJ5TN2-8BgAcd9ScaA+KCZ9qGA@mail.gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] meta/lib/oe/utils.py: properly implement both_contain()
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
X-List-Received-Date: Thu, 26 Feb 2015 20:08:18 -0000
Content-Type: multipart/alternative; boundary=001a11c12e96243fec05100350eb

--001a11c12e96243fec05100350eb
Content-Type: text/plain; charset=UTF-8

On 25 February 2015 at 15:15, Cristian Iorga <cristian.iorga@intel.com>
wrote:

> oe.utils.both_contain() just does a find() on the value
> rather than splitting the value and then looking in the
> list of split items. The result is that if you add a
> feature to MACHINE_FEATURES that itself has a substring
> that matches one of the values looked for when building
> COMBINED_FEATURES, you end up with an incomprehensible
> error (here with "ext2i" in MACHINE_FEATURES):
>

This looks right but you know what it needs: a test suite.  Add a small
test case that demonstrates it breaking before the fix and then working
after the fix.  We've been adding test cases to bitbake as bugs are found
and it's really helping demonstrate that changes work.

Ross

--001a11c12e96243fec05100350eb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 February 2015 at 15:15, Cristian Iorga <span dir=3D"ltr">&lt;<a href=
=3D"mailto:cristian.iorga@intel.com" target=3D"_blank">cristian.iorga@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":59=
r" class=3D"a3s" style=3D"overflow:hidden">oe.utils.<span class=3D"il">both=
_contain</span>() just does a find() on the value<br>
rather than splitting the value and then looking in the<br>
list of split items. The result is that if you add a<br>
feature to MACHINE_FEATURES that itself has a substring<br>
that matches one of the values looked for when building<br>
COMBINED_FEATURES, you end up with an incomprehensible<br>
error (here with &quot;ext2i&quot; in MACHINE_FEATURES):</div></blockquote>=
</div><br>This looks right but you know what it needs: a test suite.=C2=A0 =
Add a small test case that demonstrates it breaking before the fix and then=
 working after the fix.=C2=A0 We&#39;ve been adding test cases to bitbake a=
s bugs are found and it&#39;s really helping demonstrate that changes work.=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross<=
/div></div>

--001a11c12e96243fec05100350eb--
