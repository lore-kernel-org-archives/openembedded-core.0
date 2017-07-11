Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1AE5073117
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 11:11:31 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id v143so98718927qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 04:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0ftAKynAdI/JCeJvRvmton+0cGlrMT1u2lEDn7NQx7M=;
	b=LC1UibGfqYXDgNe23mHAOTBVAmpIU9vucsRRR8YMUa0fk7spTxxRSARl31tHG68jUr
	vpGYtDinEfVrvOOWUtp4sLfeQyPMRqQi0YqKeaVP5lD9ZArUr053vuRuqO5h/eTIKC4d
	BFX09Tp4Tx8A59saE9JTH9OMnoC/tOASoVbX6owBzofWf6eSzO02TWedPRevzly/S8UK
	22db6u+w0LL5+nYbUKGoEtqx03SfeiBMzriUhuxG1CoQKM4jSOwJwMqDHNYF/Snt/5ht
	o8kWDqglQitIztim/6voluO1+v4hBgkKuXZNfGL4HWj+X3Wf/v9KRd5jG/GyxjsbFSeV
	a8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0ftAKynAdI/JCeJvRvmton+0cGlrMT1u2lEDn7NQx7M=;
	b=VsFWarIcXm5dA68TbPWNSq+8S4m5ge2lCb1Q8pfcMVPx7WEAC/wb1p88X1q+InUQTY
	OE58C3P6mYeYXMIQA1izUOI4Wm6YdX56n6yQBKTC0RPK6sO8prxN+nj4Yqo1b2xv5/zu
	QxjNyhxh+OFRbZqug15c/U8YQReOvSQG3lQDpUO+8SQDzQ3zRAAEWxalRoo6iD4uEL4W
	XjrGzs6YZD/2Iv4ijTeOJrPaDpGc6hRb4ESLzwEfxr0vQIoEHNZJa1UlvxefeiR2je0n
	vyV67I+Sx1wUO0el/+TVuvAkU0tAs/V/melVeQsslI/bAGShhnVgtaYbqoatB+hDz3bL
	fA6A==
X-Gm-Message-State: AIVw111sY29s+qaV040YSfDFX/hueCjKmNSgtbmmguwOAgq+FKDXJKxD
	ctilZlcE8pugdhjNrAE1Kh4ybzXtHA0w
X-Received: by 10.55.108.68 with SMTP id h65mr9394117qkc.141.1499771492792;
	Tue, 11 Jul 2017 04:11:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Tue, 11 Jul 2017 04:11:12 -0700 (PDT)
In-Reply-To: <20170711101241.GB3263@jama>
References: <20170709073537.16106-1-soren.brinkmann@xilinx.com>
	<CAJTo0Lb6wS0cYqDmg87_sXh3+SV4mR+kmMA26XUKtscZ4B36GQ@mail.gmail.com>
	<20170711101241.GB3263@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Jul 2017 12:11:12 +0100
Message-ID: <CAJTo0LYqWR3BVaT3bhKxv--rdocGW0MN9Pk6zQw-2sKEAQiVXQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] valgrind: Update 3.12.0 -> 3.13.0
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
X-List-Received-Date: Tue, 11 Jul 2017 11:11:32 -0000
Content-Type: multipart/alternative; boundary="001a114feeb61293b5055408c3e2"

--001a114feeb61293b5055408c3e2
Content-Type: text/plain; charset="UTF-8"

On 11 July 2017 at 11:12, Martin Jansa <martin.jansa@gmail.com> wrote:

> ptest was broken for all architectures even before 3.13.0 upgrade, wasn't
> it?
>

Works for me, and the autobuilder, before the upgrade.  Curious what the
difference is.

Ross

--001a114feeb61293b5055408c3e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 July 2017 at 11:12, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3na" class=3D=
"a3s aXjCH m15d3122ab2ff4296">ptest was broken for all architectures even b=
efore 3.13.0 upgrade, wasn&#39;t it?<br></div></blockquote></div><br>Works =
for me, and the autobuilder, before the upgrade.=C2=A0 Curious what the dif=
ference is.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--001a114feeb61293b5055408c3e2--
