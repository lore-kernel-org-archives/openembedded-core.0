Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id CF1DB62134
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 14:15:37 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id m9so10428096ige.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 07:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aeBxjWu9oQ1wjIzGfCyqGV1QV1pri+cS9UBExMmxA+M=;
	b=KQL3OMrZr8GyETp7Fgo3RqIMxf+SJ5Fek3jQzgv+zHW2nbrWGeFayfiU8RLV+IMK/r
	RlSu6BeFnjKozokkwRYDF4OGxnLz6LMAfcfVvWRlartrZDWMtJX8pa22UWw770iKXeX8
	JuLkebxNJjeftYwkyxLgW4a+zI49OLfRjsQaRm1vfrcw79gntMdfgD9R+fEjzmWbSteK
	wu7J6eQnDV73Wa409D2jASbFM4F4Ew2wakD4I0s0xyFUVWCUxmPst2dIH83mtdPRGI8H
	GW7skCjaYn1LvRyF5SgIvqER8LFucFnf+m52PueutRb39NYILQFzQPygEmEt3biQWD72
	wtsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aeBxjWu9oQ1wjIzGfCyqGV1QV1pri+cS9UBExMmxA+M=;
	b=g+L3F58C4oKhr5n1hk63+l2L0+cUOW/P67/tnSbDGNA2I30V8jS2fJb21X419DiW+j
	N6tSojzIHZRPr/hZXqBfHbtHhdn+7TjiQJ5HxgNjvjgz/M0U8jHuqhrJkPKjRfs81iwl
	Ylv8u2yGcqSz02YcnQPC6ZYd4JABug2JDEv2a8Qhj28vEMxmmM8nVN0IZ99rtip2D4Kw
	Fvs0QsQ6RT3rMdt8OIdlCVXu9znnUFJ4j67LczSd4yIwkpspzay0tL933x4AiXT/hqYu
	kNLKaLUt/VEVkQlhveueU5LNhReokHHpHKJ+lDGzL+idZgMaG+fWG5QUmronoBv+wBou
	eTkA==
X-Gm-Message-State: AOPr4FVcgcaAEWKZc4Zat1GBedVKe4A9Xrl6HTQNtuutIsAejGBPys/HOWvx3R5LReDn6yuduorIiP5OKVUpSjOz
X-Received: by 10.50.150.1 with SMTP id ue1mr13265922igb.52.1463494538025;
	Tue, 17 May 2016 07:15:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Tue, 17 May 2016 07:15:18 -0700 (PDT)
In-Reply-To: <1463429917-24006-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
References: <1463429917-24006-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 May 2016 15:15:18 +0100
Message-ID: <CAJTo0LbdmjRzH5ZBwhF31azfTwZ65=H-VWkvJAM+JWxpM7=2Hw@mail.gmail.com>
To: edwin.plauchu.camacho@linux.intel.com
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta:recipes-devtools: makedevs fix security gaps
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
X-List-Received-Date: Tue, 17 May 2016 14:15:39 -0000
Content-Type: multipart/alternative; boundary=001a11c30f0a11f56c05330a60cf

--001a11c30f0a11f56c05330a60cf
Content-Type: text/plain; charset=UTF-8

On 16 May 2016 at 21:18, <edwin.plauchu.camacho@linux.intel.com> wrote:

> ++              fprintf(stderr,helptext,NULL);
>

Just fputs() would be more the intention?

Also the subject should be just the recipe name, so "makedevs: fix string
format errors".

Ross

--001a11c30f0a11f56c05330a60cf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 May 2016 at 21:18,  <span dir=3D"ltr">&lt;<a href=3D"mailto:edwin.pla=
uchu.camacho@linux.intel.com" target=3D"_blank">edwin.plauchu.camacho@linux=
.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":1hk" class=3D"a3s aXjCH">++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 fprintf(stderr,helptext,NULL);<br></div></blockquote></div><br>Just =
fputs() would be more the intention?</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra">Also the subject should be just the recipe n=
ame, so &quot;makedevs: fix string format errors&quot;.</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c30f0a11f56c05330a60cf--
