Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SLzFh-0003mx-PH
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Apr 2012 18:03:05 +0200
Received: by lagw12 with SMTP id w12so7865352lag.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Apr 2012 08:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=lF88WiXN49O+C3k+r80+H5chxjVEzHQ8JW3UyibsUnc=;
	b=iExbrrh7mrbYVzhGrpGahLXLDD0IPgS1F5IKvLxBDWAnmC0lcAgHxsG+OBcmRsP/Vo
	B5f3bsaIyYZbzwN8n0jqWj+5ofcnRy0PaWwGHvIkmTwO8cnjA9uChuEKLE9bF5g0WCA5
	kXSWdHX6RGGocFCywWT4y3gIoGlYviVTY6+bv/8gOMYW7b2JBKQXeTCCR8huuvF4oucr
	xjerVuZVTLb9QXVfyc7KzjA0FSSGzua7NY8cCJFRP76Opi1oGkGeaoyfQKKkMQeJTCw9
	Xub79TxEK/KAyhNEWPSqT52d1yurEEfV9mxMlStWgwVA8M5bTkbpbXbeR284VaHm7Wis
	wDMQ==
Received: by 10.152.146.234 with SMTP id tf10mr12460446lab.31.1335110013283;
	Sun, 22 Apr 2012 08:53:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Sun, 22 Apr 2012 08:53:02 -0700 (PDT)
In-Reply-To: <91F01C72-881B-47AD-BBC3-99F505939D29@dominion.thruhere.net>
References: <91F01C72-881B-47AD-BBC3-99F505939D29@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 22 Apr 2012 08:53:02 -0700
Message-ID: <CAMKF1spC+76TQ5M7RaO8uhGmkQgZg=cUPPppnithARxe=z3oJw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Suspicous tune args for armv5te machines
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
X-List-Received-Date: Sun, 22 Apr 2012 16:03:05 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Apr 22, 2012 at 6:57 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Hi,
>
> Is the following still valid for the current oe-core (and toolchain-layer) toolchains:
>
> koen@dominion:/OE/tentacle/sources/openembedded-core$ git grep CCARGS_pn
> meta/conf/machine/include/tune-xscale.inc:TUNE_CCARGS_pn-webkit-gtk = "-march=armv4t"
> meta/conf/machine/include/tune-xscale.inc:TUNE_CCARGS_pn-cairo = "-march=armv4t"
>
> ?
>
> I know why and when it was added by Marcin, but is this still needed?

It was probably copied from angstrom. Its not needed since oldest gcc
we have is 4.5
last I tested it was not needed. Its been already deleted from
angstrom few months ago
this could be deleted as well.

>
> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


