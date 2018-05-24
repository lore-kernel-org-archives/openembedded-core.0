Return-Path: <twoerner@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id AEFB374AD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 21:38:22 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id y15-v6so5672113wrg.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 14:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hOnUxqCMKzR4bce/3IEDFFG952neD0WRnh1Ffhg8RPo=;
	b=AIn+iqBdQ2XGckKo4dRWRPtYHwpU2OZBcJujIBdUq9r9qmEiSMcYIEvZ/wnrDCnpDO
	Fv/YkL3HykEgEECsBWnKT0ENzvCopLlNUBehrQS6vrq3hzYHFJThPw1448DqQ2My7v+K
	6tfu28ZIaQs5+YcsoKCKSexWTt6HlRuQCKDNk1issHK7zUuP8YZtukLNji6THPeSN6s0
	OjSYMXJ1UdtnzjxG8ykM0cXIYIvhM+x6FVSFChhX0a0sjQhSWOYzOjHf6Y0MbD1gzjJ/
	Iu2ZzhUk5f5FHUyrxJMOfJZd30/qqJKYP9Vsu5jMw/Bhuj/aGneEF5s5yuSF+h4xJ2rL
	T0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hOnUxqCMKzR4bce/3IEDFFG952neD0WRnh1Ffhg8RPo=;
	b=NaOx0ST5n31zSFDFFQsGVrDhkdMdCF/jOjzKMvroyaOMGwfYZayEjcsqk4hJTYe4xP
	h3mfZbLrNqm0ZaJ47i4YB+2ugUchbizf34s5/j+p6FpsCAPl9f55sSbzQbWF6GqxLlnw
	sEHJ4BRKtlyPmYuZDuSiRuEin/0DNZVJ/yoVJVg3fOaldmF/GA+ubsACegRMflKcaQJB
	tgJgqKgFr+5/zQCak1Ss1tS7JQ8uuP4PV15SJnq+LCjBnjjJNgZWhYSFFadArmxnzE08
	BLBp9yG01SjKWlutGc9U6NOGB9//TBM6kpSWxGv33FKrhgmyI8osxj67smCzgVIYfopT
	uCkA==
X-Gm-Message-State: ALKqPwdrXdVEc8gepqrcZivd8fNLOIGU/zB0ewvKbaG+3OTGVsIBfpjR
	2dFW/rUisu9wOCo3GWSeaqgHXi7Ggx2GduFPHps=
X-Google-Smtp-Source: AB8JxZr/VzkGFHcTTw6jDB1Lks/XsXyzzDAvFwT4X/bjV9qwPjbDzQ1FpCtRuldCLrvig2J5ViCU3NgTrjh6cg408N4=
X-Received: by 2002:a19:a591:: with SMTP id
	o139-v6mr5365274lfe.146.1527197903278; 
	Thu, 24 May 2018 14:38:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:cb07:0:0:0:0:0 with HTTP; Thu, 24 May 2018 14:38:22
	-0700 (PDT)
In-Reply-To: <1527194374-2490-1-git-send-email-daniel.diaz@linaro.org>
References: <1527194374-2490-1-git-send-email-daniel.diaz@linaro.org>
From: Trevor Woerner <twoerner@gmail.com>
Date: Thu, 24 May 2018 17:38:22 -0400
Message-ID: <CAHUNapS-0876NrNQB8=hwNSOHz3GSAFxZ2MkkovhvseSQgdPAg@mail.gmail.com>
To: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: bump to release 20180515
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
X-List-Received-Date: Thu, 24 May 2018 21:38:23 -0000
Content-Type: multipart/alternative; boundary="00000000000086d8d1056cfa78e1"

--00000000000086d8d1056cfa78e1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 24, 2018 at 4:39 PM, Daniel D=C3=ADaz <daniel.diaz@linaro.org> =
wrote:

> Patches are still fresh as the meadows.
>

meaning.... ?

--00000000000086d8d1056cfa78e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, May 24, 2018 at 4:39 PM, Daniel D=C3=ADaz <span dir=3D"ltr">&lt;<a href=
=3D"mailto:daniel.diaz@linaro.org" target=3D"_blank">daniel.diaz@linaro.org=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Patches are still =
fresh as the meadows.<br></blockquote><div><br></div><div>meaning.... ? <br=
></div></div></div></div>

--00000000000086d8d1056cfa78e1--
