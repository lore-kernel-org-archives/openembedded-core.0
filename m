Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id CA1966D06A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 13:42:36 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1VgxBt-0001FC-Qy; Thu, 14 Nov 2013 14:42:37 +0100
Message-ID: <1384436557.17320.62.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Gary Thomas <gary@mlbassoc.com>
Date: Thu, 14 Nov 2013 13:42:37 +0000
In-Reply-To: <5284CFAD.2060903@mlbassoc.com>
References: <cover.1384433183.git.Qi.Chen@windriver.com>
	<a86f7984cd1b08978d4358f862ff97d3d5cd3fb7.1384433183.git.Qi.Chen@windriver.com>
	<5284CFAD.2060903@mlbassoc.com>
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
	Content preview:  On Thu, 2013-11-14 at 06:27 -0700,
	Gary Thomas wrote: > Also, 
	is "-" actually valid? I seem to recall having problems when my build >
	tree
	had the hyphen ("-") in the path. Paths with "-" in certainly work for
	me.
	If there are any recipes which break in that situation then we should
	just fix them. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sanity.bbclass: check for validity of TMPDIR
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
X-List-Received-Date: Thu, 14 Nov 2013 13:42:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-11-14 at 06:27 -0700, Gary Thomas wrote:
> Also, is "-" actually valid?  I seem to recall having problems when my build
> tree had the hyphen ("-") in the path.

Paths with "-" in certainly work for me.  If there are any recipes which
break in that situation then we should just fix them. 

OE already has quite a range of baroque restrictions on what sort of
TMPDIR you are allowed to use (no nfs, no symlinks in the path, no
spaces in the name) and every new prohibition represents a loss in
usability.  This patch as proposed already forbids a whole range of
characters, including things like "+", and I think that disallowing "-"
as well would be a step too far.

p.



