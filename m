Return-Path: <anders@chargestorm.se>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3D9AC73FE5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 05:17:03 +0000 (UTC)
Received: by layy10 with SMTP id y10so21162993lay.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 22:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:organization:user-agent;
	bh=8Wddjp4Q8hTgxL48EnB07VslIx6H5xOSZrsCQ6FsFD0=;
	b=lOn1UV0d5LieHU4lysM+zNyn4tJtT8GfVIzY6arGtGQ6682g6Y1nsS6ATzTXxNz0/U
	064E/i2qfHqsqRxOuWD39m9CKSBV/K3nVokwDBaQ66Mg8AkVm9M28en2KJVegWY4jsvV
	HlhtHJAil0ZQAvUgcytW7eC3puZkZ9XsywkD4K5WiVDRlKGqh0lhAjHtj1Zn9/TyZ6tz
	TUV5Fyvd9jKv6+pe5A4PAbfEEWbwWs7GuUfaEwIspQk4NiBBQgP/F2cYvHbty32U6Mfy
	o7Yb2NvEjtKjDjOckGx7LGAhVRoEXUHfpr+5PvBR5k0JMC0uhXuw6ALR8A3+oeteNYGY
	Sbvw==
X-Gm-Message-State: ALoCoQnb5cU/FjymbyLN2w+CNHlm8bWeNmsujKTFknf6NhUNLNEr+SbXxpMJIjwcLVZfgtsOLimN
X-Received: by 10.153.8.167 with SMTP id dl7mr14662869lad.86.1431494224389;
	Tue, 12 May 2015 22:17:04 -0700 (PDT)
Received: from ad.chargestorm.se (h83-209-191-235.dynamic.se.alltele.net.
	[83.209.191.235])
	by mx.google.com with ESMTPSA id df8sm4561114lac.3.2015.05.12.22.17.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 May 2015 22:17:03 -0700 (PDT)
Date: Wed, 13 May 2015 07:17:01 +0200
From: Anders Darander <anders@chargestorm.se>
To: Mario Domenech Goulart <mario@ossystems.com.br>
Message-ID: <20150513051701.GA6448@ad.chargestorm.se>
Mail-Followup-To: Mario Domenech Goulart <mario@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
References: <1431442688-5860-1-git-send-email-mario@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1431442688-5860-1-git-send-email-mario@ossystems.com.br>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] README: add "Contributing" section
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
X-List-Received-Date: Wed, 13 May 2015 05:17:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Mario Domenech Goulart <mario@ossystems.com.br> [150512 16:58]:
> +Contributing
> +------------
> +
> +To contribute to this layer you should submit the patches for
> +review to the mailing list (openembedded-core@lists.openembedded.org).
> +
> +Please refer to:
> +http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> +for some useful guidelines to be followed when submitting patches.
> +
> +Mailing list:
> +
> +    http://lists.openembedded.org/mailman/listinfo/openembedded-core
> +
> +Source code:
> +
> +    http://git.openembedded.org/openembedded-core/
> +
> +When sending patches, please use something like:
> +
> +    git send-email --to openembedded-core@lists.openembedded.org <patches>


Maybe we could add something about the helper scripts:

scripts/create-pull-request
scripts/send-pull-request

or do you think that those scripts might be out of scope for the primary
intended audience of this section?

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

