Return-Path: <prvs=12357d6673=holzmayr@rsi-elektrotechnik.de>
X-Greylist: delayed 373 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 03 Mar 2017 10:33:28 UTC
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
	[81.169.146.220])
	by mail.openembedded.org (Postfix) with ESMTP id F418C7763A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 10:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1488537208;
	l=1029; s=domk; d=rsi-elektrotechnik.de;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
	Date:From:References:To:Subject;
	bh=2n9jnJGumESZ9xiF0X+x5Qxi+mqhVifTS5qzuVOARHs=;
	b=edKMJLbV0U7BFuMWd5lgGvIT7Hd1bqv37LKsmsp+90cEjd22VL4oFZqTxsPiAnuoXJ
	Y4e7mp1a5R/tEMGotvdN8WxuQ8/2/svyE33Uo2X4wrUGbUUiD5K9hCZ3bQc5cq7bQ15+
	Ds3dglem1kfpulsB/EcbezpzIoV7jO695EKm0=
X-RZG-AUTH: :fz5RJhWIaexwuXGosGLfiBc0xYyi1Y5bd+wRKqrzPWwJyH/ODuV4n+N26eC0MVrEDIlpLg0lWA==
X-RZG-CLASS-ID: mo00
Received: from mail.rsi-elektrotechnik.de (p50933415.dip0.t-ipconnect.de
	[80.147.52.21]) by smtp.strato.de (RZmta 39.13 AUTH)
	with ESMTPSA id n00f1at23ARFX2w
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (curve secp384r1
	with 384 ECDH bits, eq. 7680 bits RSA))
	(Client did not present a certificate)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Mar 2017 11:27:15 +0100 (CET)
Received: from [x.x.x.x] by mail.rsi-elektrotechnik.de (Cipher
	TLSv1.2:AES-SHA:256) (MDaemon PRO v16.5.2) 
	with ESMTPSA id md50000506612.msg for
	<openembedded-core@lists.openembedded.org>; 
	Fri, 03 Mar 2017 11:27:04 +0100
X-Spam-Processed: mail.rsi-elektrotechnik.de, Fri, 03 Mar 2017 11:27:04 +0100
	(not processed: message from trusted or authenticated source)
X-MDRemoteIP: 80.147.52.21
X-MDArrival-Date: Fri, 03 Mar 2017 11:27:04 +0100
X-Authenticated-Sender: holzmayr@rsi-elektrotechnik.de
X-Return-Path: prvs=12357d6673=holzmayr@rsi-elektrotechnik.de
X-Envelope-From: holzmayr@rsi-elektrotechnik.de
X-MDaemon-Deliver-To: openembedded-core@lists.openembedded.org
X-CAV-Result: skipped - holzmayr@rsi-elektrotechnik.de is in exclusion list
To: openembedded-core@lists.openembedded.org
References: <20170228045004.GA5913@linux-uys3>
	<20170228180036.GB16277@linux-uys3>
From: Josef Holzmayr <holzmayr@rsi-elektrotechnik.de>
Message-ID: <e1083205-af78-02cc-3995-b92eff593fa4@rsi-elektrotechnik.de>
Date: Fri, 3 Mar 2017 11:26:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20170228180036.GB16277@linux-uys3>
Subject: Re: npm thoughts
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
X-List-Received-Date: Fri, 03 Mar 2017 10:33:29 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Hi Trevor,

On 28.02.2017 19:00, Trevor Woerner wrote:
> Ideally "devtool add ..." wouldn't choke and crash when it encounters a
> LICENSE string it doesn't understand. When parsing license strings from random
> places on The Internet it's inevitable odd things will come up :-)

Yeah, it even seems to get very upset for rather non-obscure things like 
lodash or redux. I ran into that too and will try to have a look.

Greetz
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


