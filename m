Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web08.10204.1623862182609511603
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 09:49:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 15GGnesi004519
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 11:49:41 -0500
Subject: Re: [OE-core] should the same recipe have two different WORKDIRs?
To: openembedded-core@lists.openembedded.org
References: <f82ec87-8fbe-49d0-e147-a9c8dd6c711@crashcourse.ca>
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
Message-ID: <8433dddb-bfc1-3ded-b76d-8bd699672493@kernel.crashing.org>
Date: Wed, 16 Jun 2021 11:49:39 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f82ec87-8fbe-49d0-e147-a9c8dd6c711@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Part of the WORKDIR component is the target (package) architecture.  If the
recipe or one of it's inherits sets PACKAGE_ARCH = "${MACHINE_ARCH}" it will
move the component.

Where I've seen both directories used is when someone is building for multiple
target boards.. and some of the targets use the default PACKAGE_ARCH, and some
use MACHINE_ARCH.  This is very common with OpenGL and hardware acceleration.
Mesa for instance becomes machine dependent on some systems, but generic for others.

--Mark

On 6/16/21 11:30 AM, Robert P. J. Day wrote:
> 
>   perhaps i've just never noticed before, but a colleague asked me to
> debug some strangeness with his WRLinux build, and what i noticed was
> that the recipe that generated a package with a single (aarch64)
> executable created WORKDIRs under both directories:
> 
>   * cortexa53...
>   * acme-coyote		[actual target board]
> 
> this surprises me ... i thought that, based on the attributes of any
> recipe, it would have only one WORKDIR in the appropriate place. what
> does the above mean? i'm not sure what to make of it.
> 
> rday
> 
> 
> 
> 
> 
