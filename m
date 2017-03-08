Return-Path: <prvs=12403ff1d9=holzmayr@rsi-elektrotechnik.de>
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
	[81.169.146.161])
	by mail.openembedded.org (Postfix) with ESMTP id DCC1372FDC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 07:12:46 +0000 (UTC)
X-RZG-AUTH: :fz5RJhWIaexwuXGosGLfiBc0xYyi1Y5bd+wRKqrzPWwJyH/ODuV4n+N26eC0MVrEDIlpLg0lWA==
X-RZG-CLASS-ID: mo00
Received: from mail.rsi-elektrotechnik.de (p50933415.dip0.t-ipconnect.de
	[80.147.52.21]) by smtp.strato.de (RZmta 39.13 AUTH)
	with ESMTPSA id 00af76t287Cc9Xx
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (curve secp384r1
	with 384 ECDH bits, eq. 7680 bits RSA))
	(Client did not present a certificate);
	Wed, 8 Mar 2017 08:12:38 +0100 (CET)
Received: from [x.x.x.x] by mail.rsi-elektrotechnik.de (Cipher
	TLSv1.2:AES-SHA:256) (MDaemon PRO v16.5.2) 
	with ESMTPSA id md50000507770.msg; Wed, 08 Mar 2017 08:12:27 +0100
X-Spam-Processed: mail.rsi-elektrotechnik.de, Wed, 08 Mar 2017 08:12:27 +0100
	(not processed: message from trusted or authenticated source)
X-MDRemoteIP: 80.147.52.21
X-MDArrival-Date: Wed, 08 Mar 2017 08:12:27 +0100
X-Authenticated-Sender: holzmayr@rsi-elektrotechnik.de
X-Return-Path: prvs=12403ff1d9=holzmayr@rsi-elektrotechnik.de
X-Envelope-From: holzmayr@rsi-elektrotechnik.de
X-CAV-Result: skipped - holzmayr@rsi-elektrotechnik.de is in exclusion list
To: "Burton, Ross" <ross.burton@intel.com>,
	Mark Hatle <mark.hatle@windriver.com>
References: <1488862727-25152-1-git-send-email-armccurdy@gmail.com>
	<CAJTo0LaNUQW=Qsyxm7eC9hFduzVMy5v+1Sy9aBMfgNoBgAqoow@mail.gmail.com>
	<f417ea5c-df83-ef34-648f-5a526f3d2e16@windriver.com>
	<CAJTo0LZKkhLFR9-bR2TV4EDJ_8A=3UYeVmAgaBMNZAeYsmDqrQ@mail.gmail.com>
From: Josef Holzmayr <holzmayr@rsi-elektrotechnik.de>
Message-ID: <0047dd6d-179f-6c34-0c3f-568783e3cff8@rsi-elektrotechnik.de>
Date: Wed, 8 Mar 2017 08:12:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZKkhLFR9-bR2TV4EDJ_8A=3UYeVmAgaBMNZAeYsmDqrQ@mail.gmail.com>
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] [PATCH] meta: start to ignore the largefile distro feature
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
X-List-Received-Date: Wed, 08 Mar 2017 07:12:48 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 07.03.2017 15:45, Burton, Ross wrote:
>
> On 7 March 2017 at 14:43, Mark Hatle <mark.hatle@windriver.com
> <mailto:mark.hatle@windriver.com>> wrote:
>
>     At this point, I'm not sure there is any reason to NOT using
>     largefile system
>     wide.  It's a common enough feature, and even 'small' devices (with
>     sdcard
>     slots) can run into large file problems now.
>
>
> My thoughts exactly, fwiw.

FULLACK

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


