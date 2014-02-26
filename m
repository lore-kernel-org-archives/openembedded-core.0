Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id DBB826F137
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 21:17:35 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1WIlrD-0008Px-Oy; Wed, 26 Feb 2014 22:17:36 +0100
Message-ID: <1393449449.2453.41.camel@e130.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Diego Sueiro <diego.sueiro@gmail.com>
Date: Wed, 26 Feb 2014 21:17:29 +0000
In-Reply-To: <1393439715-317-1-git-send-email-diego.sueiro@gmail.com>
References: <1393439715-317-1-git-send-email-diego.sueiro@gmail.com>
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
	Content preview:  On Wed, 2014-02-26 at 15:35 -0300,
	Diego Sueiro wrote: > libQtUiTools
	is only built as a static library by upstream intentionally. > So,
	libQtUiTools.a
	and libQtUiToolsE.a needs to be installed on meta-toolchain-qt > and
	meta-toolchain-qte respectively. > Whitout this static library,
	building qt apps which needs
	uitools will fail. > > qt4[-embedded]-staticdev is the package that
	contains this library and is the > only file in it. [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4] packagegroup-qt-toolchain-target.inc: add libQtUiTools static library
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
X-List-Received-Date: Wed, 26 Feb 2014 21:17:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-02-26 at 15:35 -0300, Diego Sueiro wrote:
> libQtUiTools is only built as a static library by upstream intentionally.
> So, libQtUiTools.a and libQtUiToolsE.a needs to be installed on meta-toolchain-qt
> and meta-toolchain-qte respectively.
> Whitout this static library, building qt apps which needs uitools will fail.
> 
> qt4[-embedded]-staticdev is the package that contains this library and is the
> only file in it.

If this library is intentionally static-only, shouldn't it go in qt4-dev
rather than qt4-staticdev?

p.



