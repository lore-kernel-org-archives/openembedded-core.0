Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 0BDA26E413
	for <Openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 21:38:17 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1WKx2X-0006J5-Af; Tue, 04 Mar 2014 22:38:17 +0100
Message-ID: <1393969091.4151.3.camel@e130.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: nitin.a.kamble@intel.com
Date: Tue, 04 Mar 2014 21:38:11 +0000
In-Reply-To: <a63693d8974ab55ba1031cf36302f28c4cc86c22.1393957379.git.nitin.a.kamble@intel.com>
References: <cover.1393957379.git.nitin.a.kamble@intel.com>
	<a63693d8974ab55ba1031cf36302f28c4cc86c22.1393957379.git.nitin.a.kamble@intel.com>
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
	Content preview:  On Tue, 2014-03-04 at 10:28 -0800,
	nitin.a.kamble@intel.com
	wrote: > - ("virtual/kernel" in provides) and (target_os ==
	"linux-gnux32")):
	> + (("virtual/kernel" in provides) or (KERNEL_MODULE_RECIPE == "1"))
	and (target_os == "linux-gnux32")): [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: Openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 1/1] QA_check: special case kernel modules for x32 targets
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
X-List-Received-Date: Tue, 04 Mar 2014 21:38:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-03-04 at 10:28 -0800, nitin.a.kamble@intel.com wrote:
> -        ("virtual/kernel" in provides) and (target_os == "linux-gnux32")):
> +        (("virtual/kernel" in provides) or (KERNEL_MODULE_RECIPE == "1")) and (target_os == "linux-gnux32")):

Can you not use bb.data.inherits_class("module") rather than adding this
extra variable?

Also, out of curiosity, I don't entirely understand how the code above
can possibly work.  KERNEL_MODULE_RECIPE is a bitbake variable that's
either defined to 1 or not defined at all, right?  Is there some special
magic nowadays that allows you to refer to it transparently from python
code without using d.getVar()?

p.



