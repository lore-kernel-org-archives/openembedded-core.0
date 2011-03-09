Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PxBSH-00060V-Mh
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Mar 2011 05:57:01 +0100
Received: by pzk12 with SMTP id 12so28030pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Mar 2011 20:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=mDSDt0yRwniauvMaPlnxAFhgy5mtIvPpqn3vRrSfQOU=;
	b=K84z5dT6Cv79VVOCYzIPfd6R7xetXSgdp7MHKUp1abhfnHOSfN/V4ch4XbJAQ1Hd+z
	QmBQnvbMF4ujd83Q+xqy7APOsjF4NjoqIdG0f+fd7jtmPSlXxVh7QdSH05MUR+RL6Fc4
	dzuc8ShQOfBOpivG0uHeuM8xY6L1+0tqUqJys=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	b=uq93czoVhozVEBiCywU9Xs/1Cw4S6Kys+vUBg6dqbIh1fbHQm9jk3zEqHkKAujXnIA
	SgdlgOwY7sdYH2NH9Di51JjXIlStzcPnhkZ/VQ8oB9BKGv5tYtgMY/ZaFbwUKr3zu5a9
	3U5cTdsv1Zm1F0nc2YKeOTggZ4Srzkx3wE+84=
Received: by 10.142.201.13 with SMTP id y13mr5015289wff.198.1299646523823;
	Tue, 08 Mar 2011 20:55:23 -0800 (PST)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 25sm1904290wfb.10.2011.03.08.20.55.21
	(version=SSLv3 cipher=OTHER); Tue, 08 Mar 2011 20:55:22 -0800 (PST)
Message-ID: <4D770834.9050707@gmail.com>
Date: Tue, 08 Mar 2011 20:55:16 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.14) Gecko/20110221 Thunderbird/3.1.8
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1299544029.git.sgw@linux.intel.com>	<1299610544.602.109.camel@rex>
	<201103090129.37429.paul.eggleton@linux.intel.com>
In-Reply-To: <201103090129.37429.paul.eggleton@linux.intel.com>
Cc: poky@yoctoproject.org, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 0/8] Numerous bug fixes
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
X-List-Received-Date: Wed, 09 Mar 2011 04:57:02 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/8/2011 5:29 PM, Paul Eggleton wrote:
> On Tuesday 08 March 2011 18:55:44 Richard Purdie wrote:
>>> Saul Wold (3):
>>>    gst-plugins: Added hal to DEPENDS
>>>    attr: Added ncurses to depends
>>>    lsb-live image: add lsb-live and lsb-sdk-live image types
>>
>> Merged. I'd like to drop the hal dependency if someone can send me a
>> patch which disables it and everything works.
>
> Patch attached to do this (against oe-core) .
>

patch looks sane to me. We will need Koen to Ack it.

> Cheers,
> Paul
>
>
>
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky



