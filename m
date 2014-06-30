Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 0250760850
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 19:31:32 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 04B522232CC0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 21:31:30 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 2D6792232CBF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 21:31:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de (f053010078.adsl.alicedsl.de
	[78.53.10.78]) by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 21:31:28 +0200 (CEST)
Date: Mon, 30 Jun 2014 21:31:18 +0200
From: Henning Heinold <henning@itconsulting-heinold.de>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Message-ID: <20140630193117.GA25772@mail.itconsulting-heinold.de>
References: <20140630132926.5436.qmail@f4mail-235-92.rediffmail.com>
MIME-Version: 1.0
In-Reply-To: <20140630132926.5436.qmail@f4mail-235-92.rediffmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: Reagrding meta-networking
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
X-List-Received-Date: Mon, 30 Jun 2014 19:31:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 30, 2014 at 01:29:26PM -0000, Himanshu  Pandey wrote:
> Hi,
> 
> Since I want dhcp and pppoe, so I downloaded the same from git and included meta-networking layer in bblayers.conf. This layer is getting compiled but somehow dhcp and pppoe are not getting included in the final image. So what I have to do inorder to add dhcp and pppoe in the final image.
> 
> Please help.
> 
> Regards,
> Himanshu

IMAGE_INSTALL += "packagename_dhcp packagname_pppoe"

Be aware that recipe(bb)-name is mostly not the resulting packagename.

Bye Henning

