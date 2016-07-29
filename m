Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 12D02607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 11:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6TBmbnx021493; Fri, 29 Jul 2016 12:48:37 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Iia282JmY1er; Fri, 29 Jul 2016 12:48:37 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6TBmXgY021490
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 29 Jul 2016 12:48:35 +0100
Message-ID: <1469792913.9142.56.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Date: Fri, 29 Jul 2016 12:48:33 +0100
In-Reply-To: <alpine.LFD.2.20.1607290735180.23808@localhost.localdomain>
References: <alpine.LFD.2.20.1607290725440.23675@localhost.localdomain>
	<alpine.LFD.2.20.1607290735180.23808@localhost.localdomain>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: want to verify proper use of run-postinsts, if i may
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
X-List-Received-Date: Fri, 29 Jul 2016 11:48:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-07-29 at 07:43 -0400, Robert P. J. Day wrote:
> On Fri, 29 Jul 2016, Robert P. J. Day wrote:
> 
> ... snip ...
> 
> > am i missing anything?  i'm assuming i'd use a .bbappend recipe to
> > add the script names to SRC_URI, then define "do_install_append()"
> > to manually copy them over, or is there a proper way to do that i'm
> > not seeing?
> 
>   never mind, just found an example that confirmed just what i
> suspected:
> 
> https://github.com/meta-debian/meta-debian/blob/daisy/recipes-debian/
> run-postinsts/run-postinsts_1.0.bbappend

Personally, I wouldn't take meta-debian as a good example of anything,
that layer is doing some things which I'd find questionable. Obviously
they are free to do so though.

Most of the time the package manager sets up things to run under run
-postinsts as needed. Yes, you can do this automatically, but why not
just write a postinstall for your package and defer it to first boot if
that is what you need?

Cheers,

Richard



