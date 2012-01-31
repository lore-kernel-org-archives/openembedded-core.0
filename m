Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rs9gH-0000td-Fr
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 10:07:13 +0100
Received: by lahc1 with SMTP id c1so2642140lah.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2012 00:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=HeAnyqMzv0WkgVHwnGSSQRmQdAk70U/63Q8h4BGzQno=;
	b=GPBYGPOp47U2/qKfIorDiv7cH2y+uDntKujW/H57//h13Czpn503I26vlb6pCrydkK
	mf3MS0hkXUE160Wxu6/CZV5D9G2EKFGkWcd4BzRJ24+/UASZajBcQ2f14sygJ+WeM50L
	tn/7y//m70t78GPSbJUYrMI4aZDUuPtUsU/k4=
Received: by 10.152.114.169 with SMTP id jh9mr10603826lab.20.1328000359243;
	Tue, 31 Jan 2012 00:59:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Tue, 31 Jan 2012 00:58:49 -0800 (PST)
In-Reply-To: <07E1C9D5-7CD1-4A0F-8C0A-0916826E7935@dominion.thruhere.net>
References: <4F24F822.1010102@emagii.com>
	<1327974653.1334.0.camel@localhost.localdomain>
	<CAMKF1soXjPuoroZR5kkvzD5vT+QXy-==peaSa+hV2Xore+E_VA@mail.gmail.com>
	<07E1C9D5-7CD1-4A0F-8C0A-0916826E7935@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 Jan 2012 00:58:49 -0800
Message-ID: <CAMKF1sqhkRdWYDuHwq_4tSgdwvskBSLe94o5DTUnK6BzPZG7Cw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: module.init-tools-3.16.tar.bz2 no longer available at kernel.org
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
X-List-Received-Date: Tue, 31 Jan 2012 09:07:13 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 30, 2012 at 11:57 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Like the one in meta-oe? http://cgit.openembedded.org/meta-openembedded/commit/?id=2292ac565c220f2112a07abd563c6a9ee34dc662

slightly better ;) Since I was intending to replace complete
module-init-tools (including cross recipes) with kmod.

have a look at top 3 patches on

http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/misc-fixes


