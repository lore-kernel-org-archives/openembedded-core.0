Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>)
	id 1UZRfH-0003S1-Qd; Mon, 06 May 2013 22:05:42 +0200
Received: by mail-wi0-f178.google.com with SMTP id hm14so2929700wib.11
	for <multiple recipients>; Mon, 06 May 2013 12:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=PybI7qL2155zoam4MUZkm4xubkvfLh+29xKsYeEhIhc=;
	b=rFwW8ve96xfyouwlwz2FedR2li50Hz5zuwgdR/B2xGoRdtIJ50cB/S9afXsVorbMi+
	c++TMEQpH2dmPGVPq2jj+K2OFSTsCH/Dag6LAfX3STRTKjEK1WOZ+dYmK9o8NyNU2SnZ
	chYgCoM9qDaBy0Ppu6Ns3L+e+2PMVyaK+tF8j6zWZn5evMrFdPe/dx4+Bu+JV92PAEHq
	5Do3LXFFGlrAovR2ajPBUZgHBJxvB3mZSysZD4lr8xnYYuVsXSsnzPOVImIxLtEsEHew
	4SCc+d+aOAMjvzrDybOmig+ndmZcZAaeTMcGHX+KUNmOTsfCDIXhLcm29EkysJrcLNXz
	7ZsA==
MIME-Version: 1.0
X-Received: by 10.180.185.135 with SMTP id fc7mr10532308wic.29.1367869659206; 
	Mon, 06 May 2013 12:47:39 -0700 (PDT)
Received: by 10.194.5.132 with HTTP; Mon, 6 May 2013 12:47:39 -0700 (PDT)
In-Reply-To: <CANyK_8fT_rvPPo4LJz2BcSD-ra8435m4GefggL0jgeFC1kLxRQ@mail.gmail.com>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
	<5183C9CF.3060304@herbrechtsmeier.net>
	<5187A0D3.2080607@herbrechtsmeier.net>
	<CANyK_8fT_rvPPo4LJz2BcSD-ra8435m4GefggL0jgeFC1kLxRQ@mail.gmail.com>
Date: Mon, 6 May 2013 15:47:39 -0400
Message-ID: <CAHUNapTu45Wpm1zx+vpHUgyduk8rnzdJSninsoOOw6v34ViipQ@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 May 2013 20:05:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 6, 2013 at 3:15 PM, Paul Barker <paul@paulbarker.me.uk> wrote:
> lzip: fetch failure

This is an easy one to fix: version 1.13 is no longer available,
update the recipe (filename/hashes) to use version 1.14 instead. I
have a patch waiting to submit, but until I can register for the
openembedded-devel mailing list I don't have anywhere to send it.

> Let me know if this is useful.

Yes! Thank you. I find it particularly interesting to see what others
do in their local.conf files.


