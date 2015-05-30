Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id B6B8C73236
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 May 2015 13:17:46 +0000 (UTC)
Received: by wibut5 with SMTP id ut5so3525832wib.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 May 2015 06:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=user-agent:in-reply-to:references:mime-version
	:content-transfer-encoding:content-type:subject:from:date:to:cc
	:message-id; bh=6/cCHet8vWKqueA9LruHpKjVy/cOO+27kFOhdFZKzOg=;
	b=SOWpPO8zLs72wHkcu4M4kow/bjy8SahP7eT5MscCXJKDetCEFytIkENSjEv8DZAY3D
	glgu/5syElIYi69/992rLdG7E8UrkFbxl3oazU5MRjjDw7iPmueRz2/WkPTCPgMVvJn0
	KEW3aAZRiR7J8a5F9rJVBH3LfYIyDCfKmpY/nRnSp16famiJKcB1CDrP/SoRjTrNCM2c
	o5F9C3PhVzZ28hkZSmIpSomc079QHkpydVuyjhatOKKyx7pPSwsWlOzyx8WP7TTCwH05
	I4+coe0UoApODLfMG45gW+ZasaJSjhfXR8GAwin/CGWbdIVhuIRM4mrMqZ2z/XjKIyhi
	UJfA==
X-Received: by 10.180.73.176 with SMTP id m16mr4942899wiv.68.1432991866809;
	Sat, 30 May 2015 06:17:46 -0700 (PDT)
Received: from [10.37.155.241] (089144218241.atnat0027.highway.a1.net.
	[89.144.218.241])
	by mx.google.com with ESMTPSA id o6sm7532917wiz.24.2015.05.30.06.17.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 30 May 2015 06:17:45 -0700 (PDT)
User-Agent: K-9 Mail for Android
In-Reply-To: <1432938270.2461.46.camel@pbcl.net>
References: <cover.1432775689.git.kai.kang@windriver.com>
	<20150528084706.GC2383@jama> <5567C29C.3030307@windriver.com>
	<1528283.0UTgDEqc8E@peggleto-mobl.ger.corp.intel.com>
	<1432938270.2461.46.camel@pbcl.net>
MIME-Version: 1.0
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Sat, 30 May 2015 15:17:39 +0200
To: Phil Blundell <pb@pbcl.net>,Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <5664EFD5-15CB-4772-95FB-1DE7232A62D1@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/5] libav: upgrade to 9.18
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
X-List-Received-Date: Sat, 30 May 2015 13:17:46 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

On May 30, 2015 12:24:30 AM GMT+02:00, Phil Blundell <pb@pbcl.net> wrote:
>On Fri, 2015-05-29 at 16:28 +0100, Paul Eggleton wrote:
>> Just for background, the reason I disabled the textrel check for x86
>in 
>> libav.inc was that I was able to determine based on quick research
>that 
>> upstream deliberately doesn't enable -fPIC for x86 (32-bit) because
>apparently 
>> it doesn't really work there. I honestly didn't check what the
>situation was 
>> on 32-bit ARM; I probably should have done that at the time.
>
>PIC is particularly problematic on x86 because it ties up %ebx.  This
>represents 25% of the available general purpose registers which can
>cause a measurable performance loss because of increased spilling, and

Note that the situation improved with gcc-5 for some cases though.

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=54232
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=47602
https://software.intel.com/en-us/blogs/2014/12/26/new-optimizations-for-x86-in-upcoming-gcc-50-32bit-pic-mode

Cheers,



