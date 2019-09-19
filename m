Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 84F9E7FB85
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 14:28:31 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id l3so3314438wru.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 07:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=r/zghxRWg+RHqEWkzXf2+qeo1Ao0iZbQTgWYSHPQLAw=;
	b=dpIDnZ4+0OYwZgE/cLtmhvv9MCQDJ5gGZOzyegKe81lNQVqdSf5cc8mEBe4HzJ7eey
	MiuSn6UTkqOTw4PXU/03fU/wpIN527yJN4AlY2k9qXEfACeNpIHDDLeKF+KAVdczOikt
	Yfw78dvjxdM01oONmGQxO2IHKEqQUcWROnjsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=r/zghxRWg+RHqEWkzXf2+qeo1Ao0iZbQTgWYSHPQLAw=;
	b=AiQ3wR/75yEtZyTK9ltLuoQa9BcRYkVCML3JhFkWgQpiUpBlUAozwPB5nVVxMvoeGp
	va6woENJQkObD78mqaH17VI6fcUIBKBd1x0vuZXYwVCjf1ITASkF+xI4uETQrX2orAmI
	pG5dTnD42piOmnVOF7xz3EU+WhCAkZlf7AQUMidhYDtyxIJxvkxq0RxBQZTy6Ykqfehd
	3JR+Mtoj+6AcEE5fUukJqpxZw0o999OmXipf54Wfmc8cJWAqwD4NdMB8uA8p9zt2ssyi
	1msfgr7lptWv739HwVxx7Vq+a6TdqWFQcsOKB/38uF1jxOUS7dPqoXKM/AqCbFyBNClY
	SG3w==
X-Gm-Message-State: APjAAAVEBwgFuxs1euDnQCt7/WMmzsbniHg2S9u2lptInbdjKjDnCrV/
	g4lYox9s4RpE/Gv1TcjrMcEx9Q==
X-Google-Smtp-Source: APXvYqwlnScdBUohzyu97k+jX5kR7A1Nt1UjJJculsJ+xWrLoUqFtaMvCTArsUQTU+1HkuRYoSi1IA==
X-Received: by 2002:adf:e591:: with SMTP id l17mr7705324wrm.199.1568903312225; 
	Thu, 19 Sep 2019 07:28:32 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f186sm8361865wmg.21.2019.09.19.07.28.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Sep 2019 07:28:31 -0700 (PDT)
Message-ID: <2983d9781a232abaed3e341dda56b35fabc35574.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 19 Sep 2019 15:28:30 +0100
In-Reply-To: <20190916223502.2966661-1-raj.khem@gmail.com>
References: <20190916223502.2966661-1-raj.khem@gmail.com>
User-Agent: Evolution 3.33.4-1build1 
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH V5] weston-init: Add possibility to run weston as non-root user
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
X-List-Received-Date: Thu, 19 Sep 2019 14:28:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-09-16 at 15:35 -0700, Khem Raj wrote:
> These changes are from meta-96boards primarily
> Launch the session via a udev rule based on what kind of display
> device
> is available
> 
> delete weston-conf and move the fuctionality into weston-init other
> layers are doing same
> 
> weston-init installs machine specific weston.ini therefore mark is
> machine specific now
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Otavio Salvador <otavio@ossystems.com.br>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
> v2: Drop duplicate isntall rule and use systemd_system_unitdir
> v3: Use systemd_system_unitdir in FILES section too
> v4: Move weston-conf logic into weston-init and delete it
> v5: Mark machine specific

You didn't actually retest this and v5 still fails the selftest. I've
squashed the fix needed into the patch.

Cheers,

Richard


