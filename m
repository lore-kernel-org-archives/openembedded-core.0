Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2A6CE7412A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 20:00:51 +0000 (UTC)
Received: by qkgx75 with SMTP id x75so77667598qkg.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 13:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=muDT8r45ZniqpObyy3R0Dusdgm9UhkWk6NRJD68/T3I=;
	b=UT9stZ6miaSY4lLWTCL0pq6wywmCWaghN11KUI0EXqTLRkXdEXK4oNhjKRRISwAch4
	75tdkRoHW2XKodR5P5VUFmOc5SAvVp1XkQlTCDpVySu/Vu95zYSEESLBQm0rPqG0ztS0
	RIU9bUeLuwEU5LVmHRjGSt1587qJj9By4MjWlaVXp1G9K3+ApZItkxHMc1Ib7z2UUaVi
	6wk2NSwVgWaLcR/2/mkh1PcJCeC5WVYHt2nmDR13jRtIIw/W2M2KJXuV9CvytTI56wE0
	tSfxQMNi/Fbx3eiNxofKlFHQvBJY4ot7/IMnkctqRZzmlEjpUJmUYvqXjfog3Fkcn0B5
	CJhA==
X-Gm-Message-State: ALoCoQnCEX4wpegauGp1OKNBX0lvgDaJuMHj2J13MCOwa59Vr2QrvmzcnDsWB/E9Sj/w3GETIzNI
X-Received: by 10.140.216.5 with SMTP id m5mr15317368qhb.52.1431720052640;
	Fri, 15 May 2015 13:00:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 15 May 2015 13:00:32 -0700 (PDT)
In-Reply-To: <CAJTo0LZNd142tRVh36yatiRxhwHdVwDYC4pVv_V1xNbebtmmSQ@mail.gmail.com>
References: <cover.1431324180.git.liezhi.yang@windriver.com>
	<84a0731e7204cfb400610c3abc871894b7a03a39.1431324180.git.liezhi.yang@windriver.com>
	<CAJTo0LZNd142tRVh36yatiRxhwHdVwDYC4pVv_V1xNbebtmmSQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 15 May 2015 21:00:32 +0100
Message-ID: <CAJTo0LbvnOannviRAbfJbVnYcqS=h14kjX5VGAYWX5x0qPi3Fg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/12] libsdl: depends on libglu when x11
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
X-List-Received-Date: Fri, 15 May 2015 20:00:53 -0000
Content-Type: multipart/alternative; boundary=001a11354e682807eb0516244df5

--001a11354e682807eb0516244df5
Content-Type: text/plain; charset=UTF-8

On 15 May 2015 at 20:59, Burton, Ross <ross.burton@intel.com> wrote:

> I've just sent a revert for this, but was there a problem this was
> attempting to fix?
>

Just realised - opengl enabled and x11 disabled in DISTRO_FEATURES.  I
guess you need to make the GL support depend on opengl *and* x11.  Tested
patches for all combinations of those features welcome :)

Ross

--001a11354e682807eb0516244df5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 May 2015 at 20:59, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mail=
to:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra">I=
&#39;ve just sent a revert for this, but was there a problem this was attem=
pting to fix?</div></blockquote><div><br></div><div>Just realised - opengl =
enabled and x11 disabled in DISTRO_FEATURES.=C2=A0 I guess you need to make=
 the GL support depend on opengl *and* x11.=C2=A0 Tested patches for all co=
mbinations of those features welcome :)</div><div><br></div><div>Ross=C2=A0=
</div></div></div></div>

--001a11354e682807eb0516244df5--
