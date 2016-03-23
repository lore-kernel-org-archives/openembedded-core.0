Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 17BFB6AC00
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 17:56:41 +0000 (UTC)
Received: from elite.brightsigndigital.co.uk ([213.210.30.29]
	helo=phil-desktop) by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <pb@pbcl.net>)
	id 1ain1M-0005ce-UV; Wed, 23 Mar 2016 18:56:41 +0100
Message-ID: <1458755798.3476.186.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Bill Randle <william.c.randle@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 23 Mar 2016 17:56:38 +0000
In-Reply-To: <1458748461-4643-1-git-send-email-william.c.randle@intel.com>
References: <1458748461-4643-1-git-send-email-william.c.randle@intel.com>
X-Mailer: Evolution 3.18.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH] insane.bbclass: tighten lib_re and exec_re patterns to avoid false positive
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
X-List-Received-Date: Wed, 23 Mar 2016 17:56:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-03-23 at 08:54 -0700, Bill Randle wrote:
> lib_re would match files like "/libsoletta.so.0.0.1-gdb.py" which are
> not valid library filenames.

What are the consequences of it matching things that are not libraries?

> Tighten up the re for lib_re and exec_re so they match only valid
> sonames (.so or .so followed by major version and optional minor
> version and release).

Where does this definition of "valid sonames" come from?

p.


