Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id E140F6B7C9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 09:55:20 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1V9uH2-0002xW-BY; Thu, 15 Aug 2013 11:55:20 +0200
Message-ID: <1376560519.17787.16.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Rongqing Li <rongqing.li@windriver.com>
Date: Thu, 15 Aug 2013 10:55:19 +0100
In-Reply-To: <520CA4AF.4040403@windriver.com>
References: <cover.1376379182.git.rongqing.li@windriver.com>
	<02e6f25c210b0628dc4ee4482474b0e6ce5606e4.1376379182.git.rongqing.li@windriver.com>
	<520A82BA.2070706@linux.intel.com> <520B1595.3060909@windriver.com>
	<20130814065609.GQ17945@jama> <1376477217.22952.5.camel@ted>
	<20130814105915.GU17945@jama> <520CA4AF.4040403@windriver.com>
X-Mailer: Evolution 3.4.4-3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sstate.bbclass: fix parallel building issue
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
X-List-Received-Date: Thu, 15 Aug 2013 09:55:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-08-15 at 17:51 +0800, Rongqing Li wrote:
> OK, But your issue is not related to me.
> 
> I can reproduce my issue by two simple script.

If tar is deciding that the file has "changed" just because the link
count on the dentry has increased, that sounds like it is probably a bug
in tar and ought to be fixed there.

That said, I can't immediately think why autotools_copy_aclocal couldn't
use a symlink rather than a hard link which would avoid this whole
problem.  If the file is in the sysroot then there should be no risk of
it going away underneath its user.

p.



