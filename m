Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 63A1A7FA67
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 12:02:03 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id q17so6476514wrx.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 05:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=I6ukGLmGgBW2tJAkC2LJhPB384rhSXDibpE5kERWSrc=;
	b=c2/BWQoSjeT2x4pffljnLEu7JT1rGsfT2t7g/QOsXtToXE8pjnouutHv3bhFGsHnsh
	y3PGEQ/zDWj308a+4sIzeVQMaiejBJrdGJGUAEEHfrzzn0q9t2KLHV3DDCVNLJIC0M/T
	FtGxyJhn3XIMYoPcYug5dVhYzBQQ/v1WcR9xc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=I6ukGLmGgBW2tJAkC2LJhPB384rhSXDibpE5kERWSrc=;
	b=j48Ls6cICDKbF9IWhQaAfyeIdA8xswjep/RmTYpn3OYhBSOZR5KEjkxX0Bce7dRZRW
	UdVs/FCK/wV4zshdaE6N1fVygGGZFFwzHaOhIhu6FfOxQ7dhL2ycmQTWHwRelcahXrIY
	eDBkYxeyCNxHeWpk9f+F5wiYUBXAK725Uq7FnIyv+gjYtFrXTtW8JGz972L2OkFtfI1j
	KEq3adYvJJo9TQVNjzje/89l97fZG2Dr1F73VsXERSQg1iAbEMRiHF8S6HT9thN8B+O/
	omXR88HXNE7ZQ/PWF4pUXOc/DiWCmoX9YTArIzKY75CQyhDDZLKKTGtiGYUuvo8UwKvm
	e83w==
X-Gm-Message-State: APjAAAWCJLGmFPDFrT754hov6j5D2C0sq26coc+kT77lomkJ29rR+ct9
	k1AU6gZN7IjSzIc0TdndIp/HYw==
X-Google-Smtp-Source: APXvYqw1lSsSXjYJDUl59MLvzOdwkUX4EzhLv7h/q4EI/Xy4X1sePL1iTs+2LNxl9kO6hqsJceLV7A==
X-Received: by 2002:adf:ef05:: with SMTP id e5mr11368892wro.127.1568980924022; 
	Fri, 20 Sep 2019 05:02:04 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 33sm2634375wra.41.2019.09.20.05.02.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Sep 2019 05:02:02 -0700 (PDT)
Message-ID: <6e040457ee15fc874b8a4d6a627661fe2669467f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 20 Sep 2019 13:01:53 +0100
In-Reply-To: <1568683649-14738-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1568683649-14738-1-git-send-email-ee.peng.yeoh@intel.com>
User-Agent: Evolution 3.33.4-1build1 
MIME-Version: 1.0
Subject: Re: [PATCH] testimage.bbclass: Add kernel provider and version to testresult
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
X-List-Received-Date: Fri, 20 Sep 2019 12:02:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-09-17 at 09:27 +0800, Yeoh Ee Peng wrote:
> In running QA testing, we sometime need to select custom  provider
> for
> virtual/kernel and version. To track the selected virtual/kernel
> provider
> and version used during test, we need to add these information to
> testresult.
> 
> This patch add the virtual/kernel and version into the testresult
> configuration section.
> 
> Example of virtual/kernel and version added to testresult
> configuration:
>    - "KERNEL_PROVIDER_VERSION": "linux-intel_4.19"
> 
> Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
> ---
>  meta/classes/testimage.bbclass | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)

This fixes a very specific use case but we don't really want to add
extra variables to this each time someone has a new use case. In other
words this isn't going to scale.

The idea originally is that "DISTRO" should give a pretty good idea of
what was being tested. Another idea would be to allow the variables to
be configurable but I'm not sure we want to support adding arbitrary
variables...

Cheers,

Richard



