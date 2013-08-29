Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id B66116BC83
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 11:49:42 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1VF0jN-0003bB-SC; Thu, 29 Aug 2013 13:49:42 +0200
Message-ID: <1377776979.28077.88.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Thu, 29 Aug 2013 12:49:39 +0100
In-Reply-To: <alpine.DEB.2.02.1308290733210.5515@oneiric>
References: <alpine.DEB.2.02.1308290628130.4283@oneiric>
	<20130829104913.GM3544@jama>
	<alpine.DEB.2.02.1308290657140.5063@oneiric>
	<20130829112725.GN3544@jama>
	<alpine.DEB.2.02.1308290733210.5515@oneiric>
X-Mailer: Evolution 3.4.4-4+b1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: appears to be inconsistency re: base-files between oe-core and meta-angstrom
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
X-List-Received-Date: Thu, 29 Aug 2013 11:49:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-08-29 at 07:37 -0400, Robert P. J. Day wrote:
>   distroless. i realize i *could* set a value for DISTRO, but it would
> seem that i shouldn't have to in order to avoid a build error.

Well, either you're using angstrom or you aren't.  If you do want to use
it then you ought to set DISTRO appropriately, and if you don't want to
use it then you probably oughtn't to have the angstrom layer included at
all.  

Trying to use the angstrom .bbappends and files with a different (or no)
distro configuration will give you a set of metadata that's neither one
thing nor the other and, even if you didn't get a build error, there's
no guarantee that the resulting image would actually work.

p.



