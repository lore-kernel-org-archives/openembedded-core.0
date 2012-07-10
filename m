Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SoPKa-0002rI-Gt
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 03:33:36 +0200
Received: by eaal1 with SMTP id l1so4249658eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2012 18:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ljJnn520tHUWD3KL428QSrtnRX7pztF2Xmx2w77FHMs=;
	b=pM+wdJM/HeSmMj7I1WuVDSjnmONc+pFf9meuBrKk6YdFsH44O0NHJ5NM6GFaWFcvho
	pStUpQdKKSjbVlkhLbsvFIM8d4QRPz1+V+WzzM5pc9I+LU0o49BEtKK7QlqwcKna29W+
	sD5+n+DyYOmdjmfQQPimCdYJkEleIXtXycSEVAE9SSpSjA34Czp0BdilzHDNaCkwX49m
	bs8xIcZJuw6zG2UMU3eiQew4lAAcVufsjvyRXK93N/kDRAE2MYqjJOTyAvsbMWxBGgDH
	vQKUMdMrjnKJiJoA6y4Z2NGlG5T2KgaAp/1GF+CYsycx2Cm2FRcNJ0ei02y+p2+/AFHJ
	noBA==
Received: by 10.14.97.16 with SMTP id s16mr9405131eef.117.1341883346590; Mon,
	09 Jul 2012 18:22:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Mon, 9 Jul 2012 18:21:56 -0700 (PDT)
In-Reply-To: <4FFB6D1A.4070400@linux.intel.com>
References: <1341871474-8719-1-git-send-email-sgw@linux.intel.com>
	<CAMKF1sowgGneDRp61GaL10-rbsCT7ucUq_ri_GNhm4+--idKww@mail.gmail.com>
	<4FFB6D1A.4070400@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Jul 2012 18:21:56 -0700
Message-ID: <CAMKF1sr7U+mDi=5c2_C9ejW05DBQzHCY6RYoWr_L4xB3KKuYUQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnupg: ensure deterministic build by disabling libcurl
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
X-List-Received-Date: Tue, 10 Jul 2012 01:33:36 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 9, 2012 at 4:45 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 07/09/2012 03:43 PM, Khem Raj wrote:
>>
>> On Mon, Jul 9, 2012 at 3:04 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>>
>>> gnupg has it's own fake curl, since we use gnupg with zypper, there does
>>> not
>>> seem to be a strong reason to add curl to the depends list.
>>
>>
>> what does disabling curl has to do with gnupg being used with zypper ?
>>
> I was looking for where gnupg was used within oe-core and it's usage model
> to see if it made sense to go with the extra dependency for gnupg, let me
> know your reasoning.  Generally especially for natives we look for ways to
> reduce the initial build time.

I am all for it. I wanted to understand the context thanks for that.
On another note
it would be interesting to know what are we losing if we disable curl
or external curl

>
> Sau!
>
>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>


