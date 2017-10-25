Return-Path: <prvs=14716c3ac2=holzmayr@rsi-elektrotechnik.de>
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
	[81.169.146.162])
	by mail.openembedded.org (Postfix) with ESMTP id EF5F677D6B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 18:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1508956797;
	s=domk; d=rsi-elektrotechnik.de;
	h=Content-Transfer-Encoding:Content-Language:Content-Type:In-Reply-To:
	MIME-Version:Date:From:Cc:References:To:Subject;
	bh=FpaBlq/LlBMu4G84ywM5ttTBGhxhfUOB/KEyBYrYPLk=;
	b=luehfHAe07r4EbPDAsKryXIOqn0km05LBWMKaAlnHXGN2Ii4f2ZuB+UiOWpI88dXhe
	WALzOkfKEEsiLVM1Wr2dC330gBYgIx8Wt/+TfdTsXllk27WXuBFwaXKTDfRuJr0/EG2N
	XB5g+JTlf/+SDTlrkd73A2vyf7EdFJti40+4I=
X-RZG-AUTH: :fz5RJhWIaexwuXGosGLfiBc0xYyi1Y5bd+wRKqrzPXw4V1/Kpz6b/avroGOv0c9mHNc01sePA6ZpTLlbQjW24Oop5Qo4fhADQi1rSTLfuAPP4FE=
X-RZG-CLASS-ID: mo00
Received: from mail.rsi-elektrotechnik.de
	([2001:0:9d38:78cf:2cf1:e1f:af6c:cbea])
	by smtp.strato.de (RZmta 42.8 AUTH) with ESMTPSA id 40b7eet9PIdsX5V
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp384r1
	with 384 ECDH bits, eq. 7680 bits RSA))
	(Client did not present a certificate);
	Wed, 25 Oct 2017 20:39:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/relaxed;
	d=rsi-elektrotechnik.de; s=MDaemon; t=1508956782; x=1509561582;
	i=holzmayr@rsi-elektrotechnik.de; q=dns/txt; h=Subject:To:
	References:Cc:From:Message-ID:Date:User-Agent:MIME-Version:
	In-Reply-To:Content-Type:Content-Language:
	Content-Transfer-Encoding; bh=FpaBlq/LlBMu4G84ywM5ttTBGhxhfUOB/K
	EyBYrYPLk=; b=nfVZMwQaMFoKnNLA78k2W6tGsTNR2o8qPzkyZUeV79RsaEJRN+
	15L1xmAJuJb4jIADrsj9hmxFvSoWuknq6TggVcI7+JfyVaa6An21yQ6W9ZsrKgwq
	qN0feKwD4EChs+2TVqtcL5162K6ZEKGSyfbCd49DDJWKxYQ+UF/T+yol8=
X-Spam-Processed: mail.rsi-elektrotechnik.de, Wed, 25 Oct 2017 20:39:42 +0200
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NO_RELAYS shortcircuit=no
	autolearn=disabled version=3.4.1
X-Spam-Report: * -0.0 NO_RELAYS Informational: message was not relayed via SMTP
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28)
Received: by mail.rsi-elektrotechnik.de (MDaemon PRO v17.5.0) with ESMTPSA id
	md50000014702.msg; Wed, 25 Oct 2017 20:39:42 +0200
X-MDRemoteIP: 62.168.35.108
X-MDArrival-Date: Wed, 25 Oct 2017 20:39:42 +0200
X-Authenticated-Sender: holzmayr@rsi-elektrotechnik.de
X-Return-Path: prvs=14716c3ac2=holzmayr@rsi-elektrotechnik.de
X-Envelope-From: holzmayr@rsi-elektrotechnik.de
X-CAV-Result: skipped - holzmayr@rsi-elektrotechnik.de is in exclusion list
To: Jose Lamego <jose.a.lamego@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <1508934851-3067-1-git-send-email-holzmayr@rsi-elektrotechnik.de>
	<706ad8ef-39de-02ea-6475-f6caf2012cb5@linux.intel.com>
From: Josef Holzmayr <holzmayr@rsi-elektrotechnik.de>
Message-ID: <e68b95de-6795-0886-827f-bbf01d5923c9@rsi-elektrotechnik.de>
Date: Wed, 25 Oct 2017 20:39:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <706ad8ef-39de-02ea-6475-f6caf2012cb5@linux.intel.com>
Subject: Re: [PATCH 0/2] version bump bc to 1.07.1
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
X-List-Received-Date: Wed, 25 Oct 2017 18:39:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 8bit

Hi Jose,

On 25.10.2017 17:16, Jose Lamego wrote:
> A previous upgrade attempt [1] showed that bc version 1.07.1 not only 
> needs ed in the host (a regression from 1.06) but also shows a Parallel 
> Make Race that requires unsetting PARALLEL_MAKE variable. I contacted 
> the upstream maintainer and he is aware of this situation and has 
> developed and tested a version 1.07.2, (however is not available for 
> download yet). The upgrade was delayed for this reason (more details in 
> the patch comments thread).

Interesting, thanks for pointing that out!

> That said, Is there any urgent need for the upgrade to 1.07.1?

Absolutely not. The story behind this upgrade is that at OEDEM, we 
discussed version bumps as a way for new contributors to get up to 
speed. So when the upgradeable recipes report came in shortly 
afterwards, I just picked something that looked innocent enough and gave 
it a try. I'm absolutely fine with ignoring this patchset for the given 
reasons.

> On a side note, I believe bc 1.07.1 license should be GPLv3+ & LGPLv3 
> only, unless I'm missing something.

Alex and I actually discussed that in the meantime and we concluded that 
given license notices in the source itself and the description on the 
home page that it actually is only "GPLv3+". But thats just a side notice.

Thanks for the heads up!

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


