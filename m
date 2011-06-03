Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QSYiQ-0007jY-Tz
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 20:03:23 +0200
Received: by pzk36 with SMTP id 36so948649pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jun 2011 11:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=tRtS9LAYt2Izmg4B3BWfXyyGiRyrLy99XeipYKKKqL0=;
	b=OOzE721JPvnpFd45SDYvvyGkfOnMxY3iFG85OKmT471iXlQ24Bq15vYpCD6jSRy+w5
	10wSBXM8t0UmOFP6bdTU4rpTTDO808mtthBFQJXAPLhcB4y2vnqi2ktL6zTWRfMecR/B
	cEKp0vCWVkQGenDLy+pQrFiMUAOKe/MfcgVyE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	b=GcGgoQau/49xtIK4MSbSodxfUOt1TVbYgc0qzrQ2gVdtOvh/Aq45PrDN06SbOrSZ8p
	x8gxwYTpNgZi4QHuVxlQG042c25h+okfUHeqL8Rz/BLMb+olRsirfey/ywniMgTu5GOc
	luZSukaS3woIT6O/oWBKs0qG/FIPnUM49v1No=
Received: by 10.142.2.33 with SMTP id 33mr336571wfb.232.1307124009049;
	Fri, 03 Jun 2011 11:00:09 -0700 (PDT)
Received: from [172.23.0.205] (natint3.juniper.net [66.129.224.36])
	by mx.google.com with ESMTPS id x16sm1174377wfc.10.2011.06.03.11.00.06
	(version=SSLv3 cipher=OTHER); Fri, 03 Jun 2011 11:00:07 -0700 (PDT)
Message-ID: <4DE92125.5020709@gmail.com>
Date: Fri, 03 Jun 2011 11:00:05 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1307083232.git.kai.kang@windriver.com>	<adfc33032da197d9e5438a42e2b5df4681cdbb35.1307083232.git.kai.kang@windriver.com>	<1307089346.27470.624.camel@rex>
	<EEAC1D96-7E8D-4496-9FA1-E41860CA131E@dominion.thruhere.net>
In-Reply-To: <EEAC1D96-7E8D-4496-9FA1-E41860CA131E@dominion.thruhere.net>
X-Enigmail-Version: 1.1.2
Subject: Re: [PATCH 1/1] eglibc: migrate configurability from oe
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
X-List-Received-Date: Fri, 03 Jun 2011 18:03:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 06/03/2011 01:57 AM, Koen Kooi wrote:
> 
> Op 3 jun 2011, om 10:22 heeft Richard Purdie het volgende geschreven:
> 
>> On Fri, 2011-06-03 at 14:47 +0800, Kang Kai wrote:
>>> From: Kang Kai <kai.kang@windriver.com>
>>>
>>> Migrate configurability from oe, try to shrink minimal image size
>>>
>>> The switch is in local.conf.sample, uncomment the line
>>> DISTRO_FEATURES_EGLIBC = ""
>>> and write what options you want to enable.
>>>
>>> If want to disable locale-code charsets or locales, you have to uncomment
>>> PACKAGE_NO_GCONV = 1
>>> Because without this, it fails on package_do_split_gconvs in libc-package.bbclass
>>
>> I have some comments:
>>
>> a) I think these should become flags in DISTRO_FEATURES with an
>> "eglibc-" prefix so something like "spawn" would become "eglibc-spawn"
> 
> Taking a step back here, uclibc has the same configurability, so wouldn't it make sense to align both (where possible) and just have 'libc-spawn' in DISTRO_FEATURES?
> 

uclibc's configurations are not 1 to 1 with eglibc. but I agree the
common configs should be derived from single DISTRO_FEATURE dealing with
that like ipv6

> regards,
> 
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



