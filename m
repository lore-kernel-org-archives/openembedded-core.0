Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 7610D60097
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 17:20:00 +0000 (UTC)
Received: from cpc5-cmbg17-2-0-cust97.5-4.cable.virginm.net ([86.30.112.98]
	helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1Z7Rrc-0002cT-D8; Tue, 23 Jun 2015 19:20:00 +0200
Message-ID: <1435079991.2483.418.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Darren Hart <dvhart@linux.intel.com>
Date: Tue, 23 Jun 2015 18:19:51 +0100
In-Reply-To: <D1AEE18F.D4FA6%dvhart@linux.intel.com>
References: <1435072967-10333-1-git-send-email-sgw@linux.intel.com>
	<1435075347.11489.87.camel@linuxfoundation.org>
	<D1AEE18F.D4FA6%dvhart@linux.intel.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] tune-i586-nlp: Add new tune file to support Quark/X1000 CPU
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
X-List-Received-Date: Tue, 23 Jun 2015 17:20:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-06-23 at 10:17 -0700, Darren Hart wrote:
> Hrm... The thing we need to avoid is quark machines accepting an i586
> package in lieu of a i586-nlp package. I don't think that's a problem here
> is it? The PACKAGE_EXTRA_ARCHS makes it so the i586-nlp package can be
> used on machines that require i586, but not vice versa - correct?

No, exactly the opposite to that. 

p.



