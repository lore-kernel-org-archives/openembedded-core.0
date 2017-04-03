Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yb0-f170.google.com (mail-yb0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id EB55B719C3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 11:47:14 +0000 (UTC)
Received: by mail-yb0-f170.google.com with SMTP id f204so30925709ybc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Apr 2017 04:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1aKgvmYUfHzNvwX19knyDdO++zEG/qyAEyJ9Ufhmv8Q=;
	b=lgHpYQHpV7nov4Cy2N6QUNWmHmmqh8/AMvo8zGppspgpuvetULD5niQmWhgmD4L5c+
	RcTnIvwcTaxP9867QM9wnAyu/7ocV1izKyHjjadEiccF2BqJRW7nX7BSsCWt8o5yaxKa
	fyBpyLExs0pa2dOvCXKQ9oJ4sBHrQsiKDMLfd43H5qJ5z/quVefqbdFsP7WiNTW2wCDr
	CituuYnWkxazGIKSIfWp3EanPuZsB+yz8IVjrwofa8MgumnKj+U8OCkc9sad3jsGPCph
	Jv+LFb8/wA96/cIT5MeSp67gRZ+MqBAx//eMnJ2DyOBFESM4uKqSmBfe5RfD5l5Vouv9
	Zi5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1aKgvmYUfHzNvwX19knyDdO++zEG/qyAEyJ9Ufhmv8Q=;
	b=Jzw7ipRG+huIHIQXCZ1WN0SteWmt3sDhOK41MJoVM3wV7sMCaxx/rhDiyRND4d4yxH
	r41Bku7yVOZaipCFVYWdFLeAMGA+1SP//OtTmO7ONGE7O1PCChTu6bUfORvcfPZVPStx
	sVnP9RtACe2ABCYhabVY27zWyhHm7BZNm1Ew9bZG1szG2SSLpRuP4wov1sEmm7Pu5ocv
	6bauRyOn0bHhS9Lvz/N0DaprhBwkUY8NrY8w5fLRU6JFKeU/iQuScjWWKpoU5R8H+/em
	mOHVRL8qCWd2YZimcf97ssS/SPpJPmJkH8z1WtziiHQNAZ/uBfnrEZlNZTn4S2ir0bl3
	RiRA==
X-Gm-Message-State: AFeK/H2cQFWkQbqravCxhM2vqe85jfttL8hICScWIAb0dCzk/5mSEHGy6BXYj4/EAXomB3B7NXj9XsbrKPAjn0nd
X-Received: by 10.129.197.74 with SMTP id o10mr12049964ywj.183.1491220035488; 
	Mon, 03 Apr 2017 04:47:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.81.136 with HTTP; Mon, 3 Apr 2017 04:46:45 -0700 (PDT)
In-Reply-To: <CF0C948DE8E2634BB64BF489FF9EF7E7CB120C@PGSMSX105.gar.corp.intel.com>
References: <1491187907-5752-1-git-send-email-yin.thong.choong@intel.com>
	<1491187907-5752-5-git-send-email-yin.thong.choong@intel.com>
	<CAHiDW_HmcNpGPrmf+oDiKaU8EHS=RoXYZW3XkzPKuZKLFmNauw@mail.gmail.com>
	<CF0C948DE8E2634BB64BF489FF9EF7E7CB114D@PGSMSX105.gar.corp.intel.com>
	<CAHiDW_Ee=0nyBAsHkagd0hfS0orWBDu9ahh4k=2uQHR0tet2Fg@mail.gmail.com>
	<CAJTo0Lb6o=fFerSorzQqJpRtMNB6z1L5ZDqE5AzTE6gCpWNmSA@mail.gmail.com>
	<CF0C948DE8E2634BB64BF489FF9EF7E7CB120C@PGSMSX105.gar.corp.intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 3 Apr 2017 14:46:45 +0300
Message-ID: <CAHiDW_EDa4mQkDZ69LdzK0JQrOr2YmSXY5nKw1_BUdw_jeQW2w@mail.gmail.com>
To: "Choong, Yin Thong" <yin.thong.choong@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] logrotate: replace fedorahosted.org SRC_URI with yoctoproject.org source
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
X-List-Received-Date: Mon, 03 Apr 2017 11:47:15 -0000
Content-Type: multipart/alternative; boundary=94eb2c1a54fa7f6134054c41b87c

--94eb2c1a54fa7f6134054c41b87c
Content-Type: text/plain; charset=UTF-8

On 3 April 2017 at 14:00, Choong, Yin Thong <yin.thong.choong@intel.com>
wrote:
>
> Hi,
> Once I change to github.com below error pop out. Seem like it miss align
with the patch compare with github.com logrotate source. Both package seem
got miss align on the version. When I compare yoctoproject logrotate.c and
github logrotate.c it has big different (as attached), there even got
different parameter count on some API function


Ross's  suggestion of asking the maintainer is good but I'll note that
there does not seem to be any difference in the actual source files: you're
maybe looking at a different version.

The patching error is a result of the top level source directory name
changing. This could be worked around with
  S = "${WORKDIR}/logrotate-r3-9-1"

Jussi

--94eb2c1a54fa7f6134054c41b87c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 3 April 2017 at 14:00, Choong, Yin Thong &lt;<a href=3D=
"mailto:yin.thong.choong@intel.com">yin.thong.choong@intel.com</a>&gt; wrot=
e:<br>&gt;<br>&gt; Hi,<br>&gt; Once I change to <a href=3D"http://github.co=
m">github.com</a> below error pop out. Seem like it miss align with the pat=
ch compare with <a href=3D"http://github.com">github.com</a> logrotate sour=
ce. Both package seem got miss align on the version. When I compare yoctopr=
oject logrotate.c and github logrotate.c it has big different (as attached)=
, there even got different parameter count on some API function<br><br><br>=
Ross&#39;s =C2=A0suggestion of asking the maintainer is good but I&#39;ll n=
ote that there does not seem to be any difference in the actual source file=
s: you&#39;re maybe looking at a different version.=C2=A0<div><br></div><di=
v>The patching error is a result of the top level source directory name cha=
nging. This could be worked around with<br>=C2=A0 S =3D &quot;${WORKDIR}/lo=
grotate-r3-9-1&quot;<br><br>Jussi=C2=A0<br><br></div></div>

--94eb2c1a54fa7f6134054c41b87c--
