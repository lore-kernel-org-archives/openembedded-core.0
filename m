Return-Path: <florian.boor@kernelconcepts.de>
Received: from mail.kernelconcepts.de (mail.kernelconcepts.de [212.60.202.196])
	by mail.openembedded.org (Postfix) with ESMTP id 12917739D1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 09:25:03 +0000 (UTC)
Received: from [192.168.2.34] by mail.kernelconcepts.de with esmtpsa
	(TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.72)
	(envelope-from <florian.boor@kernelconcepts.de>)
	id 1YVcsu-0000gV-LD; Wed, 11 Mar 2015 10:25:00 +0100
Message-ID: <550009C1.80502@kernelconcepts.de>
Date: Wed, 11 Mar 2015 10:24:17 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Andre McCurdy <armccurdy@gmail.com>
References: <1426025096-24078-1-git-send-email-florian.boor@kernelconcepts.de>
	<CAJ86T=WvZ=cU2GCQ=P3XPar-WhQvhZFX0MbPcL7ahtkiW8xrhA@mail.gmail.com>
In-Reply-To: <CAJ86T=WvZ=cU2GCQ=P3XPar-WhQvhZFX0MbPcL7ahtkiW8xrhA@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] directfb: Allow native builds of directfb 1.7.6
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
X-List-Received-Date: Wed, 11 Mar 2015 09:25:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Arndre,

On 10.03.2015 23:32, Andre McCurdy wrote:
> Are you sure that excluding tslib-native from DEPENDS works? Since
> -lts is hardcoded in LDFLAGS (see directfb.inc) the linker won't run
> unless libts.so is found in sysroot (regardless of whether or not you
> configure with "--with-inputdrivers=none"). That being said, I don't
> know if -lts really needs to be hardcoded in LDFLAGS, it's been there
> since directfb was first imported into oe-core, with no explanation of
> comment.

yes it works - tested it and made sure that there was no native libts around
from a previous build.
But you are right, this hardcoded -lts in LDFLAGS looks strange. I can take a
look at this later since I need to build and test this anyway.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
                                        http://www.kernelconcepts.de/en

