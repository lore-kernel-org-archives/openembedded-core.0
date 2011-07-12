Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QgZ6D-0001xV-JH for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 11:17:49 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1QgZ2Q-0002x4-Sw
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 11:13:55 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 12 Jul 2011 10:13:54 +0100
In-Reply-To: <1310461868.6337.179.camel@phil-desktop>
References: <cover.1310425837.git.sgw@linux.intel.com>
	<1122cff5b635c23b36bc76ad58a088f522ac21a5.1310425837.git.sgw@linux.intel.com>
	<1310461868.6337.179.camel@phil-desktop>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310462034.6337.181.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 03/26] shared_lib.bbclass: create common class
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
X-List-Received-Date: Tue, 12 Jul 2011 09:17:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-12 at 10:11 +0100, Phil Blundell wrote:
> On Mon, 2011-07-11 at 16:13 -0700, Saul Wold wrote:
> > This class is for packages that do not work with debian library naming
> 
> I tend to feel that most of those packages should be fixed so that they
> do.  If they aren't currently getting renamed then it usually means that
> they include too much (i.e. both binaries and libraries, or multiple
> libraries) and should be split up so that this doesn't happen.

Actually, looking at the patch more carefully I guess this does
basically address the first case above (binaries and libraries).  But it
looks like it will result in the slightly confusing situation where the
libraries go into lib${PN} but the corresponding headers are in
${PN}-dev.

p.




