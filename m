Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5ED9671E22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 17:52:11 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id x186so7810210vkd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 09:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=oGdq8LF3QwHlvm63LAHsAl5M5mV+3EPUAgdPHaGQhVg=;
	b=tznQd5ObuTzRQC+Q4Ygd2LUIC/YDVw1PnEpYAL/IDFPR60aVctdL2YSVCDIoyG7Qcn
	gJT51e/Jtzo+Kb3P6rwdzyytt6YxM0MIb2IyoVILKCwUC72DwXBWzd06vMh6DlMi0WTl
	FIMOyoFX0CAtbuwbsX8nKwkxXfYv8zxLQ+5pKvf8A58ly2pY05KNZp5aF4sy2jAubZwf
	hLXpGIO2P35eM5iISz0IC9Pc6GbDs3rvUadqZifC/v+odbcN0ECgT5+l6QyW3gNOLTLw
	6JC3s6/WFJY0/LoE0e5HMOj3gpdMbolRWovR7w2KXqd9NAV659MxtUfJFxJISE0xZ4B9
	JLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=oGdq8LF3QwHlvm63LAHsAl5M5mV+3EPUAgdPHaGQhVg=;
	b=QdWk1GxGBRHX/C05bV6KHYCre8f8WhDTBcHZu+poRD93Ld+hSXFi9XfD7l5HiiTVjI
	asrL2V4qvHiPER7mE5owE+H4XEunSeD4DEq5nnTQxBMSTpme/nlN90hbdbUgk4vrastF
	gx5u6Q0TblbnTkCQgftJ0iX5f1HnEeyYxekwFecVRcSumYcrK57FddPQvEHkBohXFvLd
	XH4ViKMG57DWcc2HdtXmU5dKOdylugoUyRGRDzPlHzGiegdAYIETlopDw5wbrEXP4P8y
	RBR9fQJnt6buDC7mZlW0G55o4HLLuY/2VlkrDmX1w3iuCjUpNScH3lJTaR46gC0qLdG1
	Yd5A==
X-Gm-Message-State: AKaTC01UyH+pr08Kjmdm4iLxzZ5Bqk6gAZv7H7JTrZ4J8yApNh5X9im1vBxLzC21APCmsuZbjMPYbpgC12dreg==
X-Received: by 10.176.84.156 with SMTP id p28mr8477937uaa.76.1481651533402;
	Tue, 13 Dec 2016 09:52:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.85.157 with HTTP; Tue, 13 Dec 2016 09:52:13 -0800 (PST)
In-Reply-To: <CALbNGRRaAi4Y7MhfgPY9X8c3+pOgrBnxK0jeeLG+=EWSReR+Yg@mail.gmail.com>
References: <1480983561-11437-1-git-send-email-schnitzeltony@googlemail.com>
	<1480983561-11437-5-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0LbtMiBd=_rip_Let9C0aAg-moLt2=3V=ghGOUA=yW-m=A@mail.gmail.com>
	<CALbNGRR0CXGDXr6Jj1q5_WQ8U_=kyJmdvUs1hJ_jELBSEYcnDw@mail.gmail.com>
	<CAJTo0LZ-3hpYZcibQQX=D6o-wMRZbVeTGVSs9rkKNpEmOoqoZg@mail.gmail.com>
	<CALbNGRSCR4bNEwKmH_cjEdoQqUUyarOJ+zp-0EP2bvFp5LXByA@mail.gmail.com>
	<CAJTo0LazOcewXGiXoqrtxVTt=3994exQPwaf=DnqLkJRYP39qg@mail.gmail.com>
	<CALbNGRRaAi4Y7MhfgPY9X8c3+pOgrBnxK0jeeLG+=EWSReR+Yg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 13 Dec 2016 18:52:13 +0100
Message-ID: <CALbNGRSuM0zy848Vv1j_mBXPccGcNmK50tD0yc1jc8XotmfPEA@mail.gmail.com>
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
X-List-Received-Date: Tue, 13 Dec 2016 17:52:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

reas

went out too early :)

On Tue, Dec 13, 2016 at 6:51 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Tue, Dec 13, 2016 at 6:46 PM, Burton, Ross <ross.burton@intel.com> wro=
te:
>>
>> On 13 December 2016 at 17:46, Andreas M=C3=BCller <schnitzeltony@googlem=
ail.com>
>> wrote:
>>>
>>> I thought wayland depends on wayland-native already. Is it possible
>>> that you don't have wayland in your DISTO_FEATURES - honestly have not
>>> tested that on a machine with missing wayland-scanner.
>>
>>
>> If wayland comes from sstate then it won't pull in the native dependenci=
es.
>>
>> Ross
> Ahh - OK
>
> P.S. This is a good example why recipe specific sysroot is a good
> thing - correct?
>
> And

