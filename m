Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6410571C9A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 10:41:08 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id n124so6224624lfd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2017 02:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=JHoDsvX7Uupgc84bOVv6LuGz/3lvfx18hvNa2BJHWPE=;
	b=AeetuxGldvSjJkcN+jKkHRejNq4wMsPwcibZ1bv7yWkOkH2W6Ni8YCVkzke935gssh
	VTUp/e+l/r6W1RIW8DSdm32Aspf8ZOGnq9gaj1DIH1FP8o/FGM0fr1QVHxijEk/t1VGq
	28lxu4XmR9s9wu9hXatk7BYLqWLEho50q1JOQUVGsXeNTbG3kcMsAp+SyakvHSwXaZdB
	sr+NUVCqR2gdHMJZg74YOYZwOSxV42/lz4HA9iJbRv+20GoeFd8vsieNWvq9h53da+og
	fVY9vSdAmgMs2qAAjBrq7Nd6WXssD+cV8P7mqO2ftb2qC/wYhkFk1VNIWXr6xi6E4WzW
	BEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=JHoDsvX7Uupgc84bOVv6LuGz/3lvfx18hvNa2BJHWPE=;
	b=a/1LmbE9/Suvr1Upe7okY2Koade+/AAwIy0MRBLLkQcMC800T7qhtYSPdmC8aqK5tt
	PfDP5S3YhOqbVDeqqbbRJyGG6ecptCuQHCrM4MvThpUyZhhyO8mfoRAAa17nVhvpm3Kq
	3NgbJY5zgkKgfFI/svBrJaTJJx/H6QDT9SLxnFyQ+kshKB1g07Sueg/UgGfrGRh0Pmas
	h8xfo+xdnO+intqUDQFCJeV2WKuUsZAVQtrckweaDlWPhNS8OuTe7qUbhgBbhsAz6n1D
	T3f+lVBLK7jpCt8jecNzXkU6z/RM9U4S5DwRg+TfRBOtSe3UhvwyTXHbkl0WVJSC2FdR
	9alg==
X-Gm-Message-State: AIkVDXKvFXgJbIIcLwJlAsbW7YPD8ypBNL/Zou0sxmOJGwUAesiiSqd+ZrHEqLMMUw/P3Q==
X-Received: by 10.46.13.1 with SMTP id 1mr3004979ljn.27.1486032067865;
	Thu, 02 Feb 2017 02:41:07 -0800 (PST)
Received: from ad.chargestorm.se (194-237-220-218.customer.telia.com.
	[194.237.220.218])
	by smtp.gmail.com with ESMTPSA id w4sm2567830ljd.23.2017.02.02.02.41.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 Feb 2017 02:41:06 -0800 (PST)
Date: Thu, 2 Feb 2017 11:41:05 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170202104105.yl4nrp3wbym7ahhf@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1485846907.git.anders@chargestorm.se>
	<6f44da9601d2ae87573905ca1b7fa30cf5043100.1485846907.git.anders@chargestorm.se>
	<385d3282-7a91-7d60-cd6a-393ada75bd09@gmail.com>
MIME-Version: 1.0
In-Reply-To: <385d3282-7a91-7d60-cd6a-393ada75bd09@gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20170113 (1.7.2)
Subject: Re: [PATCH v2 2/7] python3-manifest: move htlm.py to python3-html
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
X-List-Received-Date: Thu, 02 Feb 2017 10:41:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Khem Raj <raj.khem@gmail.com> [170201 17:52]:

> On 1/30/17 11:18 PM, Anders Darander wrote:
> > This allows us to use html.py without importing misc.

> html.py is provided by many packages. Does is make more sense to package
> html.py on a package of its own ?

Hm, I had another look at this. On my build:

$ du -sh python3-html/
140K    python3-html/

$ du -sh python3-html/usr/lib/python3.5/html/
108K    python3-html/usr/lib/python3.5/html/

Thus, the major part, 77%, of python3-html is related to my change.
Thus, I'm not sure that it makes sense to put html in it's own
package...

I'm not going to add a new package for html for the moment.

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

