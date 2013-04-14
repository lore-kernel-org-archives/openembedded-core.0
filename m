Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1URRoK-0005Zb-Jq
	for openembedded-core@lists.openembedded.org;
	Sun, 14 Apr 2013 20:37:56 +0200
Received: by mail-ea0-f175.google.com with SMTP id r16so1856808ead.20
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2013 11:20:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=5AuDytzozZJ1v9m+1LPLVOo0BquvsK35cGu/blB60ts=;
	b=bBki6JTPe2h25ETtJ1DQGUEuJkgh/COaR12hja53UIdLl5KiJr/q6B8B2mL5rjoNDD
	szkoFH1hx/UB7NhNJRfvbIcNnnptpa0Xe1g9MjQUFhsc/PpEoS+5MsDME1A7CNX2GfVx
	mooeDy2niFRHkZDhXcPUrBIyvV9UG2BI6ce/aOgj3nAZAKO8FR+ZJtta16qIQ61S/D6B
	8xVmZiIbSm4VWnGFgi+kDBK7SW1jcKINsvmOe6ef1xoBETlZ2+65AqfhRSwRNNVKpdOa
	O79z5JGqfjYL2OqzaJte1Ar1KCZh6jIOdJyaWXZ+yeC1PzgsXYqJJ3bQJczrTtFFiJ2E
	jgYw==
X-Received: by 10.15.101.200 with SMTP id bp48mr53284465eeb.38.1365963629034; 
	Sun, 14 Apr 2013 11:20:29 -0700 (PDT)
Received: from ?IPv6:2001:610:612::1cd5:7e72:317b:cd33?
	([2001:610:612:0:1cd5:7e72:317b:cd33])
	by mx.google.com with ESMTPS id a2sm21283105eem.11.2013.04.14.11.20.27
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 14 Apr 2013 11:20:28 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20130414175740.GI2475@jama>
Date: Sun, 14 Apr 2013 20:20:26 +0200
Message-Id: <DFB5BA7F-B813-4A97-9BCA-D191A23FD9DC@dominion.thruhere.net>
References: <20130318131702.8ADB35040D@opal> <20130414175740.GI2475@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQmG4V/DBc3fdmds7i8JqDkMKlWzSOQW6vfGqALVQy0l0PsjxnVg6d4wZjQg/v3SfxzsRPQg
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Marcin Juszkiewicz : nss-myhostname: add 0.3 version
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
X-List-Received-Date: Sun, 14 Apr 2013 18:37:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 apr. 2013, om 19:57 heeft Martin Jansa <martin.jansa@gmail.com> =
het volgende geschreven:

> On Mon, Mar 18, 2013 at 01:17:02PM +0000, git@git.openembedded.org =
wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: 9f46e4c195e4d8bc638191428492e09f1e57cc76
>> URL:    =
http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit;h=3D9f46=
e4c195e4d8bc638191428492e09f1e57cc76
>>=20
>> Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>> Date:   Thu Mar 14 22:16:34 2013 +0100
>>=20
>> nss-myhostname: add 0.3 version
>>=20
>> Meta-linaro layer had own netbase.bbappend which took care of adding
>> MACHINE name to /etc/hosts to get it resolvable.
>>=20
>> Koen Kooi pointed to nss-myhostname as better solution. Tested, works
>> fine so I add it for other users.
>>=20
>> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>=20
> Does this conflict with systemd?

Yes, systemd ships an internal copy of that to make localhost resolving =
work. We don't enable it yet in the postinst, though.

>=20
> WARNING: The recipe systemd is trying to install files into a shared
> area when those files already exist. Those files and their manifest
> location are:
>   =
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/us=
r/lib/libnss_myhostname.so.2
>   Matched in manifest-qemuarm-nss-myhostname
> Please verify which package should provide the above files.
>=20
>>=20
>> ---
>>=20
>> .../nss-myhostname/nss-myhostname_0.3.bb           |   25 =
++++++++++++++++++++
>> 1 files changed, 25 insertions(+), 0 deletions(-)
>>=20
>> diff --git =
a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb =
b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
>> new file mode 100644
>> index 0000000..d5ed084
>> --- /dev/null
>> +++ b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
>> @@ -0,0 +1,25 @@
>> +DESCRIPTION =3D "plugin for the GNU Name Service Switch (NSS) =
functionality of \
>> +the GNU C Library (glibc) providing host name resolution for the =
locally \
>> +configured system hostname as returned by gethostname(2)."
>> +HOMEPAGE =3D "http://0pointer.de/lennart/projects/nss-myhostname/"
>> +LICENSE =3D "LGPLv2.1"
>> +LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D2d5025d4aa3495befef8f17206a5b0a1"
>> +
>> +SRC_URI =3D =
"http://0pointer.de/lennart/projects/nss-myhostname/nss-myhostname-${PV}.t=
ar.gz"
>> +
>> +SRC_URI[md5sum] =3D "d4ab9ac36c053ab8fb836db1cbd4a48f"
>> +SRC_URI[sha256sum] =3D =
"2ba744ea8d578d1c57c85884e94a3042ee17843a5294434d3a7f6c4d67e7caf2"
>> +
>> +inherit autotools
>> +
>> +pkg_postinst_${PN} () {
>> +	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
>> +		-e =
's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 myhostname =
\3\4\5/' \
>> +		-i $D/etc/nsswitch.conf
>> +}
>> +
>> +pkg_prerm_${PN} () {
>> +	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
>> +		-e '/^hosts:/s/\s*myhostname//' \
>> +		-i $D/etc/nsswitch.conf
>> +}
>>=20
>>=20
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



