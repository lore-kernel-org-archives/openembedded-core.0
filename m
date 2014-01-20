Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 968E36B678
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 16:08:02 +0000 (UTC)
Received: by mail-wg0-f54.google.com with SMTP id x13so6926640wgg.33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 08:08:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=/Xbu92JopEFvHc12p9xz10eYTZWEaO3mgo7ZFoh9ndg=;
	b=DoJ5EKh3Af77dEehsKsFg8IsD92Eg6QmmkdV51JxWCgnkmFamBgQ3oe61KOfRlSBh3
	xDPDhEdWp1oWE2pInbPqfig9W0EgdIn3Wc4ZzOwnzavcLRS3LQ+yueY1KueffLCrhw2o
	bKRMV0X2GF2U1wEgaWDmO4ZSh8/RUubaVTSUDZ8/6EtiV2LhFG7XzP9T7+a9bdvupWdK
	LPsNKhsMOe1h84UfN3sttPbu/GdFGNPQPipk6YTVcpyMxSk9lHbuyzAPFQowbNEZU1ta
	qBd4lzzLlPh31lv0fLF44IqDp7JSbq0yrpWdtKMgvAqF13ir3yv1x4JqbR5R3mjujsFr
	UvmQ==
X-Gm-Message-State: ALoCoQk3MsCo0JcCROP6PicjcrgXTmvUHXOst0uSCdA7L+k/lt9t6g8emXV6TeAh03wS0vvQ+bQr
X-Received: by 10.180.86.198 with SMTP id r6mr10407364wiz.27.1390234083156;
	Mon, 20 Jan 2014 08:08:03 -0800 (PST)
Received: from ?IPv6:2001:610:612::11f9:9674:3238:1702?
	([2001:610:612:0:11f9:9674:3238:1702])
	by mx.google.com with ESMTPSA id w1sm3332769wib.6.2014.01.20.08.08.01
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 20 Jan 2014 08:08:02 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <52D3493D.70501@windriver.com>
Date: Mon, 20 Jan 2014 17:08:04 +0100
Message-Id: <C78732B4-A012-46A8-A69E-84187182C284@dominion.thruhere.net>
References: <cover.1389206129.git.Martin.Jansa@gmail.com>
	<52D3493D.70501@windriver.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Mailer: Apple Mail (2.1827)
Cc: "OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dora][PATCH 0/4] Dora backports
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
X-List-Received-Date: Mon, 20 Jan 2014 16:08:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable



Op 13 jan. 2014, om 03:02 heeft Robert Yang <liezhi.yang@windriver.com> =
het volgende geschreven:

>=20
> Hi Martin,
>=20
> Thank you ver much, I will merge them to dora-next.


What's the status on these?

regards,

Koen

>=20
> // Robert
>=20
> On 01/09/2014 02:36 AM, Martin Jansa wrote:
>> The following changes since commit =
e86622a932bbd0acdea67ecfb15c8b06c27353d8:
>>=20
>>   libsoup-2.4: add intltool-native to DEPENDS (2013-12-19 14:59:47 =
+0000)
>>=20
>> are available in the git repository at:
>>=20
>>   git://git.openembedded.org/openembedded-core-contrib =
jansa/dora-backports2
>>   =
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3Dj=
ansa/dora-backports2
>>=20
>> Martin Jansa (1):
>>   ltp: set PREFERRED_PROVIDER and rename runtests_noltp.sh script
>>=20
>> Mike Crowe (2):
>>   Revert "kernel.bbclass: move bundle_initramfs after
>>     kernel_link_vmlinux"
>>   kernel.bbclass: Stop bundle_initramfs thwarting sstate cache and =
fix
>>     race
>>=20
>> Richard Purdie (1):
>>   eglibc-initial.inc: Drop duplicate include
>>=20
>>  meta/classes/kernel.bbclass                        |  24 +--
>>  meta/conf/distro/include/default-providers.inc     |   2 +
>>  meta/recipes-core/eglibc/eglibc-initial.inc        |   2 -
>>  ...tests_noltp.sh-script-so-have-unique-name.patch | 202 =
+++++++++++++++++++++
>>  meta/recipes-extended/ltp/ltp_20130503.bb          |   4 +-
>>  5 files changed, 219 insertions(+), 15 deletions(-)
>>  create mode 100644 =
meta/recipes-extended/ltp/ltp/0001-Rename-runtests_noltp.sh-script-so-have=
-unique-name.patch
>>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


