Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SogG4-0007bp-TM for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 21:38:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6AJQojx020426;
	Tue, 10 Jul 2012 20:26:50 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19561-03; Tue, 10 Jul 2012 20:26:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6AJQckb020420
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 10 Jul 2012 20:26:39 +0100
Message-ID: <1341948400.1294.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: tom.zanussi@intel.com
Date: Tue, 10 Jul 2012 20:26:40 +0100
In-Reply-To: <cover.1341852059.git.tom.zanussi@intel.com>
References: <cover.1341852059.git.tom.zanussi@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Tue, 10 Jul 2012 19:38:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-07-09 at 12:07 -0500, tom.zanussi@intel.com wrote:
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
>   Robert P. J. Day (1):
>         bitbake: usermanual: Fix missing markup
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib.git tzanussi/perf-scripting-v3
>   http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/perf-scripting-v3
> 
> Tom Zanussi (3):
>   perf: add perf.inc
>   perf: add perf-scripting feature
>   perf: add perf-tui feature

Merged to master, thanks.

Richard



