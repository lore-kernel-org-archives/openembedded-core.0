Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 18A8771081
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 06:18:11 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id a1so1671480wgh.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 23:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=JIbclRHIAV1M2BpJBiKLY5lO4LzSvOIcdePBWUtC88Q=;
	b=XWbIjYBdkH/RERNk24YUZmc6dhaGpMLgSDsUVCA+i5SfJKMHTvR5i1hKoNIBUNsE9K
	YyPBSqxmuWas6F01UJIq1ChV0gTtqJkcZ5hIEwXTdaVY7eecYrvgOamkE/pQrlP3K5uk
	yEfiJxtr6YuUbzCRTCR0Ev91KbJfFQccZCGziDbY8NDfYr8lrWmq0Tku6I4E5FDxuTc9
	SUn6isU+OqC1EDNoXAYV6bdkgZQpMM9uvqgNBFbCNYD11xlOa93W/Amd4GjoiB2BZcNG
	xcHRAssdT6GE3lHCnsG3npaVN/3sOFL3JCKMfP4ypVqiXg4FYE3ipljg8YQpp92J1JVa
	meFA==
X-Gm-Message-State: ALoCoQmRX1L5lS748dKBiItYOmXLgsmMwfKYEUToJe+rw78g3nYMHNZ8zjS+U27VwrYBQt5jsEc7
X-Received: by 10.194.78.243 with SMTP id e19mr59853wjx.119.1409293092100;
	Thu, 28 Aug 2014 23:18:12 -0700 (PDT)
Received: from ?IPv6:2001:610:612::d1ac:ee01:c702:e868?
	([2001:610:612:0:d1ac:ee01:c702:e868])
	by mx.google.com with ESMTPSA id
	mx19sm22871310wic.3.2014.08.28.23.18.10 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Aug 2014 23:18:11 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAMKF1sqxz2DCvH3G9SdvgNbPR6zqGL3tWb85vDSAacz+BOCN8w@mail.gmail.com>
Date: Fri, 29 Aug 2014 08:18:08 +0200
Message-Id: <59ACD9C3-1BD2-4EE3-93DD-DEA1D30E068B@dominion.thruhere.net>
References: <cover.1408326458.git.Qi.Chen@windriver.com>
	<1408814895.5457.36.camel@ted> <53FADCD1.2050807@windriver.com>
	<CAMKF1sqxz2DCvH3G9SdvgNbPR6zqGL3tWb85vDSAacz+BOCN8w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1878.6)
Cc: Richard Purdie <rpurdie@rpsys.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 00/10] upgrade systemd to 215 and other misc fixes
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
X-List-Received-Date: Fri, 29 Aug 2014 06:18:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 29 aug. 2014, om 04:58 heeft Khem Raj <raj.khem@gmail.com> het =
volgende geschreven:

> On Sun, Aug 24, 2014 at 11:50 PM, ChenQi <Qi.Chen@windriver.com> =
wrote:
>> On 08/24/2014 01:28 AM, Richard Purdie wrote:
>>>=20
>>> On Mon, 2014-08-18 at 09:51 +0800, Chen Qi wrote:
>>>>=20
>>>> The following changes since commit
>>>> 4321c553d5ae816e566234e981a0815bba046d39:
>>>>=20
>>>>   SIGGEN_EXCLUDERECIPES_ABISAFE: add initscripts (2014-08-11 =
17:44:09
>>>> +0100)
>>>>=20
>>>> are available in the git repository at:
>>>>=20
>>>>   git://git.openembedded.org/openembedded-core-contrib
>>>> ChenQi/systemd-misc-fixes
>>>>=20
>>>> =
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3DC=
henQi/systemd-misc-fixes
>>>>=20
>>>> Chen Qi (10):
>>>>   systemd: upgrade to 215
>>>>   systemd: add PACKAGECONFIG for 'elfutils'
>>>>   systemd: make runlevel work in non-runlevel targets
>>>>   update-rc.d: fix logic in populate_packages_updatercd
>>>>   alsa-state: fix pkg_postinst and set INHIBIT_UPDATERCD_BBCLASS
>>>>   keymaps: fix for systemd
>>>>   systemd: add kbd-keymaps to RRECOMMENDS of systemd-vconsole-setup
>>>>   v86d: set INHIBIT_UPDATERCD_BBCLASS if 'sysvinit' not in
>>>>     DISTRO_FEATURES
>>>>   systemd: add support for executing scripts under /etc/rcS.d
>>>>   dhcp: add dhcpd.service
>>>=20
>>> Testing with this patchset included resulted in:
>>>=20
>>>=20
>>> =
https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/buil=
ds/6/steps/Running%20Sanity%20Tests_2/logs/stdio
>>>=20
>>> Could you have a look into this and see if we can figure out why =
some of
>>> these start failing please?
>>>=20
>>> Cheers,
>>>=20
>>> Richard
>>>=20
>>>=20
>>>=20
>>>=20
>>>=20
>>=20
>> Got it.
>>=20
>> I'm looking into the problem.
>=20
> where are we with this ? we shud have systemd 216 in 1.7. can you =
rebase

Here's a recipe for 216 with the nss postinst fixed and proper =
CONFFILES: =
https://github.com/Angstrom-distribution/meta-angstrom/blob/master/recipes=
-tweaks/systemd/systemd_216.bb


