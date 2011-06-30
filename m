Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QcO1X-0006u9-PC
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 22:39:43 +0200
Received: by wwi14 with SMTP id 14so1121866wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 13:36:00 -0700 (PDT)
Received: by 10.216.158.198 with SMTP id q48mr2058987wek.94.1309466159829;
	Thu, 30 Jun 2011 13:35:59 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id n21sm1320011wed.43.2011.06.30.13.35.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Jun 2011 13:35:59 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E0C9F74.9040301@windriver.com>
Date: Thu, 30 Jun 2011 22:35:57 +0200
Message-Id: <21BC0569-3028-4DBA-90CB-D7CEC814DBC1@dominion.thruhere.net>
References: <1309446689-21243-1-git-send-email-koen@dominion.thruhere.net>
	<4E0C9D43.6020504@mentor.com> <4E0C9F74.9040301@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] insane bbclass: turn fatal errors back into fatal	errors
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
X-List-Received-Date: Thu, 30 Jun 2011 20:39:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 30 jun 2011, om 18:08 heeft Mark Hatle het volgende geschreven:

> On 6/30/11 10:58 AM, Tom Rini wrote:
>> On 06/30/2011 08:11 AM, Koen Kooi wrote:
>>> These were turned off by:
>>>=20
>>> 	commit fae8d5e985e9b05ce90f1eca434ad4dbf2259725
>>> 	Author: Richard Purdie <rpurdie@linux.intel.com>
>>> 	Date:   Thu Jul 8 23:51:06 2010 +0100
>>>=20
>>> 		insane.bbclass: Relax fatal errors for now until we get =
have time to work through the backlog
>>>=20
>>> The current metadata triggers so many of these that they need to be =
made fatal so people will actually fix them.
>>>=20
>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>=20
>> Given that a number of them can probably just be pulled from oe.dev =
as
>> fixes too:
>>=20
>> Acked-by: Tom Rini <tom_rini@mentor.com>
>=20
> I'm really worried about the current warnings/QA issues that keep =
coming up.. so
> I agree we really need to do this.. (note, we also really need to tell =
people to
> expect some breakage as we go and fix the mess!)

During todays TSC meeting the proposed date to switch was the 11th and =
encourage people to start fixing things *NOW*. What are peoples thought =
on that?

regards,

Koen=


