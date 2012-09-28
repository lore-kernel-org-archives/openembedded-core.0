Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1THRgL-0007Dn-TF
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 05:56:06 +0200
Received: by pbbro12 with SMTP id ro12so4594538pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 20:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=1FkM5hS96FY8ujNXITiuy8GpOSF9YYBnYAyJpDp4eCM=;
	b=Dcpxl1uRbRzTGBG/RaR9fM9lS2rNt/FOQHXdk9XbdZadRintU3BBYgwIVwJ1meieZB
	w3Ke2Bqjrl4qP51MY1CED2l78qThyrB0/GDtYTzlCZgxVRIrA21VnQ1BpwVhbSsjr2pc
	SDrlj2bW4o3ZATbagaHl7T3mUoKHmoUxwUkf4dAdzUMAIH2lSX8jaH6LCeDZpqSZsAvv
	LgB3xvg11R9hoIUXO7eGKNl3eti5bJF6pchvibmEokssmK14pLRcylELLMBHZKJoq0+I
	zMnwxLPTVp0yF/4LOtPasFDp80dChCv0eMy6cN7ZfrPr/+CLENU0dP19HAXTf6nhqV9o
	4+Sg==
Received: by 10.68.223.37 with SMTP id qr5mr16914662pbc.101.1348803789619;
	Thu, 27 Sep 2012 20:43:09 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id
	gv1sm4874098pbc.38.2012.09.27.20.43.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Sep 2012 20:43:08 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A6B4252@039-SN1MPN1-001.039d.mgd.msft.net>
Date: Thu, 27 Sep 2012 20:43:06 -0700
Message-Id: <C4E52DF7-ECBD-4411-9DA6-5E7F920FE747@gmail.com>
References: <9CAE2E57-84BE-44B7-A7BE-BCE8F728EFE8@gmail.com>
	<E416A48D-4E21-4353-BDDC-B3B15AA810C9@gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A6B4252@039-SN1MPN1-001.039d.mgd.msft.net>
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
X-List-Received-Date: Fri, 28 Sep 2012 03:56:06 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


On Sep 27, 2012, at 8:40 PM, McClintock Matthew-B29882 =
<B29882@freescale.com> wrote:

> Khem,
>=20
> I'm just not looking at a similiar issue. Do this:
>=20


just 'not' or just 'now' ?

> cat tmp/sstate-control/manifest-* | grep usr/lib/perl5
>=20
> And see which recipe is making this folder. It should be the perl
> recipe, first not some other recipe=85


cat sstate-control/manifest-* | grep usr/lib/perl5

return nothing

>=20
> Side question are you using FSL layers?

yes

>=20
> -M
>=20
> On Thu, Sep 27, 2012 at 10:28 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>> On Sep 27, 2012, at 8:22 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>>> Hi
>>>=20
>>> On ppc64 I am getting
>>>=20
>>> | Warning: perl appears in your path in the following locations =
beyond where
>>> | we just installed it:
>>> |     =
/work/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/perl-native/perl
>>> |
>>> | make[1]: Nothing to be done for `install.man'.
>>> | make[1]: Leaving directory =
`/work/yocto/poky/build/tmp/work/ppc64e5500-poky-linux/perl-5.14.2-r10/per=
l-5.14.2'
>>> | ln: failed to create symbolic link =
`/work/yocto/poky/build/tmp/work/ppc64e5500-poky-linux/perl-5.14.2-r10/ima=
ge//usr/lib64/perl5': No such file or directory
>>> | ERROR: Function failed: do_install (see =
/work/yocto/poky/build/tmp/work/ppc64e5500-poky-linux/perl-5.14.2-r10/temp=
/log.do_install.6656 for further information)
>>> ERROR: Task 1679 =
(/work/yocto/poky/meta/recipes-devtools/perl/perl_5.14.2.bb, do_install) =
failed with exit code '1'
>>> NOTE: Tasks Summary: Attempted 4082 tasks of which 4057 didn't need =
to be rerun and 1 failed.
>>>=20
>>>=20
>>> It was working fine yesterday
>>> anyone else seeing it ?
>>=20
>>=20
>> If I revert
>>=20
>> perl: Fix nativesdk install path
>> Commit 38234f2e276356b1d77a87ceabc486107e336d19 tried to fix the sed
>> expressions by anchoring the left side of the search regexp to =
prevent
>> $prefix$prefix type expression in the perl config. For nativesdk this =
is
>> not enough. Adding anchors on both side fixes this.
>>=20
>> Signed-off-by: Christian Glindkamp <christian.glindkamp@taskit.de>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>=20
>>=20
>>=20
>> It works again
>>=20
>> Thanks
>> -Khem
>>=20
>>=20
>>=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



