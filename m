Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web10.8731.1616681751200595943
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 07:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 12PEFmbD029031
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO)
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 09:15:48 -0500
Subject: Re: [OE-core] any *compelling* reasons to whitelist env vars for an OE build?
To: openembedded-core@lists.openembedded.org
References: <429b51e-7cc5-54a7-a28-7e8beab0c77d@crashcourse.ca>
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
Message-ID: <e3fe7a19-50f4-1f42-dbed-1cb2f32fa94e@kernel.crashing.org>
Date: Thu, 25 Mar 2021 09:15:46 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <429b51e-7cc5-54a7-a28-7e8beab0c77d@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/25/21 9:08 AM, Robert P. J. Day wrote:
> 
>   kind of a philosophical question, but i'm having a discussion with
> some new colleagues about how to customize an OE (actually, wind river
> linux) build, and these colleagues have, until now, used (whitelisted)
> environment variables to pass info to the build, that info being used
> to specify things like a development versus manufacturing build, and
> so on.
> 
>   i suggested that i didn't think there was any really persuasive
> reasons to use environment variables this way, as there are more than
> enough configuration files to customize a build. i mentioned things
> like:
> 
>   * machine config files
>   * distro config files
>   * defining packagegroup files
>   * defining image files
> 
> and on and on and on.
> 
>   my point was that there are more than enough ways to support all the
> customization you might need, that taking advantage of shell
> environment variables strikes me as unnecessarily messy and, for that
> matter, dangerous if you forget so set the environment.
> 
>   thoughts? am i out of line in advising them to use what OE offers
> them, and not extract stuff from the environment?

I _always_ do builds like:

MACHINE=zynqmp-generic DISTRO=petalinux bitbake core-image-minimal

I don't want to have to update any configuration files to pass basic values into
the system.  This is also used heavily on my build systems so we can have a
common configuration for all builds, but built across a wide breadth of components.

I also occasionally use BB_ENV_EXTRAWHITE to add additional variables I might
want to override.  For instance, sometimes I want TMPDIR to go to a different
location, instead of having to modify local.conf (and then remember to put it
back the way it was) I can just add to the EXTRAWHITE, and call passing in TMPDIR.

--Mark

> rday
> 
> 
> 
> 
> 
