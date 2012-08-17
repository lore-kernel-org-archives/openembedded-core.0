Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T2Qws-00054z-Kk
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 20:07:06 +0200
Received: from mail63-ch1-R.bigfish.com (10.43.68.238) by
	CH1EHSOBE008.bigfish.com (10.43.70.58) with Microsoft SMTP Server id
	14.1.225.23; Fri, 17 Aug 2012 17:55:07 +0000
Received: from mail63-ch1 (localhost [127.0.0.1])	by mail63-ch1-R.bigfish.com
	(Postfix) with ESMTP id 567D62E009D;
	Fri, 17 Aug 2012 17:55:07 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -3
X-BigFish: VS-3(zz98dI9371I936eI1432Izz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail63-ch1 (localhost.localdomain [127.0.0.1]) by mail63-ch1
	(MessageSwitch) id 1345226104929326_27660;
	Fri, 17 Aug 2012 17:55:04 +0000 (UTC)
Received: from CH1EHSMHS005.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.235])	by mail63-ch1.bigfish.com (Postfix) with ESMTP id
	E09B0300055;	Fri, 17 Aug 2012 17:55:04 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS005.bigfish.com
	(10.43.70.5) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 17 Aug 2012 17:55:04 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.41]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0298.005;
	Fri, 17 Aug 2012 12:55:00 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] cross-localedef-native_2.16.bb: fix for
	CentOS 5.X
Thread-Index: AQHNfASsshRJqAQgGEytjftF+twx9JdePnsAgABgCYA=
Date: Fri, 17 Aug 2012 17:54:59 +0000
Message-ID: <CAEsOVNfqeyJ-2oxaasS_sEbTbBkECLDGtqaRG++WYxmfaze1kQ@mail.gmail.com>
References: <1345158769-15782-1-git-send-email-msm@freescale.com>
	<1345205454.27428.3.camel@ted>
In-Reply-To: <1345205454.27428.3.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@openembedded.org" <openembedded-core@openembedded.org>
Subject: Re: [PATCH] cross-localedef-native_2.16.bb: fix for CentOS 5.X
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 17 Aug 2012 18:07:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <BA91A0A93381BA42A51D43093E081BB9@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 17, 2012 at 7:10 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2012-08-16 at 18:12 -0500, Matthew McClintock wrote:
>> | gcc -isystem/home/mattsm/git/poky/build-master/tmp/sysroots/x86_64-lin=
ux/usr/include -isystem/home/mattsm/git/poky/build-master/tmp/sysroots/x86_=
64-linux/usr/include -O2 -pipe -DNOT_IN_libc=3D1 -DNO_SYSCONF -DNO_UNCOMPRE=
SS -DLOCALE_PATH=3D'"/usr/local/lib/locale:/usr/local/share/i18n"' -DLOCALE=
DIR=3D'"/usr/local/lib/locale"' -DLOCALE_ALIAS_PATH=3D'"/usr/local/share/lo=
cale"' -DCHARMAP_PATH=3D'"/usr/local/share/i18n/charmaps"' -DREPERTOIREMAP_=
PATH=3D'"/usr/local/share/i18n/repertoiremaps"' -DLOCSRCDIR=3D'"/usr/local/=
share/i18n/locales"' -DNOT_IN_libc -DIN_GLIBC_LOCALEDEF -Iglibc/locale/prog=
rams -I./include -Iglibc/locale -I. -I. -include ./include/always.h -Wall -=
Wno-format -c -o ld-address.o glibc/locale/programs/ld-address.c
>> | In file included from glibc/locale/programs/localedef.h:24,
>> |                  from glibc/locale/programs/ld-address.c:30:
>> | ./include/locale.h:6: error: conflicting types for 'locale_t'
>> | glibc/locale/xlocale.h:42: error: previous declaration of 'locale_t' w=
as here
>> | make: *** [ld-address.o] Error 1
>> | ERROR: oe_runmake failed
>>
>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>> ---
>>  meta/recipes-core/eglibc/cross-localedef-native_2.16.bb     |  9 ++++++=
+--
>>  .../eglibc/eglibc-2.16/fix_for_centos_5.8.patch             | 13 ++++++=
+++++++
>>  2 files changed, 20 insertions(+), 2 deletions(-)
>>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/fix_for_centos_=
5.8.patch
>>
>> diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb b/m=
eta/recipes-core/eglibc/cross-localedef-native_2.16.bb
>> index 47f0834..a79a276 100644
>> --- a/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
>> +++ b/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
>> @@ -13,10 +13,15 @@ LIC_FILES_CHKSUM =3D "file://${LIC_DIR}/LICENSES;md5=
=3D98a1128c4b58120182cbea3b1752d
>>  inherit native
>>  inherit autotools
>>
>> -PR =3D "r0"
>> +# pick up an eglibc-2.16 patch
>> +FILESPATH =3D "${FILE_DIRNAME}/eglibc-${PV}"
>> +
>> +PR =3D "r1"
>>  SRCREV=3D"19383"
>>  EGLIBC_BRANCH=3D"eglibc-2_16"
>> -SRC_URI =3D "svn://www.eglibc.org/svn/branches/;module=3D${EGLIBC_BRANC=
H};protocol=3Dhttp "
>> +SRC_URI =3D "svn://www.eglibc.org/svn/branches/;module=3D${EGLIBC_BRANC=
H};protocol=3Dhttp \
>> +        file://fix_for_centos_5.8.patch;patchdir=3D.. \
>> +       "
>>  S =3D "${WORKDIR}/${EGLIBC_BRANCH}/localedef"
>>
>>  do_unpack_append() {
>> diff --git a/meta/recipes-core/eglibc/eglibc-2.16/fix_for_centos_5.8.pat=
ch b/meta/recipes-core/eglibc/eglibc-2.16/fix_for_centos_5.8.patch
>> new file mode 100644
>> index 0000000..32ee16d
>> --- /dev/null
>> +++ b/meta/recipes-core/eglibc/eglibc-2.16/fix_for_centos_5.8.patch
>> @@ -0,0 +1,13 @@
>> +Index: eglibc-2_16/libc/locale/programs/config.h
>
> No patch header here...

Overlooked late last night, v2 sent.

-M

>
> Cheers,
>
> Richard
>
>
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- eglibc-2_16.orig/libc/locale/programs/config.h
>> ++++ eglibc-2_16/libc/locale/programs/config.h
>> +@@ -19,6 +19,8 @@
>> + #ifndef _LD_CONFIG_H
>> + #define _LD_CONFIG_H        1
>> +
>> ++#define DUMMY_LOCALE_T
>> ++
>> + /* Use the internal textdomain used for libc messages.  */
>> + #define PACKAGE _libc_intl_domainname
>> + #ifndef VERSION
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core=



