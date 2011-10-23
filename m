Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RI4WI-0003O4-Km
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Oct 2011 22:19:46 +0200
Received: from mail-pz0-f44.google.com ([209.85.210.44])
	by mga03.intel.com with ESMTP/TLS/RC4-MD5; 23 Oct 2011 13:13:49 -0700
Received: by pzk4 with SMTP id 4so33709415pzk.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2011 13:13:49 -0700 (PDT)
Received: by 10.68.74.4 with SMTP id p4mr43016626pbv.47.1319400828706;
	Sun, 23 Oct 2011 13:13:48 -0700 (PDT)
Received: from [192.168.0.34] ([96.24.77.242])
	by mx.google.com with ESMTPS id e10sm50504632pbq.10.2011.10.23.13.13.47
	(version=SSLv3 cipher=OTHER); Sun, 23 Oct 2011 13:13:48 -0700 (PDT)
Message-ID: <4EA4757A.5010106@intel.com>
Date: Sun, 23 Oct 2011 13:13:46 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1319394187.git.sgw@linux.intel.com>
	<9d70a72f5ab24bc0424f11311c8eb6b19f3d2987.1319394187.git.sgw@linux.intel.com>
	<CAMKF1soJ1Kv77_dNijQTWjzk8W+M5z2+yg2SUPxZtADLgum2CA@mail.gmail.com>
In-Reply-To: <CAMKF1soJ1Kv77_dNijQTWjzk8W+M5z2+yg2SUPxZtADLgum2CA@mail.gmail.com>
Subject: Re: [CONSOLIDATED PULL 24/27] texi2html: Added recipe from OE
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
X-List-Received-Date: Sun, 23 Oct 2011 20:19:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/2011 01:06 PM, Khem Raj wrote:
>
>
> On Sunday, October 23, 2011, Saul Wold <sgw@linux.intel.com
> <mailto:sgw@linux.intel.com>> wrote:
>  > Needed to build oe-core with oe-core
>
Nope, this is needed on the target image to build OE-core with an 
OE-Core image.

Sau!
> Oe-Core with oe-core did u mean meta-oe in one place ?
>  >
>  > Signed-off-by: Saul Wold <sgw@linux.intel.com
> <mailto:sgw@linux.intel.com>>
>  > ---
>  >  meta/recipes-extended/texi2html/texi2html_1.82.bb
> <http://texi2html_1.82.bb> |   14 ++++++++++++++
>  >  1 files changed, 14 insertions(+), 0 deletions(-)
>  >  create mode 100644 meta/recipes-extended/texi2html/texi2html_1.82.bb
> <http://texi2html_1.82.bb>
>  >
>  > diff --git a/meta/recipes-extended/texi2html/texi2html_1.82.bb
> <http://texi2html_1.82.bb>
> b/meta/recipes-extended/texi2html/texi2html_1.82.bb
> <http://texi2html_1.82.bb>
>  > new file mode 100644
>  > index 0000000..f19b576
>  > --- /dev/null
>  > +++ b/meta/recipes-extended/texi2html/texi2html_1.82.bb
> <http://texi2html_1.82.bb>
>  > @@ -0,0 +1,14 @@
>  > +DESCRIPTION = "Perl script that converts Texinfo to HTML"
>  > +HOMEPAGE    = "http://www.nongnu.org/texi2html/"
>  > +SECTION     = "console/utils"
>  > +LICENSE     = "GPLv2"
>  > +LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>  > +
>  > +PR = "r0"
>  > +
>  > +SRC_URI     =
> "http://download.savannah.gnu.org/releases/texi2html/${P}.tar.bz2"
>  > +
>  > +SRC_URI[md5sum] = "a8a9193c0ac1bec2f3ca7be40a5a82eb"
>  > +SRC_URI[sha256sum] =
> "d69c1effc416896409003ea64fdb21152cc0a9a7c665d437a0a3bef9b588b4f1"
>  > +
>  > +inherit autotools
>  > --
>  > 1.7.6.4
>  >
>  >
>  > _______________________________________________
>  > Openembedded-core mailing list
>  > Openembedded-core@lists.openembedded.org
> <mailto:Openembedded-core@lists.openembedded.org>
>  > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>  >
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



