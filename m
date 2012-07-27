Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sucih-0004xY-Bc
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 07:04:11 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Jul 2012 21:52:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="172059155"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by orsmga001.jf.intel.com with ESMTP; 26 Jul 2012 21:52:38 -0700
Message-ID: <50121E96.50308@linux.intel.com>
Date: Thu, 26 Jul 2012 21:52:38 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1343361755.git.sgw@linux.intel.com>
In-Reply-To: <cover.1343361755.git.sgw@linux.intel.com>
Subject: Re: [RFC 00/34] Clear update-alternatives WARNINGS
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
X-List-Received-Date: Fri, 27 Jul 2012 05:04:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

This was a cover letter ONLY don't expect another 34 messages

Sau!


On 07/26/2012 09:50 PM, Saul Wold wrote:
> Folks,
>
> Please review this change set via the links, it large enough
> that I don't want to spam the list multiple times as I already
> send enough pull requests to you all!
>
> I have reviewed these and they look correct, there are a couple
> of issues that I am still working out so there will likely be a
> v2 (possibly a v3).
>
> One thing I did notice is that for some of the alternatives in the
> following form I am not sure the correct files are getting setup:
>
> ALTERNATIVE_${PN} = "x-terminal-emulator"
> ALTERNATIVE_LINK_NAME[x-terminal-emulator] = "${bindir}/rxvt"
>
> In the older/depercated way there would be a /usr/bin/rxvt while with
> the new U-A code, I get a /usr/bin/rxvt.rxvt-unicode so the rxvt binary
> is not effectively gone, this happens in other cases also.
>
> I know there is a problem with ncurses and nativesdk, which I am still
> working on. pigz seems to not add any alt-update in the pkgdata, I am
> not sure why not.
>
> Please scan though these and let me know what you think.
>
> BTW, you will all be saved from my Consolidated pulls for a week
> while I hike the North Umpqua trail in Oregon.
>
> Thanks
> 	Sau!
>
> The following changes since commit 651b223c5fc93c7504e304e954b9ae4640ed47c6:
>
>    usbutils: avoid dependency on bash (2012-07-26 18:52:00 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib sgw/update-alternatives
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/update-alternatives
>
> Saul Wold (34):
>    rxvt-unicode: cleanup update-alternatives deprecated code
>    openssh: cleanup update-alternatives deprecated code
>    mini-x-session: cleanup update-alternatives deprecated code
>    console-tools: cleanup update-alternatives deprecated code
>    kbd: cleanup update-alternatives deprecated code
>    tinylogin: cleanup update-alternatives deprecated code
>    patch: cleanup update-alternatives deprecated code
>    ubootchart: cleanup update-alternatives deprecated code
>    bc: cleanup update-alternatives deprecated code
>    diffutils: refactor to add a common diffutils.inc
>    diffutils: cleanup update-alternatives deprecated code
>    findutils: refactor common code to findutils.inc
>    findutils: cleanup update-alternatives deprecated code
>    powertop: cleanup update-alternatives deprecated code
>    mutter: cleanup update-alternatives deprecated code
>    matchbox-wm-2: cleanup update-alternatives deprecated code
>    matchbox-session: cleanup update-alternatives deprecated code
>    metacity: cleanup update-alternatives deprecated code
>    pigz: cleanup update-alternatives deprecated code
>    msmtp: cleanup update-alternatives deprecated code
>    mktemp: cleanup update-alternatives deprecated code
>    which: cleanup update-alternatives deprecated code
>    less: cleanup update-alternatives deprecated code
>    shadow: cleanup update-alternatives deprecated code
>    mingetty: cleanup update-alternatives deprecated code
>    hdparm: cleanup update-alternatives deprecated code
>    gzip: cleanup update-alternatives deprecated code
>    procps: cleanup update-alternatives deprecated code
>    time: cleanup update-alternatives deprecated code
>    wget: cleanup update-alternatives deprecated code
>    sed: cleanup update-alternatives deprecated code
>    gawk: cleanup update-alternatives deprecated code
>    net-tools: cleanup update-alternatives deprecated code
>    ncurses: fix file names for update -alternatives
>
>   meta/recipes-connectivity/openssh/openssh_6.0p1.bb |    6 +---
>   .../console-tools/console-tools_0.3.2.bb           |    8 ++++-
>   meta/recipes-core/kbd/kbd_1.15.2.bb                |    7 ++--
>   meta/recipes-core/ncurses/ncurses.inc              |    4 +-
>   meta/recipes-core/tinylogin/tinylogin_1.4.bb       |   11 ++-----
>   meta/recipes-devtools/patch/patch.inc              |    7 +----
>   meta/recipes-devtools/patch/patch_2.5.9.bb         |    2 +-
>   meta/recipes-devtools/patch/patch_2.6.1.bb         |    2 +-
>   meta/recipes-devtools/ubootchart/ubootchart_svn.bb |    7 ++--
>   meta/recipes-extended/bc/bc_1.06.bb                |    4 +-
>   meta/recipes-extended/diffutils/diffutils.inc      |   22 ++++++++++++++
>   meta/recipes-extended/diffutils/diffutils_2.8.1.bb |   24 ++-------------
>   meta/recipes-extended/diffutils/diffutils_3.2.bb   |   22 ++------------
>   meta/recipes-extended/findutils/findutils.inc      |    4 ++-
>   .../recipes-extended/findutils/findutils_4.2.31.bb |   31 +++----------------
>   meta/recipes-extended/findutils/findutils_4.4.2.bb |    4 +--
>   meta/recipes-extended/gawk/gawk_3.1.5.bb           |    7 ++--
>   meta/recipes-extended/gawk/gawk_4.0.1.bb           |    7 ++--
>   meta/recipes-extended/gzip/gzip_1.3.12.bb          |    7 +++-
>   meta/recipes-extended/hdparm/hdparm_9.39.bb        |    5 ++-
>   meta/recipes-extended/less/less_444.bb             |    6 +--
>   meta/recipes-extended/mingetty/mingetty_1.08.bb    |   10 ++----
>   meta/recipes-extended/mktemp/mktemp_1.7.bb         |   11 +++----
>   meta/recipes-extended/msmtp/msmtp_1.4.24.bb        |    7 ++--
>   .../net-tools/net-tools_1.60-23.bb                 |   19 +++++++----
>   meta/recipes-extended/pigz/pigz.inc                |    4 ++-
>   meta/recipes-extended/pigz/pigz_2.2.4.bb           |    2 +-
>   meta/recipes-extended/procps/procps.inc            |    9 ++++-
>   meta/recipes-extended/procps/procps_3.2.8.bb       |    9 +-----
>   meta/recipes-extended/sed/sed_4.1.2.bb             |    9 ++---
>   meta/recipes-extended/sed/sed_4.2.1.bb             |    9 ++---
>   meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |   18 ++++-------
>   meta/recipes-extended/time/time.inc                |    8 +----
>   meta/recipes-extended/time/time_1.7.bb             |    2 +-
>   meta/recipes-extended/wget/wget.inc                |   10 +-----
>   meta/recipes-extended/which/which_2.18.bb          |    8 +----
>   meta/recipes-extended/which/which_2.20.bb          |   10 +-----
>   meta/recipes-gnome/gnome/metacity_2.30.3.bb        |    7 ++--
>   .../matchbox-session/matchbox-session_0.1.bb       |    7 ++--
>   .../matchbox-wm-2/matchbox-wm-2_git.bb             |    7 ++--
>   .../mini-x-session/mini-x-session_0.1.bb           |    7 ++--
>   meta/recipes-graphics/mutter/mutter.inc            |    5 +--
>   meta/recipes-graphics/mutter/mutter_2.29.1.bb      |    2 +-
>   meta/recipes-kernel/powertop/powertop_1.13.bb      |   13 ++++----
>   .../recipes-sato/rxvt-unicode/rxvt-unicode_9.15.bb |    6 ++--
>   45 files changed, 159 insertions(+), 237 deletions(-)
>   create mode 100644 meta/recipes-extended/diffutils/diffutils.inc
>



