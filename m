Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15530.1795517834605920372
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 02:57:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=VbTM9Dy9;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-9213922de73so78421916d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 02:57:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795517833; cv=none;
        d=google.com; s=arc-20260327;
        b=Xh3+1HLUq9aEC6OftslT20JcQC3R+uZYzqBxBjx9zLKVznM2abOsDK9rB75EGBjSp5
         U8Dsosk3uDiK7jbfXb3fW/IALbVuZMfRYPzXVMKBYjOKzzPsNqha3Qzw9OMNk7QGnFxv
         rEIhuhqfjwfJ8cvrw+jD1sdPovUCzbvMICr+3p3oudRubDkc6copfYiQV96/AsbdtsVU
         A29i4e0+kBoot4lr+iC6+JslsRwCU4hgjBiFQNESWFfw4S6FRBNn0h+MeUHLlVp6V3uQ
         IVCciKAyzU2NS2kLSm85ezEBc78NRlzZE4+H43QmCp41L4zoQglSPsCqpjm9L++b+v0q
         +kiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0Jqs+ZU62LtvZ1TkkCMzSqgd1oqaZRJOh+I7X6Rpmug=;
        fh=IIGSP5ttPxX7XJ64L4z1vyaY/NOPbSfkk2ig8BCb4Ag=;
        b=lRAO/HW9RxzuB3YAZFTd2/y0ttZvOXqV3Wa224p3aXscH4tbWrLlSwaQ//Lltemc/7
         1jlBtb/V8tyeuIDiaghVoOg0ImrjuHzrrRa9jTt88o/dOVvtiK31qD8j/kgnAMFOonc0
         VcmFE4yEmmVZ55qqWSnrG9RKcuU6oPKk/dQ5v7fXPjf+0xz03hKgqhcEx4UX1R5h+ERq
         DyPJLZJ9uFZrVZzunW9mhcAz4p2ua1VNhl9sO7QhzT+BCOy9Gexkhqtr0ooaK+VHbDwQ
         xVkshq0SNfZQ4kL2CDOAoNHrVtpmd7frjD3/h4ysqqCPFclLuYgAxqsseKxxEDcPqqew
         oJnQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795517833; x=1796122633; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Jqs+ZU62LtvZ1TkkCMzSqgd1oqaZRJOh+I7X6Rpmug=;
        b=VbTM9Dy9rkd0y1woMXPlP6sfUbTBRu5eomABWW6Lo46sbnNFHX/cSq0vzNkw4Oylk2
         f/J5k5cNNqsP8x2qrFIVrbQ+hmIDBSt4G4bFyR+rqfZ3RtDO7b1eaj4wDx5t7rTMdbiX
         LOw0rNJm8n+AB7nLaju4m4U+jd8xKS/8Ob7oPQ8AEdIes96aHF3ICBJg+J54EdqWXjnU
         kNMWgSmSt/HIAW5szUPX7nPwLSiLK2bzjkTnyL4709a5lVe0NbeVUlbdC3PQ24KACvES
         h+a4zUZ1AKzBxqbDNBgxD1IfP11sEOtF4RPgSzWMV6a1Mp3CaIdjOW0liXrU9tnt1/7u
         +mkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517833; x=1796122633;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0Jqs+ZU62LtvZ1TkkCMzSqgd1oqaZRJOh+I7X6Rpmug=;
        b=vAiupQuxe2j8OfBoOaQVqs1g/Tx57/xXUqDODTk69JWMm+mNvmJfbwwGqO1e70sdLk
         1GiJJJc2V8xEtRjygKuJVqtsYk+Vmd0N0YxJpMsuzMtzDudhtU/Bfyl9lYNo5iAPlvw4
         jT0e81PCMYELiKOJtDz8pDjdahysrpEgK1Zs5uvmaX7nD3gbjG8xhvfxzWJP4Eb9+2ng
         QLCGG1c8Nmr+2XElgeaK+MYsXJy/Mv38HXi2INzrxL+lmcUzFddHCshkiViXb5wSccR7
         aBXUG3E/sXdBgHrXaPRjVoUdRfDrIC2iE7ARNDUnXy7XCXpYL8D25nign2NJoo4XxdcL
         4ieA==
X-Gm-Message-State: APuU4Z8IdNUad03/doGsoYU9BNvVgX91/XsA0XTLfaxm5RxKAKTlTYRA
	tErwbbK84WmhajdzsLWUv6jF8Gs3Awq8WIqCE0BNAe+MJhAq70QYmeHmfMN62UB5NaKi303FpH4
	kODye0f7JlOqUVlGYywvAn1NbbX6BTrg=
X-Gm-Gg: AZFdTZcsVWBg34YeKIWU7NjfDvzJs5ZqpEpcSCUsDG83Ug0XEk0ZZOoyyX3iE25AwKq
	CQzjVkM87xOTNwA2HBfXiGjMxcbITYSG1CSZMOgfSVvZxVokPIiFaU1Wb3OYBsA02rgvE+nM02V
	sjbsZ7sfga3ybnjl9JVoxDEarvwRC9Dn0eJX7ceHCtMrMezBuq4BNLErmMFQSiFfebGKcOYFk7m
	7bKJYTQAi9n+A271nKjgdA4CKpcUGzfjF6+tp9xHoJNRWjmVcIRywiiir+tyc5etV3mzla5q+0i
	WKAyJm2jFrZR18gAO/1iuIHR7RFyCX60yjjOTtpQSQWQaC62BllB8HRG9zFu7HR7VjpFWfgMvuH
	lvIWEJQvaJ3P/dIy0X9a2v3ETo+MR2Febo7+gaHJjPfXFdPiCIkdoyJq5AkJGzwyQdPWfwWLG
X-Received: by 2002:a05:6214:61c4:10b0:91e:8a02:6eb8 with SMTP id
 6a1803df08f44-92134b4e734mr201485506d6.54.1795517833436; Tue, 24 Nov 2026
 02:57:13 -0800 (PST)
MIME-Version: 1.0
References: <20261124061348.3997765-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20261124061348.3997765-1-khem.raj@oss.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 24 Nov 2026 11:57:02 +0100
X-Gm-Features: Aa3M54qS_zm2J9d21l_9cUbSL2dxXjMi6Ca5jTe-tlRt5cZ9NHCIoN0b1XstwxE
Message-ID: <CANNYZj9G8ts=aXyrXP9RyVu2qO=L6FApGkjx2ivCc+j=aK2UYg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gawk: Fix intformat ptest failure with clang
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="000000000000a663b30661039214"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:57:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251019

--000000000000a663b30661039214
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Nov 2026 at 07:13, Khem Raj via openembedded-core <raj.khem=
gmail.com@lists.openembedded.org> wrote:

> +Upstream-Status: Pending
> +Reported upstream:
> https://lists.gnu.org/archive/html/bug-gawk/2026-11/msg00028.html


You can submit the patch as a followup? Or is it inappropriate somehow?

Alex

--000000000000a663b30661039214
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 24 Nov 2026 at 07:13, Khem Raj vi=
a openembedded-core &lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openem=
bedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:</div><div class=
=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">+Upstream-Status: Pending<br>
+Reported upstream: <a href=3D"https://lists.gnu.org/archive/html/bug-gawk/=
2026-11/msg00028.html" rel=3D"noreferrer" target=3D"_blank">https://lists.g=
nu.org/archive/html/bug-gawk/2026-11/msg00028.html</a></blockquote><div><br=
></div><div>You can submit the patch as a followup? Or is it inappropriate =
somehow?</div><div><br></div><div>Alex=C2=A0</div></div></div>

--000000000000a663b30661039214--
