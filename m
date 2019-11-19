Return-Path: <kergoth@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id 74D867F894
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 18:08:26 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id 3so12554263pfb.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 10:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:message-id:in-reply-to:references:subject
	:mime-version; bh=AbMEeivcvRoHVIB0Mvx5h8Gl/G0Cf7MQIYFpMrg0vuc=;
	b=LUtt816Fqs1uPC/OjoUn/yDodgfZcQDU909RyNqLzcJ03ZU9YWYSVKBrRhBmcTCSak
	as+6gjr3Gpv7B1U6zovQAxc4S3mJ/UsNzxGxjNB2QOlhDIKbAhipwmMyPG9MhdmcBDFX
	GOqLs6b0L9hQ6Pb4rGHAQif4wKaw3OO2xqq8fdQSrKNa2Z7W70Z4NR7FFiOI5Xymik1H
	lc0oWD6UhIP0vf3El88ckrcUyyk6ggINKluM90wTwh4bi4nVDMNgTD7CDApUKmIlwob/
	jcpwyO/R4rJz1uDZzkjQwhWUGvhSuJMlgWSwM4Yj91VX6X1zjPx8zNXp11k2wYOys5Jd
	NqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
	:references:subject:mime-version;
	bh=AbMEeivcvRoHVIB0Mvx5h8Gl/G0Cf7MQIYFpMrg0vuc=;
	b=JrBYs7Rw+8FtSJA4CiEDEzeY3z6jLvojOVTd8NNtJCkzWmi+l/UY0a1SWYy2SLbVOP
	wTsSKi0ZayEBhZ53BsNuGprc8VomzTfLKg8Y2XeYQkJ0fwvnbqWGFX04LFRGmurHC0k6
	deCFLym0uSarKksHrYeD2wMHicPb3Tax+qO0/aXiIvx49PbU3/JEY9un+DY16LMkwBIv
	lf+afsvJ8eB5y+yfen/NnM7Mh93Y1ZFwXI7w8PxD3kwcMYjmlfIq1a4sOOdv839BEHm/
	aIb4vmESubgvdVj4chc7a4n97cNoGZfnyGcGO5Cz8oJIyFQS52ZZ+F7xjvj450oxszob
	Qj6Q==
X-Gm-Message-State: APjAAAWIzvIBcpnrG0JB2OsK9Wckfkii44MEuoQJooPNrF0xcKcxxDjl
	V40OG+bwFzfNQ0D8+WMYUr58z9XtCTo=
X-Google-Smtp-Source: APXvYqx8adNTPZpfEK7NNq7qEyWzGkH7T4pQ4mDvDTtDurKRcChUEQgmsEHDA9eFXGFTD+NKdWnYMQ==
X-Received: by 2002:a63:f006:: with SMTP id k6mr6955474pgh.380.1574186907266; 
	Tue, 19 Nov 2019 10:08:27 -0800 (PST)
Received: from [192.168.1.17] (ip70-180-21-74.ph.ph.cox.net. [70.180.21.74])
	by smtp.gmail.com with ESMTPSA id
	f10sm26487088pfd.28.2019.11.19.10.08.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Nov 2019 10:08:26 -0800 (PST)
Date: Tue, 19 Nov 2019 11:08:19 -0700
From: Christopher Larson <kergoth@gmail.com>
To: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <709581ab-081f-432d-8631-caac81d40a60@Spark>
In-Reply-To: <CANNYZj-g4E=bRw7=m+RG0vZQywD5KdiaLCr=8JDjaBAgjJ5wrw@mail.gmail.com>
References: <20191118142852.22981-1-alex.kanavin@gmail.com>
	<20191118142852.22981-13-alex.kanavin@gmail.com>
	<CAMKF1srtYneT81UKC0Lcn4U_DgWiWb3Xm11mXL+2i3+yvCE5qg@mail.gmail.com>
	<CANNYZj9rV_qvPV0j7oPwAUw7MCEeVj1NOYXSVGfj_k9w_yEPdQ@mail.gmail.com>
	<CAMKF1spKz9eE6DjDmqHUC_ak0joX4jwrzAVFwDdmKdUtyBVaWA@mail.gmail.com>
	<CANNYZj8A3DhhjHWvL0yQf8JyhSBWmECgJetB1+QeqFPR-4=ZZw@mail.gmail.com>
	<CAMKF1spOt5nU0_VmHpz5FqF3f50x-KrpvkL+wduM1H+CJhGzjQ@mail.gmail.com>
	<CANNYZj-g4E=bRw7=m+RG0vZQywD5KdiaLCr=8JDjaBAgjJ5wrw@mail.gmail.com>
