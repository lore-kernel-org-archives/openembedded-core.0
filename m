Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 9259360656
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 09:47:52 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1V1vfk-00072u-W8; Wed, 24 Jul 2013 11:47:53 +0200
Message-ID: <1374659271.6324.95.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 24 Jul 2013 10:47:51 +0100
In-Reply-To: <CANyK_8difMKU96M-DeL2XHrdR+RV9TFEXvgJDeVey6zktjXprQ@mail.gmail.com>
References: <cover.1374479372.git.kai.kang@windriver.com>
	<3185bfa72aaa8acd02d32f67ee51de79a24c7c19.1374479372.git.kai.kang@windriver.com>
	<1374481350.6719.83.camel@bril0118.bri.st.com>
	<51EF39C7.2060703@windriver.com>
	<CAJTo0LYcYUVxJ0pyMDKTSA_=ezGnn++nSh-MuFsFC40LBwydWw@mail.gmail.com>
	<CANyK_8difMKU96M-DeL2XHrdR+RV9TFEXvgJDeVey6zktjXprQ@mail.gmail.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] webkit-gtk: fix 'Memory exhausted' error
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
X-List-Received-Date: Wed, 24 Jul 2013 09:47:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-07-24 at 09:31 +0100, Paul Barker wrote:
> Would variables like LDFLAGS_webkit-gtk and PARALLEL_MAKE_gnuradio be
> applied to the appropriate recipes if they were set in local.conf or a
> globally inherited bbclass, or am I misunderstanding how bitbake
> parses variables?

LDFLAGS_pn-webkit-gtk and PARALLEL_MAKE_pn-gnuradio, yes.  Any of that
stuff can go in site.conf and/or local.conf, and this is where this sort
of build-environment-specific customisation belongs.

p.



