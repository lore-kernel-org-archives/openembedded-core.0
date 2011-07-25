Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QlNj0-0006iR-Fi
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 18:09:46 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QlNey-0000uc-IX
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 18:05:36 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jul 2011 17:05:35 +0100
In-Reply-To: <4E2D93D3.7030505@mentor.com>
References: <cover.1311352057.git.tom_rini@mentor.com>
	<516e42bf64159cbea7c5500eb2dbc6452ca3825a.1311352057.git.tom_rini@mentor.com>
	<1311609656.30326.246.camel@phil-desktop> <4E2D93D3.7030505@mentor.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311609936.30326.248.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 6/8] siteinfo: Move certain db entries to common-linux
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
X-List-Received-Date: Mon, 25 Jul 2011 16:09:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-25 at 09:03 -0700, Tom Rini wrote:
> On 07/25/2011 09:00 AM, Phil Blundell wrote:
> > On Fri, 2011-07-22 at 09:28 -0700, Tom Rini wrote:
> >> +db_cv_path_ar=${db_cv_path_ar=/usr/bin/ar}
> >> +db_cv_path_chmod=${db_cv_path_chmod=/bin/chmod}
> >> +db_cv_path_cp=${db_cv_path_cp=/bin/cp}
> >> +db_cv_path_ln=${db_cv_path_ln=/bin/ln}
> >> +db_cv_path_mkdir=${db_cv_path_mkdir=/bin/mkdir}
> >> +db_cv_path_ranlib=${db_cv_path_ranlib=/usr/bin/ranlib}
> >> +db_cv_path_rm=${db_cv_path_rm=/bin/rm}
> >> +db_cv_path_sh=${db_cv_path_sh=/bin/sh}
> >> +db_cv_path_strip=${db_cv_path_strip=/usr/bin/strip}
> > 
> > Those contain assumptions about ${bindir} and ${base_bindir} which are
> > not necessarily valid.  I think db should probably be patched for those
> > rather than putting them here,
> 
> It's possible they simply aren't used anymore, if micro in oe.dev is
> building / working with db.

Yeah, could be.  (I haven't checked recently but I don't recall any db
breakage with micro in oe.dev.)  It does seem a bit weird that db would
want to use things like "strip".

p.





