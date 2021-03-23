Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web12.715.1616539638284214568
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 15:47:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MacBook-Pro-16.local (068-117-040-126.res.spectrum.com [68.117.40.126])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 12NMlFa6007760
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 17:47:17 -0500
Subject: Re: [OE-core] PR Service and eSDK
To: openembedded-core@lists.openembedded.org
References: <4196565e-34b9-ae0d-dbaf-c3292efa1ba0@kernel.crashing.org>
 <48a1fdaf1535daf49500ed7ae3551bc7099e4940.camel@linuxfoundation.org>
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
Message-ID: <a98e3c52-54f2-e131-1c53-f688ec2589ed@kernel.crashing.org>
Date: Tue, 23 Mar 2021 17:47:15 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <48a1fdaf1535daf49500ed7ae3551bc7099e4940.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/23/21 5:45 PM, Richard Purdie wrote:
> On Tue, 2021-03-23 at 17:34 -0500, Mark Hatle wrote:
>> For some reason I thought if PR service was enabled, when the eSDK was generated
>> it would export the pr service information and include it within the eSDK.
>>
>> I'm not finding the file, or even code that does this.  Am I having a fever
>> dream, or is there code that should be doing this?
>>
>> What I'm trying to build is an eSDK that the user can use devtool and construct
>> a new version of a package, then they can deploy the new package within their
>> package feed to update their targets.  Without the PR service in the eSDK, there
>> won't be any way to get a correct PR number.
> 
> I know we copy bb_unihashes.dat into the eSDK with code in populate_sdl_ext.bbclass
> for this reason for hashequiv.
> 
> We do have prserv export and import code but I'm not sure anyone has integrated it
> with eSDK, or if there is integration, I can't spot it atm. I wondered if it copied
> the prserv database from the build directory over to assist with this issue but
> again, I can't spot it.

Ok, this confirms what I am seeing then.  Maybe it was discussed and was never
implemented.  I'll look at where the unihashes.dat is copied over and look to do
the export... and then import in the setup script.

--Mark

> Cheers,
> 
> Richard
> 
> 
> 
> 
> 
