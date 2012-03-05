Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S4fPD-0004vN-25
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 22:25:19 +0100
Received: by wibhq12 with SMTP id hq12so2324384wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2012 13:16:44 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.216.135.234 as permitted sender)
	client-ip=10.216.135.234; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.216.135.234 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.216.135.234])
	by 10.216.135.234 with SMTP id u84mr4702625wei.108.1330982204315
	(num_hops = 1); Mon, 05 Mar 2012 13:16:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=6U8bQ3zbLqBmOWEbnPLKvINhNX+qwMFGjBBwm7wlwWo=;
	b=GTvFF5s+1nR3ISewojhRuXpSsBWW+w1jVZOTXExW4JvyfkXoth7FH8WXBBUtb0xJLu
	vVzV1g4X0mDA3izfk1JeJMLHIXQF3busM2yf+bN91FqqygoGm4XLQpfSZCT7DpYMtD8x
	N3ArmE+p2DDTSXqWdISphniooqSbXIoltqOWaEs0vgnyIcRNJwTYA/RYMPIo2yBmMfH3
	J4lRrMCtpZ2mvgaC+huTSxvTKQnwXIC8OqZvTOkmB0OvXDylNLLFNFloB0VzRrmrMOZR
	Wy75IyR3W6ko1EzpXrYcGB132hIzmhhjKNF83MPhLBpO/Uv2JonYeXzPuvUcmBlymhZH
	hrPQ==
Received: by 10.216.135.234 with SMTP id u84mr3808348wei.108.1330982204208;
	Mon, 05 Mar 2012 13:16:44 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fb2sm23442879wid.3.2012.03.05.13.16.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 13:16:43 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1330982065.25887.3.camel@ted>
Date: Mon, 5 Mar 2012 22:16:41 +0100
Message-Id: <BD4EAF0F-F5EF-4692-A980-12C7156650F2@dominion.thruhere.net>
References: <1330933112-13510-1-git-send-email-koen@dominion.thruhere.net>
	<1330982065.25887.3.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkYg/bZ2bKYD9OngQNJj6IAsGr4R2/D11lbW2dxQg5Tnz5LZjXUs/oIzBqUcLofS6IloGL5
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/4] polkit 0.104: convert pam code to PACKAGECONFIG and adhere to OE recipe styleguide
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
X-List-Received-Date: Mon, 05 Mar 2012 21:25:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 5 mrt. 2012, om 22:14 heeft Richard Purdie het volgende geschreven:

> On Mon, 2012-03-05 at 08:38 +0100, Koen Kooi wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta/recipes-extended/polkit/polkit_0.104.bb |   25 =
+++++++++++++++----------
>> 1 files changed, 15 insertions(+), 10 deletions(-)
>>=20
>> diff --git a/meta/recipes-extended/polkit/polkit_0.104.bb =
b/meta/recipes-extended/polkit/polkit_0.104.bb
>> index 2737a4a..5dc82c5 100644
>> --- a/meta/recipes-extended/polkit/polkit_0.104.bb
>> +++ b/meta/recipes-extended/polkit/polkit_0.104.bb
>> @@ -6,28 +6,33 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D155db86cdbafa7532b41f390409283eb \
>>                     =
file://src/polkit/polkit.h;beginline=3D1;endline=3D20;md5=3D0a8630b0133176=
d0504c87a0ded39db4 \
>>                     =
file://docs/polkit/html/license.html;md5=3Dd85a36709a446c10f4ee123f9dda0e3=
8"
>>=20
>> +DEPENDS =3D "expat dbus-glib eggdbus intltool-native"
>> +
>> +PACKAGECONFIG =3D "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', =
'', d)}"
>> +PACKAGECONFIG[pam] =3D =
"--with-authfw=3Dpam,--with-authfw=3Dnone,libpam,libpam"
>> +
>=20
> After this merged I found a few issues on the autobuilder. There were
> two problems. If DISTRO_FEATURES didn't contain pam and was empty, the
> PACKAGECONFIG code would not trigger at all (and not add the
> authfw=3Dnone).

Beth mailed me the log and I asked her is PACKAGECONFIG is broken, and =
it seems it is since the --disable-foo isn't triggering. Or have I =
misunderstood how PACKAGECONFIG is supposed to work?

regards,

Koen=


