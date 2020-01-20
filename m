Return-Path: <ticotimo@gmail.com>
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
	[209.85.166.176])
	by mail.openembedded.org (Postfix) with ESMTP id D91327FCF5;
	Mon, 20 Jan 2020 18:08:35 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id f10so219627ils.8;
	Mon, 20 Jan 2020 10:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=jVqSp12By0KjQYmtdE/M8a7YnTUF9XAzOG72ipXENqo=;
	b=pzljI8vDPQR2Xfh+LUjSfDF+PST9pm8cN31CKIoq1bLJQ3jxfdwJUFRGHWigsmnKda
	0S38xrC9n2DwF6d3lrU7eKtC+z2gj8ARq8w6w8wlCr6KXxqv3HEi8SBjIolHvVxeDaHq
	fr7HdHV937OA/cSON9T8WtYL3wB2uOKF/yEecOtpBcwPUNo0JdkCNita+1I5Gz+t5Mtm
	jQNW6rQIlMItpx64ztR7H7/G4/OMgyOVtMRAXtSZNF/MlAHLYvQt0Vt3B4UPYCUlELlZ
	cCcJV3KYID1GudbncbBRW2djGidZXu5Y0IAwo/RHilpmCo7cEYseL2RG1B/gwLjHiUsS
	AGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=jVqSp12By0KjQYmtdE/M8a7YnTUF9XAzOG72ipXENqo=;
	b=ChO+eOnaeop1Hmpq8kjPzq5LmyHD6odl6IfdG8Mklzy+W6vVWJonFEaqbm8T3zXHRU
	2V2WIK0K6/XFaIPGvtLHWgeHUVq9yf7gYkJOZHJ340So3GSN1W49WT6HGXjE8kjxdQCK
	sFxudo0nlnAdoiOTqeH0PUWN+WTSjka8YQIIWmr2jBNXlLEAEbXp6fb3QJUC1nbWWQjk
	wKUnZz9RNFmpCGR/mDzfNXUqoETyGXEl/AMVfJ7gk9kx343GKqZly0qbVns7JWC2VIi0
	tNhjoLmfX4zdKAoPxfcp5+Q4daWWa7GMxqBfdH2Txf8avfpxaRz00RJBLglmQToYnXMb
	SvOA==
X-Gm-Message-State: APjAAAWLWW4skP665NXB63VgpiyT0adCDsBIxSuji53+IvcnRyvrenZ5
	izBe1sKHwGsGWJ2WPqAMthrNdMNIsQaX8wAR3IGZFu4g2Qc=
X-Google-Smtp-Source: APXvYqxgPmNF1A7BtPyPAtkgrSbpI1k3zSWncJPmK+vM9aN2RV7Q2bXVzGP6bdTfiZVf9DtQo4rVgfNt6UoTCefeQ04=
X-Received: by 2002:a92:290a:: with SMTP id l10mr250533ilg.151.1579543716724; 
	Mon, 20 Jan 2020 10:08:36 -0800 (PST)
MIME-Version: 1.0
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 20 Jan 2020 10:08:25 -0800
Message-ID: <CANx9H-BZLFrVCtGtWW5Wh_0mY_1oXBw-UfXsGG0LGn-qrhoMCg@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>
Subject: Python 2 sunsetting
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
X-List-Received-Date: Mon, 20 Jan 2020 18:08:36 -0000
Content-Type: multipart/alternative; boundary="00000000000024ad3e059c962ea1"

--00000000000024ad3e059c962ea1
Content-Type: text/plain; charset="UTF-8"

CPython has officially announced that there will be one more release
(2.7.18) in April 2020 [1]. After this date all work on python2 will stop
as far as the official community is concerned. This means no bug fixes,
security fixes or vulnerability checks will be done by the official python
community.

YOU HAVE BEEN WARNED. Move away from Python 2 immediately. To continue to
use it will put you and your organization at significant risk.

To make this transition as smooth as possible, meta-python2 has been
created [2]. But note that maintenance of that layer will be entirely up to
the community after Q12020. I have no business nor personal need to
continue using python2 and will therefore have no motivation to continue to
maintain that layer. Someone else will have to step up.

[1]
http://pyfound.blogspot.com/2019/12/python-2-sunset.html?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+PythonSoftwareFoundationNews+%28Python+Software+Foundation+News%29

[2] https://git.openembedded.org/meta-python2/

--00000000000024ad3e059c962ea1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>CPython has officially announced that there will be o=
ne more release (2.7.18) in April 2020 [1]. After this date all work on pyt=
hon2 will stop as far as the official community is concerned. This means no=
 bug fixes, security fixes or vulnerability checks will be done by the offi=
cial python community.<br></div><div><br></div><div>YOU HAVE BEEN WARNED. M=
ove away from Python 2 immediately. To continue to use it will put you and =
your organization at significant risk.</div><div><br></div><div>To make thi=
s transition as=C2=A0smooth as possible, meta-python2 has been created [2].=
 But note that maintenance of that layer will be entirely up to the communi=
ty after Q12020. I have no business nor personal need to continue using pyt=
hon2 and will therefore have no motivation to continue to maintain that lay=
er. Someone else will have to step up.<br></div><div><br></div><div>[1] <a =
href=3D"http://pyfound.blogspot.com/2019/12/python-2-sunset.html?utm_source=
=3Dfeedburner&amp;utm_medium=3Dfeed&amp;utm_campaign=3DFeed%3A+PythonSoftwa=
reFoundationNews+%28Python+Software+Foundation+News%29">http://pyfound.blog=
spot.com/2019/12/python-2-sunset.html?utm_source=3Dfeedburner&amp;utm_mediu=
m=3Dfeed&amp;utm_campaign=3DFeed%3A+PythonSoftwareFoundationNews+%28Python+=
Software+Foundation+News%29</a></div><div><br></div><div>[2] <a href=3D"htt=
ps://git.openembedded.org/meta-python2/">https://git.openembedded.org/meta-=
python2/</a></div></div>

--00000000000024ad3e059c962ea1--
