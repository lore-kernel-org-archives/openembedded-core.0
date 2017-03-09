Return-Path: <prvs=12419f2f09=holzmayr@rsi-elektrotechnik.de>
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
	[81.169.146.160])
	by mail.openembedded.org (Postfix) with ESMTP id 8C57B7017B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 06:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1489040576;
	l=1078; s=domk; d=rsi-elektrotechnik.de;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
	Date:From:References:To:Subject;
	bh=/0rDk4HyJUHj9C2vnEM4qj7d2+3Lj7N0tyj8XjoT9Ww=;
	b=kmgb9yTXK3xlxXcRhIPMkrjNWtxRJQMJ9RadERN/Lqci360kJYOz0K9IbMZ0vKSfqd
	AdrcKB8TYaCCrPCTVfK/kvQT1S89ThSHZDdfRoKyeAQYTK6lZsdO31WMf+TDfDhyhdvH
	TrjnLZIimv89Jt9iTSQ+aZJ9tRBVA/Dqgt6tw=
X-RZG-AUTH: :fz5RJhWIaexwuXGosGLfiBc0xYyi1Y5bd+wRKqrzPWwJyH/ODuV4n+N26eC0MVrEDIlpLg0lWA==
X-RZG-CLASS-ID: mo00
Received: from mail.rsi-elektrotechnik.de (p50933415.dip0.t-ipconnect.de
	[80.147.52.21]) by smtp.strato.de (RZmta 39.13 AUTH)
	with ESMTPSA id j005fdt296MtgUb
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (curve secp384r1
	with 384 ECDH bits, eq. 7680 bits RSA))
	(Client did not present a certificate)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Mar 2017 07:22:55 +0100 (CET)
Received: from [x.x.x.x] by mail.rsi-elektrotechnik.de (Cipher
	TLSv1.2:AES-SHA:256) (MDaemon PRO v16.5.2) 
	with ESMTPSA id md50000508177.msg for
	<openembedded-core@lists.openembedded.org>; 
	Thu, 09 Mar 2017 07:22:44 +0100
X-Spam-Processed: mail.rsi-elektrotechnik.de, Thu, 09 Mar 2017 07:22:44 +0100
	(not processed: message from trusted or authenticated source)
X-MDRemoteIP: 80.147.52.21
X-MDArrival-Date: Thu, 09 Mar 2017 07:22:44 +0100
X-Authenticated-Sender: holzmayr@rsi-elektrotechnik.de
X-Return-Path: prvs=12419f2f09=holzmayr@rsi-elektrotechnik.de
X-Envelope-From: holzmayr@rsi-elektrotechnik.de
X-MDaemon-Deliver-To: openembedded-core@lists.openembedded.org
X-CAV-Result: skipped - holzmayr@rsi-elektrotechnik.de is in exclusion list
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1488388550.git.anders@chargestorm.se>
	<12830a63c0c221f1a3a227173a69d55111359b8a.1488388550.git.anders@chargestorm.se>
	<CAMKF1spaobz07gVftrY+ZKxUrXKfcXBvf0QUKLp=agh8fDWeug@mail.gmail.com>
	<20170306072129.usryssqrwguoftdg@ad.chargestorm.se>
From: Josef Holzmayr <holzmayr@rsi-elektrotechnik.de>
Message-ID: <fddc169d-2102-7ad3-0813-14ce4a079435@rsi-elektrotechnik.de>
Date: Thu, 9 Mar 2017 07:22:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170306072129.usryssqrwguoftdg@ad.chargestorm.se>
Subject: Re: [PATCH 2/7] create_npm.py: convert MIT/X11 to MIT
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
X-List-Received-Date: Thu, 09 Mar 2017 06:22:57 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Hi Anders,

from what I can see the problem is rooted a bit deeper, and this patch 
(together with 5, 6, 7 from the series) is basically symptomatic:
the package.jsons license field is mostly expected to be spdx-compliant 
(see https://docs.npmjs.com/files/package.json#license). So I think we 
need a concept here to actually handle the complexity it brings, or we 
end up rewriting a boatload of license strings. And doing that in 
create_npm.py just feels wrong to me.

my $.02
-- 
Josef Holzmayr
Software Developer Embedded Systems

Tel: +49 8444 9204-48
Fax: +49 8444 9204-50

R-S-I Elektrotechnik GmbH & Co. KG
Woelkestrasse 11
D-85301 Schweitenkirchen
www.rsi-elektrotechnik.de
———————————————
Amtsgericht Ingolstadt – GmbH: HRB 191328 – KG: HRA 170393
Geschäftsführer: Dr.-Ing. Michael Sorg, Dipl.-Ing. Franz Sorg
Ust-IdNr: DE 128592548

_____________________________________________________________
Amtsgericht Ingolstadt - GmbH: HRB 191328 - KG: HRA 170363
Geschäftsführer: Dr.-Ing. Michael Sorg, Dipl.-Ing. Franz Sorg
USt-IdNr.: DE 128592548


