Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1QYetn-0004HJ-4Y
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 15:52:19 +0200
Received: by gyd12 with SMTP id 12so208818gyd.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2011 06:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=WYAquyHCu42rHI5efwYy1VRhVOKn+mfUisVsvAJguuw=;
	b=po+m8Frn9fdY6gNZXfKxdr/QGKZueiLnb8UlxV+KiSCH32+xIq2kKxbJStonCDf/HT
	cVI/ru230rfocFbzyv/f3NcyEHBIt7qVJ+koMoGpNGyF68iu68jIBeERzcnv6gD/WvBi
	1EMCUOakYMJmVnEGMyzwTh4FZpq0+72rMy0w4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=a7M/FAOgwDqXqyiIv+zd9O3oA14Y0/4pHiNcFNoSu+iVu3rVgZDftog28vFxDo7xeF
	eWEuAeM3g1ttaQf2x9df//4CUWFogofrr9+zJQeTKHwPsVmq02RxgPfwSfj62Zo7yLTQ
	8pcgvYmTsKCEyO2gA9TWRBa7EZmoMvIvuRVJ4=
MIME-Version: 1.0
Received: by 10.236.157.97 with SMTP id n61mr3813040yhk.285.1308577725240;
	Mon, 20 Jun 2011 06:48:45 -0700 (PDT)
Received: by 10.236.202.69 with HTTP; Mon, 20 Jun 2011 06:48:45 -0700 (PDT)
In-Reply-To: <201106181840.38875.paul.eggleton@linux.intel.com>
References: <E1QXzLA-0004Ca-IU@happy.bec-systems.com>
	<201106181840.38875.paul.eggleton@linux.intel.com>
Date: Mon, 20 Jun 2011 09:48:45 -0400
Message-ID: <BANLkTi=zfbd=Z0nXhjsE8Z+qr90u6V+Law@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: OE Changelog for 2011-06-6 to 2011-06-13
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
X-List-Received-Date: Mon, 20 Jun 2011 13:52:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jun 18, 2011 at 1:40 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Saturday 18 June 2011 18:29:48 cliff.brake@gmail.com wrote:
>> meta-yocto: git://git.yoctoproject.org/poky
>>...
>> ====================================================
>> Changelog for meta-yocto:
>>
>
> This clearly contains more than just changes to the meta-yocto subdirectory of
> the poky repo. Can you please set this up to be filtered? Otherwise we're just
> effectively getting dupes of commits to bitbake and oe-core.

Hi Paul,

I'll look into filtering.

Can you describe how the bitbake and oe-core directories are
synchronized to content in the poky repo?

Thanks,
Cliff

-- 
=================
http://bec-systems.com


