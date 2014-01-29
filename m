Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id BD26A6E7AF
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 14:30:59 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1W8WAN-0005b5-P0; Wed, 29 Jan 2014 15:30:59 +0100
Message-ID: <1391005859.19023.164.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Jason Wessel <jason.wessel@windriver.com>
Date: Wed, 29 Jan 2014 14:30:59 +0000
In-Reply-To: <1391004721-15474-2-git-send-email-jason.wessel@windriver.com>
References: <1391004721-15474-1-git-send-email-jason.wessel@windriver.com>
	<1391004721-15474-2-git-send-email-jason.wessel@windriver.com>
X-Mailer: Evolution 3.8.5-2+b1 
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
	Content preview:  On Wed, 2014-01-29 at 08:12 -0600,
	Jason Wessel wrote: > # Not automake,
	no out of tree build support > -#B_pn-nativesdk-unfs3 = "${SEPB}"
	> B_pn-nativesdk-util-macros = "${SEPB}" > B_pn-nativesdk-xcb-proto =
	"${SEPB}" > B_pn-nativesdk-xcmiscproto = "${SEPB}" [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] unfs3: Fix dependencies and allow target builds
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
X-List-Received-Date: Wed, 29 Jan 2014 14:31:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-01-29 at 08:12 -0600, Jason Wessel wrote:
>  # Not automake, no out of tree build support
> -#B_pn-nativesdk-unfs3 = "${SEPB}"
>  B_pn-nativesdk-util-macros = "${SEPB}"
>  B_pn-nativesdk-xcb-proto = "${SEPB}"
>  B_pn-nativesdk-xcmiscproto = "${SEPB}"

Is that right?  I would have thought you ought to be uncommenting the
commented-out line and deleting the comment above it, whereas you're
deleting the commented-out line altogether and leaving the (now
nonsensical seeming) comment.

p.



