Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TMdn5-0007Eb-MP
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Oct 2012 13:52:31 +0200
Received: from localhost ([127.0.0.1]:57991 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TMdaK-0006l1-Ap
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Oct 2012 11:39:20 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=bob3PhC5zLQU3gf7RpHtfEvsYrE=; b=GfISVhVofu4HGzWXBhpKBnmLxz5q
	f4v+CPi1Rlwt4IeeTHN1IhEXq99ApNqdPw/T+u7PUc5I03OPlB+NY5a+r4enWujP
	g/FRUM7GwRBtLNZ4YZsIi+Lfcp8BkfgzgclKzv5N+NSzY9XLsiqu75qKbOdl6TDD
	Nqp+TO8et1dl3tc=
Received: from [195.171.99.130] (port=27445 helo=[192.168.0.79])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TMdaK-0006kx-8P
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Oct 2012 11:39:20 +0000
Message-ID: <507801D8.30001@communistcode.co.uk>
Date: Fri, 12 Oct 2012 12:41:12 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120910 Thunderbird/15.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <5077FEA8.5080308@communistcode.co.uk>
	<5077FF51.2060703@communistcode.co.uk>
	<507800E4.3070305@communistcode.co.uk>
In-Reply-To: <507800E4.3070305@communistcode.co.uk>
Subject: Re: Build Failures
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Oct 2012 11:52:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/12 12:37, Jack Mitchell wrote:
> On 12/10/12 12:30, Jack Mitchell wrote:
>> On 12/10/12 12:27, Jack Mitchell wrote:
>>> On my git pull and build today I ran into some compile errors. As 
>>> mentioned before I would usually just -c cleansstate and retry, 
>>> which 99% of the time sorts the issue. However, I was informed this 
>>> was not meant to happen and logs would be appreciated, so please 
>>> find them below.
>>>
>>> pkgconfig-native
>>> http://ix.io/38G
>>>
>>> binutils-crosssdk
>>> http://ix.io/38I
>>>
>>> Possibly looks like something doesn't have a 'sed' dependency when 
>>> it should?
>>>
>>> Cheers,
>>>
>>
>> On a re-run I get:
>>
>> http://ix.io/38J
>>
>> Next step is to try good old cleansstate which I believe will work as 
>> it seems to be an autoreconf which isn't being performed.
>>
>> Regards,
>>
>
> Ok, seems to be maybe a bit more serious that first thought. Pkgconfig 
> still fails to build with the following log:
>
> http://ix.io/38K
>
> Any ideas? Force a rebuild of libtool maybe?
>
> Cheers,
>

Ok, to fix:

bitbake -c cleansstate binutils-crosssdk
bitbake -c cleansstate pkgconfig
bitbake -c cleansstate pkgconfig-native

This got past the issue and it has now continued to build.


-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



