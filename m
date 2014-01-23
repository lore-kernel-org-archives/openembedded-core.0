Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 917BC6B05F
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 15:02:22 +0000 (UTC)
Received: from [12.157.112.67] (helo=[10.71.2.210])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1W6LnS-0003C8-Uo; Thu, 23 Jan 2014 16:02:23 +0100
Message-ID: <1390489330.24755.17.camel@e130.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Jason Wessel <jason.wessel@windriver.com>
Date: Thu, 23 Jan 2014 15:02:10 +0000
In-Reply-To: <1390487566-13569-3-git-send-email-jason.wessel@windriver.com>
References: <1390487566-13569-1-git-send-email-jason.wessel@windriver.com>
	<1390487566-13569-3-git-send-email-jason.wessel@windriver.com>
Organization: Phil Blundell Consulting Ltd
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
	Content preview:  On Thu, 2014-01-23 at 08:32 -0600,
	Jason Wessel wrote: > #
	Not automake, no out of tree build support > -#B_pn-unfs-server-native =
	"${SEPB}" > +#B_pn-unfs3-native = "${SEPB}" Is that still true? The
	unfs3 recipe makes it look like it does use autotools. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/6] unfs3, unfs-server: Replace all instances of unfs-server with unfs3
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
X-List-Received-Date: Thu, 23 Jan 2014 15:02:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-01-23 at 08:32 -0600, Jason Wessel wrote:
>  # Not automake, no out of tree build support
> -#B_pn-unfs-server-native = "${SEPB}"
> +#B_pn-unfs3-native = "${SEPB}"

Is that still true?  The unfs3 recipe makes it look like it does use
autotools.

p.



