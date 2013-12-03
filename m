Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 45EDE610DC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2013 22:09:59 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.7]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1Vny9o-0002ue-7Y; Tue, 03 Dec 2013 23:09:55 +0100
Message-ID: <1386108562.8293.8.camel@x121e.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Tue, 03 Dec 2013 22:09:22 +0000
In-Reply-To: <ae7e0f907b72ad9af0a078bdf317a7eb10315c7f.1386078157.git.hongxu.jia@windriver.com>
References: <cover.1386078157.git.hongxu.jia@windriver.com>
	<ae7e0f907b72ad9af0a078bdf317a7eb10315c7f.1386078157.git.hongxu.jia@windriver.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.4.4-3 
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
	Content preview:  On Tue, 2013-12-03 at 21:46 +0800,
	Hongxu Jia wrote: > +-
	echo search $new_domain_search >> /etc/resolv.conf.dhclient > ++ echo
	search
	$new_domain_search >> $sysconfdir/esolv.conf.dhclient Should that be
	"$sysconfdir/resolv.conf.dhclient"? [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] dhclient-script: let resolv.conf and resolv.conf.dhclient on the same direcotry
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
X-List-Received-Date: Tue, 03 Dec 2013 22:10:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-12-03 at 21:46 +0800, Hongxu Jia wrote:
> +-      echo search $new_domain_search >> /etc/resolv.conf.dhclient
> ++      echo search $new_domain_search >> $sysconfdir/esolv.conf.dhclient

Should that be "$sysconfdir/resolv.conf.dhclient"?

p.



