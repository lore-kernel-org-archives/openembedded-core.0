Received: from mho-03-ewr.mailhop.org ([204.13.248.66]
	helo=mho-01-ewr.mailhop.org) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <blloyd@familyhonor.net>) id 1TE6d7-0000ff-BE
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 00:50:57 +0200
Received: from [98.142.68.244] (helo=lloydserv.familyhonor.net)
	by mho-01-ewr.mailhop.org with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.72) (envelope-from <blloyd@familyhonor.net>)
	id 1TE6Qq-0001ta-Q3 for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 22:38:16 +0000
Received: from [10.1.7.39] (ICNET-66-210-165-231.icnet.net [66.210.165.231])
	(authenticated bits=0)
	by lloydserv.familyhonor.net (8.14.5/8.14.5) with ESMTP id
	q8IMcDSG026566
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 17:38:14 -0500
X-Mail-Handler: Dyn Standard SMTP by Dyn
X-Originating-IP: 98.142.68.244
X-Report-Abuse-To: abuse@dyndns.com (see
	http://www.dyndns.com/services/sendlabs/outbound_abuse.html for
	abuse reporting information)
X-MHO-User: U2FsdGVkX19L6adrZ+5XhU9rBRQnz2Tb/fkX7KZPwOo=
Message-ID: <1348007893.20356.21.camel@omclinuxballt.devnet.ordermatic.net>
From: Brian Lloyd <blloyd@familyhonor.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2012 17:38:13 -0500
X-Mailer: Evolution 3.4.4 (3.4.4-1.fc17) 
Mime-Version: 1.0
Subject: building wxwidgets under oe-core
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
X-List-Received-Date: Tue, 18 Sep 2012 22:50:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Before going to the core methodology, the classic openembedded had
support for building wxwidgets.

That library is one that does not appear to have been picked back up
since the refactoring of the code, either because there wasn't much
interest or else it proved hard to do.
        
When I tried it myself, I found that the autotools class assumed use of
all parts of autotools, which unfortunately wxwidgets doesn't do.  It
almost looks like I would have to write a custom class (or include it
all in the wxwidgets packet/includes) that only calls configure instead
of trying to do autoreconf (as well as deleting the bakefile generated
acinclude.m4).
        
Does anyone have any suggestions how to fit these two systems together
smoothly in a way that is likely future change resistant?  Is making a
custom class like configure_only.bbclass a good idea?  After all, the
tar files for wxWidgets doesn't have the issues that the forced
autoreconf is trying to avoid but the attempt to fix the issue is
bringing in all sorts of added files/dependencies required.  Or is there
a way to use the autotools class which will ensure the hack code does
not fire?
        
Of course, if someone has already made this work and it's somewhere I
missed, a pointer to where it is would be greatly appreciated.

        
Brian Lloyd
        
        
        



