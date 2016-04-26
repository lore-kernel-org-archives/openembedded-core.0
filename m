Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8D16A60123
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 11:59:23 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id bi2so94205883igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 04:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=s9/4ZOPIYhxHdjSNalGX/6Bwi+qnKjv/wMSvXXa9L6A=;
	b=gTXfVtj18jyGRe+yq/5TNGcxc/6q1BFuDaAotpyD5TDubOWXuk0wrEUJ8QE6XvgO0h
	nRs29d8pE0rVPKLHeKJrhf8UBnJK9rEWRP7AOOHeqbLwUme2sMENHgZ1b4u/oJWHHY0S
	dmKRio1P54EGzTMIl0K6Cin8sGnlGzUv0rbgPh+9I5JAcHLekgO1ya6E23vVlYhexMBk
	XoewR5b2Nf6qqviPAC4JmuTvb1ZYJgf77phQ7yw4BI/SS7ScCgLPuYIPRg1jUfXIUdpq
	OVf2NzzVzyWfj+w75NA71Ysx5eAIOe0AvPA59lztaDZ5o332X0kJEjUrs0sq60tl94Fv
	MRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=s9/4ZOPIYhxHdjSNalGX/6Bwi+qnKjv/wMSvXXa9L6A=;
	b=EfYAMFGi8fvwEuDysh0PNOsNcTfo3aAI3EhD5Dx2Kob8bOwXq/CZC3d8tAOY0g8v6i
	XnMhDvJYDagkp9DKlMbaQk4PkM0e1lpQ94aopVOO2XlAv271LQLrYldcLV+rzUnkvQQp
	zGzu6cAm/YvQlaQrCW3XXrtzZ3j6VX1pCe6kkxqwj/UZ7bJObwQl9ClR4H3BTZl/2I13
	otFNYgSClAM+uInHpZhg615R8qpfWeweXaz61bTAVTpY04MfGiC8w736mjD5cuSBfj1/
	4ZAggpuCeaBAgVLPzs1XnPVKo4nTy7bPblBAuYP4vci6JHci5cOZWy++V6o63NN9HShL
	XRzQ==
X-Gm-Message-State: AOPr4FXQJdW8rUNLBewAqkETAmVcciE+HmK007q1eoM6ygac1gIxSaSVWUIQiwj6OcYH8/su3F4DPQKA89g5eHPu
X-Received: by 10.50.18.111 with SMTP id v15mr17974899igd.64.1461671964798;
	Tue, 26 Apr 2016 04:59:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.106 with HTTP; Tue, 26 Apr 2016 04:59:05 -0700 (PDT)
In-Reply-To: <20160425165011.GV16135@denix.org>
References: <20160422000519.GR16135@denix.org>
	<CABcZANmiDeW-B13vE3X0gjX_QfxV5iihD9ZnUKAU=wovnEuxBg@mail.gmail.com>
	<20160425165011.GV16135@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Apr 2016 12:59:05 +0100
Message-ID: <CAJTo0LZCgoyt8GyvbkhvsK4_Q8v5MgU3O+0FFXGaajyyiDS0Zg@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Christopher Larson <clarson@kergoth.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: mesa, libgbm and weston
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
X-List-Received-Date: Tue, 26 Apr 2016 11:59:27 -0000
Content-Type: multipart/alternative; boundary=089e014953cc3d7b640531620614

--089e014953cc3d7b640531620614
Content-Type: text/plain; charset=UTF-8

On 25 April 2016 at 17:50, Denys Dmytriyenko <denis@denix.org> wrote:

> One other thing I was thinking is how to avoid conflict between separate
> libgbm and the one provided by mesa-gl. As mesa-gl may be useful for
> providing
> SW rendering for OpenGL, while leaving OpenGLES to a separate provider,
> like
> SGX. Unfortunately, mesa-gl also provides libgbm - would PACKAGECONFIG to
> use
> a standalone external libgbm work and be acceptable here?
>

I added a PACKAGECONFIG for libgbm to mesa.inc, enabled it for mesa and
disabled it for mesa-gl, and mesa-gl still build fine but didn't ship a
libgbm.

I've forgotten the details about all of this: does mesa-gl shipping libgbm
make sense at all?  Or in the real world will BSPs either use mesa or their
own GLES driver + their own libgbm + mesa-gl if required?

Ross

--089e014953cc3d7b640531620614
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 April 2016 at 17:50, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=
=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":3bq" class=3D"a3s aX=
jCH">One other thing I was thinking is how to avoid conflict between separa=
te<br>
libgbm and the one provided by mesa-gl. As mesa-gl may be useful for provid=
ing<br>
SW rendering for OpenGL, while leaving OpenGLES to a separate provider, lik=
e<br>
SGX. Unfortunately, mesa-gl also provides libgbm - would PACKAGECONFIG to u=
se<br>
a standalone external libgbm work and be acceptable here?</div></blockquote=
><div><br></div><div>I added a PACKAGECONFIG for libgbm to mesa.inc, enable=
d it for mesa and disabled it for mesa-gl, and mesa-gl still build fine but=
 didn&#39;t ship a libgbm.</div><div><br></div><div>I&#39;ve forgotten the =
details about all of this: does mesa-gl shipping libgbm make sense at all?=
=C2=A0 Or in the real world will BSPs either use mesa or their own GLES dri=
ver + their own libgbm + mesa-gl if required?</div><div><br></div><div>Ross=
</div></div></div></div>

--089e014953cc3d7b640531620614--
