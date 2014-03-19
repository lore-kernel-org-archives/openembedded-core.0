Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 00E9F6F8F0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 12:14:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Mar 2014 05:14:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,685,1389772800"; d="scan'208";a="501934571"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.192])
	by fmsmga002.fm.intel.com with ESMTP; 19 Mar 2014 05:14:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Wed, 19 Mar 2014 12:14:50 +0000
Message-ID: <1899152.9NP6EKmDJi@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.3 (Linux/3.13.6-200.fc20.x86_64; KDE/4.12.3; x86_64; ; )
In-Reply-To: <cover.1394555880.git.liezhi.yang@windriver.com>
References: <cover.1394555880.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/6 V3] refactor the archiver*.bbclass
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
X-List-Received-Date: Wed, 19 Mar 2014 12:15:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Robert,

On Wednesday 12 March 2014 01:08:18 Robert Yang wrote:
> === V3:
> * Do the unpack, patch and configure in another WORKDIR as RP and Ross
>   suggested, so that it would not affact the default build dependencies,
>   thanks for Ross' prototype.
> * Don't archive the logs (temp/log.do*), mainly because of:
>   - We can easily get the log via reset the T rather than use the
>     archiver.
>   - If we need archive the logs, we must let the task to run as the last
>     one, but it's hard to do this.
> 
> === V2:
> * Fix the warning between different machines which is reported by Martin
> * Fix the error when the archiver.bbclass is not inherited but
>   ARCHIVER_MODE[type] = "srpm" is set, reported by Ross.
> * Fix the archiving for gcc staff which uses the shared source according
>   to the recently changes of prefuncs and postfuncs in bitbake, so it only
>   works well with bitbake's up to date master branch, if we want to backport
> it, we also need backport the pre/postfuncs related patches.
> 
> === V1:
> * The archive*.bbclass didn't work, and there were a few problems, for
>   example:
>   1) There were a few duplicated code
>   2) There was no src_dir.org (or orig), but the diff command still use
>      it, and it is not easy to fix this issue if we don't change a lot
>      of the code.
>   3) It didn't archive the source for the native or gcc
>   4) The work flow is not very well
>   5) The "subprocess.call('fakeroot cp xxxx'" should be removed
>   6) And others ...
> 
> * So that we have to refactor it, the benefits are:
>   1) Fix the problems and make it work well.
>   2) Reduce more than 400 lines in total.
>   3) Make it easy to use.
> 
> // Robert
> 
> 
> The following changes since commit 23f7decb84922a3467c5b10b013e66596926b5cf:
> 
>   .templateconf: New file for customized template defaults (2014-03-11
> 08:11:07 -0700)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib rbt/archiver_v3
>  
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/
> archiver_v3
> 
> Robert Yang (6):
>   classes/archive*.bbclass: remove archive-*-source.bbclass
>   archiver.bbclass: refactor it
>   package_rpm.bbclass: archive the source to srpm package
>   archiver.bbclass: move a few code to copyleft_compliance.bbclass
>   local.conf.sample.extended: update for the archiver

I've had a look at this series - great work on the refactoring and cleanup! 
There were a couple of things I noticed, I've replied to the individual 
patches.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

