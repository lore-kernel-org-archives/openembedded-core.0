Return-Path: <kergoth@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 98CC060269
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 16:24:31 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id n6so14679157qtd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 08:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=M4tHKu40avAW4tFWd91oknR9A2Fqr6k7tm5Kjq8vR3o=;
	b=RTijWi+xHKg6/b6dgpY34JL+ZEAI4eMehZFpyuSC8lLjZ2VUHKzbZGvFFqsC6roYCV
	hnNlh0AEQTtE5jPDvP+aYX5omPMFm6HadHAHDDOhAwKPlPr2BYVbAOMfddPCl0ysfH+E
	qG3kd1mmoxo6jnFSuCwFcV44RmzyQ9Nts5RjOmuzYSD9G7IQNNVMND3ScOV98nMBGkh9
	VUruf1pfQWflXBNYCU4Q2VUSGLdPk+923dmWZ8bNklt72MWFCrTXtRXzMmGRX2prOCpz
	CV4mVZn7Rks9gO3DnuFoSwQkSVhAO5nB5sfYB//NDpoJ+Cjlij2CFWYZtc8DOE0H0z81
	PWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=M4tHKu40avAW4tFWd91oknR9A2Fqr6k7tm5Kjq8vR3o=;
	b=KPQbp2XtDCcsKACJoZkDtTpxIxsQwspGTBreAp4jF3MEYDZ54fklC61NwwrjDDaxxB
	m/RHWQGi6HhkmHn8n4TbpnxEJB94zCiaBmNw+0NjrVRSLmkxmEmpZqKlZefsa9LUpYGj
	mrTNS2ijjUf7IH+MGPmyUJ9F3a48LDAGjYGf3aMfMPIrIiclw76mKD+nJ8NFy+ylCiT+
	GyJYrlIBhW8kmnmfcvUHUiGM+SlNF9vZ3pN+s50VltAGuPD+ndZz/aIaONjYYQZBF7AK
	TtshUWCeAGt34Yb33V8rUujjjsbz366JidTB8jxXQhAle9pGBBrkA+Jq8CHajceOq2hb
	35+g==
X-Gm-Message-State: AKaTC02OH03+qWArvH65p7/JBTWsg3e+Zc8xy68vXFk4JKZd35H7z+qBwX5YvuQrfqa1JgoBvdmeEiIUkKDhNw==
X-Received: by 10.202.117.207 with SMTP id q198mr1614173oic.163.1479399872782; 
	Thu, 17 Nov 2016 08:24:32 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.35.65 with HTTP; Thu, 17 Nov 2016 08:24:12 -0800 (PST)
In-Reply-To: <CAAPZna2dHKqh-rDSo6UGu0uP=CBLRHaGbhC-c=OisccQ4HUUsQ@mail.gmail.com>
References: <1479396394-26134-1-git-send-email-fabio.berton@ossystems.com.br>
	<CABcZANmh+pV4Xxwi2UY7fA+BctpVXRvM6gLcgMJEx-rwODMi4g@mail.gmail.com>
	<CAAPZna2pDLyq6PH6sb8c0J_Bxa2Pi+FNNZw_tVJ38o90mGsEJw@mail.gmail.com>
	<CABcZAN=55DOHHy0fMJi6pPaR+TuwgwfErOd7YBAN=s_e9D0rwA@mail.gmail.com>
	<CAAPZna2dHKqh-rDSo6UGu0uP=CBLRHaGbhC-c=OisccQ4HUUsQ@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 17 Nov 2016 09:24:12 -0700
X-Google-Sender-Auth: hWvrHbola0cWXXjad8z7Y9KNkX8
Message-ID: <CABcZANnL5MxwQmiZZ0i8CGHaYxsD9zapNfcyB_a37OoigHq2oA@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpcap: Fix build when PACKAGECONFIG ipv6 is not enable
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
X-List-Received-Date: Thu, 17 Nov 2016 16:24:31 -0000
Content-Type: multipart/alternative; boundary=001a11c17ba4e5ec390541819f86

--001a11c17ba4e5ec390541819f86
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2016 at 9:21 AM, Fabio Berton <fabio.berton@ossystems.com.b=
r
> wrote:

> No, I created a patch, git format-patch and then edit generated files wit=
h
> Upstream-Status tag and added to recipe. Is this wrong?


As I indicated in my first reply, it=E2=80=99s best to put the tag outside =
the
generated patch (above it, or below the =E2=80=94-), as it isn=E2=80=99t pa=
rt of the
commit, only part of the patch file. It=E2=80=99s minor, and you don=E2=80=
=99t need to
re-submit, but in general the tag is not part of the commit message. For
example, if your patch was applied to a git repository with git-am, it=E2=
=80=99d be
in the commit message, which should not be the case.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c17ba4e5ec390541819f86
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Nov 17, 2016 at 9:21 AM, Fabio Berton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:fabio.berton@ossystems.com.br" target=3D"_blank">fabio.berton@os=
systems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">No, =
I created a patch, git format-patch and then edit generated files with Upst=
ream-Status tag and added to recipe. Is this wrong?</blockquote></div><br>A=
s I indicated in my first reply, it=E2=80=99s best to put the tag outside t=
he generated patch (above it, or below the =E2=80=94-), as it isn=E2=80=99t=
 part of the commit, only part of the patch file. It=E2=80=99s minor, and y=
ou don=E2=80=99t need to re-submit, but in general the tag is not part of t=
he commit message. For example, if your patch was applied to a git reposito=
ry with git-am, it=E2=80=99d be in the commit message, which should not be =
the case.<br>-- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_=
signature">Christopher Larson<br>clarson at kergoth dot com<br>Founder - Bi=
tBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software En=
gineer, Mentor Graphics</div>
</div></div>

--001a11c17ba4e5ec390541819f86--
