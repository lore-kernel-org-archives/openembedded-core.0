Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1THSEq-0003Np-SR
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 06:31:45 +0200
Received: by daks35 with SMTP id s35so563382dak.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 21:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=vxnnTLyNAYI0BatgcdGdGJln3ikjopA3Lm6M/KJpN4c=;
	b=Cs9t+25jGy/MST29uM+9p/d5TyIx8kPrWXCdBc8+MqaWZTbIyd56k0UgUyleCNBVJJ
	Bkko/oL7hRmGOfIsOo8An94I2qfKn8DOlDgc/WYuR+me6jr5P8neiNH7lSDb45lnjkre
	570AXr/f1SKkZR2/FJyW12fzelx16yuyFliidsX+wez5T66PrGMjHt1eSkr8py1hZaZQ
	Li/jm5yqqyAwxMpepbA6GFIy3efyLNM4Z1UPYN4CO4S+CFIYbmHpzDQh/1YFQYYgx2OC
	O3UFBIxNxHyp0IRUCxoCShldTJhcuQvjKd1J3G+XmPCnaViNhuL8OyGDtHw4CpchzXRE
	2ubw==
Received: by 10.68.189.70 with SMTP id gg6mr17159077pbc.125.1348805931548;
	Thu, 27 Sep 2012 21:18:51 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id
	bs6sm4821426pab.30.2012.09.27.21.18.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Sep 2012 21:18:50 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A6B43AC@039-SN1MPN1-001.039d.mgd.msft.net>
Date: Thu, 27 Sep 2012 21:18:49 -0700
Message-Id: <C0194970-81E1-4713-A8EF-5BB842370C25@gmail.com>
References: <9CAE2E57-84BE-44B7-A7BE-BCE8F728EFE8@gmail.com>
	<E416A48D-4E21-4353-BDDC-B3B15AA810C9@gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6B4252@039-SN1MPN1-001.039d.mgd.msft.net>
	<C4E52DF7-ECBD-4411-9DA6-5E7F920FE747@gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6B43AC@039-SN1MPN1-001.039d.mgd.msft.net>
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
X-List-Received-Date: Fri, 28 Sep 2012 04:31:45 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


On Sep 27, 2012, at 8:52 PM, McClintock Matthew-B29882 =
<B29882@freescale.com> wrote:

> On Thu, Sep 27, 2012 at 10:43 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>> On Sep 27, 2012, at 8:40 PM, McClintock Matthew-B29882 =
<B29882@freescale.com> wrote:
>>=20
>>> Khem,
>>>=20
>>> I'm just not looking at a similiar issue. Do this:
>>>=20
>>=20
>>=20
>> just 'not' or just 'now' ?
>>=20
>>> cat tmp/sstate-control/manifest-* | grep usr/lib/perl5
>>>=20
>>> And see which recipe is making this folder. It should be the perl
>>> recipe, first not some other recipe=85
>>=20
>>=20
>> cat sstate-control/manifest-* | grep usr/lib/perl5
>>=20
>> return nothing
>=20
> Maybe this is not the same root cause then.

reverting that commit fixed it. before that I tried to cleans state =
clean all perl and perl-native
to no avail.

>=20
>>=20
>>>=20
>>> Side question are you using FSL layers?
>>=20
>> yes
>=20
> Is libhugetlbfs getting built?

No