X-Readdle-Message-ID: 709581ab-081f-432d-8631-caac81d40a60@Spark
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/13] man-pages: correct the SRC_URI
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
X-List-Received-Date: Tue, 19 Nov 2019 18:08:26 -0000
Content-Type: multipart/alternative; boundary="5dd42f98_12200854_114a4"

--5dd42f98_12200854_114a4
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

The whole point of having PV in the filename is ensuring it won=E2=80=99t=
 change out from under us. If they=E2=80=99re modifying files in place th=
at=E2=80=99s going to cause us headaches whether we pull from archive or =
not due to checksum changes.
On Nov 19, 2019, 9:46 AM -0700, Alexander Kanavin <alex.kanavin=40gmail.c=
om>, wrote:
> > On Tue, 19 Nov 2019 at 17:38, Khem Raj <raj.khem=40gmail.com> wrote:
> > > >
> > > > If I was asking you to store the tarball some place in arctic the=
n I would understand your concern but in this case I am not able to. can =
you describe why using archive location is not suitable here perhaps that=
 will help me
> >
> > The archive location is missing several latest releases of man-pages,=
 which are only available from the main location. Which means that we alw=
ays ship an out of date version of manpages, and aren't aware (via versio=
n check tooling) that later versions exist.
> >
> > Alex

--5dd42f98_12200854_114a4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html xmlns=3D=22http://www.w3.org/1999/xhtml=22>
<head>
<title></title>
</head>
<body>
<div name=3D=22messageBodySection=22>
<div dir=3D=22auto=22>The whole point of having PV in the filename is ens=
uring it won=E2=80=99t change out from under us. If they=E2=80=99re modif=
ying files in place that=E2=80=99s going to cause us headaches whether we=
 pull from archive or not due to checksum changes.</div>
</div>
<div name=3D=22messageReplySection=22>On Nov 19, 2019, 9:46 AM -0700, Ale=
xander Kanavin &lt;alex.kanavin=40gmail.com&gt;, wrote:<br />
<blockquote type=3D=22cite=22 class=3D=22spark=5Fquote=22 style=3D=22marg=
in: 5px 5px; padding-left: 10px; border-left: thin solid =231abc9c;=22>
<div dir=3D=22ltr=22>
<div class=3D=22gmail=5Fquote=22>
<div dir=3D=22ltr=22 class=3D=22gmail=5Fattr=22>On Tue, 19 Nov 2019 at 17=
:38, Khem Raj &lt;<a href=3D=22mailto:raj.khem=40gmail.com=22>raj.khem=40=
gmail.com</a>&gt; wrote:<br /></div>
<blockquote class=3D=22gmail=5Fquote spark=5Fquote=22 style=3D=22margin: =
5px 5px; padding-left: 10px; border-left: thin solid =23e67e22;=22>
<div>
<div class=3D=22gmail=5Fquote=22><br />
<div dir=3D=22auto=22>If I was asking you to store the tarball some place=
 in arctic then I would understand your concern but in this case I am not=
 able to. can you describe why using archive location is not suitable her=
e perhaps that will help me<br /></div>
</div>
</div>
</blockquote>
<div><br /></div>
<div>The archive location is missing several latest releases of man-pages=
, which are only available from the main location. Which means that we al=
ways ship an out of date version of manpages, and aren't aware (via versi=
on check tooling) that later versions exist.</div>
<div><br /></div>
<div>Alex<br /></div>
</div>
</div>
</blockquote>
</div>
</body>
</html>

--5dd42f98_12200854_114a4--
