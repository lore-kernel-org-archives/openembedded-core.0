Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 86666731E5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 05:00:53 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id g73so211858160ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 21:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=YnLAXpHqrdsrb2bJPiWT8HTpU3IcKkfv0y50bkNxB1o=;
	b=XXyp0ih88x8eMvPX/WUE2Yj4LHjMDN+r5yHYjejJDrLBc7UFz3nV5I3TLhyo6bIWzf
	fzLIIOT76NYJ1rUe2H02LqnYwtVpgsvUp2YS9M4o0xDZVAveDL05xzvbnJumGngtKvyK
	HPGKQ7teSRvmG9lbbGdr5a6iSotS6Kv01C9K04LUMJ8NQpjqeB+6JiJgj69+oVw0jCso
	s+SC5T7IpjneenIDsYiffDwWtbDb5vVkoKdcSGTCGiSFswdj/W2XjXLhjY3FiYMQIgHP
	djmiGrGuQf3yB8RmE3/i6KJyHnxNDKtDAhkY8WEg+art29S8gjxRACC8i989aEgKzVbA
	MQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=YnLAXpHqrdsrb2bJPiWT8HTpU3IcKkfv0y50bkNxB1o=;
	b=Rt70enp3GMZ2lVdP+zSkouwC7bEvvg7HDHMa8dA+eDkSVcJk5vJptn3EhXu41VocwU
	BaAfNB2tQvcA8gwS5dt6kE20To0SJ4z4Kcz1cBgODb+SkXUxBahNjppBGLAcfx/wZQj/
	R3yTIVJAmEBAbSmfAYv6ovGYDhxIg3E7ZUeCdwU/7ao5mEKZeHzgbJNfT+dZOput7xCb
	JQmnPlXwMsGQOXJjih0KKshwW6frgrFV1Mv8lzRIkpNcL0CiZBhc+Lrcws1EeL/pAZGT
	uUa3oiiPyMIH2EkaIGXJPaERpNTPNFLW/m6bxHiuGEJio2viKVOtF505HOmWcS3c9FUG
	gZYQ==
X-Gm-Message-State: ALoCoQlOzLICNFeWr+y6MkeHGHDnPtUqFiOEiv4AKIFnva8v7TnyrlN2COIPKnXZ2CDOcsFTWVPPCSDDTA5T8NPfyqlbvrXwfw==
X-Received: by 10.107.165.14 with SMTP id o14mr33440133ioe.49.1452661254509;
	Tue, 12 Jan 2016 21:00:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Tue, 12 Jan 2016 21:00:25 -0800 (PST)
In-Reply-To: <CAJ86T=UJ5veG78VpmofhDndLq0kB78TaAggmh5_sj2EDjGqYEA@mail.gmail.com>
References: <cover.1452264916.git.alexander.kanavin@linux.intel.com>
	<548fe6538063b3021c1dc46b1d710c495f5d67d8.1452264916.git.alexander.kanavin@linux.intel.com>
	<5695B3EB.8040504@windriver.com>
	<CAJ86T=UJ5veG78VpmofhDndLq0kB78TaAggmh5_sj2EDjGqYEA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Jan 2016 21:00:25 -0800
Message-ID: <CAMKF1soWWGnhAo+vC3YyUck95LkGWYkqUb_ZKhP2rtrBnEvMXA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] valgrind: don't restrict to armv7a
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
X-List-Received-Date: Wed, 13 Jan 2016 05:00:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2016 at 7:23 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Tue, Jan 12, 2016 at 6:18 PM, dengke.du@windriver.com
> <dengke.du@windriver.com> wrote:
>> Hi Alexander
>>
>> I got valgrind do_compile error:
>>
>> MACHINE =3D "qemuarm"
>> $ bitbake valgrind
>>
>> warning: switch -mcpu=3Dcortex-a8 conflicts with -march=3Darmv5e switch

-mcpu=3Dcortex-a8 used for armv5 may not be right but patches from

https://bugs.kde.org/show_bug.cgi?id=3D248998

are helpful.


