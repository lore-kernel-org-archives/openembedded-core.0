Received: from mail-ea0-f169.google.com ([209.85.215.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UVg3E-0007RC-6y
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 12:38:48 +0200
Received: by mail-ea0-f169.google.com with SMTP id d10so1185784eaj.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2013 03:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=BnO+D6PRqii+T968lCfrmhUer+blyE1TwaLysoBEep0=;
	b=Wu+YuE4hhpPX0S8Ysi+FG0YBvckTnnZpvc5IcwkQp+1nt9NpUO8d9zXUFOSbV6sE/4
	Gxru3ZMta3bvzdEcan53QWjO+rDl9vlM3bLtJM+/WQv0qcFEFy54gmVr3JGG3hiD2lVI
	jt/t8MYrP+XEnhEU+MJO3msSMJzbVvfC2O5xykHK8Wi8GdE8Ukl8Rpff+WkSZxWpROrb
	m9b0jR8e40EQvdW0wUWXg5VVeTX6tXFZSjV96v0uBQgWIudHl9y/NmEZsiul1cSuoLIY
	Pb1FMxcqshdvCoMpeaDhPwK9iKCq5oTNFi9tygRdiypat+2ylFTWIb69PXlQMHjlyLGt
	N56w==
X-Received: by 10.14.5.72 with SMTP id 48mr85732155eek.19.1366971663550;
	Fri, 26 Apr 2013 03:21:03 -0700 (PDT)
Received: from ?IPv6:2001:610:612::28b6:bc4f:a329:c51d?
	([2001:610:612:0:28b6:bc4f:a329:c51d])
	by mx.google.com with ESMTPSA id
	ch6sm15125272eeb.17.2013.04.26.03.21.01 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 26 Apr 2013 03:21:02 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <517A49FE.5020702@communistcode.co.uk>
Date: Fri, 26 Apr 2013 12:21:03 +0200
Message-Id: <DF1B948E-98FE-41D8-9C5A-7F2AACD70B98@dominion.thruhere.net>
References: <1366963623-13626-1-git-send-email-B40290@freescale.com>
	<517A49FE.5020702@communistcode.co.uk>
To: ml@communistcode.co.uk
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQnwJx+uOSRrjez2ry+000gb9iTKGdXdYuR1U90/2A59ERSU2dBEDZ5Tt1DYsvlF6KbH+HnS
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: tist of connman do not support powerpc64
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
X-List-Received-Date: Fri, 26 Apr 2013 10:38:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 apr. 2013, om 11:33 heeft Jack Mitchell <ml@communistcode.co.uk> =
het volgende geschreven:

> On 26/04/13 09:07, Chunrong Guo wrote:
>>     connman build for powerpc 64bit boards were producing errors like =
this:
>>     | make[1]: *** [plugins/plugins_tist_la-tist.lo] Error 1
>>     | make[1]: *** Waiting for unfinished jobs....
>>     | make: *** [all] Error 2
>>     | ERROR: oe_runmake failed
>>=20
>> Signed-off-by: Chunrong Guo <B40290@freescale.com>
>> ---
>>  meta/recipes-connectivity/connman/connman.inc |    3 ++-
>>  1 files changed, 2 insertions(+), 1 deletions(-)
>>=20
>> diff --git a/meta/recipes-connectivity/connman/connman.inc =
b/meta/recipes-connectivity/connman/connman.inc
>> index 589ece8..5389f3a 100644
>> --- a/meta/recipes-connectivity/connman/connman.inc
>> +++ b/meta/recipes-connectivity/connman/connman.inc
>> @@ -20,10 +20,11 @@ DEPENDS  =3D "dbus glib-2.0 ppp iptables gnutls \
>>              ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', =
d)} \
>>              "
>>  -INC_PR =3D "r19"
>> +INC_PR =3D "r20"
>>    TIST =3D "--enable-tist"
>>  TIST_powerpc =3D ""
>> +TIST_powerpc64 =3D ""
>>    EXTRA_OECONF +=3D "\
>>      ac_cv_path_WPASUPPLICANT=3D${sbindir}/wpa_supplicant \
>=20
> Is there a reason that we need to specifically enable TIST at all? =
This is quoted from one of the developers on the ConnMan list:
>=20
>> it is special hardware where we need this plugin for. As I said, I =
was considering to remove the plugin actually. So it is safe to > =
disable this plugin.
>=20
>> By default this plugin is actually disabled. And we do not even build =
test it for the releases.
>=20
> I think if anyone needs it, shout up; otherwise we should go with the =
default and disable it.

What's it actually doing? Kernel loads wifi firmware, you can use =
hciattach manually or uim automatically to enable bluetooth on wl1xxx =
chips, which are the only users of the TI shared transmission stuff. As =
far as I'm concerned it can be globally disabled :)=


