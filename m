Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QWsv3-0007ym-Jb
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 18:26:17 +0200
Received: by iwn19 with SMTP id 19so455050iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 09:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=ycLhca10zJI80knLeyAXCxSi+gwm/jfUI70qUN8nthI=;
	b=FrQtiwkG+7OaJ/ZNRT6wVsGRrwJJHgxmz4QomF2UTwCc7ae1FG9E0cdGgEetSfD7CB
	eZzNUzfMjZG250IZyLCE30/JmN+7y+xLET+vI0IaybAhrNaliFCHjcSbw3WB1+vFF0qz
	JWA/hvn/c3yZSklagkgpVUhV9uJ9e9d7Lt0IU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=b7oC6MVpH3s3xEzYcnYl/KYtUmz9+31MtLj4mKtAPqMEdtYrK0A7O2L+XIpDyfGkhD
	pX2MgonwFtgysrYHKTUdLLooDYUpnojFsFNFEW3sJ29oK2ZuRyyji8Xy3ZJBUmQZ7FvO
	8iDgQJbOiJWaFe21sz9xIgnR6bGmwivI9xA5c=
Received: by 10.231.82.139 with SMTP id b11mr546230ibl.134.1308154970021;
	Wed, 15 Jun 2011 09:22:50 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id q15sm303704ibb.31.2011.06.15.09.22.48
	(version=SSLv3 cipher=OTHER); Wed, 15 Jun 2011 09:22:48 -0700 (PDT)
Message-ID: <4DF8DC56.7000100@gmail.com>
Date: Wed, 15 Jun 2011 09:22:46 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4DF8D848.9000605@linux.intel.com> <4DF8D9A6.3020606@windriver.com>
In-Reply-To: <4DF8D9A6.3020606@windriver.com>
Subject: Re: [RFC] DISTRO_MIRRORS / DISTRO_PREMIRRORS
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
X-List-Received-Date: Wed, 15 Jun 2011 16:26:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/15/2011 09:11 AM, Mark Hatle wrote:
> On 6/15/11 11:05 AM, Saul Wold wrote:
>>
>> Folks,
>>
>> Recently we have seen a number of fetch failures, due to upstream sites
>> being down or deprecated (tinylogin, pscmic and others).
>>
>> The issue is that oe-core as a non-distro does not have a default set of
>> mirrors, which causes the fetcher to fail as there is no fall-back
>> mirror to distrubte the source code.
>>
>> As has been pointed out, different projects and distributions (Yocto
>> Project and Angstrom) both have upstream source mirrors which could be
>> used. Currently the Yocto Project defines it's MIRRORS and PREMIRRORS in
>> meta-yocto/conf/distro/poky.conf.
>>
>> I propose that we add a list of DISTO_MIRRORS and DISTRO_PREMIRRORS with
>> default settings pointing to the current autobuilder.yoctoproject.org
>> source site.  These would be added to the mirrors.bbclass, so that
>> oe-core will have a default set of mirrors that can be overridden by a
>> distro or layer.
>>
>
> ...
>
>>
>> Thoughts, ACKs, NAKs??
>
> The only concern I have is that we may miss when an upstream source location
> changes, thus not fixing a recipe when a package moves, disappears and otherwise
> can't be downloaded.
>

yeah thats why mirror.openembedded.org usually contains the sources that 
are not found anywhere.


> --Mark
>
>> --
>>       Sau!
>>
>> Saul Wold
>> Yocto Component Wrangler @ Intel
>> Yocto Project / Poky Build System
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



