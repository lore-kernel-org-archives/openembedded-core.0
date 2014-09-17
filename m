Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id F26E6713C1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 16:21:48 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id q107so2243564qgd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 09:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=uewtRpH3lT2KyvJwweSjpoVeylesMYhxLNQRc3t2oSE=;
	b=ffMUGyDnt3VWQI3In4ZPN98GW1noZFZ5aS48+TozrEkrF76P1XMBmxVXGoKAC0esWK
	b0mF63tYGIm63kd6PeXQtiISVx1MyrbasAqddLarUQpolPgJY4hmjqQ8jEJInUDSzwpn
	KjmlIDQjZ5aEKku9u1JnVatuVTyuPkZ5p/4+1DHDLV/hWfmOOvCl7VhqragNTCvgAkH4
	ni3CpunMbDcGjbZQOxBSDixoQf5Hrp6EIlADgRhL1CH0Gg/xBiNjsLcm5Hr0Jcbf1Gbx
	CfQVJTh/bk2Z0EHKnzXKfLsjAXC+GvOZl0H00zsAFsUgdUsnPS2nxYM6ybAt979DCXdY
	w0HA==
MIME-Version: 1.0
X-Received: by 10.236.162.7 with SMTP id x7mr51434644yhk.6.1410970909956; Wed,
	17 Sep 2014 09:21:49 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.44.19 with HTTP; Wed, 17 Sep 2014 09:21:49 -0700 (PDT)
In-Reply-To: <1410970596.14624.108.camel@ted>
References: <cover.1410939794.git.hongxu.jia@windriver.com>
	<7e57c471b593b7be818545b5da25869cb506bde1.1410939794.git.hongxu.jia@windriver.com>
	<1410970596.14624.108.camel@ted>
Date: Wed, 17 Sep 2014 13:21:49 -0300
X-Google-Sender-Auth: dnIWunD24iGWaF6IPwWawFnFyD0
Message-ID: <CAP9ODKoqzBXjjYjALrRH_2K3K2uobEUk4irxL=ZNB1m8hOPe_g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 9/9] sstatesig: incremental dump lockedsigs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Sep 2014 16:21:50 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 17, 2014 at 1:16 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2014-09-17 at 16:08 +0800, Hongxu Jia wrote:
>> The idea of incremental sig is:
>>
>> New sig file = Old sig file (if available) + New sig items in current build.
>>
>> Limit the modification within the dump_lockedsigs, and add two variables
>> 'self.lockedsigs_types' and 'self.lockedsigs_raw' keep old sig file.
>>
>> How to config for incremental dump:
>> ...
>> USER_CLASSES += "sstate_lockedsig"
>> SIGGEN_LOCKEDSIGS_CONFIG = "${TOPDIR}/locked-sigs.inc"
>> require ${SIGGEN_LOCKEDSIGS_CONFIG}
>> ...
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>
> I'm fine with the idea in principle. Why can't we do something like:
...
> which is substantially simpler though?

Wouldn't it keep accumulating locked hashes for same recipes?


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

