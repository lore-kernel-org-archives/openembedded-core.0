Return-Path: <rm.santos.caldas@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 081856FF4E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 20:39:28 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id a136so101523577wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 13:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-transfer-encoding;
	bh=+RkFWODKcojpgkvetgYqoXVEudKceDyPZocbixG098E=;
	b=1G68JcfG4jb6oloxS0KDsoBB13Ue1/dbAGJG2llhFqIbe34+qq7oMyK5PDk/SO4WXQ
	DaFQ4w2KVb+CLEJfPpCVI5uyryNHUzHFMUlOu2/WnL8yN+dy6DTPwZNWJh4X273XcgUt
	I9OZHwP/+X5PbgsPBNNUr5w1UZ2pjeW9oAQho7Jx2uJbGCgTSIRWhTEf80mzUYd2v1ac
	Nv6OMrbkFiOg6hDsDQlSSDNESvT06jzPJ92Y4o2h26oXNgxCLuW1HGwtVGnTQYixiaBb
	ikEMH2xIDqcPyRcXlBTHS5+v9AD6WR/5EiczqoXdVqZI+dWdqH/cDQsWKPFx237oozxj
	nzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=+RkFWODKcojpgkvetgYqoXVEudKceDyPZocbixG098E=;
	b=WmYf85o5GykGUQOcHg0AKAIpr0i3fxknILpUtaIpkN0ed9HktahaoqjK9aeddDdYFw
	rP0e0KCf5Nrq+lvgPiMOmLZ/4qxY1PYPMuGq+kWtOsqHu01UmJP7q7oOXk9sfyyxin2e
	gTrl0aNilZR17vpudsQcNABtwnLovJhN/jRuMPxXmkAVyUCUuwTLfM8Zts0n72WSZqC4
	iNTcuw4h5GgDj+UC3aiU1msgcnOQQ9L1X9boLxPD0ZehFGhcvknF4VWSNdnacnZajgci
	lVT6FsBzaNrEVd4O9/E2PBbfuideq+m7JPt11ShgSAQJ1Oa/x7Sf0P8c3tAFAyFyicsK
	0Gag==
X-Gm-Message-State: ALyK8tKL7tZnciqsWBKfDRISapBv934t7zYNgVY8vLxuR+u8pOFSrdcvn2P/pbYgdu0ry2yZb4mp3jI0ftMKzA==
MIME-Version: 1.0
X-Received: by 10.194.246.138 with SMTP id xw10mr26501907wjc.99.1464640768719; 
	Mon, 30 May 2016 13:39:28 -0700 (PDT)
Received: by 10.194.81.105 with HTTP; Mon, 30 May 2016 13:39:28 -0700 (PDT)
In-Reply-To: <574C9E8C.1070503@linux.intel.com>
References: <20160528115341.4965-1-rm.santos.caldas@gmail.com>
	<574C9E8C.1070503@linux.intel.com>
Date: Mon, 30 May 2016 21:39:28 +0100
Message-ID: <CA+21M5A1CeV6ojWjLsLNcf3XgC_nUgwJtjV5B5NCF-0_Aj_4Qw@mail.gmail.com>
From: Renato Caldas <rm.santos.caldas@gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] perl: reorder tar arguments in do_install_ptest()
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
X-List-Received-Date: Mon, 30 May 2016 20:39:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi An=C3=ADbal,

Sorry but I'm still a bit unfamiliar with the yocto workflow, should I
resubmit exact same patch with the [krogoth] prefix added, or should I
change the commit message in any way? It applies cleanly to both
master and krogoth.

Cheers,
  Renato

2016-05-30 21:11 GMT+01:00 An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel=
.com>:
> Hi Renato,
>
> I tested the patch and works very well.
> Could you sent another patch with [krogoth] prefix to be backported?
>
> Thanks a lot,
>         alimon
>
>
> On 05/28/2016 06:53 AM, Renato Caldas wrote:
>> On some distributions tar requires the FILE argument to be the last, and
>> the existing order was causing the subsequent --exclude options to be dr=
opped.
>>
>> Fixes [YOCTO #9673].
>>
>> Signed-off-by: Renato Caldas <rm.santos.caldas@gmail.com>
> Acked-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
>> ---
>>  meta/recipes-devtools/perl/perl-ptest.inc | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-de=
vtools/perl/perl-ptest.inc
>> index 948ea7c..66c5355 100644
>> --- a/meta/recipes-devtools/perl/perl-ptest.inc
>> +++ b/meta/recipes-devtools/perl/perl-ptest.inc
>> @@ -7,8 +7,8 @@ do_install_ptest () {
>>       mkdir -p ${D}${PTEST_PATH}
>>       sed -e "s:\/opt:\/usr:" -i Porting/add-package.pl
>>       sed -e "s:\/local\/gnu\/:\/:" -i hints/cxux.sh
>> -     tar -cf - * --exclude \*.o --exclude libperl.so --exclude Makefile=
 --exclude makefile --exclude hostperl \
>> -             --exclude miniperl --exclude generate_uudmap --exclude pat=
ches | ( cd ${D}${PTEST_PATH} && tar -xf - )
>> +     tar -cf - --exclude \*.o --exclude libperl.so --exclude Makefile -=
-exclude makefile --exclude hostperl \
>> +             --exclude miniperl --exclude generate_uudmap --exclude pat=
ches * | ( cd ${D}${PTEST_PATH} && tar -xf - )
>>
>>       sed -i -e "s,${D},,g" \
>>              -e "s,--sysroot=3D${STAGING_DIR_HOST},,g" \
>>
>