>> | {standard input}:25: Error: selected processor does not support ARM mo=
de
>> `movw r3,#:lower16:primary_map'
>> | {standard input}:28: Error: selected processor does not support ARM mo=
de
>> `movt r3,#:upper16:primary_map'
>> | {standard input}:30: Error: selected processor does not support ARM mo=
de
>> `uxth r1,r0'
>> | {standard input}:31: Error: selected processor does not support ARM mo=
de
>> `movw r3,#0xAAAA'
>> | {standard input}:40: Error: selected processor does not support ARM mo=
de
>> `movw r3,#0x5555'
>> | {standard input}:61: Error: selected processor does not support ARM mo=
de
>> `movw r3,#:lower16:primary_map'
>> | {standard input}:64: Error: selected processor does not support ARM mo=
de
>> `movt r3,#:upper16:primary_map'
>> | {standard input}:66: Error: selected processor does not support ARM mo=
de
>> `uxth r1,r0'
>> | {standard input}:94: Error: selected processor does not support ARM mo=
de
>> `movw r3,#:lower16:primary_map'
>> | {standard input}:95: Error: selected processor does not support ARM mo=
de
>> `uxth r1,r0'
>> | {standard input}:96: Error: selected processor does not support ARM mo=
de
>> `movt r3,#:upper16:primary_map'
>> | {standard input}:135: Error: selected processor does not support ARM m=
ode
>> `movw r3,#:lower16:primary_map'
>> | {standard input}:136: Error: selected processor does not support ARM m=
ode
>> `uxth r1,r0'
>> | {standard input}:137: Error: selected processor does not support ARM m=
ode
>> `movt r3,#:upper16:primary_map'
>
> Apparently Khem had this working prior to the update to valgrind v3.11
>
>   http://lists.openembedded.org/pipermail/openembedded-core/2015-December=
/114340.html
>
> Looking at the code I don't see any easy way to build for armv5
> though. Maybe it's hackable, but the result probably wouldn't be
> suitable for oe-core.
>
> Probably the best solution is to restore the blacklisting of armv6 and
> below. I'll send a patch.
>
>> Thanks!
>>
>> //dengke
>>
>> On 2016=E5=B9=B401=E6=9C=8808=E6=97=A5 22:57, Alexander Kanavin wrote:
>>
>> From: Andre McCurdy <armccurdy@gmail.com>
>>
>> Valgrind has been tested on armv5te/qemuarm, so it seems
>> that valgrind's configure check for armv7 is over cautious.
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>> ---
>>  meta/recipes-devtools/valgrind/valgrind_3.11.0.bb | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
>> b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
>> index 0823144..575db35 100644
>> --- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
>> +++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
>> @@ -27,14 +27,16 @@ SRC_URI =3D
>> "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
>>  SRC_URI[md5sum] =3D "4ea62074da73ae82e0162d6550d3f129"
>>  SRC_URI[sha256sum] =3D
>> "6c396271a8c1ddd5a6fb9abe714ea1e8a86fce85b30ab26b4266aeb4c2413b42"
>>
>> -COMPATIBLE_HOST =3D '(i.86|x86_64|mips|powerpc|powerpc64).*-linux'
>> -COMPATIBLE_HOST_armv7a =3D 'arm.*-linux'
>> +COMPATIBLE_HOST =3D '(i.86|x86_64|arm|mips|powerpc|powerpc64).*-linux'
>>
>>  inherit autotools ptest
>>
>>  EXTRA_OECONF =3D "--enable-tls --without-mpicc"
>> -EXTRA_OECONF_armv7a =3D "--enable-tls -host=3Darmv7-none-linux-gnueabi
>> --without-mpicc"
>>  EXTRA_OECONF +=3D
>> "${@['--enable-only32bit','--enable-only64bit'][d.getVar('SITEINFO_BITS'=
,
>> True) !=3D '32']}"
>> +
>> +# valgrind checks host_cpu "armv7*)", so we need to over-ride the
>> autotools.bbclass default --host option
>> +EXTRA_OECONF_append_arm =3D " --host=3Darmv7${HOST_VENDOR}-${HOST_OS}"
>> +
>>  EXTRA_OEMAKE =3D "-w"
>>
>>  CFLAGS_append_libc-uclibc =3D " -D__UCLIBC__ "
>>
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

