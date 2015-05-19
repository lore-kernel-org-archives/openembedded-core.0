Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5B49660125
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 14:58:53 +0000 (UTC)
Received: by qceb3 with SMTP id b3so7064755qce.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 07:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7N4lD5EKwWSWIzzoYczZiqpQX0Qc+/ucUb6L1A7aDgE=;
	b=Q+Xh6JH7maA5c2mqLGQdRnK7XbNzesR9OghS7aiR479lZpAuHD4XP+VEIBwQ5GqpB0
	3mu0dMHPvyDeXItjbdpRK56YlErqYBNO0Hp3u+dfGPPFLAQ/4bs7DyCyjTmlGnXJQWpT
	x2k8Zb/C/hCPgP3sjM5JRRAGmqgBggp+JfIdLFMNy9RMPGFNbLkHRnNg1i/S/qkaPpbq
	ZkWhZas4YBMrmtXMtzEnub6LyRSPzQSaHWovnCBaRuyaTrkw6pgvZtZlqE3b1YYrSv+S
	6uAT02rPRu300piCp1UtFKwc247U4JPf3up4X1kOuLTyqKLAY2Lr4W1Rd6pc+4Ao/R/F
	hAIQ==
X-Gm-Message-State: ALoCoQlp3mr4GwPIDEC++OyAo6s9WFy6XissZ1oGhHwc74rD0dtNdiC5btsH//euGuLvoGBUPG0Y
X-Received: by 10.140.235.77 with SMTP id g74mr38654621qhc.64.1432047534096;
	Tue, 19 May 2015 07:58:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 19 May 2015 07:58:33 -0700 (PDT)
In-Reply-To: <1431952843-25139-5-git-send-email-tanu.kaskinen@linux.intel.com>
References: <1431952843-25139-1-git-send-email-tanu.kaskinen@linux.intel.com>
	<1431952843-25139-5-git-send-email-tanu.kaskinen@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 May 2015 15:58:33 +0100
Message-ID: <CAJTo0Lb3SLJvmQzMh6f5ym9LcmYB9Tkq_SJ1rkaYe3e0WA1o1Q@mail.gmail.com>
To: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] pulseaudio-client-conf-sato: initial recipe
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
X-List-Received-Date: Tue, 19 May 2015 14:58:55 -0000
Content-Type: multipart/alternative; boundary=001a11354a0092917a0516708c46

--001a11354a0092917a0516708c46
Content-Type: text/plain; charset=UTF-8

On 18 May 2015 at 13:40, Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
wrote:

> +LIC_FILES_CHKSUM =
> "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
> +
> file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
>

I understand that you just copied existing recipes, but I never understood
why COREBASE/LICENSE is used here - it just points to other licenses.

As this file is MIT, just use COPYING.MIT.

Also, there's an allarch class you can inherit in this as the file is
architecture-agnostic.

Ross

--001a11354a0092917a0516708c46
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 May 2015 at 13:40, Tanu Kaskinen <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:tanu.kaskinen@linux.intel.com" target=3D"_blank">tanu.kaskinen@linux.in=
tel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
:7to" class=3D"a3s" style=3D"overflow:hidden">+LIC_FILES_CHKSUM =3D &quot;f=
ile://${COREBASE}/LICENSE;md5=3D4d92cd373abda3937c2bc47fbc49d690 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de20420&quot=
;<br>
+</div></blockquote></div><br>I understand that you just copied existing re=
cipes, but I never understood why COREBASE/LICENSE is used here - it just p=
oints to other licenses.</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">As this file is MIT, just use COPYING.MIT.</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Also, there&#39;s a=
n allarch class you can inherit in this as the file is architecture-agnosti=
c.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ros=
s</div></div>

--001a11354a0092917a0516708c46--
