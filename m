Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QwGAV-0000t5-3v
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 18:19:07 +0200
Received: by yia28 with SMTP id 28so953307yia.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2011 09:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=cvuHzAt/TB0eWkJVkZo0ccOa9RLc+s2pxT6eIwHAuy0=;
	b=QzYBq9u2NpD2omiiS7Ks7Dv7HEk7fTK18UAbln1WJgzmW+W9BcoaTWy5HctW0s9f2X
	zV/w0BG0sik1fwSqeFnG6NTot3ycNDSh9Ov3Bh958rrwS59oC9htJ1T+tkTWDNOoNUmQ
	fOL6G4w4zWUosZh7/2vNKY8ua/89IfFFRaHAI=
Received: by 10.101.54.20 with SMTP id g20mr5076299ank.69.1314202459540;
	Wed, 24 Aug 2011 09:14:19 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v6sm1011556anq.28.2011.08.24.09.14.18
	(version=SSLv3 cipher=OTHER); Wed, 24 Aug 2011 09:14:18 -0700 (PDT)
Message-ID: <4E552357.3070609@gmail.com>
Date: Wed, 24 Aug 2011 09:14:15 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <A182C128-8E5F-48F0-B72B-39DA62E6E1F4@kernel.crashing.org>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D724C903@shsmsx501.ccr.corp.intel.com>
	<0597F428-97F2-461F-804B-FE793E911BD4@kernel.crashing.org>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D724C949@shsmsx501.ccr.corp.intel.com>
	<1314183168.19905.6.camel@phil-desktop>
In-Reply-To: <1314183168.19905.6.camel@phil-desktop>
Subject: Re: why do we poison -Os?
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
X-List-Received-Date: Wed, 24 Aug 2011 16:19:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 8/24/2011 3:52 AM, Phil Blundell wrote:
> On Wed, 2011-08-24 at 09:47 +0800, Xu, Dongxiao wrote:
>> My understanding is that, if GCC is not configured with the ability of code space optimization, target recipes will not have code size benefit even if adding "-Os" option.
>
> No, that's incorrect.  All that --enable-target-optspace does is change
> the definition of CFLAGS_FOR_TARGET, which causes the GCC support
> libraries (i.e. libgcc, libstdc++, etc) to be built with -Os rather than
> -O2.  It has no effect on the functionality of the compiler itself.
>

thats correct. this options is only for making gcc runtime to be built 
with Os. It does not make gcc to use -Os by default. The problem for ppc 
however is that if you built with Os then gcc depends upon functions 
from libgcc.a which needs libgcc.so to be a linker script stub rather 
than a symlink as it used to be but this has been fixed

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



