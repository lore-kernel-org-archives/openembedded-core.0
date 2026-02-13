Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD87EDF175
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 15:34:04 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74433.1770996836124809751
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 07:33:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=k7PW4la8;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (unknown [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1018AC1EC8E;
	Fri, 13 Feb 2026 15:33:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4ECC5606BE;
	Fri, 13 Feb 2026 15:33:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A750510368E8E;
	Fri, 13 Feb 2026 16:33:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770996816; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=EMjRQalDR7EcK/ZM3E3FRGGfotYiEDkrHnDVRuDqlFY=;
	b=k7PW4la8huR5RXpBZhzFFfVM2UYctNjE+PlAxuMcA4317l498eR8QrfD6DjSy2XwNSN5Rp
	sa0vgtouTOcZ0NHbQNgr9SvTls8dMBGtxcF3gMiUEoncwoXhTl6hKDudn5DJ/i2UaLyNTf
	ZHN8SQGNrE8dVsMPAdmNfKQemPcVFsDSnyFbL6F8V7aPtIfU0Ku2+NZUycBc0stYkMYA22
	e+NFTP2QoHLvnEH54evL0xqRrkmGNtXuCrrdwZie9t1Ncj/cVyIHZnVRqWpA8HZX0XU2nW
	tBfk/jSMFXlKyNW0tX1XrAI8i0Ez2eMDDRlDb+AKZVMTM/ucKReNqyINKR0xnA==
Message-ID: <5cfda679-374f-4bc7-a33e-53f75833b090@bootlin.com>
Date: Fri, 13 Feb 2026 16:33:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] binutils: Upgrade to 2.46 release
To: mathieu.dubois-briand@bootlin.com, deepesh.varatharajan@windriver.com,
 openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20260212142933.3543788-1-Deepesh.Varatharajan@windriver.com>
 <DGDWTI56DB4D.1I1SUNULX6S5R@bootlin.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <DGDWTI56DB4D.1I1SUNULX6S5R@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 15:34:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231125

Hello,

On 2/13/26 15:39, Mathieu Dubois-Briand via lists.openembedded.org wrote:
> On Thu Feb 12, 2026 at 3:29 PM CET, Deepesh via lists.openembedded.org =
Varatharajan wrote:
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> New Features:
>> Support for new instructions added to AMD, ARM and RISC-V architecture=
s.
>> Support for version 3 of the SFrame standard.
>> The readelf program can now display the contents of Global Offset Tabl=
es.
>> Improved linker tagging support.
>>
>> Detailed release notes are here [1]
>>
>> [1] https://lists.gnu.org/archive/html/info-gnu/2026-02/msg00006.html
>>
>> Dropped patches:
>> 0001-aarch64-constify-BTI-and-GCS-report-functions.patch
>> Since the fix is already included in binutils 2.46.
>>
>> CVE patches: CVE-2025-11081,CVE-2025-11082,CVE-2025-11083,
>> CVE-2025-11839,CVE-2025-11840,CVE-2025-11412,CVE-2025-11413,
>> CVE-2025-11414,CVE-2025-11494,CVE-2025-11495.
>> These were dropped because they are already addressed in binutils 2.46=
.
>>
>> Drop CVE_STATUS:
>> binutils 2.46 has needed fixes for CVE-2025-7545 and CVE-2025-7546.
>>
>> Rebase existing patches with binutils 2.46.
>>
>> Testing Results:
>> +----------------------+--------+--------+------+
>> | Result               | 2.45.1 |  2.46  | Diff |
>> +----------------------+--------+--------+------+
>> | Expected Passes      | 318    |  331   | +13  |
>> | Untested Testcases   | 5      |  5     |  0   |
>> | Unsupported Tests    | 8      |  6     | -2   |
>> +----------------------+--------+--------+------+
>>
>> Testcases changes:
>> ----------------------------------------------------------------------=
---------
>> Testcase-name                                             2.45.1      =
  2.46
>> ----------------------------------------------------------------------=
---------
>> nm --ifunc-chars=3D-- (global ifunc)                          -       =
    PASS
>> nm --ifunc-chars=3D-- (local ifunc)                           -       =
    PASS
>> copy with unknown section flag                              -         =
  PASS
>> objcopy tek2bin                                             -         =
  PASS
>> binary symbol (implicit)                                    -         =
  PASS
>> binary symbol (explicit)                                    -         =
  PASS
>> readelf SFrame V2 (x86-64/test-v2-ET_EXEC.sframe)           -         =
  PASS
>> objdump SFrame V2 (x86-64/test-v2-ET_EXEC.sframe)           -         =
  PASS
>> readelf SFrame V2 (x86-64/test-v2-ET_REL.sframe)            -         =
  PASS
>> objdump SFrame V2 (x86-64/test-v2-ET_REL.sframe)            -         =
  PASS
>> run objcopy of executable                                UNSUPPORTED  =
  PASS
>> run stripped executable                                  UNSUPPORTED  =
  PASS
>> run stripped executable with saving a symbol             UNSUPPORTED  =
  PASS
>> Copy object attributes v2 data from an object to another    -        U=
NSUPPORTED
>>
>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.co=
m>
>> ---
>=20
> Hi Deepesh,
>=20
> Thanks for the upgrade.
>=20
> It looks like some patch needs to be refreshed or dropped. It's only
> applied for class-nativesdk, so that's probably why it does not show in
> most builds.
>=20
> ERROR: Task (virtual:nativesdk:/srv/pokybuild/yocto-worker/genericx86-6=
4/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_=
2.46.bb:do_patch) failed with exit code '1'
> ...
> ERROR: nativesdk-binutils-2.46-r0 do_patch: Applying patch '/srv/pokybu=
ild/yocto-worker/genericx86-64/build/layers/openembedded-core/meta/recipe=
s-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternati=
ve-ld.so.conf.patch' on target directory '/srv/pokybuild/yocto-worker/gen=
ericx86-64/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-=
binutils/2.46/sources/binutils-2.46'
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/3189
>=20
> Can you have a look at it?
>=20
> Thanks,
> Mathieu
>=20


Just in case, there's also a ptest failure that could be related to this=20
update:

Failed ptests:
{'elfutils':
['run-strip-strmerge.sh',
'run-elflint-self.sh',
'run-reverse-sections-self.sh']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3036/s=
teps/13/logs/stdio


--=20
Best regards,
Jo=C3=A3o Marcos Costa

