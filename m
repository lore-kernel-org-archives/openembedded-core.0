Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6E27C7866F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 17:56:13 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id d137so3556621itc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Dec 2017 09:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rR+hQphQI27ouA/LYJRT5D6MKdecxbVhjorsEtPI9Fg=;
	b=gnd5R0mpSyA0hNe/mafiutYdBJo13oZXcpAnV6m7vrMRi5SdmFLBmPN7ErAaGQwYW4
	VkKinIWSNmOHt7QXvGYQc+BzGpiW4SSxT9zdt9bcO0RJvxnZxH997NeylEBALjvbh9Er
	VhuNm86PXQVMAd3U66BY9p+6rXaQU7PeJjgnDV5I7O7u6ctarjLahhle/ET0L681fBTq
	wPf4PBSW9f4/xRmpZpalH2ilSSRjhLyFwkjWMx7jsJ4wjw2spvHKVqVBOFuDCN3xsB1j
	RpecvcXhfg8XRpt5LGjWY4dCUnZLTdcdjt249n9pj30MnTn3vTwrXGzuUO7x4V1oNmhx
	Uwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rR+hQphQI27ouA/LYJRT5D6MKdecxbVhjorsEtPI9Fg=;
	b=MmQVQUsCnc86PMlTS4bDnNJaqUJ3i7feqQJgPGFisRaqckhs/HsBEpZGIZZFKRXeCG
	05Xp/YaC8FBqXuMZD79XS1bHi9ceefOcU6Kyg6XWbmmtRX3wnr4rqvb0TZ5TdGFcKAcP
	hDUwFJwxdryreqZKWo4DK8JDE5YOEgJhZXGX5RB9QFG544bio+Vj6ZwNwf/jtB2arDnV
	DGdU2QXLB4M3fQmcgTcKgeBsN6NJoXynhddG5QQnRTEQlGjBfOJkrMM/hf3Ui89t1lYP
	DJbNBu7HrLjfIQ+tHb7ui+f24x1o60fX0FkUi2HcIpkdwjH6bv4ASVfzS5K0MIdoHy0P
	pJfw==
X-Gm-Message-State: AKGB3mJKGoIlgCR2QXpUN33UqHzHyt0+1LhxvlfBpxdHib19zWFPq9bA
	vT8zxAVA3+vNy+y87pSOncak6EgS76fpv2FyYRxMIw==
X-Google-Smtp-Source: AGs4zMb912GHOoOKaQu/2QhzRntEGFPBeHnqHclxmLqBQK7N+Sup+Mfc33OnOI4WyrBnlZWN1rHdyXOeT1Pvfb9qB/k=
X-Received: by 10.36.17.15 with SMTP id 15mr19944340itf.53.1512496574287; Tue,
	05 Dec 2017 09:56:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.137.195 with HTTP; Tue, 5 Dec 2017 09:55:53 -0800 (PST)
In-Reply-To: <1512488695-19237-1-git-send-email-vincent.prince.fr@gmail.com>
References: <1512488695-19237-1-git-send-email-vincent.prince.fr@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Dec 2017 17:55:53 +0000
Message-ID: <CAJTo0LYiCVhhN0m8eEhVE4gE1k20fQ0nrYTGRtT5XDxm1-A7Vg@mail.gmail.com>
To: Vincent Prince <vincent.prince.fr@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] GCC 7.2.0: Fix 0051-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
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
X-List-Received-Date: Tue, 05 Dec 2017 17:56:13 -0000
Content-Type: multipart/alternative; boundary="001a11445d68091783055f9b8d50"

--001a11445d68091783055f9b8d50
Content-Type: text/plain; charset="UTF-8"

On 5 December 2017 at 15:44, Vincent Prince <vincent.prince.fr@gmail.com>
wrote:

> Patch fails to apply on peep-ldrd-1.c and peep-strd-1.c.
> First chunk replace ldrd by ldrd\\t then second chunk copy peep-X-1.c to
> peep-ldrd-2.c and try to replace already patched ldrd\\t
>

We did some digging on IRC and discovered that this is caused by having an
old patch release (earlier than 2.7).  I've just sent a patch to check for
that instead.

Ross

--001a11445d68091783055f9b8d50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 5 December 2017 at 15:44, Vincent Prince <span dir=3D"l=
tr">&lt;<a href=3D"mailto:vincent.prince.fr@gmail.com" target=3D"_blank">vi=
ncent.prince.fr@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extr=
a"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Patch fails to=
 apply on peep-ldrd-1.c and peep-strd-1.c.<br>
First chunk replace ldrd by ldrd\\t then second chunk copy peep-X-1.c to pe=
ep-ldrd-2.c and try to replace already patched ldrd\\t<br></blockquote><div=
><br></div><div>We did some digging on IRC and discovered that this is caus=
ed by having an old patch release (earlier than 2.7).=C2=A0 I&#39;ve just s=
ent a patch to check for that instead.</div><div><br></div><div>Ross</div><=
/div></div></div>

--001a11445d68091783055f9b8d50--
