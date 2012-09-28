Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1THSYN-0003fN-0t
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 06:51:55 +0200
Received: by padfa11 with SMTP id fa11so1940269pad.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 21:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=CDnV3Rqr4oOQHtNThlHNYzLLbmRztKzXao668+sQobc=;
	b=JH/SrkAr96LU7izhW81OkyzP5EKbmR3qD469bfF3HN/3I7kryjmwi1oUObCjpV06wT
	cYmWWfXGFTbJM7gtJMQk4h+y3pLpPAEBvpkhIayHPRaln9czxyCI7QricQiqogVU+ofM
	GM/NdFfn0go1Pz5UEyyO2vhVaqS3ywV7B28BV20iS9R8w7hzO6vYaNssq9CtVKv9rav5
	c3Yrz5A3JZlq7RcaZ0tst39ivgDXxWxpwoubddAAW3e8+JuzxzXv3hY8/GADNIyeOHlz
	VgEmm9wSPaDgI9whLEbDfut3014p6TxM95n0CZH3x+V0KeWh5fr+GvoUXqFcJA2okJA4
	pJSQ==
Received: by 10.68.234.232 with SMTP id uh8mr17212838pbc.94.1348807141703;
	Thu, 27 Sep 2012 21:39:01 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id j9sm4858517pav.15.2012.09.27.21.38.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Sep 2012 21:39:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A6B462F@039-SN1MPN1-001.039d.mgd.msft.net>
Date: Thu, 27 Sep 2012 21:38:58 -0700
Message-Id: <FBB69FDD-BE5F-4BAD-9FE3-59A5283722E6@gmail.com>
References: <9CAE2E57-84BE-44B7-A7BE-BCE8F728EFE8@gmail.com>
	<E416A48D-4E21-4353-BDDC-B3B15AA810C9@gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6B4252@039-SN1MPN1-001.039d.mgd.msft.net>
	<C4E52DF7-ECBD-4411-9DA6-5E7F920FE747@gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6B43AC@039-SN1MPN1-001.039d.mgd.msft.net>
	<C0194970-81E1-4713-A8EF-5BB842370C25@gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6B462F@039-SN1MPN1-001.039d.mgd.msft.net>
To: McClintock Matthew-B29882 <B29882@freescale.com>
X-Mailer: Apple Mail (2.1498)
Cc: "openembedded-core@lists.openembedded.org oe-core layer"
	<openembedded-core@lists.openembedded.org>
Subject: Re: perl install error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Sep 2012 04:51:55 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


On Sep 27, 2012, at 9:23 PM, McClintock Matthew-B29882 =
<B29882@freescale.com> wrote:

> On Thu, Sep 27, 2012 at 11:18 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>> On Sep 27, 2012, at 8:52 PM, McClintock Matthew-B29882 =
<B29882@freescale.com> wrote:
>>=20
>>> On Thu, Sep 27, 2012 at 10:43 PM, Khem Raj <raj.khem@gmail.com> =
wrote:
>>>>=20
>>>> On Sep 27, 2012, at 8:40 PM, McClintock Matthew-B29882 =
<B29882@freescale.com> wrote:
>>>>=20
>>>>> Khem,
>>>>>=20
>>>>> I'm just not looking at a similiar issue. Do this:
>>>>>=20
>>>>=20
>>>>=20
>>>> just 'not' or just 'now' ?
>>>>=20
>>>>> cat tmp/sstate-control/manifest-* | grep usr/lib/perl5
>>>>>=20
>>>>> And see which recipe is making this folder. It should be the perl
>>>>> recipe, first not some other recipe=85
>>>>=20
>>>>=20
>>>> cat sstate-control/manifest-* | grep usr/lib/perl5
>>>>=20
>>>> return nothing
>>>=20
>>> Maybe this is not the same root cause then.
>>=20
>> reverting that commit fixed it. before that I tried to cleans state =
clean all perl and perl-native
>> to no avail.
>=20
> OK, well we got the same error and ours was from another sstate-cache
> installing files in /usr/lib/perl5 before perl installed it's own
> symlink. cleaning cache for perl did not help either.
>=20
> Reverting that patch could have causes rebuilds and change of ordering
> (possibly) that might mask the error a little longer. If ours are
> related.


Does it mean that if I invalidate whole state it will work ?
thats kind of gross


>=20
> -M
>=20
>>>=20
>>>>=20
>>>>>=20
>>>>> Side question are you using FSL layers?
>>>>=20
>>>> yes
>>>=20
>>> Is libhugetlbfs getting built?
>>=20
>> No
>>=20
>>=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



