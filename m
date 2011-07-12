Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QgZ3W-0001v3-WF for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 11:15:03 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1QgYzk-0002wq-8e
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 11:11:08 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 12 Jul 2011 10:11:07 +0100
In-Reply-To: <1122cff5b635c23b36bc76ad58a088f522ac21a5.1310425837.git.sgw@linux.intel.com>
References: <cover.1310425837.git.sgw@linux.intel.com>
	<1122cff5b635c23b36bc76ad58a088f522ac21a5.1310425837.git.sgw@linux.intel.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310461868.6337.179.camel@phil-desktop>
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
X-List-Received-Date: Tue, 12 Jul 2011 09:15:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-11 at 16:13 -0700, Saul Wold wrote:
> This class is for packages that do not work with debian library naming

I tend to feel that most of those packages should be fixed so that they
do.  If they aren't currently getting renamed then it usually means that
they include too much (i.e. both binaries and libraries, or multiple
libraries) and should be split up so that this doesn't happen.

For the rare cases where you really do want to put multiple SOs in a
single output package you can use LEAD_SONAME, but this is virtually
never the right thing to do.

p.



