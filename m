Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UbvAC-0005hA-8U for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 17:59:51 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Ubuse-0004SA-BO; Mon, 13 May 2013 17:41:40 +0200
Message-ID: <1368459699.6920.41.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
Date: Mon, 13 May 2013 16:41:39 +0100
In-Reply-To: <5190B2AE.9010102@r-finger.com>
References: <518A6B25.5000108@r-finger.com> <1368026618.27116.52.camel@ted>
	<518A7B37.8050308@r-finger.com> <1368176725.11129.9.camel@ted>
	<518CD26F.3090901@r-finger.com> <1368185566.11129.28.camel@ted>
	<518D22CC.1040002@r-finger.com> <1368206371.11129.46.camel@ted>
	<CAP9ODKqGThBAjFkc1ViF9TJhW6z-xuVwwmDOa9mXg+h=TALJpw@mail.gmail.com>
	<518D5A7D.20606@windriver.com> <5190B2AE.9010102@r-finger.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: proposal to move cogl, clutter and related recipes from oe-core to dedicated meta-clutter layer
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 May 2013 16:00:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-05-13 at 10:30 +0100, Tomas Frydrych wrote:
> Yes, but the clutter packages are not being tested, and more to the
> point, they cannot be meaningfully tested using oe-core, because such
> testing has to be done against a real OGL/GLES implementation -- Clutter
> can only be tested properly in conjunction with BSP layer(s). All you
> can test with oe-core is the mesa software rasterizer, which is just
> about the one thing nobody cares about because it is of no practical use.

It seems a bit hyperbolic to claim that testing clutter is impossible
without GPU hardware (either real or emulated).  The majority of the
code even in cogl, and virtually all the code in clutter itself, is
mostly independent of the underlying GL implementation.  From the point
of view of testing whether clutter basically "works" and is correctly
built/packaged it seems as though this ought to be quite sufficient.

Indeed, testing against Mesa is in some sense a benefit because you can
exercise both the GL and GLES2 backends (and even GLES1 if you so
desired) as well as all the windowing systems.

p.




