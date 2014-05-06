Return-Path: <saul.wold@intel.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id D047D60559
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 16:48:38 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id kx10so8795780pab.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 May 2014 09:48:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:organization:user-agent
	:mime-version:to:subject:content-type:content-transfer-encoding;
	bh=uqKhxAsMjJUYEvmYel2XFHyLSS4BIlBP6qjD3gV/aCE=;
	b=bUs0JZWfuj3j7AaAbKtK5R8mZAhybzq0zwjBh3EksHT0AnN1ur5TV7oPhov+p8h85e
	CDgu9pmhelcmcPC78GorTdc6R+gt+k91/AsRaMQWkPwWmbpVIGTqCrvjgjKRgkwKOq/J
	4dt7UWMP1rUFzebVJ5KawVLjmpWvcRZjrJ2RgpzmYbMkpG7nm41FD7ES+rCLJWEKqe5e
	XtrKa8XdKQTbIjA7b9eGdth+InaHojTfpNqOJa3gdA77I0CUGK0u3ys10lKOumwuw+J8
	xa2Lg2V/uusvAksAGCW8XkcZ1lLTTVyWnRdpuEiCVf1ok/siRZT9O8BcYrQljxLSZGYx
	iWCw==
X-Gm-Message-State: ALoCoQnSYQiAiV9B+ujFSwwHlPSz/ekhrKV3j1h4Imeg3y3VnE+PoZnvzgvWFrMxBFUwDohSTZKf
X-Received: by 10.66.136.103 with SMTP id pz7mr8220553pab.140.1399394919765;
	Tue, 06 May 2014 09:48:39 -0700 (PDT)
Received: from [10.6.18.24] (c-50-186-0-160.hsd1.or.comcast.net.
	[50.186.0.160]) by mx.google.com with ESMTPSA id
	iq10sm1393660pbc.14.2014.05.06.09.48.38 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 06 May 2014 09:48:39 -0700 (PDT)
Message-ID: <53691266.2090107@intel.com>
Date: Tue, 06 May 2014 09:48:38 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>, 
	Yocto Project Discussion <yocto@yoctoproject.org>, 
	"poky@yoctoproject.org" <poky@yoctoproject.org>,
	bitbake-devel <bitbake-devel@lists.openembedded.org>
Subject: Daisy Stable Branch - open for patch suggestions
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
X-List-Received-Date: Tue, 06 May 2014 16:48:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


[Sorry for the overlap, want to make sure I hit a broad audience]

Hi Everyone!

I will be the stable maintainer for the Daisy branch, and it is now open 
for suggestions of backport patches.  I am starting to generate a list 
of patches that are already in master.

The following wiki page has the Policies and process for requesting a 
fix in a stable branch, please review that before sending a patch.

https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance

Please remember to include [daisy] in any request (backport or commit).

We do not have a hard date for this yet, but likely be in late May - 
early June time frame for the 1.6.1 release.

Thanks to all for your efforts.

Sau!

