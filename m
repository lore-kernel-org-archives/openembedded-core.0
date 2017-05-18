Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 06DE978095
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 23:16:51 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id y10so14555071wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 16:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nQ+aJIgObMUUQpjJXO5+VfjDDCPelracDxk3VGioIEI=;
	b=GraiRq8kxkt32bD2tZ8j8RkIpKOa8JuTNGZSmRuUA0B+kVAnuoLmzAXLUA/JMhMi7e
	d0EAZ7CQmaMUTfibtLzB2huyDaflwXlR44x9KD9WxcoLXosEvcJ+hmtIVcS4TKbROWLR
	hPn9+hX50NXynbC7gkaZX6if2asIhHG4p2RDb5njSS/mjtX9XNjJy3zfX7yG5IGddm1b
	h+7zVLUdnpGxaUr+XdmUhcXTsxHn7P0+w9clb7QrbckpUZGziqwb8IdhPfcCD11jTkAW
	KixUZSiMBRgdDSXbL1NjcqBGPIOBSLPC+8z6ghmsMUTLpzT5D8n//o3DQl9sJjjRMToF
	bVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nQ+aJIgObMUUQpjJXO5+VfjDDCPelracDxk3VGioIEI=;
	b=rOXXBPqsFjvW46ltUQ6o60k+vNSd1n2whq8wMM7vGt+3qRolU0aDd0EWt101Kqyr7F
	u47tRcRNxrFzf7PcGU+Zj/iXJAUoxj6slc9/vrhYuTg5y0T11i0QrUuRM/EAgvdPcMG2
	RW6bEVCM96SuENm3S3TMNBq6nWv3CjvdHKZA37cAPWjlQRcPVGVIMTjtOp859scvbhgz
	EVbJDKi2Q5WkxhOtYVY3D5m3J9pDvszZA9YK8o8cIr/qduazSu3NFhPDiNXorjt3I0+y
	h4Vm4/2kh3mIbDz1m/poMYcrTHI70Tpvg/bFQULOEPG3xBb3rikx5T2VkSD41t+tmkeL
	rtTQ==
X-Gm-Message-State: AODbwcDJIdonKcrtpLSXZ1B2+IRh/ZHOUKHC/2B1CrMtWUFFIQOyPmdN
	2En7gCpDn0S9figApXlq5cShEcN/Tg==
X-Received: by 10.80.137.56 with SMTP id e53mr4961502ede.67.1495149412568;
	Thu, 18 May 2017 16:16:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Thu, 18 May 2017 16:16:22 -0700 (PDT)
In-Reply-To: <1495149157.27342.142.camel@linuxfoundation.org>
References: <1495146527-32073-1-git-send-email-jose.a.lamego@linux.intel.com>
	<1495146527-32073-2-git-send-email-jose.a.lamego@linux.intel.com>
	<1495149157.27342.142.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 May 2017 16:16:22 -0700
Message-ID: <CAMKF1so_wFUH=eNqBc_Qhach4+C1mW73ZFUuK=TqLaYZ81C=Hg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] conf/bitbake.conf: include ed in hosttools
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
X-List-Received-Date: Thu, 18 May 2017 23:16:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 18, 2017 at 4:12 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2017-05-18 at 17:28 -0500, Jose Lamego wrote:
>> Some recipes build fail due to missing ed command.
>>
>> This change includes ed to the hosttools required to
>> run builds with oe-core.
>>
>> Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
>> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.in
>> tel.com>
>
> We really don't want to add ed here. Which recipes are failing and why
> do we need ed to build them?

we also need whoami which kernel uses to identify the build user id

>
> Cheers,
>
> Richard
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

