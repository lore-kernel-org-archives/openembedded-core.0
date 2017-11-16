Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id CD78D787BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 17:57:52 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id i14so3277283lfc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 09:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EOPOwT1j6jO4meCSbLsh3Ud7/bikmTQD2RP/3xbTsts=;
	b=q62X5PptqJ/xBTatHMfBxXkNVtH9/4EVQwaaQQu0evHJjyg5qNi3RUAmiAT6/Q0ra5
	lIWRVdcjfwwS8OVV7BXg4al68dxu4VV+dl7Rcv/21jWFZoL93zqTZlZ+mqdytBucEuIe
	1EMKoHbUOXP62uhAcDuK2azmUhrXmOZZksw7vN7GFWnfj6RJgOoNst1XmvVuznysLPVU
	9BoaDOxHu01+H6a1arcXvXyRRZ5hQtghzjMonECJ6De6UsGj1TvqJi+jum/3NcnQj5qE
	w76lmImEmCDi0QAIN3y/UYqFbmDk8qcwFUX0MmciuQtBchq2L7ErF0p2/b0Z2jl67kDp
	OywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EOPOwT1j6jO4meCSbLsh3Ud7/bikmTQD2RP/3xbTsts=;
	b=eah21dqYGvAIV3oM0BYxGmSV7FN8xbYXfLwvQZWRBIr7qIRmcW7QfiadSYZsZGEJNu
	RQB00N3NhkySnLtGJQE5/vSsi6IndwNAu7yzJ6XNNrSj2wBjMulRPYoD5BJ3zOqa9Slf
	loGLPojv0i2ejnml0Ba/sF8v+EoR1numE3A/EqprlKLKr18jB8yak3GQJF6zVRibkdL1
	OQwmPmM9+kyIGf/ppRy/SzrQ3c+VTsMgWYiXmchBKIQUtkfI3kphWYwHXWrZsO2eRmFl
	bx4BRDXdLyyH4g/v4r6KHT+y9grluRmH2bvQaNv7aycTxbyHooyG14oEF1eXPHhOwPIN
	VIdQ==
X-Gm-Message-State: AJaThX5aHclIea2S4rFfxfrT5CmfOn1FOwWmbpZgRI+efkfUAKAeeswG
	T8F/mHbDRkyxiqcOA/9C4Bxq39PNnl0GCGw79Wk=
X-Google-Smtp-Source: AGs4zMYhVcJ4Qr5omH/tQnTZv+EBrdaSEL3Ka24S11UdA5RBr8fJNjhl5T9AwEHAPULQvUBLj6Ijzy0GNv6Q38aKbUs=
X-Received: by 10.46.27.85 with SMTP id b82mr571841ljb.163.1510855073481; Thu,
	16 Nov 2017 09:57:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.143.11 with HTTP; Thu, 16 Nov 2017 09:57:32 -0800 (PST)
In-Reply-To: <db49b730-240f-3d14-3fd0-31e109bd2ee2@linux.intel.com>
References: <20171116174541.3081-1-ricardo.ribalda@gmail.com>
	<db49b730-240f-3d14-3fd0-31e109bd2ee2@linux.intel.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 16 Nov 2017 18:57:32 +0100
Message-ID: <CAPybu_28ZvnJTjd1KiNx375+kfh1c+q=y65paJYDeHpJyd5qew@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] meson: Port pkgconfig-native patch to 0.43.0
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
X-List-Received-Date: Thu, 16 Nov 2017 17:57:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 16, 2017 at 6:54 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 11/16/2017 07:45 PM, Ricardo Ribalda Delgado wrote:
>>
>> +Some libraries, like QT, have pre-processors that convert their input
>> +files into something that the cross-compiler can process. We find the
>> +path of those pre-processors via pkg-config-native instead of
>> +pkg-config.
>> +
>> +This path forces the use of pkg-config-native for host_bins arguments.
>> +
>> +There are some discussions upstream to merge this patch, but I presonaly
>> believe
>> +that is is OE only.
>> https://github.com/mesonbuild/meson/issues/1849#issuecomment-303730323
>
>
> Does the snippet from Martin's patch that I just commented on solve this
> issue in a much simpler way?

I am afraid not. We need to call pkg-config for getting the -libs
-cflags, et all, and pkg-config-native for --host_bins We cannot use
the same pkg-config for all unfortunatelly.

>
> Alex



-- 
Ricardo Ribalda

