Received: from mail-ea0-f181.google.com ([209.85.215.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UFhwd-0003K7-UE
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 10:26:00 +0100
Received: by mail-ea0-f181.google.com with SMTP id z10so294487ead.40
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2013 02:09:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=yALQMbjoyxh64WwpVeXaA/dgkXY6tS0xsTf+uJ3ko+8=;
	b=apjiwRWEJBAAF9trkcV07wKkXINJkyUgMWGLY0V+sebaM7foowTjjBQAoifBMfJhG1
	hOQpm22UZc3kK8Ee9bR+YfIfG3GfHwioQZJ9wbZYykKel3YN9rD3EV9ZQL33awaCKzKD
	sZID4khSLUuVgSTHxKxPC7tr5CvScpq9JO711lFUQub9KRg1/kaMGqplrRxkmBRMDiHd
	UfDE8d8EDB6bvWTOjkpAnNj1fIA9TlyCJo9v9eK+k5I38RFy1dcpVJkDEzg8KDIXGiVf
	HssLC27eM9GzWVJYic62fYdaDZbeRU8twnlUPwG1pOGIrUpytXHY6RYn+/y5RMjMujK1
	i+Gw==
X-Received: by 10.14.3.133 with SMTP id 5mr56854769eeh.43.1363165759413;
	Wed, 13 Mar 2013 02:09:19 -0700 (PDT)
Received: from ?IPv6:2001:610:612::d9f7:1f4c:8d6f:e720?
	([2001:610:612:0:d9f7:1f4c:8d6f:e720])
	by mx.google.com with ESMTPS id r4sm34617628eeo.12.2013.03.13.02.09.17
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 02:09:18 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1363114248.9859.17.camel@ted>
Date: Wed, 13 Mar 2013 10:09:16 +0100
Message-Id: <492A89BB-593D-44E2-98B7-549EE53FFA56@dominion.thruhere.net>
References: <cover.1363031776.git.ross.burton@intel.com>
	<CAJTo0LY7vOy4_A3YJ2-jGMfLr32o7XKY-BGp9xuiB_wnVhb6Ag@mail.gmail.com>
	<CAP9ODKr_3VVmw5vGm8EnnmOKEu8z2uzp97iBjh7315DduPegoQ@mail.gmail.com>
	<ACE79805-5D74-40F1-8443-1410AC215E88@gmail.com>
	<980599F4-DEED-41CF-B871-750758BD6D45@dominion.thruhere.net>
	<1363114248.9859.17.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQnb9mhsyAOkvD6atczqBi5X7njqDGsUwFhMJ6fgZ4GxPw10XthTS7Z/FQpE7Nz1P6fgaUk1
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 0/9] hybrid systemd/sysvinit
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
X-List-Received-Date: Wed, 13 Mar 2013 09:26:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 mrt. 2013, om 19:50 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Tue, 2013-03-12 at 08:42 +0100, Koen Kooi wrote:
>> Op 11 mrt. 2013, om 23:49 heeft Khem Raj <raj.khem@gmail.com> het =
volgende geschreven:
>>=20
>>>=20
>>> On Mar 11, 2013, at 2:47 PM, Otavio Salvador =
<otavio@ossystems.com.br> wrote:
>>>=20
>>>> On Mon, Mar 11, 2013 at 6:37 PM, Burton, Ross =
<ross.burton@intel.com> wrote:
>>>>> On 11 March 2013 13:07, Ross Burton <ross.burton@intel.com> wrote:
>>>>>> This series allows you to have both sysvinit and systemd in =
DISTRO_FEATURES.
>>>>>> Packages will be built with both init scripts, and some daemons =
will be linking
>>>>>> to libsystemd-daemon so that will be pulled in to sysvinit =
images.
>>>>>=20
>>>>> Regarding the upgrade path, Richard/Paul/myself discussed this =
over
>>>>> lunch and proposed that oe-core could gain an include file for =
distro
>>>>> configuration that basically injects the backward compatibility
>>>>> dependencies.  So for meta-systemd, it would inject
>>>>> replaces/provides/conflicts for each of the packages in =
meta-systemd.
>>>>> This would isolate the dependencies into a single location, and be
>>>>> opt-in for distros that previously shipped meta-systemd.  =
Hopefully
>>>>> the implementation of this is obvious, and patches to implement =
this
>>>>> are welcome.
>>>>=20
>>>> I personally prefer to still use meta-oe systemd class and keep the
>>>> possibility to product images with choosen init system. I think =
Martin
>>>> will also prefer it.
>>>=20
>>> using different init manager is a separate problem than what Ross =
tried to address here isn't it ?
>>> I personally don't have a use case where I would upgrade live from =
1.3 to 1.4 so
>>> for me I could easily accept a different solution for 1.4
>>=20
>> Upgrading between 1.3 and 1.4 is already impossible for non-systemd
>> related reasons.
>=20
> Which reasons?

Warning, handwaving ahead: Renamed packages, differently split packages =
et cetera.=


