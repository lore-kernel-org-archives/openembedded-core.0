Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 372286FFEC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 12:25:41 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id u188so101887170wmu.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 04:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=D0hAlubJAQnCxanAMITgDj+s8o5PIelInnZs+SGh/js=;
	b=uFbCFsMmzrz3ByLbLRch9PiMv6gFyeh/rcGggJ98PzUvcsUmDEdtDNFxt53eA1Hinw
	y1g4YcdjYkNORuWVxuNDsjmxhNHJUEZZQSxPKqfitBe1MNcTzjVu3zptny6tYsHA5sJC
	VBi8qluyO7YK3cDWR88jk+8Ry5Dg/kgNdfvTOPBN0lyLl/2ZH1PscbfHXzbSimTkMzRt
	CipXDc2gFZnu0qfrsboxKaDv6vwxGBbzvGAcCst0294LWNCZ++IF1oS7vQOnPbEoIc4P
	93RSCexcU9ENNuwo/qhcmhDjcmlbDB4IvaTcSq9qul8YDnsejcr91iKyVW3crnat88Wr
	xQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=D0hAlubJAQnCxanAMITgDj+s8o5PIelInnZs+SGh/js=;
	b=VZQMYQnjlTMOKJlss78qYSzfg2hnDDdl37qDQ+HWLtNMmzW4prKs5iuc0WLHVlJKe1
	S/wTd25KaA5jxVzJAkyw5cWcrtAKHZIuYIp8cmvkb966cTesa2fVa4mVuevAudk6AP4i
	1poIYYIGtCIKdmdQ/F9QHAbK5JVtgDzZx2lYxXCOE33W7FxwCJjImJR9xSR5QMcluNIk
	2ALd36pFatFyEhUjPMilpYP7R6LD9CO6Vfx2VUjkY0HBlqe71xMC9nUVqxPBdgRpivxS
	M2z4WKfgm4oNxZXiSRztkC7SNRRLT8ySf4lL2/KJBR3Pbi1OHHZa9Ccg3iGdsWo+QkCc
	1GRg==
X-Gm-Message-State: AG10YORIbRASRdpBBnhJUBgk+yerlwk8A6xXy+BUO7IWvKkoPIzH7ErszO/KOzvdQMfbUQ==
X-Received: by 10.28.146.145 with SMTP id u139mr12454589wmd.81.1453119942054; 
	Mon, 18 Jan 2016 04:25:42 -0800 (PST)
Received: from ?IPv6:2001:610:612::15b1:72cd:f502:7863?
	([2001:610:612:0:15b1:72cd:f502:7863])
	by smtp.gmail.com with ESMTPSA id
	ei9sm23678093wjd.40.2016.01.18.04.25.40
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Jan 2016 04:25:40 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3117\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <569CD2A2.8040006@dresearch-fe.de>
Date: Mon, 18 Jan 2016 13:25:39 +0100
Message-Id: <A4980CBC-821A-4487-BC72-0AC8F60771E4@dominion.thruhere.net>
References: <5698E002.5090800@dresearch-fe.de>
	<1452863169.28375.161.camel@linuxfoundation.org>
	<5698F31E.1020905@dresearch-fe.de>
	<56990180.9080407@dresearch-fe.de>
	<6AFD6AF0-3B94-44BB-BAA0-30EBB9747193@dominion.thruhere.net>
	<569CD2A2.8040006@dresearch-fe.de>
