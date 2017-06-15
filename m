Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3340571A84
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 16:42:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Jun 2017 09:42:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,343,1493708400"; d="scan'208";a="1141630278"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by orsmga001.jf.intel.com with ESMTP; 15 Jun 2017 09:42:08 -0700
Message-ID: <1497545468.29576.22.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Date: Thu, 15 Jun 2017 11:51:08 -0500
In-Reply-To: <1497543585-32012-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1497533249.3942.94.camel@linuxfoundation.org>
	<1497543585-32012-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] image_types.bbclass: get rid of IMAGE_DEPENDS
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
X-List-Received-Date: Thu, 15 Jun 2017 16:42:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-06-15 at 19:19 +0300, Ed Bartosh wrote:

> +    if d.getVar('IMAGE_DEPENDS') != None:
> +        bb.fatal('IMAGE_DEPENDS is deprecated. Use do_image_<type>[depends] += "<recipe>:<task>>" instead')

s/>>/>/

also, should it be a warning instead?






