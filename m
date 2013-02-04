Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1U2W3O-0005uu-D4
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 01:06:26 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r14NoaWk027051
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Feb 2013 15:50:36 -0800 (PST)
Received: from e6410-2 (172.25.40.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Mon, 4 Feb 2013 15:50:33 -0800
Date: Mon, 4 Feb 2013 17:50:24 -0600
From: Peter Seebach <peter.seebach@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130204175024.3af7b9b2@e6410-2>
In-Reply-To: <1360021079.14071.174.camel@ted>
References: <1359977606-15432-1-git-send-email-constantinx.musca@intel.com>
	<20130204122309.12582d0b@e6410-2> <1360020111.14071.172.camel@ted>
	<20130204172705.0e18d279@e6410-2> <1360021079.14071.174.camel@ted>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pseudo: fix sqlite path and package missing files
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
X-List-Received-Date: Tue, 05 Feb 2013 00:06:26 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Mon, 4 Feb 2013 23:37:59 +0000
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> Agreed. Can someone send me a patch which makes it all work please? :)

I probably can. I think the 1.4.3 patch I sent out recently (sgw was
looking at it, but the binaries weren't up on the downloads server yet)
probably covers most of it, but not the case where sqlite-libdir isn't
lib, which is probably (??) a target-only case.

Can someone show me a test case where it fails, so I can add that to my
pile of pseudo test cases, and then stare at it for a while?

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


