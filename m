Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <swaplinker@gmail.com>) id 1SIPt0-00005J-6M
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 21:40:55 +0200
Received: by obbuo13 with SMTP id uo13so3337831obb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 12:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=AUrtV2yxCSamqBqMrlskdPZn50SP1N2eKFYBq7Bgbnk=;
	b=TWkgeUqR6+Eri6SuSsLe2oulnb4j1Z/dYrXdVc5yPH9aQ5cxlTxgzY4LX0rUhhTJyA
	1tMYJBA6gF3+m5xebjrGlO7wEGYsF7kGF8ra9Hbf3bMWndOlSWfJBmUxXtMaqdNwCwEU
	qrwz3DQvdSPicCadfWwuyQ9X62wTpG+NwG3QhOQHkqkPk1Q0VUCwp4gT46qSqDc688Wq
	r2PGL0U077cranGAU0UTKtGWlrHttL4YBgAEuGrM+zLLrKyGuAX8EIS2FxczsN66Lc8n
	fTOM9j/mXESSIBCIxOcQb7MGctgtgCQChzpmPFQVbQM0A/2Yrm5pYhHNXmlefZzdNu+L
	D8/Q==
Received: by 10.182.127.20 with SMTP id nc20mr4562276obb.66.1334259093268;
	Thu, 12 Apr 2012 12:31:33 -0700 (PDT)
MIME-Version: 1.0
Sender: swaplinker@gmail.com
Received: by 10.60.168.172 with HTTP; Thu, 12 Apr 2012 12:31:13 -0700 (PDT)
In-Reply-To: <CAMKF1soezt5BK0Qnx1Jda_uHXuFKiW9apSxXOu650SqcsqqKCA@mail.gmail.com>
References: <7E680CB2A76BB8438D08CF13C09FC53A46B06325@FMSMSX151.amr.corp.intel.com>
	<4F84D58F.8020608@gmail.com> <1334221321.31685.24.camel@ted>
	<4543FDF1-0512-4B36-ABB3-DBB957B86E88@dominion.thruhere.net>
	<CAMKF1soezt5BK0Qnx1Jda_uHXuFKiW9apSxXOu650SqcsqqKCA@mail.gmail.com>
From: Julian Pidancet <julian.pidancet@gmail.com>
Date: Thu, 12 Apr 2012 20:31:13 +0100
X-Google-Sender-Auth: bfBCy_6JEL9EG2MwKNvSjVFoKRQ
Message-ID: <CAKZ=5EUVJ_E5G46=9u_oKbjc9r4BBGWZ7A8QhD4LPfF=1=rFeg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Yocto Project 1.2 M4 schedule
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
X-List-Received-Date: Thu, 12 Apr 2012 19:40:55 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 12, 2012 at 5:55 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> I think that string is fine as long as its just for yocto but I think
> for OE-Core we are going to do a General release
> so tagging that with something yocto project will be very confusing
> unless we plan to do different releases of OE-Core for general
> availability
> and yocto project. I dont think we have bandwidth for that. And since
> poky repository makes a copy of OE-Core metadata it can be tagged in
> yoctoproject specific tags
>

In case there is an oe-core general availability release separated
from the yocto release, when would that happen ? Is there anything
planned yet ?

-- 
Julian


