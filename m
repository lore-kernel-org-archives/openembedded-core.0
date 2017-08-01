Return-Path: <drew.moseley@northern.tech>
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
	[209.85.161.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4AFED7836B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 11:57:18 +0000 (UTC)
Received: by mail-yw0-f182.google.com with SMTP id s143so8277771ywg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 04:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=northern.tech; s=google;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=lfZIsxH+YF0xolUf6Cu4OZNzCZaKxV/mqnhx3eyn4oU=;
	b=Ned+0CeHrEpaqRmh8ePBSleleFE9fJltcUjNu6UpzO00/+So/NgqrlT262FFq/wapn
	hmbqncZkbai51sBTyFHL1i6AonIYJCSFTZHqueZVkvLnV+ePsvJpoGzGWtvqKrlON30Q
	irrnRBsF7gLCJ0hrTz82YKLiW37vnbA9D9wNza5qJC5tzH1omZdGDU2JuCozGkHnrx8Z
	UcyBpOiU+LqBvrkZEJpZK5iRp4O6BwPPyp9t2tKg8LJ1IRDUZ92bKgRx64LXVrD/sf6/
	0Hk112/mkY/2WhmtH3YeHS3r8Rb83FLjdTroKPMekoaVlJ3J7bR9VcPFDEJeglSzRToQ
	+sIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=lfZIsxH+YF0xolUf6Cu4OZNzCZaKxV/mqnhx3eyn4oU=;
	b=iLhFEpAfzSnViJniuM06A/xf9H/0WU8nvh6zK375ooIcNyath8f0ZfeZL0h6Rm2E04
	OvA3GKBlnRmKY1LTiMPAUQrt1bEe/0qsncp9Bzi60cXURHVKTQmPPvVwPH9oukzz6nOk
	1EbkVLurBFDAG59GBDP6qo+AG2uETns1SnP+NYNUhaXp1FKD9qIHbUKD+HjmH3BmFwiN
	LoIbWaDWRK5OH+YXMmGtQkHMTtA2tmrusLQqXnh+l0ScuxFyF5jD5ydvogR7MiKL9ZXH
	Y+Jb17MTvjooSR/LFXz4p+btK9tICtnLUIJVQ/Q0ALN3yyvizBC5VrKCnCnv/9qiZHr8
	og4g==
X-Gm-Message-State: AIVw111RrsynovZa1iT834KUU9vYNVT8THh7Iv9+ux4x40RSJk2Uc6WX
	kmFL9UXzXawphSpq
X-Received: by 10.129.130.65 with SMTP id s62mr16021335ywf.18.1501588640266;
	Tue, 01 Aug 2017 04:57:20 -0700 (PDT)
Received: from [192.168.1.33] (653240hfc152.tampabay.res.rr.com.
	[65.32.40.152]) by smtp.gmail.com with ESMTPSA id
	o81sm7053861ywb.77.2017.08.01.04.57.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Aug 2017 04:57:19 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Drew Moseley <drew.moseley@northern.tech>
In-Reply-To: <20170731212359.GR16135@bill-the-cat>
Date: Tue, 1 Aug 2017 07:57:19 -0400
Message-Id: <01952D79-29AB-41F1-AF87-BF8C19E1E5E6@northern.tech>
References: <1501532184-26270-1-git-send-email-drew.moseley@northern.tech>
	<20170731212359.GR16135@bill-the-cat>
To: Tom Rini <trini@konsulko.com>
X-Mailer: Apple Mail (2.3273)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] local.conf.sample.extended: remove references to image_types_uboot
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
X-List-Received-Date: Tue, 01 Aug 2017 11:57:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Jul 31, 2017, at 5:23 PM, Tom Rini <trini@konsulko.com> wrote:
>=20
> On Mon, Jul 31, 2017 at 04:16:24PM -0400, drew.moseley@northern.tech =
wrote:
>=20
>> From: Drew Moseley <drew.moseley@northern.tech>
>>=20
>> This class was removed with commit:
>>    OE-Core rev: 65f27122950a35a67ce39ae4cfe93d0dca6b0dab
>>=20
>> Signed-off-by: Drew Moseley <drew.moseley@northern.tech>
>=20
> Reviewed-by: Tom Rini <trini@konsulko.com>
>=20
> --=20
> Tom

Evidently my northern.tech subscription had not yet taken effect when I =
submitted the original patch so that email never made it to the list.  =
I=E2=80=99ll resend a V2.

Drew=

