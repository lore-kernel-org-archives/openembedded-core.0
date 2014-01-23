Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 4CD9D6B05F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 07:04:08 +0000 (UTC)
Received: from [12.157.112.67] (helo=[10.71.2.210])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1W6EKe-0002t7-97; Thu, 23 Jan 2014 08:04:08 +0100
Message-ID: <1390460640.24755.11.camel@e130.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Saul Wold <sgw@linux.intel.com>
Date: Thu, 23 Jan 2014 07:04:00 +0000
In-Reply-To: <1390459814-15764-1-git-send-email-sgw@linux.intel.com>
References: <1390459814-15764-1-git-send-email-sgw@linux.intel.com>
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
	Content preview:  On Wed, 2014-01-22 at 22:50 -0800,
	Saul Wold wrote: > +IS_VMDK
	= '${@base_contains("IMAGE_FSTYPES", "vmdk", "true", "false", d)}' > + >
	+ if [ "${IS_VMDK}" ];
	then Does that really work? I can't quite see how it would,
	but I might be overlooking something. Presumably you did test this,
	right? [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] boot-directdisk: fix the support of vmdk
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
X-List-Received-Date: Thu, 23 Jan 2014 07:04:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-01-22 at 22:50 -0800, Saul Wold wrote:
> +IS_VMDK = '${@base_contains("IMAGE_FSTYPES", "vmdk", "true", "false", d)}'
> +
> +	if [ "${IS_VMDK}" ]; then

Does that really work?  I can't quite see how it would, but I might be
overlooking something.  Presumably you did test this, right?

p.



