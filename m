Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 19EED766D2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 11:03:42 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 24 Aug 2015 04:03:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,737,1432623600"; d="scan'208";a="789702220"
Received: from achalot-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.20.62])
	by fmsmga002.fm.intel.com with ESMTP; 24 Aug 2015 04:03:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org, "Kucharczyk,
	Bartlomiej (Nokia - PL/Wroclaw)" <bartlomiej.kucharczyk@nokia.com>
Date: Mon, 24 Aug 2015 12:03:36 +0100
Message-ID: <2068998.UOjQ1ZVCqg@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.5-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <CAJTo0LYUyMGtDs0VJgc2SRXXdW3ttpzDT5W-_nniXrSrCJX4Hw@mail.gmail.com>
References: <6F44F925AFE971408EDDDD548F9B486F198BD299@DEMUMBX005.nsn-intra.net>
	<CAJTo0LYUyMGtDs0VJgc2SRXXdW3ttpzDT5W-_nniXrSrCJX4Hw@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: Get patch of all manual changes done in sources.
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
X-List-Received-Date: Mon, 24 Aug 2015 11:03:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 21 August 2015 18:02:47 Burton, Ross wrote:
> On 21 August 2015 at 17:04, Kucharczyk, Bartlomiej (Nokia - PL/Wroclaw) <
> bartlomiej.kucharczyk@nokia.com> wrote:
> > Is there any automated way to get diff of all manual changes done in
> > recipe sources?
> > 
> > Use case is:
> > 1. bitbake something -c devshell
> > 2. # manually modify sources #
> > 3. bitbake image
> > 4. bitbake something2 -c devshell
> > 5. # manually modify sources #
> > 6. bitbake image
> > ...
> > n. bitbake image
> > 
> > And now I would like to automatically generate patch from changes in step
> > #2, #5, and next. Is there any way in oe core to achieve such thing?
> > 
> > And if needs to be implemented, do you have any suggestions how to start?
> > (e.g. doing another task, create a bbclass, or? )
> 
> For this sort of iterative development in a source tree it's best to use
> devtool instead of the devshell task.  There's a section on devtool in the
> documentation.

More specifically:

http://www.yoctoproject.org/docs/latest/dev-manual/dev-manual.html#using-devtool-in-your-workflow

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

