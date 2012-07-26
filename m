Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SuMMc-0006BG-8N
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 13:36:18 +0200
Received: by yhjj56 with SMTP id j56so1674872yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 04:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=X9bMk98TsUa2IBZHBkjRHM0V9rWORNCyeGpAtSSkL6I=;
	b=kcgcn2CcbIa8kcx56codKR/mK1CQLglSvRROdSGLtHfdb1wN6okWNAXty1XGeCZRZq
	rqUxIQ8PmJUa32BNT6GSCuc2FOaMrnPcfwKp7pL8QoBkZs8zrRrc8vwkcFka5lGtovYE
	Z7BW2dh7xAHMod3m6rUDOosEyBg95iD8kMWLl6cCB5YZ0o2nLWVctXlv5xOlYfNeXasX
	WySIMX3PYozgXItYEWZGsiqquyMsNdQGqalZFlCG6smc8pmv5j8MOnqPx4J/oAshenab
	TKMgha06xeGYINEoE5LSCBqI8hMU6IAVXrKH36U9tTanH0wYgHKaLPTZQcTAMUYja7Mc
	25TQ==
MIME-Version: 1.0
Received: by 10.50.181.232 with SMTP id dz8mr1293275igc.36.1343301886878; Thu,
	26 Jul 2012 04:24:46 -0700 (PDT)
Received: by 10.64.9.165 with HTTP; Thu, 26 Jul 2012 04:24:46 -0700 (PDT)
Date: Thu, 26 Jul 2012 13:24:46 +0200
Message-ID: <CALbNGRS3ZaawmC1+pt_ja2+90qyan1XC3V-9s8gsKyr-PsHWwQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: autoconf broken? (was [oe] gtk+-native configure fails)
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
X-List-Received-Date: Thu, 26 Jul 2012 11:36:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 25, 2012 at 5:43 PM, Henning Heinold
<heinold@inf.fu-berlin.de> wrote:
> On Wed, Jul 25, 2012 at 01:47:03PM +0200, Andreas M=FCller wrote:
>> Ciao,
>>
>> with the latest sources gtk+-nataive (and maybe also gtk+ - but I
>> don't get that far) configure fails with
>>
>> | configure.in:1587: warning: PKG_PROG_PKG_CONFIG is m4_require'd but
>> not m4_defun'd
>> | aclocal.m4:1818: GTK_DOC_CHECK is expanded from...
>> | configure.in:1587: the top level
>> | configure.in:151: error: possibly undefined macro: dnl
>
> uhm,
>
> 'dnl' besides ';' was the comment sqeuenz. So this is odd and maybee chan=
ged in newer
> autotools versions.
>
>> |       If this token and others are legitimate, please use m4_pattern_a=
llow.
>> |       See the Autoconf documentation.
>> | autoreconf: /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr=
/bin/autoconf
>> failed with exit status: 1
>> | ERROR: autoreconf execution failed.
>> | ERROR: Function failed: do_configure (see
>> /home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/gtk+-native-2.24.8-r5=
/temp/log.do_configure.22156
>> for further information)
>>
>> Supporting hints welcome :-)
>>
>> Andreas
>
> Bye Henning
>

I think it is not gtk+-native specific but some autoconf trouble. I
tried a build from scratch and get:

| configure.ac:171: warning: macro 'AM_PATH_GLIB_2_0' not found in library
| configure.ac:195: warning: macro 'AM_GLIB_GNU_GETTEXT' not found in libra=
ry
| autoreconf: running:
/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/autoconf
--include=3D/home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-native-2=
.2.0-r3/atk-2.2.0/m4/
--include=3D/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/shar=
e/aclocal-1.12
--include=3D/home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-native-2=
.2.0-r3/atk-2.2.0/aclocal-copy/
--force --warnings=3Dcross
| configure.ac:171: error: possibly undefined macro: AM_PATH_GLIB_2_0
|       If this token and others are legitimate, please use m4_pattern_allo=
w.
|       See the Autoconf documentation.
| configure.ac:195: error: possibly undefined macro: AM_GLIB_GNU_GETTEXT
| autoreconf: /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bi=
n/autoconf
failed with exit status: 1
| ERROR: autoreconf execution failed.
| ERROR: Function failed: do_configure (see
/home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-native-2.2.0-r3/temp=
/log.do_configure.24422
for further information)
NOTE: package atk-native-2.2.0-r3: task do_configure: Failed

| configure.ac:171: warning: macro 'AM_PATH_GLIB_2_0' not found in library
| configure.ac:195: warning: macro 'AM_GLIB_GNU_GETTEXT' not found in libra=
ry
| autoreconf: running:
/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/autoconf
--include=3D/home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-native-2=
.2.0-r3/atk-2.2.0/m4/
--include=3D/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/shar=
e/aclocal-1.12
--include=3D/home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-native-2=
.2.0-r3/atk-2.2.0/aclocal-copy/
--force --warnings=3Dcross
| configure.ac:171: error: possibly undefined macro: AM_PATH_GLIB_2_0
|       If this token and others are legitimate, please use m4_pattern_allo=
w.
|       See the Autoconf documentation.
| configure.ac:195: error: possibly undefined macro: AM_GLIB_GNU_GETTEXT
| autoreconf: /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bi=
n/autoconf
failed with exit status: 1
| ERROR: autoreconf execution failed.
| ERROR: Function failed: do_configure (see
/home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-native-2.2.0-r3/temp=
/log.do_configure.24422
for further information)
NOTE: package atk-native-2.2.0-r3: task do_configure: Failed

Suggestions?

Andreas


