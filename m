Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TdMmu-0002g7-LA for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 16:09:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAREt92J004297;
	Tue, 27 Nov 2012 14:55:09 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03657-05; Tue, 27 Nov 2012 14:55:04 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAREt02s004277
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 27 Nov 2012 14:55:02 GMT
Message-ID: <1354028099.21863.100.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Tue, 27 Nov 2012 14:54:59 +0000
In-Reply-To: <alpine.DEB.2.02.1211270512010.16369@oneiric>
References: <alpine.DEB.2.02.1211270427320.17683@oneiric>
	<alpine.DEB.2.02.1211270512010.16369@oneiric>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: qemuarm: configure of bison fails, claims to need flex [SOLVED?]
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
X-List-Received-Date: Tue, 27 Nov 2012 15:09:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-11-27 at 05:19 -0500, Robert P. J. Day wrote:
> On Tue, 27 Nov 2012, Robert P. J. Day wrote:
> 
> >
> >   trying to build absolutely stock qemuarm image with current oe-core,
> > got:
> >
> > ERROR: Task 800
> > (virtual:native:/home/rpjday/OE/dist/layers/oe-core/meta/recipes-devtools/bison/bison_2.5.1.bb,
> > do_configure) failed with exit code '1'
> >
> > and the log file claimed that bison needed flex.  i'm doing it all
> > over again from scratch just to make sure it wasn't something silly
> > i did, i'll report back if i can reproduce it.
> 
>   ah, i see where i did something unapproved -- to test what i could
> add to the ASSUME_PROVIDED list, i added this to my local.conf:
> 
> ASSUME_PROVIDED += "m4 quilt"
> 
> which caused the configure step for bison to fail, claiming that it
> needed flex.  should i have expected that?  am i misunderstanding the
> rationale for ASSUME_PROVIDED?

You are misunderstanding the syntax. Were you not meaning m4-native and
quilt-native?

Cheers,

Richard



