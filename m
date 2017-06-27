Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id D6C1877F7D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 10:02:40 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id h64so14716589iod.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 03:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=fr6oqUD0QeK59HubUM35/0dvJ/jKwi+vIc3r1WUEsxc=;
	b=ynEwggAe0Q6AWtPHiuUiW/DWarMQLHuxBzA6lgQoZSapDafkNZcCviuYppRFTMjhmS
	hJJxDtXcuwRZZAjgZZk5ajXjL3h+KVcT4q8d1rFom68FT6d3RmTNPo/f/AZ2Ngz4gjdH
	3KHaOW/EFt0274/u9ZKwz/cYQzVaYYBCBQHmxX9WlRtlE333YF5ziVf4Ebu9/QUxeXLP
	Fr5AtKMk4ERA28pZnXkoV5WpybZry605gageCfn4b6SAQoK0GY/GYuhlabdH9wimUTlX
	0lMzJQNsfuj/hFCBqSuMI7bviKZZYENR6a0gzMv29rAGq43oCmMemuvGkWno9IrCFQ7N
	MALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=fr6oqUD0QeK59HubUM35/0dvJ/jKwi+vIc3r1WUEsxc=;
	b=tuFYItIWGMsHuMfE+se16wSPK1oECZbRbIzUnr8/lW1sAZVqjOgLVkcOvCvIbWKuTy
	O6itOTjcDke4FO1axr3ie4g+98CIKGfHlLREzntG3o6CfexdBLs145W5mEe68LZQhGfB
	CNPjmRMNDGuRUFSWX1z8q2GN7NaYrfOO4oVI+hY8JhWsLHD6Z2BmqYvlLDZXaQqYn1ay
	2II9tFkDas3LBhWQlIOJ1qyJwoDO8CylYXCdVI1yX+p3shQcH9uCk4PkhbRPFHsNau5K
	6ISpLHUiYuPHpXlVbVaE13fidmjqHdNyL7DWX9GP6P7rKPi47BXRPlCN4vegWas29tFH
	kVaw==
X-Gm-Message-State: AKS2vOxKw1HI47bPTd3tkcmB3sNDAo6tl2OiPWoqjma1Y8LKF0DktfHr
	4rh8pi3kiK5wenbM
X-Received: by 10.107.39.12 with SMTP id n12mr1337732ion.127.1498557761886;
	Tue, 27 Jun 2017 03:02:41 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8FB9F.dip0.t-ipconnect.de. [93.232.251.159])
	by smtp.gmail.com with ESMTPSA id
	m129sm1357611iom.27.2017.06.27.03.02.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jun 2017 03:02:40 -0700 (PDT)
Message-ID: <1498557757.7464.36.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Jonathan Liu <net147@gmail.com>
Date: Tue, 27 Jun 2017 12:02:37 +0200
In-Reply-To: <CANwerB2NyXa=MiKAHRMa+kYCUhFWQ47JEDT6fcVEzhVgc4=X6Q@mail.gmail.com>
References: <20170601121552.27868-1-net147@gmail.com>
	<1498554326.7464.33.camel@intel.com>
	<CANwerB2NyXa=MiKAHRMa+kYCUhFWQ47JEDT6fcVEzhVgc4=X6Q@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 27 Jun 2017 10:02:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-06-27 at 19:53 +1000, Jonathan Liu wrote:
> Hi Patrick,
> 
> Something is really strange. HOSTTOOLS doesn't appear to be working
> anymore in pyro branch
> If I do "bitbake -c devshell qemu-native", I can run the following
> commands successfully which should have been filtered out by
> HOSTTOOLS:
> 
> $ which sdl-config
> /usr/bin/sdl-config
> $ which ncdu
> /usr/bin/ncdu
> $ which whoami
> /usr/bin/whoami
> 
> For some reason /usr/bin is contained in PATH. Previously it was filtered out.

I think that's done intentionally for devshell (and only for devshell)
because developers expect to have access to all host tools.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




