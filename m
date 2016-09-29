Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7F2A660125
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 14:49:18 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id u134so114611229itb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 07:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zqSc2HRsouDz13QhQWeqIcr9rTUcuxQtlIO0FrE4o3U=;
	b=BIyok5McIAYLwdMVgBYyCOdbzY3Bgp3OI/E9n9sXU4Bzf3eq8k//i2iNJiM5W/Vbg+
	GlKF46MUVVPfWXZdfCNXhDjRL5Dl5mtUopNfEkWDOcS2ioR2g7zeDk7YxQ6QpI5ibz5D
	0xgOsxFHYrtEhdKCvMH+dfm6Xkizn3CV8TcViFGuSTgisFjQNezYLKAOEwO16YjJmTSg
	Sm2jnUWHFJGPVy+7IEHeZMfxjx8/7BbQ1H4X1aRmsQMjz2+7TPIw50Undemw2MzrZynQ
	ByUwSOp4Kmn9hTodWlW0fTaX6FFEO4hk0aqwAVBkT8Y3L6B0h3q2Q4nhv+6j7xuF0NWs
	fCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zqSc2HRsouDz13QhQWeqIcr9rTUcuxQtlIO0FrE4o3U=;
	b=lhE2xCyvJ44JDwkFnR1PocVNt/hcnwDYeRpn8gI2lzxargVnD8aK+wZ9/FL/tKFtfK
	NQw/SCk7TXUHnvR5IKd0S5VLxOSl5qG6hODyov6UDk8yIv04fOAk9abBvR1+af4gGI4s
	b/d1HnVjtalbID+mNnF+LwViL5q6nitwHy4/d9LuqMNd7R6hIraXhJLBtBIhDwBA2FN9
	+I2Q6naHftqeckPAiUXMXWUcr7ZDGQhxn29CpU5nBkPhfSTVrrcLP+6Ra73aV+D7Zm01
	AXi4LmBFe12wJhMKmQw4h6YDFmoGch+b0d9qrn2+/5aJi/ID2lyDV8rebhEO4dWb7C/i
	6ayQ==
X-Gm-Message-State: AA6/9RnKk72Cd3e/HqDJYoiIYe93RI2yRGBq2i0+fVw/mtQ+5jy4/b+S69DSWXR9VPRIXv97aP+JdL9NNcXv9xbY
X-Received: by 10.107.17.36 with SMTP id z36mr3073448ioi.1.1475160559522; Thu,
	29 Sep 2016 07:49:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Thu, 29 Sep 2016 07:48:59 -0700 (PDT)
In-Reply-To: <1475138332-514-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1475138332-514-1-git-send-email-ed.bartosh@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 29 Sep 2016 15:48:59 +0100
Message-ID: <CAJTo0LY7q-=+5Dyj+CMv2Z6ujZZutDM_R5E0uexeDbF1BpZ5PQ@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [wic][PATCH] wic: selftest: add test for mksystemd-bootdisk
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
X-List-Received-Date: Thu, 29 Sep 2016 14:49:18 -0000
Content-Type: multipart/alternative; boundary=001a113f71f22379d9053da695cb

--001a113f71f22379d9053da695cb
Content-Type: text/plain; charset=UTF-8

On 29 September 2016 at 09:38, Ed Bartosh <ed.bartosh@linux.intel.com>
wrote:

> +    def test_mksystemd_bootdisk(self):
> +        """Test creation of mksystemd-bootdisk image"""
> +        image = "mksystemd-bootdisk"
> +        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
> +                                   % image).status)
> +        self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" %
> image)))
>

Jianxun sent a patch to rename this image to just systemd-bootdisk, do you
agree with this rename (so can you update the patch) or do you think we
should not rename?

Ross

--001a113f71f22379d9053da695cb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 September 2016 at 09:38, Ed Bartosh <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@linux.intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,=
204);border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:p4" class=
=3D"gmail-a3s gmail-aXjCH gmail-m1577523922c2b491">+=C2=A0 =C2=A0 def test_=
mksystemd_bootdisk(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Test creation of mksystemd-b=
ootdisk image&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 image =3D &quot;mksystemd-bootdisk&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(0, runCmd(&quot;wic create %s=
 -e core-image-minimal&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% image).status)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(1, len(glob(self.resultdir + =
&quot;%s-*direct&quot; % image)))</div></blockquote></div><br>Jianxun sent =
a patch to rename this image to just systemd-bootdisk, do you agree with th=
is rename (so can you update the patch) or do you think we should not renam=
e?<br></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Ross</div></div>

--001a113f71f22379d9053da695cb--
