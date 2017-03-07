Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 82C9572F5B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 16:52:44 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Mar 2017 08:52:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,258,1486454400"; d="scan'208";a="1119580844"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.141])
	by fmsmga001.fm.intel.com with ESMTP; 07 Mar 2017 08:52:45 -0800
Message-ID: <1488906009.3261.18.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Tue, 07 Mar 2017 11:00:09 -0600
In-Reply-To: <1488902424-9496-2-git-send-email-mark.hatle@windriver.com>
References: <1488902424-9496-1-git-send-email-mark.hatle@windriver.com>
	<1488902424-9496-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gpgme: Fix issue building for the target
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
X-List-Received-Date: Tue, 07 Mar 2017 16:52:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Mark, pachtest complained with this series. (manually copying and
pasting stuff from the latter tool, posted in patchwork)

On Tue, 2017-03-07 at 10:00 -0600, Mark Hatle wrote:
> gpgme failed when configuring since you can only configure for one python
> system at a time (via the inherits).  So we need to have a PACKAGECONFIG
> that defines which one [or neither] you want to use.
> 
> The prior pkgconfig patch introduced the usage of the variable PKG_CONFIG,
> which is not defined anywhere.  Define this.
> 
> When building the python module, we can not call gpg-error-config, so we
> need to find an alternative way of finding the information the setup.py.in
> requires.  (In this case, it's easy to just use the environment
> STAGING_INCDIR.)
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  .../gpgme/gpgme/python-lang-config.patch           | 50 ++++++++++++++++++++++
>  meta/recipes-support/gpgme/gpgme_1.8.0.bb          | 28 +++++++++++-
>  2 files changed, 77 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-support/gpgme/gpgme/python-lang-config.patch
> 
> diff --git a/meta/recipes-support/gpgme/gpgme/python-lang-config.patch b/meta/recipes-support/gpgme/gpgme/python-lang-config.patch

* Issue             Added patch file is missing Upstream-Status in the
header [test_upstream_status_presence] 
  Suggested fix    Add Upstream-Status: <status> to the header of
meta/recipes-support/gpgme/gpgme/python-lang-config.patch (possible
values: Pending, Submitted, Accepted, Backport, Denied, Inappropriate)





