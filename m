Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U74pC-0008U7-8q for openembedded-core@lists.openembedded.org;
	Sun, 17 Feb 2013 15:02:41 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1HDqphP017476; Sun, 17 Feb 2013 13:52:51 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rvi7j6zd+n9Y; Sun, 17 Feb 2013 13:52:51 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1HDqjSb017472
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sun, 17 Feb 2013 13:52:48 GMT
Message-ID: <1361108780.32271.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Sun, 17 Feb 2013 13:46:20 +0000
In-Reply-To: <CAP9ODKqd_DbKPHu_FYnHAR2TRqb8Ouw3XuonR43P6Ze0zT9qRQ@mail.gmail.com>
References: <1361049644-27904-1-git-send-email-otavio@ossystems.com.br>
	<1361049644-27904-3-git-send-email-otavio@ossystems.com.br>
	<1361087577.31795.106.camel@ted>
	<CAP9ODKqd_DbKPHu_FYnHAR2TRqb8Ouw3XuonR43P6Ze0zT9qRQ@mail.gmail.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] libsdl: Use 'virtual/libx11' instead of hardcoding nativesdk-libx11
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
X-List-Received-Date: Sun, 17 Feb 2013 14:02:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2013-02-17 at 10:42 -0300, Otavio Salvador wrote:
> On Sun, Feb 17, 2013 at 4:52 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Sat, 2013-02-16 at 19:20 -0200, Otavio Salvador wrote:
> >> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >> ---
> >>  meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> >> index e25c597..3dbe97a 100644
> >> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> >> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> >> @@ -16,7 +16,7 @@ DEPENDS = "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
> >>             ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} \
> >>             ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
> >>             tslib"
> >> -DEPENDS_class-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11', 'nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
> >> +DEPENDS_class-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
> >
> > Don't you mean virtual/nativesdk-libx11 ?
> 
> Other places are using virtual/libx11 so I sticked to it.

Other places in nativesdk overrides?

>  For me it
> has worked but I did not change if it'd choose the right package when
> building with 'x11' (as my project now builds without it).

That doesn't make it correct.

Cheers,

Richard




