Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 079406CF40
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 13:50:13 +0000 (UTC)
Received: (qmail 12383 invoked by uid 1003); 8 Jan 2014 13:50:14 -0000
Received: from unknown (HELO ?192.168.1.122?)
	(philip@opensdr.com@71.171.41.155)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	8 Jan 2014 13:50:14 -0000
Message-ID: <52CD5795.8000005@balister.org>
Date: Wed, 08 Jan 2014 08:50:13 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Mike Looijmans <mike.looijmans@topic.nl>
References: <cover.1389186276.git.irina.patru@intel.com>
	<52CD5193.2060702@topic.nl>
In-Reply-To: <52CD5193.2060702@topic.nl>
X-Enigmail-Version: 1.6
Cc: openembedded-core@lists.openembedded.org
Subject: Re: What package installs a C compiler on my target?
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
X-List-Received-Date: Wed, 08 Jan 2014 13:50:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/08/2014 08:24 AM, Mike Looijmans wrote:
> Probably a silly question that has been asked a thousand times, but my
> searches on Google only give me the answer to the wrong question (how to
> build FOR the target, which I already know how to do).
> 
> I want to run the C compiler on the board itself. That is, a GCC that
> runs on the board and compiles (and links etc.) C code for that board.
> 
> What package(s) do I need to build and install to accomplish this?

From one of my images:


IMAGE_FEATURES += "splash ssh-server-openssh tools-sdk \
tools-debug debug-tweaks \
dev-pkgs dbg-pkgs \
"
looks like tools-sdk is the one you want. dev- and dbg- packages might
also be helpful, but will make the image larger. Especially the debug ones.

Philip

> 
> Mike.
> 
> 
> Met vriendelijke groet / kind regards,
> 
> Mike Looijmans
> 
> TOPIC Embedded Systems
> Eindhovenseweg 32-C, NL-5683 KH Best
> Postbus 440, NL-5680 AK Best
> Telefoon: (+31) – (0)499 - 33.69.79
> Telefax: (+31) - (0)499 - 33.69.70
> E-mail: mike.looijmans@topic.nl
> Website: www.topic.nl
> 
> Dit e-mail bericht en de eventueel daarbij behorende bijlagen zijn
> uitsluitend bestemd voor de geadresseerde, zoals die blijkt uit het
> e-mail bericht en/of de bijlagen. Er kunnen gegevens met betrekking tot
> een derde instaan. Indien u als niet-geadresseerde dit bericht en de
> bijlagen ontvangt, terwijl u niet bevoegd of gemachtigd bent om dit
> bericht namens de geadresseerde te ontvangen, wordt u verzocht de
> afzender hierover direct te informeren en het e-mail bericht met de
> bijlagen te vernietigen. Ieder gebruik van de inhoud van het e-mail
> bericht, waaronder de daarbij behorende bijlagen, door een ander dan de
> geadresseerde is onrechtmatig jegens ons dan wel de eventueel in het
> e-mail bericht of de bijlagen voorkomende andere personen. TOPIC
> Embedded Systems is niet aansprakelijk voor enigerlei schade
> voortvloeiend uit het gebruik en/of acceptatie van dit e-mail bericht of
> de daarbij behorende bijlagen.
> 
> The contents of this message, as well as any enclosures, are addressed
> personally to, and thus solely intended for the addressee. They may
> contain information regarding a third party. A recipient who is neither
> the addressee, nor empowered to receive this message on behalf of the
> addressee, is kindly requested to immediately inform the sender of
> receipt, and to destroy the message and the enclosures. Any use of the
> contents of this message and/or the enclosures by any other person than
> the addressee or person who is empowered to receive this message, is
> illegal towards the sender and/or the aforementioned third party. TOPIC
> Embedded Systems is not  liable for any damage as a result of the use
> and/or acceptance of this message and as well as any enclosures.
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

