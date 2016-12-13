Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8A35171DE6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 17:51:28 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id l126so7867097vkh.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 09:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=tSFd8ToChdjlyj+IPmwuHbTIvZehrp130bPZuIYd2k4=;
	b=Bban/zzudeUfb50FaxHu8OCQML0yavdB6hRN4edld8JESl+uz/dsuIIhrEe8p9Da+d
	Jd/WsyUcH4NiVn+tHZm+iyVx32EKEPUHfPyVUBuXPQQRsSH5irFN1/5iQX7JOr0ayvyz
	vqWgh92F2pjIYYgkXnvmC/GRN0X8NrQ4XKY+E3Dqk9Im5pTsCvKOMIQKjHob7SmpDyin
	XneJaRjn5nG8fQoJ7eUa6OA/N7zwE8+UO5ZCM+gD0UpVOxEq2yj+9MJaQXIZM1LZcmjm
	9wbZWeCXM8OVxUK8qcc7SUJj62MA8SOeTsUDikKnKOreUrWkej44/3Y272tiP/4Yq/7i
	ROng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=tSFd8ToChdjlyj+IPmwuHbTIvZehrp130bPZuIYd2k4=;
	b=RavoKuo8Eq8FUPbulOS7n9cOMMrsYaRn4Ntz2c14EkW/h7ifSyoQKzE3Q31UCv7v7D
	m7BKq/GmwvaGy1vx+9phA2GX79g50Ev6pNCcDY/kT8speSNSsKOfv1Vn5aPTO3/gwHHF
	3HtKC6Cdg1n6HVproM0rbsxr2kaYt49fNVU4A0cWJ3JhHZU0abVaX3N6gBrQZnD7sqpJ
	GbkNwyfURiPsKsGKhQqG0VgM7qqSWrTvclXML+na2qBrQABSV0cP1njHb2pW6qC7Iixp
	RGwGuLkI2lQpHUaCwCFVSz5mWqiAJ9tHDgCeKxng93wm6CX9ARN4To+0u2Js3EuFXK0D
	uzWQ==
X-Gm-Message-State: AKaTC02GFADdt9oFEfyEfWa3LDkFoBA4HhROo5kq4iJiohLTSKRPgiX2MnTHjyPu3BZjd0vxx+AZKxVc0J1nZw==
X-Received: by 10.31.75.198 with SMTP id y189mr35002996vka.51.1481651490211;
	Tue, 13 Dec 2016 09:51:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.85.157 with HTTP; Tue, 13 Dec 2016 09:51:29 -0800 (PST)
In-Reply-To: <CAJTo0LazOcewXGiXoqrtxVTt=3994exQPwaf=DnqLkJRYP39qg@mail.gmail.com>
References: <1480983561-11437-1-git-send-email-schnitzeltony@googlemail.com>
	<1480983561-11437-5-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0LbtMiBd=_rip_Let9C0aAg-moLt2=3V=ghGOUA=yW-m=A@mail.gmail.com>
	<CALbNGRR0CXGDXr6Jj1q5_WQ8U_=kyJmdvUs1hJ_jELBSEYcnDw@mail.gmail.com>
	<CAJTo0LZ-3hpYZcibQQX=D6o-wMRZbVeTGVSs9rkKNpEmOoqoZg@mail.gmail.com>
	<CALbNGRSCR4bNEwKmH_cjEdoQqUUyarOJ+zp-0EP2bvFp5LXByA@mail.gmail.com>
	<CAJTo0LazOcewXGiXoqrtxVTt=3994exQPwaf=DnqLkJRYP39qg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 13 Dec 2016 18:51:29 +0100
Message-ID: <CALbNGRRaAi4Y7MhfgPY9X8c3+pOgrBnxK0jeeLG+=EWSReR+Yg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] libsdl2: fix build on wayland(-dev)less hosts
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
X-List-Received-Date: Tue, 13 Dec 2016 17:51:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2016 at 6:46 PM, Burton, Ross <ross.burton@intel.com> wrote=
:
>
> On 13 December 2016 at 17:46, Andreas M=C3=BCller <schnitzeltony@googlema=
il.com>
> wrote:
>>
>> I thought wayland depends on wayland-native already. Is it possible
>> that you don't have wayland in your DISTO_FEATURES - honestly have not
>> tested that on a machine with missing wayland-scanner.
>
>
> If wayland comes from sstate then it won't pull in the native dependencie=
s.
>
> Ross
Ahh - OK

P.S. This is a good example why recipe specific sysroot is a good
thing - correct?

And

