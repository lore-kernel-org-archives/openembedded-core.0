Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1StbzW-0005ZS-HY
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 12:05:22 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:33776 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1StboQ-0005En-Os for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 05:53:54 -0400
Date: Tue, 24 Jul 2012 05:53:40 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1207240539570.19401@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: "bitbake-layers show-overlayed" doesn't match its "help" message
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
X-List-Received-Date: Tue, 24 Jul 2012 10:05:22 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  (wasn't sure whether this belonged with current layers thread, it
seemed appropriate to start a new one since it's fairly specific.)

$ bitbake-layers help
... snip ...
  show-overlayed
    list overlayed recipes (where the same recipe exists in another layer that has a higher layer priority)
... snip ...

  tested with with a yocto checkout and, sure enough, there's no
overlays:

$ bitbake-layers show-overlayed
Parsing recipes..done.
No overlayed files found.
$

  so as a test, i copied the "tiny-init" recipe from
meta-yocto/recipes-core to meta/recipes-core, and:

$ bitbake-layers show-overlayed
Parsing recipes..done.
=== Overlayed recipes ===
tiny-init:
  meta-yocto           1.0
  meta                 1.0
$

  those two layers have the same priority, but the help suggests that
you'll only see instances of recipes from layers that have a
*different* priority -- not quite true.

rday

p.s.  i'm assuming that overlaid recipes are just a bad idea anyway,
and should be used only in unusual circumstances, yes?

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


