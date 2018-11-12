Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 77FBD6C0DE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2018 11:44:08 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f2-v6so7795846wme.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2018 03:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=lzZ6MhGYBP+MCm3wGzEP7RXRQ1iSrnBF3ndJ/WJeOUw=;
	b=NKDA0QHjkv/mow26HmpOJ/g+aV573rjkHtDWot01PmyMTt1zWSHJGXMe4Hzh7+XShC
	1FAagocQegHCsFRp2rhotPpsHTQ8g+eK+i7fkk5wxQ9HXZ58/klt6eCiAJpbagh+NyF6
	Xtd8/2PUpA9TsQximFlfKD6u65Cm6/ntnkFFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lzZ6MhGYBP+MCm3wGzEP7RXRQ1iSrnBF3ndJ/WJeOUw=;
	b=NV1dKN0WuZk6VhvedS5Mde15EcSKZOJ8Ws6rPEATTcZ3f2uCfdygdorQVmtoqstTSd
	Wh9NVZwT8HUyw4Q5ZYzU00iN+Nzx5pKWkLvLi8a0LZ8zpie0u9dw/ZeNlHMQwpm3SPn+
	NsLDMmldi35+6LD7ynaSOcrK4pminXix0dRkw0SzBL+B//RxfFZYDnp2C9pY2Lotl1+a
	yjbNM36ZmPH1l2qtgkqZppDp5UlOMLxc0S241Sj/nIlsJWBgQti4JSe5OZc3uKH6FryH
	ji4hNw5A61tYu1hAN+91cWU6Cx1OENJAvYMeOPSZgd/uJyW7uvXPAQvGUM18h2S1AmQH
	9/zg==
X-Gm-Message-State: AGRZ1gIb6NNvSTbAT3JQY8uoedQyKK/htaAaPLlsFcYaNoPPhjCRdjbz
	Bc2J9HsLrX3WB1KQ7PZapQJ1iw==
X-Google-Smtp-Source: AJdET5e+jD+8K0EReTModfayD27wKXQsp59+7aKbSArdK/YkJ0OcBAaSeaY1eB3uC0eFPw7aaKrE+A==
X-Received: by 2002:a1c:3491:: with SMTP id
	b139-v6mr6817306wma.99.1542023048394; 
	Mon, 12 Nov 2018 03:44:08 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x194-v6sm32780857wmd.41.2018.11.12.03.44.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Nov 2018 03:44:07 -0800 (PST)
Message-ID: <3c2a7b56677a1eb00aace62b4608055810e9f9f8.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 12 Nov 2018 11:44:06 +0000
In-Reply-To: <9DDD2658D1FE414E99172D2DB1E4D0434811E1D4@KMSMSX155.gar.corp.intel.com>
References: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
	<9DDD2658D1FE414E99172D2DB1E4D0434811E1D4@KMSMSX155.gar.corp.intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH 01/12] build-appliance: Drop test which is already	automated
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
X-List-Received-Date: Mon, 12 Nov 2018 11:44:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-11-12 at 01:41 +0000, Yeoh, Ee Peng wrote:
> I realize the execution action inside "build-appliance.build-
> appliance.Bitbake_build-appliance-image" was not complete. Actually
> this particular test was testing that using build-appliance-image and
> vmware, one can bitbake build-applianc-image. This was different
> compare the automated tests inside AB where it test that bitbake can
> build-appliance-image. 
> 
> The correct steps for "build-appliance.build-appliance.Bitbake_build-
> appliance-image" shall be below. Allow us to submit a patch to add
> the missing detail for this test. 
> 
> Steps to Reproduce :
> 1. Get build appliance image from following link
> 
https://autobuilder.yocto.io/pub/releases/yocto-2.6.rc1/build-appliance/Yocto_Build_Appliance.zip
> 
> 2. boot the build appliance image in vmware.
> 
> 3. Set MACHINE to qemux86 and add the following line to
> conf/local.conf :
> SRCREV_pn-build-appliance-image = "$
> 
> {AUTOREV}
> "
> 4. Run "bitbake build-appliance-image"
> 
> I am sorry for the confusion it created.

In that case wouldn't it make more sense to combine these steps with
some of the other build appliance tests? We could add an extra step
where the tester builds build-appliance rather than having multiple
tests which start "launch build appliance"?

Cheers,

Richard




