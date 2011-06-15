Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QWshD-0007mY-Ls
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 18:11:59 +0200
Received: by iwn19 with SMTP id 19so444333iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 09:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=6fsgVUK3ZGlSkGjmXqw45VRQERJ+4/yUI8WiuyBVsYo=;
	b=AAtLcM1SB/jN/I4Z21kjXcYYTzW9OtGylGcD4QzdZeyNR64e6kKgP2IU3BWaOKl9gc
	2Cdlw03XJKh5s9/aTcoQkMXnXWqwwMJnaWOqkH7CWIL4RDg/ONPXyzCV76faG0M46amL
	YEOHTGpv06B/BTmAluwA8dRBKXQ7GQ5Ee7Qx4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=UBKRIitijLMd+y5T3YZIw4gXfFDAgoScEucPepWk2vH62CTwTaczzmM82DGNw1ZtJP
	aIt8cCN1ngYHwtqqx9biwTqrkkdrUnTP9yaEgm/GPvHwu3nhbr3KNIZ73UL82OiQiF1D
	/GIi1ze4iwGGs5Y37st2oAfHbCqwYUuBdN1W8=
Received: by 10.231.253.87 with SMTP id mz23mr524763ibb.197.1308154107949;
	Wed, 15 Jun 2011 09:08:27 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id d10sm300994ibb.15.2011.06.15.09.08.26
	(version=SSLv3 cipher=OTHER); Wed, 15 Jun 2011 09:08:27 -0700 (PDT)
Message-ID: <4DF8D8F9.8060103@gmail.com>
Date: Wed, 15 Jun 2011 09:08:25 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1308139578.25285.1539.camel@phil-desktop>	<14EEB73F-6128-4529-9A23-6F18D713F8F2@dominion.thruhere.net>	<4DF8C3F5.90204@linux.intel.com>	<1308148934.25285.1795.camel@phil-desktop>
	<4DF8D076.4050206@windriver.com>
In-Reply-To: <4DF8D076.4050206@windriver.com>
Subject: Re: tinylogin unfetchable
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
X-List-Received-Date: Wed, 15 Jun 2011 16:11:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/15/2011 08:32 AM, Mark Hatle wrote:
> On 6/15/11 9:42 AM, Phil Blundell wrote:
>> On Wed, 2011-06-15 at 07:38 -0700, Saul Wold wrote:
>>> Is the fallback to MIRRORS not working?
>>
>> Which MIRRORS are you thinking of?  If there's meant to be an
>> appropriate one set in oe-core then I guess the answer is no, it isn't
>> working :-}
>
> The FALLBACK mirrors are not enabled by default in the OE-Core configuration
> files.  This is because each distribution will likely want to provide their own
> mirroring.
>
> If anyone wants to use the Yocto mirrors this is the way to enable it, in your
> local.conf add:
>
> PREMIRRORS ?= "\
> bzr://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
> cvs://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
> git://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
> hg://.*/.*    http://autobuilder.yoctoproject.org/sources/ \n \
> osc://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
> p4://.*/.*    http://autobuilder.yoctoproject.org/sources/ \n \
> svk://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
> svn://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n"
>
> MIRRORS =+ "\
> ftp://.*/.*      http://autobuilder.yoctoproject.org/sources/ \n \
> http://.*/.*     http://autobuilder.yoctoproject.org/sources/ \n \
> https://.*/.*    http://autobuilder.yoctoproject.org/sources/ \n"
>


I must say its pretty ugly

>> p.
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



