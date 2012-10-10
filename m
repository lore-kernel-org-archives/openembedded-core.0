Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TLycM-0003LI-Co
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Oct 2012 17:54:42 +0200
Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 10 Oct 2012 08:40:27 -0700
Received: by mail-pa0-f47.google.com with SMTP id fa11so648640pad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2012 08:40:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=5U0o/xW9+PeOsyCs4W/A7xte1riz8XMwEZI1n8N5Xu8=;
	b=JsLxXguiovtisOvhf2EvIpe/oRgbUy5Mwcpw8qtzmIxekKLVyHpA0c5YBC5Akiz4Tk
	abkYv7HjZDC1Z6309b62c0RQAI3D8xP+RbQg8CFuCYsWFTBWPncJlt4/haaFwZ7zfQrI
	wE0gVpVt9Vm9EjGlPqq06NwnLcb6H/P25bvdiecG8LaNBvPJpkuVWrMsMLJQ3hAhJpvO
	cOP+H5FpailTpLBuHtz8I5JWlyhlNlYKp1AQsjXCdac31QbDt6xVB2N4AyR1psUexu/8
	aoA4ywYXhM29/0rLPMuMk/zL2Uwhz6moIwd/WU4mbFBNcw03MjU0ML5QMbTt2YxKTu1T
	mlCA==
Received: by 10.68.248.10 with SMTP id yi10mr5725874pbc.39.1349883626172;
	Wed, 10 Oct 2012 08:40:26 -0700 (PDT)
Received: from [10.1.10.30] (c-50-137-42-92.hsd1.or.comcast.net.
	[50.137.42.92])
	by mx.google.com with ESMTPS id st6sm1182845pbc.58.2012.10.10.08.40.24
	(version=SSLv3 cipher=OTHER); Wed, 10 Oct 2012 08:40:25 -0700 (PDT)
Message-ID: <507596E7.3060009@intel.com>
Date: Wed, 10 Oct 2012 08:40:23 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120912 Thunderbird/15.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1349466569.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1349466569.git.scott.a.garman@intel.com>
X-Gm-Message-State: ALoCoQktM6VuKd3J7vpcmHKaENEulT+MIb6wzcxz2ReqArOUL42SnBoe9wQhkRbwobkgb6ZGBJpx
Subject: Re: [PATCH 0/6] denzil pull request 3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Oct 2012 15:54:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/05/2012 12:52 PM, Scott Garman wrote:
> Hello,
>
> This is a pull request for denzil, it includes an important fix for the
> kernel menuconfig sstate bug. The poky-based tree has been run through the
> autobuilder as follows:

Ping? I know the 1.3 release is in progress, just want to make sure this 
doesn't get neglected for too long. I kept this pull request short to 
make it easier to review.

Thanks,

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


