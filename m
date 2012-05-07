Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SRIK7-0001Kk-9G
	for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 09:25:35 +0200
Received: by werb13 with SMTP id b13so543957wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2012 00:15:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=QPeSESecrpsRTSJDLNMc6AiJI25M612s6ehutzhEULI=;
	b=Oj6pF5nYfLyc5GWn8ZU4u3Z78exWYfA8Pq893vKfMLPHB0SOiILyIsO7hSg5oVOA4U
	UgL5Ojm0K2j8Mm469ymNON/x/H4+xVKjT/aNJGAFF3aqG1ZVEawz+2hY7AGweMDNO886
	3NTGpexAmg+uWuY7WDeMM40Hl/8IXdiDA2a3k29jnASVEQDUylKvb5G4ZcES3DaHATY0
	yAySNSsJuB5SgrFj/4vFyzUBr4L1j8tqTWlHJQEU7vsRPp8m7gTbqxXHf9maOthkrx4A
	PFcqNX6N2thlLCjBLVVOFYbOvGHFnvNKsFrDMBw+7G5DLs6JwMIo4EwP83G9yN1SJsBC
	eZig==
Received: by 10.180.75.241 with SMTP id f17mr32365281wiw.11.1336374945383;
	Mon, 07 May 2012 00:15:45 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ca3sm19961681wib.6.2012.05.07.00.15.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 May 2012 00:15:44 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4FA772BF.5020406@linux.intel.com>
Date: Mon, 7 May 2012 09:15:43 +0200
Message-Id: <92E739C4-DF13-4933-92C0-A6F18CD81957@dominion.thruhere.net>
References: <1336176824-5954-1-git-send-email-sgw@linux.intel.com>
	<5B2F5D0A-BEEF-47BE-85DD-F9FCC7E290DC@dominion.thruhere.net>
	<4FA772BF.5020406@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmLKIheN5/i6ZpxlS0eSAilhJqGK9WGl/y8AZbcIF/oc2EwTSXBEkONfMyYetrU7gdHWOxv
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpcap: Move pcap-config to -dev package
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
X-List-Received-Date: Mon, 07 May 2012 07:25:36 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 7 mei 2012, om 08:59 heeft Saul Wold het volgende geschreven:

> On 05/04/2012 11:57 PM, Koen Kooi wrote:
>>=20
>> Op 5 mei 2012, om 02:13 heeft Saul Wold het volgende geschreven:
>>=20
>>> pcap-config is a tool used for getting the cflags and ln flags for =
development
>>>=20
>>> [YOCTO #2367]
>>>=20
>>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>>> ---
>>> meta/recipes-connectivity/libpcap/libpcap.inc |    7 ++++++-
>>> 1 files changed, 6 insertions(+), 1 deletions(-)
>>>=20
>>> diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc =
b/meta/recipes-connectivity/libpcap/libpcap.inc
>>> index 427078f..7950b2a 100644
>>> --- a/meta/recipes-connectivity/libpcap/libpcap.inc
>>> +++ b/meta/recipes-connectivity/libpcap/libpcap.inc
>>> @@ -13,7 +13,7 @@ DEPENDS =3D "flex-native bison-native"
>>> PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', =
'bluetooth', 'bluetooth', '', d)}"
>>> PACKAGECONFIG[bluetooth] =3D =
"--enable-bluetooth,--disable-bluetooth,bluez4"
>>>=20
>>> -INC_PR =3D "r1"
>>> +INC_PR =3D "r2"
>>>=20
>>> SRC_URI =3D "http://www.tcpdump.org/release/libpcap-${PV}.tar.gz"
>>>=20
>>> @@ -30,3 +30,8 @@ do_configure_prepend () {
>>>         cat aclocal.m4>  acinclude.m4
>>>     fi
>>> }
>>> +
>>> +# pcap-config is a dev tool and should not be packaged in the
>>> +# core package.
>>> +FILES_${PN} =3D "${libdir}/lib*${SOLIBS}"
>>> +FILES_${PN}-dev +=3D "${bindir}"
>>=20
>> Change that go ${bindir}/pcap-config to avoid being too greedy during =
upgrades. Or just inherit 'binconfig' :)
>=20
> It already inherits binconfig!
>=20
> That does not seem to address which package it gets installed in!

Ah right, the oe-core binconfig.bbclass lacks changes that the =
OE-classic one has:

koen@dominion:/OE/tentacle/sources/openembedded-core/meta$ diff -u =
classes/binconfig.bbclass =
/OE/org.openembedded.dev/classes/binconfig.bbclass=20
--- classes/binconfig.bbclass	2012-01-30 13:43:41.000000000 +0100
+++ /OE/org.openembedded.dev/classes/binconfig.bbclass	2011-04-28 =
13:29:17.000000000 +0200
@@ -1,3 +1,5 @@
+FILES_${PN}-dev +=3D "${bindir}/*-config"
+
 # The namespaces can clash here hence the two step replace
 def get_binconfig_mangle(d):
 	s =3D "-e ''"
@@ -17,6 +19,8 @@
 		s +=3D " -e =
's:OEEXECPREFIX:${STAGING_DIR_HOST}${exec_prefix}:'"
 		s +=3D " -e 's:-I${WORKDIR}:-I${STAGING_INCDIR}:'"
 		s +=3D " -e 's:-L${WORKDIR}:-L${STAGING_LIBDIR}:'"
+		if bb.data.getVar("OE_BINCONFIG_EXTRA_MANGLE", d):
+		    s +=3D bb.data.getVar("OE_BINCONFIG_EXTRA_MANGLE", =
d)
 	return s
=20
 BINCONFIG_GLOB ?=3D "*-config"
@@ -45,10 +49,10 @@
 SYSROOT_PREPROCESS_FUNCS +=3D "binconfig_sysroot_preprocess"
=20
 binconfig_sysroot_preprocess () {
-	for config in `find ${S} -name '${BINCONFIG_GLOB}'`; do
+	for config in `find ${D} -name '${BINCONFIG_GLOB}'`; do
 		configname=3D`basename $config`
-		install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
-		cat $config | sed ${@get_binconfig_mangle(d)} > =
${SYSROOT_DESTDIR}${bindir_crossscripts}/$configname
-		chmod u+x =
${SYSROOT_DESTDIR}${bindir_crossscripts}/$configname
+		install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}
+		cat $config | sed ${@get_binconfig_mangle(d)} > =
${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}/$configname
+		chmod u+x =
${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}/$configname
 	done
 }



