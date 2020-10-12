Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web12.6508.1602530132149476378
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 12:15:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 09CJEatL016371
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Mon, 12 Oct 2020 14:15:26 -0500
Subject: Re: [OE-core] [PATCH 2/2] pseudo: Fix statx function usage
To: Seebs <seebs@seebs.net>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
References: <20201007162018.3187947-1-richard.purdie@linuxfoundation.org>
 <20201007162018.3187947-2-richard.purdie@linuxfoundation.org>
 <20201012140849.69cf09fc@seebsdell>
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
Message-ID: <a2369d3c-ed7e-b03b-8538-aefe09008288@kernel.crashing.org>
Date: Mon, 12 Oct 2020 14:14:36 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201012140849.69cf09fc@seebsdell>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 10/12/20 2:08 PM, Seebs wrote:
> On Wed,  7 Oct 2020 17:20:18 +0100
> "Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:
> 
>> +There is magic in the posts where specific variable names have
>> specific +magic. For that magic to work, "path" needs to be used not
>> "pathname" as +is currently there. Fix this, which fixes path issues
>> on systems using +statx (Ubuntu 20.04 in particular).
> 
> So, usually if "pathname" is used, it's intentional to suppress the
> special magic behavior. Usually, but not always. In this case, the man
> page does use "pathname" and sometimes that means it's just a cut and
> paste error.
> 
> My man page also says there's no glibc wrapper for statx, making me
> slightly surprised that a wrapper for it is needed/relevant.

I looked into this.  It appears (after pseudo was written, but) about 7 or so
years ago, all of the man pages were re-written and the language was changed.

So 'pathname' no longer has the same syntactic meaning that it did when pseudo
was first written.  (It's not just statx, I looked at things like fopen, open, etc.)

--Mark

> -s
> 
> 
> 
> 
> 
