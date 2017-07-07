Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6A24277DD7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 14:37:20 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id 32so28550187qtv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jul 2017 07:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EktlQoeonxgz/h+ly1c/wISwvAKc4wFekVbIqLiILVs=;
	b=HUvnXB5BoDWjefTIAHKhsZVQM0olIcEXgLEFWJpJMSfr+qubG7OV3g5KHKwUEPuC7y
	gftkCaJ2O6EUBLjZm/XCo28LLvG0b7GZnOS9meodLjf61SFBUlvF75OP0pdn3UAIuPDd
	X0PFYSXKYBefM8uojoGf+AtK2f0FXMx700LF67EzZqZ3I7K508id/2oVe5B0Ti3zodhG
	HgxgntX5NtVP6UtyNo8E18g1kzctJHB+ZOEkJeSQjOaGYRrCzUqwUsM6nnPNCuDgVDSA
	rtjVyEH43gB17vNfyf5ea97zCeIRvLcGznV9pJG8Sr8HYmQhYf8Y7GB7i4NONKPkfFfo
	6tew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EktlQoeonxgz/h+ly1c/wISwvAKc4wFekVbIqLiILVs=;
	b=efaWEFv1TWeriwExfHS4WXhGkCVC5xDZw69M91tj6x3Hu++ZPythPedjzbA7+IwNDQ
	MoVdakhVmhyBh6uV2IKGvUsQ9Lm3VcoWLGF18YX3Jhc7HJ02grtqos6mPNaGyIiUNNUU
	odde01rsCza3OuWbf3/DeHuIcV4MfISQhSSgvw5SP67gtZsyLvD5XpOpM7R7IC5iqhOA
	q4C6xjQLs7FH9wa6PeMaG3qoRwlvkgvXLxf4m6iGKeusDbZurbrqI4UpuNQxbG7gatfr
	SNZhiC1G6qmCgpnqvBRrxReaonKF1PIiUMrfo9jjVjbRqk5m63losJJZY/NdA1zU8xt8
	Hwqg==
X-Gm-Message-State: AIVw111367L/UCSpeDD0ECMKe6hPQEJ1pWOCf921Sv86GmPSAftZ181u
	mHs/e7OCvnFFmGSLt1BwrirovmShjnTJPFw=
X-Received: by 10.200.43.123 with SMTP id 56mr30194828qtv.6.1499438241980;
	Fri, 07 Jul 2017 07:37:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Fri, 7 Jul 2017 07:37:01 -0700 (PDT)
In-Reply-To: <ff1fb73f38635b968a5fd5291d3ffa1f3998a4a1.1499327365.git.jussi.kukkonen@intel.com>
References: <cover.1499327365.git.jussi.kukkonen@intel.com>
	<ff1fb73f38635b968a5fd5291d3ffa1f3998a4a1.1499327365.git.jussi.kukkonen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 7 Jul 2017 15:37:01 +0100
Message-ID: <CAJTo0LaYn6HQnasedd=btX0niZwWvewhvt-WCwdwMg++uyeD2A@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 3/6] vulkan-demos: Add recipe
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
X-List-Received-Date: Fri, 07 Jul 2017 14:37:22 -0000
Content-Type: multipart/alternative; boundary="001a113f4458c6c4d30553bb2b2b"

--001a113f4458c6c4d30553bb2b2b
Content-Type: text/plain; charset="UTF-8"

vulkan-demos doesn't seem to like musl:

git/external/glm/glm/detail/../detail/func_common.inl:193:51: error: wrong
number of template arguments (5, should be 6)
  struct compute_sign<T, P, vecType, false, Aligned>
                                                   ^
http://errors.yoctoproject.org/Errors/Details/146971/

Ross

--001a113f4458c6c4d30553bb2b2b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">vulkan-demos doesn&#39;t seem to like musl:<br><br>git/ext=
ernal/glm/glm/detail/../detail/func_common.inl:193:51: error: wrong number =
of template arguments (5, should be 6)<br>=C2=A0 struct compute_sign&lt;T, =
P, vecType, false, Aligned&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br><a h=
ref=3D"http://errors.yoctoproject.org/Errors/Details/146971/">http://errors=
.yoctoproject.org/Errors/Details/146971/</a><br><br><div>Ross</div></div>

--001a113f4458c6c4d30553bb2b2b--
