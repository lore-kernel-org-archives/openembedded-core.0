Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SuNWU-0007Qs-BF
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 14:50:34 +0200
Received: by wgbdr1 with SMTP id dr1so1577630wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 05:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=lIWQrzJXE8QNSzqobl7k6DfxKuHybA1V0xMXZ9ivPx8=;
	b=p043Dit344PQEu0rVa5BR1GTesx9P1hCkmgBNvgcxRnqwx2qxWqTJaL0OvruzFwXZ6
	jekcBwvdFmeh/axrDP+w5dIQyIyHPQMM66DKlJ8CbQfffr6zNz9cii9T/Z4sNQBgyNaP
	tRp668CWgyOXTFMTgpuQsWTHBhAH7xyzqz+ptCDiKb/nMWkbCmUuWmbm8kD9mBR9wDmA
	b//S0/78sZYkG9yzxf2dXoDSjrsmCTKROXwcjCp3XFbqid1dhNtHRZ2xR721zSsJUm9k
	+pVVgdqlUhYHKbS4eG81J5JCg/i0mlTXdplpTKK9kV866d1aHUEChtZyL3CDrTeDjkIx
	IoRw==
Received: by 10.216.90.19 with SMTP id d19mr14407187wef.113.1343306343649;
	Thu, 26 Jul 2012 05:39:03 -0700 (PDT)
Received: from [172.20.0.6] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id fu3sm12275523wib.10.2012.07.26.05.39.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jul 2012 05:39:01 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1515360.HL1K52tqqg@helios>
Date: Thu, 26 Jul 2012 14:38:59 +0200
Message-Id: <0F8A947F-5465-4350-9700-5E0457EB1A38@dominion.thruhere.net>
References: <1343283462-25435-1-git-send-email-radu.moisan@intel.com>
	<CAJTo0LZx5E7tcvLUMrjPdH2B5p+DnFxU63tbtL6tsDX5dVfVSQ@mail.gmail.com>
	<2CA706BF-4D5B-4488-B128-B665F32A0DD3@dominion.thruhere.net>
	<1515360.HL1K52tqqg@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQlruPfz2Ecsx+RPISmpL2q2OAyJ1IsI7hquW/H6qUikKrswmTSNCE43b/d87DWyd61dRYoU
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Thu, 26 Jul 2012 12:50:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 jul. 2012, om 14:32 heeft Paul Eggleton het volgende geschreven:

> On Thursday 26 July 2012 14:29:14 Koen Kooi wrote:
>> Op 26 jul. 2012, om 14:00 heeft Burton, Ross het volgende geschreven:
>>> On 26 July 2012 12:55, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>>> It would be nice if other layers that have RDEPENDS_foo =3D =
"dbus-x11" keep
>>>> working till their maintainers get around fixing them. Note that =
you
>>>> might need to do a -c cleansstate on dbus first to trigger any =
errors.>=20
>>> Yes, and isn't that what the RPROVIDES is for?
>>=20
>> I'm not sure if bitbake can map RPROVIDES to PROVIDES, I vaguely =
remember
>> that it doesn't, but it will pick it up *after* do_package has run. I =
broke
>> OE way too many times doing things like that :)
>=20
> Why would it need to if we're talking about RDEPENDS and more =
specifically=20
> RDEPENDS defined before do_package?

Because AIUI RDEPENDS get resolved to build the runqueue, so you can't =
do RDEPENDS_foo =3D "I-don't-exist". If that's not the case I'll shut up =
:)

regards,

Koen=


