Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 66E6560167
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 15:05:02 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id h11so483895wiw.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 07:04:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=AqkwraDt5KQVkJkce57j29F0FAFK71o7eEj05WIliWU=;
	b=E3s0hrxxAaOiCxF0V+48IiJrxR6L20GBQu8kvhpKFLEC/fEpsnMiOP89jo5Jdu7gD5
	MPbARPuqvagEs6y3A+2RNe/Ydm5WE6tCUpudR0vb4t0Aa/QCAee+osuKDeE02DlBqhzD
	yh0jduGJ1+GliOCRoomxS1WY7hxPmPW6UWbVcmRI8kJMR86tG+P5Zt7XJTeq8qp1yyhB
	eLM/mVDp+gCllK1F/YPPuxVxXbuZQn/SWriouUktpoYzB6U3QnQb9Lc8hKstt41IQmXK
	VbDApOdWA0g9OFBUBdzi5qP9a8Q4UjFpK0Ru0iN8fQp01ZwG0ZB1aqR69Rh5EN2JTlTU
	lXQg==
X-Gm-Message-State: ALoCoQl8lO1XyKAVEfxOGLN6TSpH9k7zzsOtSaDPa471JlT4ZYAGwh+VovmKo9LCjzQXEHffZFET
X-Received: by 10.180.198.145 with SMTP id jc17mr4600857wic.67.1415891097250; 
	Thu, 13 Nov 2014 07:04:57 -0800 (PST)
Received: from ?IPv6:2001:610:612::7828:9cc5:bb98:2202?
	([2001:610:612:0:7828:9cc5:bb98:2202])
	by mx.google.com with ESMTPSA id
	bf6sm35873438wjb.13.2014.11.13.07.04.55 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 13 Nov 2014 07:04:56 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <545CD6E1.5080807@windriver.com>
Date: Thu, 13 Nov 2014 16:04:54 +0100
Message-Id: <327FE600-173F-40B2-94BC-FC120087B698@dominion.thruhere.net>
References: <cover.1415350038.git.kai.kang@windriver.com>
	<4BAF41A0-2647-427A-9F10-B2DF8D721FF5@dominion.thruhere.net>
	<545CD6E1.5080807@windriver.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Mailer: Apple Mail (2.1990.1)
Cc: Steve McIntyre <steve.mcintyre@linaro.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/24] V2: Add machine qemuarm64
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
X-List-Received-Date: Thu, 13 Nov 2014 15:05:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

CC:ing Steve M. from ARM who went through various arm naming issues for =
debian.

> Op 7 nov. 2014, om 15:27 heeft Mark Hatle <mark.hatle@windriver.com> =
het volgende geschreven:
>=20
> On 11/7/14, 3:18 AM, Koen Kooi wrote:
>>=20
>>> Op 7 nov. 2014, om 09:51 heeft Kai Kang <kai.kang@windriver.com> het =
volgende geschreven:
>>>=20
>>> V2:
>>> * rebase on master and drop qemu upgrade commit
>>> * built for lib32-core-image-sato core-image-sato-sdk meta-toolchain =
and world
>>>=20
>>> V1:
>>> The original configuration files and tune fils for arm arch64 are =
from linaro.
>>> And we rename it to qemuarm64 for consistency.
>>=20
>> Consistent to what? All current qemu machines are named after the =
qemu arch, so consistent would be 'qemuaarch64'. The 'arm64' moniker is =
*only* used in the kernel and that was caused by Linus being grumpy, =
everything else is 'aarch64' or 'armv8'
>>=20
>=20
> The arm64 name -did- come from Linaro:
>=20
> =
http://git.linaro.org/openembedded/meta-linaro.git/tree/HEAD:/meta-aarch64=
/conf/machine/include
>=20
> The arch-armv8.inc file (that arch-arm64.inc was based on) is located =
in the directly "arm64".
>=20
> In addition, the tune file that forms the basis of the ARM tunes is =
called 'arch-arm.inc'.  Not arch-aarch32.inc.  If you want to rename =
that, we can discuss it.. but to match that naming I chose =
'arch-arm64.inc'.

'aarch32' is not the same as 'arm', the arch-arm.inc covers =
armv4..armv7a with it various includes. aarch32 is s subset of armv7a, =
so please don't use that to denote 32bit arms.

> (arch-armv8.inc was kept, but only includes the arch-arm64.inc file =
since there are no custom optimizations for 'v8' that I can find.)
>=20
> As far as the machine name goes the original Linaro version, =
genericarmv8.conf and genericarmv8b.conf, don't match any of the naming =
conventions that are currently used by QEMU BSPs.
>=20
> Looking at the existing machine names:
>=20
> qemuarm.conf  qemumips64.conf  qemumips.conf  qemuppc.conf  =
qemux86-64.conf qemux86.conf
>=20
> Each of the suffix names used match the Linux kernel arch naming.

It seems to be following the qemu architecture name, which tends to =
match the kernel arch name, but not always.

Apart from the naming issues, aarch64 support is incomplete in =
meta-aarch64 since things like ILP32 are missing as well as agreement =
over page size options.=

