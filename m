Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id AAF2177805
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 09:05:29 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id h134so14138849iof.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 02:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=cPHWyphWL/7iOClt6QV3st+hln9skyE5xeAd//ZjYvo=;
	b=pcd+C4wuCRsR5JzjbH31PPXLJeykWiVLtgA78UWjK2mrFgvzribyVCIh25mWDegFue
	9MgMUfDeSAYNi57MONXGqLHDUIy+1lIL4rMUjNilDHVNS4pZ4De34tUgslk1lIixPbAy
	78ioUcH5EiLM8WDq32LC/c6sknt1YOPqY5b+SaP6DZDLFOYREUN1iPdPi7XquHV0hf0m
	Su7mX9Dk8VEXZ4P4I+WYHFMKgXqyEmEtkbGm9VqfjbA1LIxSJwlx+mgcVc1sMjv2lfzi
	CXK0ioXFf2/YwuPRFXv1IhMkJmSNEvprQjUahxMaXr539hHp+qJd4e1Mcdmr7Gpy2pU9
	nVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=cPHWyphWL/7iOClt6QV3st+hln9skyE5xeAd//ZjYvo=;
	b=PCD8sBoJVzvTiEIpdHzPzP2ncTw9229l3BNKf38Zobhxntu7snmPx+d1t1nSTta48M
	zLdDF4LDzRjq7hyNCEJKPSe/7ESX1GooHO9KanGHK/ogKMl0h465yv6XMSffISIHAO8q
	xBalKRIDTB4X2EP9Tst8hjmXP+uZO0Z5Sw+SlSRFDSZ09PUKFFjH9Jdtj13yB01vfaE2
	Is3CR5TrhDZ6I5cus/vyT9W4ICO7qOFDGpsub6JwbAULV+bHZESqHInGtDqfMOoqkjlL
	suZksTGFThakWImNVkO8j2NwKppsacgDiKhwFT9DrqFuFeEctfKrN34ldlvT1nTw2i/x
	NU6A==
X-Gm-Message-State: AKS2vOyT6VRsEVwhdQu15Zr+ELTgDmHI6W0NO4FuIYbEXRBTr0nGcDRP
	PCHYx94umO/zUhAZ
X-Received: by 10.107.23.66 with SMTP id 63mr5410991iox.184.1498554330690;
	Tue, 27 Jun 2017 02:05:30 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8FB9F.dip0.t-ipconnect.de. [93.232.251.159])
	by smtp.gmail.com with ESMTPSA id
	f195sm1291520iof.54.2017.06.27.02.05.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jun 2017 02:05:29 -0700 (PDT)
Message-ID: <1498554326.7464.33.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Jonathan Liu <net147@gmail.com>
Date: Tue, 27 Jun 2017 11:05:26 +0200
In-Reply-To: <20170601121552.27868-1-net147@gmail.com>
References: <20170601121552.27868-1-net147@gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] bitbake.conf: Add sdl-config to HOSTTOOLS if using host SDL
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
X-List-Received-Date: Tue, 27 Jun 2017 09:05:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-06-01 at 22:15 +1000, Jonathan Liu wrote:
> If ASSUME_PROVIDES contains libsdl-native, we need to add sdl-config
> to HOSTTOOLS to allow access to the host sdl-config.
> 
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta/conf/bitbake.conf | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 8e4f4bbb56..3ad905c917 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -471,6 +471,9 @@ HOSTTOOLS += " \
>  # Tools needed to run testimage runtime image testing
>  HOSTTOOLS += "ip ping ps scp ssh stty"
>  
> +# Link to sdl-config if using host SDL
> +HOSTTOOLS += "${@bb.utils.contains('ASSUME_PROVIDES', 'libsdl-native', 'sdl-config', '', d)}"
> +

Why are you checking ASSUME_PROVIDES? The variable is called
ASSUME_PROVIDED.

Even if you had checked the right variable, is that really necessary?
I'm building qemu with ASSUME_PROVIDED += "libsdl-native" just fine on
Debian Jessie, without sdl-config in HOSTTOOLS.

Sorry for the late reply, going through my backlog... I see that this
has been merged. Probably needs to be reverted or fixed.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




