Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RYanZ-0002DX-Vr
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 11:01:53 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RYah0-00019g-CA
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 10:55:06 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 08 Dec 2011 09:55:05 +0000
In-Reply-To: <4EE06925.3050205@windriver.com>
References: <cover.1323246565.git.xiaofeng.yan@windriver.com>
	<697ca68b7e47d0392273fa5a07df0e4396e709bf.1323246565.git.xiaofeng.yan@windriver.com>
	<1323253643.26081.311.camel@phil-desktop>
	<4EE06925.3050205@windriver.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1323338106.26081.332.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 07/10] pango: add directfb DISTRO_FEATURE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Dec 2011 10:01:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2011-12-08 at 15:37 +0800, Xiaofeng Yan wrote:
> On 2011=E5=B9=B412=E6=9C=8807=E6=97=A5 18:27, Phil Blundell wrote:
> > On Wed, 2011-12-07 at 16:58 +0800, Xiaofeng Yan wrote:
> >> +PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'x11', 'x11'=
, '', d)} \
> >> +           ${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb'=
, '', d)}"
> >> +PACKAGECONFIG[x11] =3D "--with-x,--without-x,${X11DEPENDS}"
> >> +PACKAGECONFIG[directfb] =3D ",,directfb"
> > Hm, really?  I didn't think pango had any inbuilt support for DirectFB.
> > Does this really accomplish anything?
> >
> pango hadn't any inbuilt support for DirectFB.
> PACKAGECONFIG[directfb] =3D ",,directfb" just express that directfb is=
=20
> built by dependence relationship when building an image based on directfb=
.

Well, right, but if pango isn't using directfb itself then it doesn't
need directfb in its DEPENDS any more than, say, busybox does.  DirectFB
will be brought in by the dependency chains for gtk, cairo or whatever
other recipes are actually using it.

p.




