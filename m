Received: from mail-pa0-f50.google.com ([209.85.220.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U8Par-0007uZ-0X
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 07:25:21 +0100
Received: by mail-pa0-f50.google.com with SMTP id fa11so4555464pad.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2013 22:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=3B4fSxgyZM7k7kIAvzcXL5/9BaajLSJQ8tpdXYSah2A=;
	b=b6USSbu/JSnUx3BL5NQTC3kpYEuPpOJGys0/Oe/4S1kScaejx2nVrpnvwCUjz3sclA
	UpijwrWCiWPqWemGpVZXu6UbL1pJYNINyDkJOjQ0OJpqywS9snTtm8IIgcLID8zX8P3P
	MHNvkUZ9dPsIe0ZilJ6L+skMhlmCA6lxfH6K5Z1jrWS17IXqMQ9/uTtiSER8I01S0902
	SgB0ZIHJUppb0f8qETev+Z8e1LnNs+iK8Btd+IL84zPSGshjSdKubMDaPQr/062/BrZd
	y3375OF5PsIWWyDTdXKt+k2WzLxL3tkMohMAxTbS6pVcYsiXZR/OYv7Iu5GYsiSt/XSi
	/VwA==
X-Received: by 10.68.213.132 with SMTP id ns4mr53549728pbc.84.1361426948533;
	Wed, 20 Feb 2013 22:09:08 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id z6sm87806167pav.3.2013.02.20.22.09.07
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 20 Feb 2013 22:09:07 -0800 (PST)
Date: Wed, 20 Feb 2013 22:08:48 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Alejandro Mery <amery@geeks.cl>
Message-ID: <20130221060847.GA32373@sakrah.homelinux.org>
Mail-Followup-To: Alejandro Mery <amery@geeks.cl>,
	openembedded-core@lists.openembedded.org
References: <CACB0nks-pBNDmYPPJ3vtPSEmri8Yeh7pJ-X229K6taXNx_DOow@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACB0nks-pBNDmYPPJ3vtPSEmri8Yeh7pJ-X229K6taXNx_DOow@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: can't build distro-less beagleboard/uclibc
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
X-List-Received-Date: Thu, 21 Feb 2013 06:25:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (31/01/13 23:49), Alejandro Mery wrote:
> Hi, I'm trying to make a custom uclibc based distro over oe-core's master,
> it's going fine for x86 but for my armv7a board uclibc fails to compile.
> and as suggested on IRC I reproduced it for a distro-less
> beagleboard/uclibc too. The host is ubuntu 12.04/64 with linaro arm
> toolchain installed, but I suppose that's not relevant at all.
> 
> Same issue happens with default uclibc and with 0.9.33.
> 
> log.do_compile: http://sprunge.us/BRWH
> conf/bblayers.conf: http://sprunge.us/NhHZ
> conf/local.conf: http://sprunge.us/cHED

can you get rid of PREFERRED_VERSION_uclibc ?= "0.9.33" from your
local.conf please and retry ?


