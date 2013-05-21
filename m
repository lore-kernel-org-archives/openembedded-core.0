Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 50D2B6969F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 11:20:52 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Uekcf-0006Yb-3v; Tue, 21 May 2013 13:20:53 +0200
Message-ID: <1369135252.6695.16.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
Date: Tue, 21 May 2013 12:20:52 +0100
In-Reply-To: <1369134259-12091-5-git-send-email-tf+lists.yocto@r-finger.com>
References: <1368789942-7476-1-git-send-email-tf+lists.yocto@r-finger.com>
	<1369134259-12091-1-git-send-email-tf+lists.yocto@r-finger.com>
	<1369134259-12091-5-git-send-email-tf+lists.yocto@r-finger.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 4/8] fix clutter
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
X-List-Received-Date: Tue, 21 May 2013 11:20:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-05-21 at 12:04 +0100, Tomas Frydrych wrote:
> -# Disable pretty much everything, override in platform specific set up
> -EXTRA_OECONF += "--disable-gtk-doc		\
> -	     	 ${@get_fpu_setting(bb, d)}	\
> -             	 --disable-introspection	\
> -	     	 --disable-egl-backend		\
> +# Disable backends we do not currently support building
> +EXTRA_OECONF += "--disable-introspection	\

Was this supposed to have been squashed with 3/8?

p.



