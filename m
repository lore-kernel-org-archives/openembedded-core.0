Received: from mho-03-ewr.mailhop.org ([204.13.248.66]
	helo=mho-01-ewr.mailhop.org) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <blloyd@familyhonor.net>) id 1TEN1X-0001LK-Rp
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 18:21:15 +0200
Received: from [98.142.68.244] (helo=lloydserv.familyhonor.net)
	by mho-01-ewr.mailhop.org with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.72) (envelope-from <blloyd@familyhonor.net>)
	id 1TEMpG-000LhO-Bl; Wed, 19 Sep 2012 16:08:34 +0000
Received: from [10.1.7.39] (ICNET-66-210-165-231.icnet.net [66.210.165.231])
	(authenticated bits=0)
	by lloydserv.familyhonor.net (8.14.5/8.14.5) with ESMTP id
	q8JG8Uit027653
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO);
	Wed, 19 Sep 2012 11:08:31 -0500
X-Mail-Handler: Dyn Standard SMTP by Dyn
X-Originating-IP: 98.142.68.244
X-Report-Abuse-To: abuse@dyndns.com (see
	http://www.dyndns.com/services/sendlabs/outbound_abuse.html for
	abuse reporting information)
X-MHO-User: U2FsdGVkX19DLI9v/H+4utEWtMAbySHX/kDwoO2FfUI=
Message-ID: <1348070906.1829.24.camel@omclinuxballt.devnet.ordermatic.net>
From: Brian Lloyd <blloyd@familyhonor.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Sep 2012 11:08:26 -0500
In-Reply-To: <CAMKF1sp=qvEm+1VBXPQU4rT5AHCLqrY0ihpmT8GC5na50j7pZQ@mail.gmail.com>
References: <1348007893.20356.21.camel@omclinuxballt.devnet.ordermatic.net>
	<CAMKF1sp=qvEm+1VBXPQU4rT5AHCLqrY0ihpmT8GC5na50j7pZQ@mail.gmail.com>
X-Mailer: Evolution 3.4.4 (3.4.4-1.fc17) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: building wxwidgets under oe-core
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
X-List-Received-Date: Wed, 19 Sep 2012 16:21:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Thank you, the referenced binutils was very informative on how to make
this work.

On Tue, 2012-09-18 at 15:47 -0700, Khem Raj wrote:
...
> > tar files for wxWidgets doesn't have the issues that the forced
> > autoreconf is trying to avoid but the attempt to fix the issue is
> > bringing in all sorts of added files/dependencies required.  Or is there
> > a way to use the autotools class which will ensure the hack code does
> > not fire?
> >
> 
> you can always override do_configure () { oe_runconf } sort of thing see
> how binutils or gcc does it.




