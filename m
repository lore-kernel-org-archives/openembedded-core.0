Return-Path: <stefan@agner.ch>
X-Greylist: delayed 476 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 21 Apr 2016 20:15:03 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 183C960670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 20:15:03 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 41D1D5C156E;
	Thu, 21 Apr 2016 22:13:26 +0200 (CEST)
MIME-Version: 1.0
Date: Thu, 21 Apr 2016 13:11:38 -0700
From: Stefan Agner <stefan@agner.ch>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
In-Reply-To: <CAHiDW_EFx5JvzNwY0=MmHNaf0=MMDA1CBz6Z8o3JhbqEtEwNVA@mail.gmail.com>
References: <CAHiDW_FCskCiuL0bf0UwRWyR=nr0GYzGhf5fRuxMrkHz_j=kSQ@mail.gmail.com>
	<49E8A3AC-D4EF-4CCB-9CEA-1CA8E0A6425D@dominion.thruhere.net>
	<CAHiDW_EFx5JvzNwY0=MmHNaf0=MMDA1CBz6Z8o3JhbqEtEwNVA@mail.gmail.com>
Message-ID: <9867f0e90947c89a380b578d1985a015@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.1.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1461269606; bh=4t1loHpypLHEjANlPhVAkVgcQVq0+ZV9EHbsybpTcnA=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
	b=UEm4AFXoox6qv/6+EQTJTCC7xpIXm1+u4OMtPzzogVhMQi+VRPsUa+wRRsH4Z7WHU2jfqhZab84ahpziSxESqhucwMc07D4sLLiuJxLYncHjCHlpiD/GvW6vGClFsn11Sc8zoSiJASbawzC3O5ymfX9dcn8X9SBuwsjJr4bNc48=
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: xinput-calibrator startup question
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
X-List-Received-Date: Thu, 21 Apr 2016 20:15:05 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2016-04-19 14:01, Jussi Kukkonen wrote:
> On 19 April 2016 at 21:24, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>
>>> Op 19 apr. 2016, om 17:12 heeft Jussi Kukkonen <jussi.kukkonen@intel.com> het volgende geschreven:
>>>
>>> Hi Koen,
>>>
>>> I was looking at xinput-calibrator in preparation for bug 9365 "Remove
>>> xtscal in preference of xinput-calibrator", and I'm wondering if you
>>> remember the logic behind this commit:
>>>
>>> commit 6464bcd67d10ab9967ac83c27c413c1014be707e
>>> Author: Koen Kooi <koen@dominion.thruhere.net>
>>> Date:   Wed Apr 30 11:33:23 2014 +0200
>>>
>>>    xinput-calibrator: fix XDG launch
>>>
>>>    In the move from meta-oe to OE-core XDG based launched was dropped
>>>    without noting it in the commit message, so fix that regression.
>>>
>>>    Gnome-session will now launch the calibrator again.
>>>
>>> The commit installs the app desktop file in the XDG autostart
>>> directory. But we already have a XSession script for a similar purpose
>>> -- the result in Sato is that xinput-calibrator runs twice (and I
>>> would expect that to happen in gnome as well)?

It does not run twice in our case (LXDE). Can you point to the XSession
script you are referring to?

--
Stefan

