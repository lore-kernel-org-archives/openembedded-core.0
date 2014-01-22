Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 322BD60017
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 07:08:20 +0000 (UTC)
Received: from [12.157.112.67] (helo=[10.71.2.210])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1W5rv8-00020h-KJ; Wed, 22 Jan 2014 08:08:19 +0100
Message-ID: <1390374490.24755.2.camel@e130.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Kai Kang <kai.kang@windriver.com>
Date: Wed, 22 Jan 2014 07:08:10 +0000
In-Reply-To: <1390360372-10947-1-git-send-email-kai.kang@windriver.com>
References: <1390360372-10947-1-git-send-email-kai.kang@windriver.com>
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
	Content preview:  On Wed, 2014-01-22 at 11:12 +0800,
	Kai Kang wrote: > Update
	eglibc-package.inc to let eglibc-dbg provides libc6-dbg. > > The use
	case
	is that when libc6-dbg is needded to be installed into > image, we don't
	need change glibc-dbg to uclibc-dbg in recipe when we > change to use
	package
	uclibc as default C library. > -RPROVIDES_${PN}-dbg = "glibc-dbg" >
	+RPROVIDES_${PN}-dbg = "glibc-dbg libc6-dbg" [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc-dbg: provides libc6-dbg
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
X-List-Received-Date: Wed, 22 Jan 2014 07:08:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-01-22 at 11:12 +0800, Kai Kang wrote:
> Update eglibc-package.inc to let eglibc-dbg provides libc6-dbg.
> 
> The use case is that when libc6-dbg is needded to be installed into
> image, we don't need change glibc-dbg to uclibc-dbg in recipe when we
> change to use package uclibc as default C library.
> -RPROVIDES_${PN}-dbg = "glibc-dbg"
> +RPROVIDES_${PN}-dbg = "glibc-dbg libc6-dbg"

Isn't PKG_${PN}-dbg set to libc6-dbg anyway (by libc-common.bbclass)?
Can you explain the use case and justification for this change a bit
more clearly?

p.



