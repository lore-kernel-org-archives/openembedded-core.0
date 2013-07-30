Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 99D2E6B1C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 13:24:13 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1V49uQ-0004Ib-1k; Tue, 30 Jul 2013 15:24:14 +0200
Message-ID: <1375190653.8017.0.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Ross Burton <ross.burton@intel.com>
Date: Tue, 30 Jul 2013 14:24:13 +0100
In-Reply-To: <1375190038-21751-1-git-send-email-ross.burton@intel.com>
References: <1375190038-21751-1-git-send-email-ross.burton@intel.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bluez5: Add obex-profiles as a PACKAGECONFIG, package obexd separately
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
X-List-Received-Date: Tue, 30 Jul 2013 13:24:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-07-30 at 14:13 +0100, Ross Burton wrote:
> --enable-obex controls if obexd supports extra profiles (currently IRMC and
> PBAB), which brings in a dependency on libical for the dummy phonebook
> implementation.
> 
> Based on work by Saul Wold <sgw@linux.intel.com>.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/buildhistory.bbclass           |    1 +

I don't suppose you intended to send that change to buildhistory as part
of this patch.

p.



