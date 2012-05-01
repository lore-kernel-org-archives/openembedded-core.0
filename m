Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SPAQh-0008VU-9e
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 12:35:35 +0200
Received: by wgbdr1 with SMTP id dr1so3008191wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 May 2012 03:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=OU9zXJ6pGTw/Sn8Alum3U4O0aZrSmEsbqrXrPv+OZdY=;
	b=aH2ysNpQA1M5w7/y8keP6VyGqmVpyq9ijBqI29Zq80rqV2HJD2M1G+JUS/6mMXsF4d
	YVdCJu88V5GP9vDDBCv0+9T5yGhObIsrCQpfKZr0YWWeRlyUTNPJRbkBb4iDBs2hBpvo
	dLYqqhOAUkaZliytAtzUeORuWUC035HVcmyahVjY9muyuw8FwVePDQpmwDJNzikXC1Jk
	3He9sdUjpWLE3GagUOPwsdevE1dwIQtVzqMSYP5ZtYMtsc6ks1bkexRRRD3sQ274le0l
	16JHw1Dp3rtspteDNo0FglpVMbbDEydKkFRrrzqzd2hGl5sgjOvsmKJhIG+VLVECkBqL
	Pz5Q==
Received: by 10.180.83.38 with SMTP id n6mr4874709wiy.1.1335867952291;
	Tue, 01 May 2012 03:25:52 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id u9sm35347032wix.0.2012.05.01.03.25.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 May 2012 03:25:50 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1335867674.7415.76.camel@ted>
Date: Tue, 1 May 2012 12:25:48 +0200
Message-Id: <B8BDFC7E-873F-4AC3-8B6B-111299DEB9A7@dominion.thruhere.net>
References: <cover.1335815704.git.peter.seebach@windriver.com>
	<1a15132d9ff316a53f58764aad35bb09c5fbcf0e.1335815704.git.peter.seebach@windriver.com>
	<4F9EF944.9080503@windriver.com> <20120430154823.3a4ea3ee@wrlaptop>
	<1335867674.7415.76.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlQmuEs5pTadAfAiOL5XEPn9Sngi6Lr3a+0FHxHMnMgVoANUzCBFxC0kTjwnS++zGG0YPbb
Subject: Re: [PATCH 2/2] sanity.bbclass: Implement initial toolchain sanity checks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 May 2012 10:35:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 1 mei 2012, om 12:21 heeft Richard Purdie het volgende geschreven:

> On Mon, 2012-04-30 at 15:48 -0500, Peter Seebach wrote:
>> On Mon, 30 Apr 2012 15:42:44 -0500
>> Mark Hatle <mark.hatle@windriver.com> wrote:
>> 
>>> Is the above debugging?  (I suspect it is)  I suggest the following...
>> 
>> Actually, that one's intentional.  I originally did it for debugging,
>> but I thought it was super convenient to actually get a list of the CPU
>> feature set bitbake thought it was using.  We can't tell you whether
>> you picked the right features, but we can tell you what they are.
>> 
>> So for instance, with a qemux86 and a core2 lib32:
>> 
>> NOTE: Sanity-checking tuning 'x86-64' (default) features:
>> NOTE:   checking for conflicts: m64
>> NOTE:   checking for conflicts with: m32
>> NOTE:   m64: IA32e (x86_64) ELF64 standard ABI
>> NOTE: Sanity-checking tuning 'core2' (lib32) features:
>> NOTE:   m32: IA32 ELF32 standard ABI
>> NOTE:   core2: Enable core2 specific processor optimizations
>> 
>> I found this really handy, and left it there on purpose.  I could take
>> it out, and/or move it to somewhere else, but I really do like having
>> that information appear.
> 
> I'd change these to debug messages. Users don't need this on the console
> on every run. There is already a summary of the active tune options
> displayed in the build configuration banner if I remember correctly.

indeed:

BB_VERSION        = "1.15.1"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "beagleboard"
DISTRO            = "angstrom"
DISTRO_VERSION    = "v2012.05-core"
TUNE_FEATURES     = "armv7a vfp neon cortexa8"
TARGET_FPU        = "vfp-neon"


