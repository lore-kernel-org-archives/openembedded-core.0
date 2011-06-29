Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QbjCu-00078j-8y
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 03:04:54 +0200
Received: by pzk36 with SMTP id 36so596515pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 18:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=5jxnn41zRgSNMZ6N10F1/E5PTmmkQAbcLKTrugqqWzM=;
	b=kgnivS7QiDXWiRIqZlepRmHMnx7+qO1E1RjPS06r8e5suURks25HmVGhn3nlQyQV2n
	qOMpnVR5QZpvbvbubtdAsm2pA2xdPIFexJCi6s8vOoTkX8vREXFzeSl1N3b5AuZ0wS+n
	n24PY8KeV7F7mRAAnSLfE01EE4ZJPAMsBnhRU=
Received: by 10.143.20.21 with SMTP id x21mr122103wfi.39.1309309261851;
	Tue, 28 Jun 2011 18:01:01 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id n9sm458652wfk.8.2011.06.28.18.01.00
	(version=SSLv3 cipher=OTHER); Tue, 28 Jun 2011 18:01:01 -0700 (PDT)
Message-ID: <4E0A794C.5060303@gmail.com>
Date: Tue, 28 Jun 2011 18:01:00 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1309239001.git.dexuan.cui@intel.com>	<674a391015f3cdebe891ae7e8439aea48698982e.1309239001.git.dexuan.cui@intel.com>	<3819C41B-FF96-45FD-8265-8EFC9F73E771@dominion.thruhere.net>
	<201106281207.23516.paul.eggleton@linux.intel.com>
In-Reply-To: <201106281207.23516.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 1/1] base.bbclass: show layer's branches/revisions in the banner info
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
X-List-Received-Date: Wed, 29 Jun 2011 01:04:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/28/2011 04:07 AM, Paul Eggleton wrote:
> On Tuesday 28 June 2011 07:45:09 Koen Kooi wrote:
>> So it works as expected, but the output is a bit confusing. I have a few
>> (conflicting) suggestions:
>>
>> 1) replace _BRANCH and _REVISION with ' branch' and ' revision', e.g.:
>>
>> 	meta-archos branch          = "master"
>> 	meta-archos revision        = "413933fb5f62574e38a9a1e38905ba6e9c1be4ad"
>>
>> 2) for the extra layers put branch and revision on a single line:
>>
>> 	meta-archos          = "master/413933fb5f62574e38a9a1e38905ba6e9c1be4ad"
>
> I'd go with option 2 over 1, personally - the list gets rather long on
> something like Angstrom, better to keep it short.

I would say to do it uniformly and treat oe-core as one of layers too 
when emitting this info


