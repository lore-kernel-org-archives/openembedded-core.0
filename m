Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0B2DE7026B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 22:38:15 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kx10so4732062pab.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 15:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:content-type:content-transfer-encoding;
	bh=sBq50dPs4OWRR1zrgmxkCLD0kmtnSjzleawXPoHoGpM=;
	b=YbeG/HLhWVBMV+N+7L7AVNDMNPqx5RaLkMZNpfxOUWISbx7Xk/a7n1VGmywvn4ZtZq
	bcogZQ18Dtl7kUIPC4yhcLlyD382GFGWth0Bdbgo8krhWc/kXzXFpOQFXB6xAzyyHhOg
	0GWYjQ+KPcHGRcxfaDp939W0re5yLqeU6wjO5jklgDxPxhZIqw6QboeB/PkpgnBA/Gpq
	/xX25LedWjRmVROVbvUVjMFEDlmBMb1h21D6YXOWnruaCWenAluCLRe49eyiSp4tiId3
	qhBH8p+X6H8YJQgb8MsRSmF7GfSbfS1TEyt0AQGKKAQ9Hf/LMB4/ZGR3zSmi9vvDtMfj
	/MTg==
X-Gm-Message-State: ALoCoQkEOunz49vXrY+cjdp8cc3Q9FIRcblOXJ8zigp5OY4f72g6d+SYdizl5PJ5ybdaqM5vuu2s
X-Received: by 10.70.109.169 with SMTP id ht9mr11512088pdb.106.1405377497002; 
	Mon, 14 Jul 2014 15:38:17 -0700 (PDT)
Received: from [172.16.1.20] (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	nz7sm15942493pdb.48.2014.07.14.15.38.15 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 14 Jul 2014 15:38:16 -0700 (PDT)
Message-ID: <53C45BD7.1020104@mvista.com>
Date: Mon, 14 Jul 2014 15:38:15 -0700
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: OE-core <openembedded-core@lists.openembedded.org>, 
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: /etc/os-release
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
X-List-Received-Date: Mon, 14 Jul 2014 22:38:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello all,

I noticed some reference to /etc/os-release in some recipes. Where can I 
find the initial creation of /etc/os-release? If one is not created, 
would there desire to have one?

regards,
Armin

