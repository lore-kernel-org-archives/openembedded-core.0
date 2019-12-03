Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id EE0167D265
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2019 23:14:54 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id g17so6176017wro.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Dec 2019 15:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=NHyVXKLohA7nSczWUHdVmqj8kDtefDFBEhSTXzWO9o4=;
	b=gSLT0hSdyT6Dq+c7K8HjTPRurzj32SFdjy1kn0BLxCLuqTN10Z7cMu6dTlTNmEvm2L
	icrjDoyc4Yi4u57wNeyUq+sKvHs9/Z1KCzudbSnRa5VHvhrlz1J53mZhDkJ9Lv0dDCVK
	jYqfAOaNW6ESABrsnmQjmbpDx5knevP0qgePg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=NHyVXKLohA7nSczWUHdVmqj8kDtefDFBEhSTXzWO9o4=;
	b=GgH8AxSK4UA9ICPLMcDP2sV7R/iJldCG35NEJfTL4OKolDF1ZicDIdHT9/gw1olRVl
	3s6m6ZmnOWGe+HFZJiCOwqmBlcI/uhNDBTIamfaaQZe8LDmihVb6SWaD+4jMnp0eJ3D9
	vWHVhbICgMZmY8oDXoAl7mfoneXDuBG2934Oq14C3OdS6SEi9/kx1ebCtrq9am1BCHxv
	qlLzcpcR3GfQMK4NDvYf5tgL9pFBOOXq9lYOQTFq03X9sClxD2gRD33OUZkvJiuh4b56
	7tDAR4tCZTDs6dzU14spp5avGFwTo2peYs0n6NLxvigirtHr3j4XHdpgXtq+3er2LHtF
	n2rg==
X-Gm-Message-State: APjAAAUxiPoW9OwuZu6R0aVNq0AduoNu7SGDdQ/DtB1NnZaLJtZKU4rf
	kwMbJ4HCveXQfwlS7lypOgwyDs6P+8k=
X-Google-Smtp-Source: APXvYqyLKePtAraCR/Dm/0SdE7ro4+f3xcQ8x6SAEEPWEHsbkEvmsmew18JX+ki5hA5tWBs8cQMRFw==
X-Received: by 2002:adf:d183:: with SMTP id v3mr556828wrc.180.1575414895224;
	Tue, 03 Dec 2019 15:14:55 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l17sm4659870wme.45.2019.12.03.15.14.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Dec 2019 15:14:54 -0800 (PST)
Message-ID: <bdb6f9214991c0871d50944f65a6782bffee5adc.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 03 Dec 2019 23:14:53 +0000
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: OE-Core Autobuilder/Bug Status
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
X-List-Received-Date: Tue, 03 Dec 2019 23:14:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We're coming up to M1 and I thought it would be useful to summarise
what the status is:

Features potentially pending:
- OE-Core python2 removal [patches in -next]
- OE-Core Hash Equivalence enabled by default [good progress in -next]

Autobuilder visible bugs with known cause:
- Reproducibility problem from perldoc (13606)
- UNKNOWN selftest result stats (13663/13067)
- PID recycling UI failure (13667)
- killed testimage does not cleanup properly (13100)

Intermittent Autobuilder Bugs being seen regularly:
- selftest LockedSignatures Failure (13605)
- selftest reproducibile build python crash (13664)
- logrotate.LogrotateTest.test_2_logrotate (13602/13632)
- systemd failed to start some services on boot (13600)
- qemuarm-alt systemd login failed (13603)

Intermittent Autobuilder bugs not seen as often:
- multilib libx11-locale package conflicts (13647)
- test_postinst_rootfs_and_boot fail (13650)
- unable to login warnings (13646)
- Distrodata.test_maintainers fails (13604)
- RunCmdTests.test_stdin failure (13055)
- TestMultiprocessLaunch.test_multiprocesslaunch failure (13054)

Cheers,

Richard