To: Steffen Sledz <sledz@dresearch-fe.de>
X-Mailer: Apple Mail (2.3117)
Cc: Christopher Larson <clarson@kergoth.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: fido -> jethro switching problem
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
X-List-Received-Date: Mon, 18 Jan 2016 12:25:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> Op 18 jan. 2016, om 12:55 heeft Steffen Sledz <sledz@dresearch-fe.de> =
het volgende geschreven:
>=20
> On 15.01.2016 15:29, Koen Kooi wrote:
>>> Op 15 jan. 2016 om 15:26 heeft Steffen Sledz <sledz@dresearch-fe.de> =
het volgende geschreven:
>>>> On 15.01.2016 14:24, Steffen Sledz wrote:
>>>> And I made another interesting discovery: The exception appears on =
certain machine types only, e.g with qemuarm it appears, with qemuarm64 =
or qemux86 not.
>>>=20
>>> It seems that all machines based on armv5e are affected.
>>=20
>> FWIW, I'm seeing the same problem. The last time it happened it was =
due to the fixup angstrom does for broken arm BSPs
>=20
> I've identified this line from =
meta-angstrom/conf/distro/include/angstrom.inc[1] as "trigger" for the =
exception in the way, that commenting out this line avoids the =
exception.
>=20
> --------------> snip <----------------
> # Add FEED_ARCH to machine overrides so we get access to e.g. 'armv7a' =
and 'sh4'
> # Hopefully we'll never see a machine or arch with 'all' as substring
> MACHINEOVERRIDES .=3D ":${@bb.data.getVar('FEED_ARCH', =
d,1).replace('all','noarch')}"
> --------------> snip <=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=
=94=E2=80=94=E2=80=94

So that bit doesn=E2=80=99t do what it says it does anymore, this diff =
after removing it:

-# $MACHINEOVERRIDES [10 operations]
+# $MACHINEOVERRIDES [9 operations]
 #   set? =
/build/v2015.12/sources/openembedded-core/meta/conf/bitbake.conf:688
 #     "${MACHINE}"
 #   set =
/build/v2015.12/sources/openembedded-core/meta/conf/bitbake.conf:689
@@ -9106,15 +9106,13 @@
 #     "${@bb.utils.contains("TUNE_FEATURES", "armv5", "armv5:", "" =
,d)}"
 #   predot =
/build/v2015.12/sources/openembedded-core/meta/conf/machine/include/arm/ar=
ch-armv4.inc:13
 #     "${@bb.utils.contains("TUNE_FEATURES", "armv4", "armv4:", "" =
,d)}"
-#   postdot =
/build/v2015.12/sources/meta-angstrom/conf/distro/include/angstrom.inc:30
-#     ":${@bb.data.getVar('FEED_ARCH', d,1).replace('all','noarch')}"
 #   append =
/build/v2015.12/sources/meta-angstrom/conf/distro/include/angstrom-core-tw=
eaks.inc:27
 #     [vardepsexclude] "SOC_FAMILY"
 #   set =
/build/v2015.12/sources/openembedded-core/meta/conf/documentation.conf:282=

 #     [doc] "Lists overrides specific to the current machine. By =
default, this list includes the value of MACHINE."
 # pre-expansion value:
-#   "${@bb.utils.contains("TUNE_FEATURES", "armv4", "armv4:", "" =
,d)}${@bb.utils.contains("TUNE_FEATURES", "armv5", "armv5:", "" =
,d)}${@bb.utils.contains("TUNE_FEATURES", "armv6", "armv6:", "" =
,d)}${@bb.utils.contains("TUNE_FEATURES", "armv7a", "armv7a:", "" =
,d)}${@['', '${SOC_FAMILY}:']['${SOC_FAMILY}' !=3D =
'']}${MACHINE}:${@bb.data.getVar('FEED_ARCH', =
d,1).replace('all','noarch')}"
-MACHINEOVERRIDES=3D"armv7a:ti33x:beaglebone:armv7at2hf-vfp-neon"
+#   "${@bb.utils.contains("TUNE_FEATURES", "armv4", "armv4:", "" =
,d)}${@bb.utils.contains("TUNE_FEATURES", "armv5", "armv5:", "" =
,d)}${@bb.utils.contains("TUNE_FEATURES", "armv6", "armv6:", "" =
,d)}${@bb.utils.contains("TUNE_FEATURES", "armv7a", "armv7a:", "" =
,d)}${@['', '${SOC_FAMILY}:']['${SOC_FAMILY}' !=3D '']}${MACHINE}"
+MACHINEOVERRIDES=3D=E2=80=9Carmv7a:ti33x:beaglebone"

So =E2=80=98armv7a=E2=80=99 is already there, 'armv7at2hf-vfp-neon=E2=80=99=
 isn=E2=80=99t needed since that information is availble from =
MACHINE_FEATURES already. I=E2=80=99ll drop the bit in jethro and =
master.

Thanks for tracking this down!

regards,

Koen=

