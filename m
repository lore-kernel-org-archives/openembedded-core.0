Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SlqUn-0007l9-PX
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 01:57:34 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jul 2012 16:46:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="163319761"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by azsmga001.ch.intel.com with ESMTP; 02 Jul 2012 16:46:31 -0700
Message-ID: <4FF232D7.70906@linux.intel.com>
Date: Mon, 02 Jul 2012 16:46:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: "Dennis.Yxun" <dennis.yxun@gmail.com>
References: <1340859395-13638-1-git-send-email-dennis.lan@actions-semi.com>
	<4FEC93ED.2040102@linux.intel.com>
	<CAF1ZMEfVGmrhzMHwKErPo8x1wZCy_ZeVAGS4qDctpQ=d_jsAkg@mail.gmail.com>
In-Reply-To: <CAF1ZMEfVGmrhzMHwKErPo8x1wZCy_ZeVAGS4qDctpQ=d_jsAkg@mail.gmail.com>
Cc: floppym@gentoo.org, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] openjade-native: fix undefined Getopts error, use std namespace
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
X-List-Received-Date: Mon, 02 Jul 2012 23:57:34 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/02/2012 03:24 PM, Dennis.Yxun wrote:
> hi saul:
>    please see my comment as following
>
I do not understand what you are getting at here?

You PATCH file openjade-1.3.2/msggen.pl.patch is what is missing the 
Upsteam-Status: and SOB (Signed-off-by), the commit message what you 
have for SOB is Ok, the commit message itself should not have the 
Upstream-Status: tag, it belongs in the .patch file header.

Sau!

> dennis
>
> At 2012-6-29 AM1:27，"Saul Wold" &
>
>     On 06/27/2012 09:56 PM, dennis lan wrote:
>
>         From: Dennis Lan<dennis.yxun@gmail.com
>         <mailto:dennis.yxun@gmail.com>>
>
>         Using Gentoo Linux as the build host, it fails without this patch
>         Use Getopt::Std in place of getopts.pl <http://getopts.pl>.
>
>         https://bugs.gentoo.org/show___bug.cgi?id=420083
>         <https://bugs.gentoo.org/show_bug.cgi?id=420083>
>
>         which following error:
>         /usr/bin/perl -w ./../msggen.pl <http://msggen.pl> -l
>         jstyleModule InterpreterMessages.msg
>         /usr/bin/perl -w ./../msggen.pl <http://msggen.pl> -l
>         jstyleModule DssslAppMessages.msg
>         Undefined subroutine&main::Getopts called at ./../msggen.pl
>         <http://msggen.pl> line 22.
>         make[2]: *** [InterpreterMessages.h] Error 2
>         make[2]: *** Waiting for unfinished jobs....
>         Undefined subroutine&main::Getopts called at ./../msggen.pl
>         <http://msggen.pl> line 22.
>         make[2]: *** [DssslAppMessages.h] Error 2
>
>         Upstream-Status: Submitted
>         [openjade-devel@lists.__sourceforge.net
>         <mailto:openjade-devel@lists.sourceforge.net>]
>
>     This needs to be in the patch file itself, we can track the patches
>     better that way.
>
>         Signed-off-by: Dennis Lan<dennis.yxun@gmail.com
>         <mailto:dennis.yxun@gmail.com>>
>         ---
>            .../openjade/openjade-1.3.2/__msggen.pl.patch        |   32
>         ++++++++++++++++++++
>            .../openjade/openjade-native___1.3.2.bb
>         <http://openjade-native_1.3.2.bb>              |    1 +
>            2 files changed, 33 insertions(+), 0 deletions(-)
>            create mode 100644
>         meta/recipes-devtools/__openjade/openjade-1.3.2/__msggen.pl.patch
>
>         diff --git
>         a/meta/recipes-devtools/__openjade/openjade-1.3.2/__msggen.pl.patch
>         b/meta/recipes-devtools/__openjade/openjade-1.3.2/__msggen.pl.patch
>         new file mode 100644
>         index 0000000..1afe68b
>         --- /dev/null
>         +++
>         b/meta/recipes-devtools/__openjade/openjade-1.3.2/__msggen.pl.patch
>
>
>     Please add comment Upstream-Status and SOB to the patch itself.
>
>     Thanks
>     Sau!
>
>         @@ -0,0 +1,32 @@
>         +Use Getopt::Std in place of getopts.pl <http://getopts.pl>.
>         +https://bugs.gentoo.org/show___bug.cgi?id=420083
>         <https://bugs.gentoo.org/show_bug.cgi?id=420083>
>         +
>         +--- a/msggen.pl <http://msggen.pl>
>         ++++ b/msggen.pl <http://msggen.pl>
>         +@@ -4,6 +4,7 @@
>         + # See the file COPYING for copying permission.
>         +
>         + use POSIX;
>         ++use Getopt::Std;
>         +
>         + # Package and version.
>         + $package = 'openjade';
>         +@@ -18,8 +19,7 @@
>         + undef $opt_l;
>         + undef $opt_p;
>         + undef $opt_t;
>         +-do 'getopts.pl <http://getopts.pl>';
>         +-&Getopts('l:p:t:');
>         ++getopts('l:p:t:');
>         + $module = $opt_l;
>         + $pot_file = $opt_p;
>         +
>         +@@ -72,7 +72,7 @@
>         +     else {
>         +       $field[0] =~ /^[IWQXE][0-9]$/ ||&error("invalid first
>         field");;
>         +       $type[$num] = substr($field[0], 0, 1);
>         +-      $argc = int(substr($field[0], 1, 1));
>         ++      $argc = substr($field[0], 1, 1);
>         +     }
>         +     $nargs[$num] = $argc;
>         +     $field[1] =~ /^[a-zA-Z_][a-zA-Z0-9_]+$/ ||&error("invalid
>         tag");
>         diff --git
>         a/meta/recipes-devtools/__openjade/openjade-native_1.3.__2.bb
>         <http://openjade-native_1.3.2.bb>
>         b/meta/recipes-devtools/__openjade/openjade-native_1.3.__2.bb
>         <http://openjade-native_1.3.2.bb>
>         index 5b29c1f..efd1e11 100644
>         ---
>         a/meta/recipes-devtools/__openjade/openjade-native_1.3.__2.bb
>         <http://openjade-native_1.3.2.bb>
>         +++
>         b/meta/recipes-devtools/__openjade/openjade-native_1.3.__2.bb
>         <http://openjade-native_1.3.2.bb>
>         @@ -14,6 +14,7 @@ RDEPENDS_${PN} = "sgml-common-native"
>
>            SRC_URI =
>         "${SOURCEFORGE_MIRROR}/__openjade/openjade-${PV}.tar.gz \
>                       file://makefile.patch \
>         +           file://msggen.pl.patch \
>                       file://reautoconf.patch \
>                     file://user-declared-default-__constructor.patch"
>


