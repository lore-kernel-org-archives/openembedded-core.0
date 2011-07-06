Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QePVZ-0007et-PG for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 12:39:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p66AZFZ7013088
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jul 2011 11:35:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13041-01 for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2011 11:35:12 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p66AZAXe013082
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jul 2011 11:35:10 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309943646.6337.5.camel@phil-desktop>
References: <696f00b67217242f3a372d070c2473f8ced639ed.1309906154.git.richard.purdie@linuxfoundation.org>
	<d0bae3ed1b9aead05a353ade871e71bf5b1c01b1.1309906154.git.richard.purdie@linuxfoundation.org>
	<1309943646.6337.5.camel@phil-desktop>
Date: Wed, 06 Jul 2011 11:34:37 +0100
Message-ID: <1309948477.20015.776.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 02/17] connman: Package unpackaged .la file
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
X-List-Received-Date: Wed, 06 Jul 2011 10:39:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-06 at 10:14 +0100, Phil Blundell wrote:
> On Tue, 2011-07-05 at 23:51 +0100, Richard Purdie wrote:
> > +FILES_${PN}-dev += "${libdir}/connman/plugins/*.la"
> 
> Actually, in this specific case, I think adding *.la to FILES is the
> wrong thing to do.  The DSOs in question are plugins, not libraries, and
> nobody is ever going to link against them.  So the corresponding .la
> files (and the .so symlinks, if those are also getting created) really
> are just dross and should be deleted.

Ever is a strong word, you might want to wrap and customise a plugin or
something :)

Seriously, I'm in two minds on this and had patches both ways. In the
end I decided it was less ugly to package them than have the metadata
covered in .la file deletions which would likely encourage people to
delete library .la files too and not see the subtle difference.

There are also rumours that some libltdl derived plugin modules use
the .la files under certain circumstances. I suspect connman doesn't use
libltdl but I didn't check. I also suspect that if it did need them, the
standard package would need to include them. Since it presumably works
as is, it therefore mustn't need them. Its a useful thing to keep in
mind though since plugins doesn't necessarily mean no need for the .la
files (imagemagik was software that used the .la files for plugins
iirc).

Cheers,

Richard







