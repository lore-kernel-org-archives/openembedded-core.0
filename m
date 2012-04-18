Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SKQvg-0002Zu-P0
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 11:12:00 +0200
Received: by iaag37 with SMTP id g37so10391980iaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 02:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=WefxVIAamVZi8u1jW06Mjefw0y2RTMSQyS3wnVs9Ym4=;
	b=BaIwauPP3SfWTt5eAhJecGU30OgaZs4NoyUhkQw/vG5+0GPFIEG8wYB53lWsH3Mr9b
	DHAzl35kseU414bTsliS3PTNJThiOwdnEMCKzzSCI/MJ2jQlb7VsHwjKlSncd0gAxXn7
	+LGENSYObl1VkXZrTKdi2dDRoUThSDL93J6+j6w+MKbTk1rc9PM+h9ECwS+MrBEktV1V
	f0ly81E2IU02otyzaUbAGSlOjiGmKiybP1+6t9/wkVY4eQhfO9rK14pS4c+94ii29/9g
	FydFrvW4BmXgkHt0Sx1bWcpdS3we6vsfO3BpGtwEX/zKufXEy71cAb5BHc/+adDRtPuZ
	bapg==
MIME-Version: 1.0
Received: by 10.42.68.71 with SMTP id w7mr831124ici.26.1334739753144; Wed, 18
	Apr 2012 02:02:33 -0700 (PDT)
Received: by 10.42.165.137 with HTTP; Wed, 18 Apr 2012 02:02:33 -0700 (PDT)
In-Reply-To: <E06E57AF-94D1-42DF-9435-ECE3DAC0DBC4@dominion.thruhere.net>
References: <4F8D8AB7.7000002@opendreambox.org>
	<20120417153919.GG3665@jama.jama.net>
	<E06E57AF-94D1-42DF-9435-ECE3DAC0DBC4@dominion.thruhere.net>
Date: Wed, 18 Apr 2012 11:02:33 +0200
Message-ID: <CALbNGRRi3peWrpGyN68Rr7tF17y1qv49AfyoqqTQx7WCDEsz+w@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] waning "it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd"
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
X-List-Received-Date: Wed, 18 Apr 2012 09:12:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 17, 2012 at 5:45 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 17 apr. 2012, om 17:39 heeft Martin Jansa het volgende geschreven:
>
>> On Tue, Apr 17, 2012 at 05:22:31PM +0200, Andreas Oberritter wrote:
>>> Hi,
>>>
>>> the following warnings keep appearing on every fresh invocation of
>>> bitbake since a few months, I think:
>>>
>>> WARNING: .../meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb: it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd
>>> WARNING: .../meta-oe/recipes-connectivity/gateone/gateone_git.bb: it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd
>
> The above 2 only have systemd support, so the WARNING is completely bogus and should be silenced.
Another chapter of 'eat systemd or die'

Andreas


