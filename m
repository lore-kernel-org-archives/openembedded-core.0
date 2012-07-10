Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SogUg-0007pr-Ni
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 21:53:10 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 10 Jul 2012 12:41:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="120881362"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Jul 2012 12:41:58 -0700
Message-ID: <4FFC8586.9000305@linux.intel.com>
Date: Tue, 10 Jul 2012 12:41:58 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: tom.zanussi@intel.com
References: <cover.1341852059.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1341852059.git.tom.zanussi@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] perf-scripting/perf-tui features, v3
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
X-List-Received-Date: Tue, 10 Jul 2012 19:53:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/09/2012 10:07 AM, tom.zanussi@intel.com wrote:
> From: Tom Zanussi <tom.zanussi@intel.com>
>
> This patchset enables the Perl and Python bindings for perf, as well
> as the perf TUI (text-based UI).
>
> These are now turned on by default via a new variable,
> PERF_FEATURES_ENABLE, which can be overridden if the default set of
> perf features aren't desired (perf-scripting and perf-tui).
>
> Because perf isn't normally enabled except in sdk builds, which
> contains most of the additional packages that these features drag
> in anyway e.g. Python and Perl, it shouldn't be too bothersome
> to unconidtionally turn the perf features on if perf itself is
> enabled.  Future work will probably allow these features to be
> disabled individually using PACKAGECONFIG for example.
>
> These changes need corresponding changes made to linux-yocto and posted
> separately on the yocto and linux-yocto mailing lists.
>
> This patchset depends on the associated kernel changes posted
> along with the original patchset:
>
> http://www.mail-archive.com/yocto@yoctoproject.org/msg07279.html
> http://www.mail-archive.com/yocto@yoctoproject.org/msg07286.html
>
> Bruce Ashfield submitted a SRCREV update for the 3.4 kernel today
> that you'll also need to build this.
>
> I just started testing this, it works so far, but thought
> I'd put it out there now in case there were comments before
> putting too much effort into that, and possibly giving other
> people a chance to try it out.
>
> This patchset has been build-tested on the following machines:
>
> qemuarm
>
> The following changes since commit 5051e9837fa698e03d0a7a8a918ee7aa98409ce1:
>    Robert P. J. Day (1):
>          bitbake: usermanual: Fix missing markup
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib.git tzanussi/perf-scripting-v3
>    http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/perf-scripting-v3
>
> Tom Zanussi (3):
>    perf: add perf.inc
>    perf: add perf-scripting feature
>    perf: add perf-tui feature
>
>   meta/recipes-kernel/perf/perf.inc    |   22 ++++++++++++++++++++++
>   meta/recipes-kernel/perf/perf_3.4.bb |   18 +++++++++++++++---
>   2 files changed, 37 insertions(+), 3 deletions(-)
>   create mode 100644 meta/recipes-kernel/perf/perf.inc
>
>

Merged into OE-Core


