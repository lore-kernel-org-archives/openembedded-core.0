Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U7rKh-00022O-6v for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 18:50:23 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1JHeYdU030228; Tue, 19 Feb 2013 17:40:35 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TQdopqPFZlFc; Tue, 19 Feb 2013 17:40:34 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1JHeMt3030201
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 19 Feb 2013 17:40:29 GMT
Message-ID: <1361295220.5927.46.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 19 Feb 2013 09:33:40 -0800
In-Reply-To: <CAP9ODKpL1KUmq1L6r9aHarBcG-UcThvEqF0OWwxkfxYiNhbcNw@mail.gmail.com>
References: <1361123592-32572-1-git-send-email-otavio@ossystems.com.br>
	<1361123592-32572-4-git-send-email-otavio@ossystems.com.br>
	<5123AE35.5020007@linux.intel.com>
	<CAP9ODKpL1KUmq1L6r9aHarBcG-UcThvEqF0OWwxkfxYiNhbcNw@mail.gmail.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 4/5] qt4-tools: Drop libx11 dependency when building without 'x11' distro feature
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
X-List-Received-Date: Tue, 19 Feb 2013 17:50:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-02-19 at 13:57 -0300, Otavio Salvador wrote:
> On Tue, Feb 19, 2013 at 1:54 PM, Saul Wold <sgw@linux.intel.com> wrote:
> > On 02/17/2013 09:53 AM, Otavio Salvador wrote:
> >>
> >> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >> ---
> >>   meta/recipes-qt/qt4/nativesdk-qt4-tools.inc | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
> >> b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
> >> index cfc6fd8..d7ce8dc 100644
> >> --- a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
> >> +++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
> >> @@ -1,10 +1,10 @@
> >>   DESCRIPTION = "SDK tools for Qt/[X11|Mac|Embedded] version 4.x"
> >> -DEPENDS = "nativesdk-zlib nativesdk-dbus nativesdk-libx11 qt4-native"
> >> +DEPENDS = "nativesdk-zlib nativesdk-dbus
> >> ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11', '',
> >> d)} qt4-native"
> >>   SECTION = "libs"
> >>   HOMEPAGE = "http://qt.nokia.com"
> >>   LICENSE = "LGPLv2.1 | GPLv3"
> >>
> >> -INC_PR = "r13"
> >> +INC_PR = "r14"
> >>
> >>   FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt4-${PV}:"
> >>
> >>
> >
> > Does this also need a change to the EXTRA_OECONF to ensure that the x11
> > functionality is disabled by default in the configuration.
> 
> I didn't find this option; it'd be great so we'd ensure it wouldn't
> link against host x11.

We need to find or patch that option in otherwise this is not a viable
change.

Cheers,

Richard




