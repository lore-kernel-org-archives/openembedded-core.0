Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id C19F76D77B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 12:51:53 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1VhIsM-0002A3-Lx; Fri, 15 Nov 2013 13:51:55 +0100
Message-ID: <1384519913.23724.8.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Qi.Chen@windriver.com
Date: Fri, 15 Nov 2013 12:51:53 +0000
In-Reply-To: <251777d6d4284fb929939d626990ee3f26394c05.1384512287.git.Qi.Chen@windriver.com>
References: <cover.1384512287.git.Qi.Chen@windriver.com>
	<251777d6d4284fb929939d626990ee3f26394c05.1384512287.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.4.4-4+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview:  On Fri, 2013-11-15 at 18:45 +0800,
	Qi.Chen@windriver.com wrote:
	> -FILES_sysvinit-sulogin = "${base_sbindir}/sulogin" >
	+FILES_sysvinit-sulogin
	= "${base_sbindir}/sulogin.sysvinit" At the risk of seeming dim,
	how does
	${base_sbindir}/sulogin.sysvinit get installed in the first place?
	[...] Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sysvinit: use ALTERNATIVE to manage sulogin
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
X-List-Received-Date: Fri, 15 Nov 2013 12:51:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-11-15 at 18:45 +0800, Qi.Chen@windriver.com wrote:
> -FILES_sysvinit-sulogin = "${base_sbindir}/sulogin"
> +FILES_sysvinit-sulogin = "${base_sbindir}/sulogin.sysvinit"

At the risk of seeming dim, how does ${base_sbindir}/sulogin.sysvinit
get installed in the first place?

p.



