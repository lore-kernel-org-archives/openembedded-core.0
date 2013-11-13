Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 2BCEE6D99D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 17:35:51 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1VgeKb-0008RQ-Bd; Wed, 13 Nov 2013 18:34:48 +0100
Message-ID: <1384364060.17320.34.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Yevhen Kyriukha <kirgene@gmail.com>
Date: Wed, 13 Nov 2013 17:34:20 +0000
In-Reply-To: <CADV-EXGSZuXVO7DqgGUnxCzNQUYXyCtNt1XXAbEAuN9gWisPSA@mail.gmail.com>
References: <1384354266-15425-1-git-send-email-kirgene@gmail.com>
	<5283AA52.4090102@linux.intel.com>
	<CADV-EXGSZuXVO7DqgGUnxCzNQUYXyCtNt1XXAbEAuN9gWisPSA@mail.gmail.com>
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
	Content preview:  On Wed, 2013-11-13 at 19:25 +0200,
	Yevhen Kyriukha wrote:
	> As far as I've tested curl crashes on i386 and Intel Cedartrail >
	platforms
	with internal threaded resolver. Crashes how? The original problem you
	mentioned
	is specific to the synchronous resolver. The threaded resolver doesn't
	use SIGALRM at all. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: Phil Blundell <philb@gnu.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] curl: allow build with c-ares library support.
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
X-List-Received-Date: Wed, 13 Nov 2013 17:35:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-11-13 at 19:25 +0200, Yevhen Kyriukha wrote:
> As far as I've tested curl crashes on i386 and Intel Cedartrail
> platforms with internal threaded resolver.

Crashes how?  The original problem you mentioned is specific to the
synchronous resolver.  The threaded resolver doesn't use SIGALRM at all.

p.



