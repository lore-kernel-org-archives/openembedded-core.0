Received: from anchovy2.45ru.net.au (anchovy2.45ru.net.au [203.30.46.146])
 by mx.groups.io with SMTP id smtpd.web10.2314.1614297384850640888
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 15:56:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: electromag.com.au, ip: 203.30.46.146, mailfrom: preid@electromag.com.au)
Received: (qmail 11397 invoked by uid 5089); 25 Feb 2021 23:56:22 -0000
Received: by simscan 1.2.0 ppid: 11360, pid: 11362, t: 0.0654s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Return-Path: <preid@electromag.com.au>
Received: from unknown (HELO ?192.168.0.22?) (preid@electromag.com.au@203.59.235.95)
  by anchovy3.45ru.net.au with ESMTPA; 25 Feb 2021 23:56:21 -0000
Subject: Re: [OE-core] Pseudo Abort errors
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
  "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
References: <6b813e24-a48e-5b92-fd26-4f1bd31a8bbd@electromag.com.au>
 <f6d954124581f233baba17e076d8a848ab998da2.camel@linuxfoundation.org>
From: "Phil Reid" <preid@electromag.com.au>
Message-ID: <a9ad3dda-2c99-f1d9-0fd4-50ef1f462ee3@electromag.com.au>
Date: Fri, 26 Feb 2021 07:56:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <f6d954124581f233baba17e076d8a848ab998da2.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit

On 25/02/2021 18:29, Richard Purdie wrote:
> On Thu, 2021-02-25 at 08:28 +0800, Phil Reid wrote:
>> G'day,
>>
>> Not really sure where to look for this. But started to get random build failures
>> with the pseudo client.
>>
>> Failures are contained to populate_sdk
>>
>> Not always the same file reported in the log and removing tmp-glibc before the build solves the problem.
>>
>> I've also tried a psudeo_git.bbappend with:
>> SRCREV = "60e25a36558f1f07dcce1a044fe976b475bec42b"
>>
>> Which looks to be a pending commit on the list.
>> Unfortunately it didn't help.
>>
>> Here's what I think are the relevant parts of the log are below.
>>
>> "rm -rf tmp-glibc" and a rebuild resolves the problem.
>>
>>
>> Any thoughts?
> 
> Which branch and which packaging backend are you using?
> 
> There is a bitbake.conf patch on the list changing PSEUDO_IGNORE_PATHS
> which would probably help but I need to understand that doesn't have
> side effects and I don't have enough data to do that yet.

G'day Richard,

I'm on the dunfell branch, using package_ipk.

I found the patch for bitbake.conf and I'll give that a go here.




-- 
Regards
Phil Reid

ElectroMagnetic Imaging Technology Pty Ltd
Development of Geophysical Instrumentation & Software
www.electromag.com.au

23 Junction Parade, Midland WA 6056, AUSTRALIA
Ph: +61 8 9250 8100
Fax: +61 8 9250 7100
Email: preid@electromag.com.au
