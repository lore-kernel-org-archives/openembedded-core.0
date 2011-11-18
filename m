Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1RRP2K-0001Tz-9D
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 15:03:24 +0100
Received: by bkbzs2 with SMTP id zs2so3409614bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2011 05:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=TkWbCgc6RrPNlhLnvgHZJO1xc/QFfnczQwTUKbYEQHo=;
	b=PcyLVpbM6lx2eEVlzlpdvfn2uorZqQlkJQL0hKkVWNWMM/K/a/t053l6EL51TQLl3w
	RKieuvav0SUUEXaDE+cHstGqX5sxKpB2uKuEtTeABSsQEYfVtDxXiCd+TSUH0z3N7JId
	9Jw0xMkWspkeAd8HpxxE1kMEEJKv9f3mzIs4g=
Received: by 10.205.133.16 with SMTP id hw16mr3373180bkc.128.1321624618369;
	Fri, 18 Nov 2011 05:56:58 -0800 (PST)
Received: from [137.202.140.192] (nat-rup.mentorg.com. [139.181.168.34])
	by mx.google.com with ESMTPS id dq2sm758011bkb.11.2011.11.18.05.56.55
	(version=SSLv3 cipher=OTHER); Fri, 18 Nov 2011 05:56:56 -0800 (PST)
Message-ID: <4EC66414.7010708@gmail.com>
Date: Fri, 18 Nov 2011 17:56:36 +0400
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:5.0) Gecko/20110807 Icedove/5.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1320429060.git.paul.eggleton@linux.intel.com>
	<E2FAFDF6-ABD2-4242-8BAC-8124ED2B1013@dominion.thruhere.net>
	<4EC22317.1090109@gmail.com> <4407672.GTMaySf1kg@helios>
In-Reply-To: <4407672.GTMaySf1kg@helios>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] core-image-minimal-initramfs: force IMAGE_FSTYPES
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
X-List-Received-Date: Fri, 18 Nov 2011 14:03:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/2011 05:55 PM, Paul Eggleton wrote:
> On Tuesday 15 November 2011 12:30:15 Dmitry Eremin-Solenikov wrote:
>> This was merged as IMAGE_FSTYPES =+ "cpio.gz"
>> Now this brings problems if I have IMAGE_FSTYPES += "live" in my
>> local.conf / BSP machine.conf.
>>
>> 1) OE tries to generate hddimg for this initramfs image, which is
>> strange idea
>> 2) If OE is trying to generate bootimg (hddimg) when the kernel is not
>> yet deployed, building fails (as bootimg can't find a deployed kernel to
>> put into hddimg).
>>
>> Please revert this back to original patch as proposed by Paul.
>
> OK, so what are we going to do about this? Do we have to do some filtering of
> this variable?

I'd propose to just set it via:

IMAGE_FSTYPES = "cpio.gz". It is really no point in generating other 
types of inititramfs images.

>
> Cheers,
> Paul
>


-- 
With best wishes
Dmitry


