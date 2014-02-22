Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 07C196EC6B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2014 07:57:23 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id k14so3164276wgh.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 23:57:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=lMC5wo7nyiaCxZDyzEQtab3lEEUYmCbQMqtszsoMRxA=;
	b=XmGhstrfBSTm37cBg1544dDBUWH02iCu5Mk1OjtIT8t+8THRkz/eTQ/MZ5OQXhJSvp
	P9ndLVFrLzu1yse/W0cUq+xQF2L7NjfgUIqJHZ7l0sh3k25JMI7XCyIHAlpBmrk8A0Hg
	xsocIRPEMZbhV1BLjFnHuTDPlkyuRfYbptw17B58RP2thavwzLC477BdHT4Apdh+nYba
	1duB/bLjcS3AtdUC0JKWEAnkTW5d8fwm2x6RKDuEyWUZ531R2eTHhFk9Yhdgbby+pcHG
	cQog4jlHkeccEttTFvCDqQNKuFVwILTXkLd+kYwCefC4QVG/TUSRayuZuqgJ3Hk28HpO
	MPew==
X-Gm-Message-State: ALoCoQmHqNLCxcFNINU/e5QFjbCElINxhyiUQRyxnxExiKZIzToYdioAGlRzK26nC7VAEC2rwdg4
X-Received: by 10.180.207.15 with SMTP id ls15mr6259671wic.50.1393055843074;
	Fri, 21 Feb 2014 23:57:23 -0800 (PST)
Received: from ?IPv6:2001:610:612::11df:8e30:212d:c407?
	([2001:610:612:0:11df:8e30:212d:c407])
	by mx.google.com with ESMTPSA id r1sm2615928wia.5.2014.02.21.23.57.21
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 21 Feb 2014 23:57:21 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1392996116.1560.14.camel@ted>
Date: Sat, 22 Feb 2014 08:57:19 +0100
Message-Id: <8730C02B-B94E-4873-88D1-E5BA9063B585@dominion.thruhere.net>
References: <cover.1392891203.git.raj.khem@gmail.com>
	<20140221151607.GG3854@jama> <1392996116.1560.14.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1827)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFT][PATCH 0/2] Systemd 209
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
X-List-Received-Date: Sat, 22 Feb 2014 07:57:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 feb. 2014, om 16:21 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Fri, 2014-02-21 at 16:16 +0100, Martin Jansa wrote:
>> On Thu, Feb 20, 2014 at 02:18:56AM -0800, Khem Raj wrote:
>>> This patchset upgrades systemd to 209 as can be seen some =
enahancements
>>> to uclibc were neeed. As of now. It builds for me on both =
uclibc/eglibc
>>> Please test it out in your setups and report back any issues
>>>=20
>>> The following changes since commit =
9a98b8bfe13b94d89a9e39cca821f26fdeaeffc3:
>>>=20
>>>  image_types.bbclass: Fix tar IMAGE_CMD to not change directories =
(2014-02-18 08:37:03 +0000)
>>>=20
>>> are available in the git repository at:
>>>=20
>>>  git://git.openembedded.org/openembedded-core-contrib =
kraj/systemd-209
>>>  =
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3Dk=
raj/systemd-209
>>>=20
>>> Khem Raj (2):
>>>  uclibc: Add new functionality needed for systemd 209
>>>  systemd: Upgrade 208 -> 209
>>=20
>> Thanks for upgrade
>>=20
>> I've noticed pulseaudio failing to build when it tries to detect old
>> libsystemd-login lib:
>>=20
>> | to the PKG_CONFIG_PATH environment variable
>> | No package 'libsystemd-login' found
>> | configure:26263: $? =3D 1
>> | configure:26277: result: no
>> | No package 'libsystemd-login' found
>> | configure:26310: error: *** Needed systemd support not found
>>=20
>> do we want to enable compat libs or update pulseaudio to use new
>> libsystemd?
>=20
> FWIW the git recipe I was using enabled compat-libs...

And that needs IFUNC which only x86 toolchains support :(=

