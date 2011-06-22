Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QZPwz-00058g-KA
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 18:06:45 +0200
Received: by pwi1 with SMTP id 1so745506pwi.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 09:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=+LXVXezNbsbOPqhsx7upBjiI2/oKgolnjg8cinW4iYs=;
	b=HzD9ya9K4tk2wLsFKkpnwPLNLF7HQd4om1u3uKJ8GxlMp8t/u2PC6ruNLt5HzB6+9m
	sIYiW0L8g5UTUO7W89/38qiHHRrkHcsTdc6/IAfcy9Qq2k+5uuBLZMjF42Gen4jnjkvV
	+TwNV+j1aaTIV0p8twOIO9QwkBt+K6+ZuGvSI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=Lb8zUFymXrQO6ycd/CFwSVnv3DG8h6oxFfLMEtU8b2FMh5OQiBZJ34mln/FsN9Tfhd
	6+SyA4ijY04LmUTeXU2cDTnzJ7FLNc4TiMhk5AHhw5r5vt3+58HYZO0rNKPkl3EeY2wu
	nJ7CHh19kg7zB7F9yp0cqnd3nGutr80KNypyA=
Received: by 10.68.16.135 with SMTP id g7mr479919pbd.486.1308758589609;
	Wed, 22 Jun 2011 09:03:09 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id o2sm525418pbj.65.2011.06.22.09.03.08
	(version=SSLv3 cipher=OTHER); Wed, 22 Jun 2011 09:03:08 -0700 (PDT)
Message-ID: <4E02123B.3010809@gmail.com>
Date: Wed, 22 Jun 2011 09:03:07 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1308706692.git.raj.khem@gmail.com>
	<1308758420.20015.82.camel@rex>
In-Reply-To: <1308758420.20015.82.camel@rex>
Subject: Re: [PATCH V2 0/2] Change gcc 4.6 recipes to use svn in SRC_URI
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
X-List-Received-Date: Wed, 22 Jun 2011 16:06:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/22/2011 09:00 AM, Richard Purdie wrote:
> On Tue, 2011-06-21 at 18:43 -0700, Khem Raj wrote:
>> changes since V1
>>
>> Separate out non gcc changes to a different pull request
>> Patches are not attached inline due to sheer size of them
>> as they might choke patchwork. The are only on the branch
>>
>> The following changes since commit 78de64f58b98101f5be5778e9ecbdaae5ba32997:
>>
>>    binutils_2.21.bb: Fix ld segfault exposed by eglibc 2.14 on x86_64 (2011-06-21 17:58:06 -0700)
>>
>> are available in the git repository at:
>>    git://git.openembedded.org/openembedded-core-contrib kraj/gcc-4.6
>>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/gcc-4.6
>>
>> Khem Raj (2):
>>    gcc-4.6: Switch to using svn SRC_URI for recipe
>>    tcmode-default.inc: use 4.6 for GCCVERSION and SDKGCCVERSION
>
> I'm afraid I don't like having "gcc 4.6" being so publicly visible. Its
> fine for the recipe names but the PV itself really needs to be something
> like "4.6.2+svn".
>
> I say this as a person who'd have to deal with people claiming we're
> behind on gcc since we were on 4.6[.0] :/
>
yeah it will be 4.6.0+svn since 4.6.0 is latest release from the branch
makes sense. I will post new version.

> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



