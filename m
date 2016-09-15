Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 72B437016E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 20:03:41 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP; 15 Sep 2016 13:03:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,340,1470726000"; 
   d="scan'208";a="9498260"
Received: from ananthna-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.179.76])
	by orsmga004.jf.intel.com with ESMTP; 15 Sep 2016 13:03:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>, Gary Thomas <gary@mlbassoc.com>
Date: Fri, 16 Sep 2016 08:03:36 +1200
Message-ID: <2762804.COdzxK9n1p@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.3-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <CAJTo0LbuVqOsjMUix-ntx67a6PVEcLFeYrAN8XnCh7eJzBQgdw@mail.gmail.com>
References: <72492146-b352-1f59-1d23-26f71773d689@mlbassoc.com>
	<CAJTo0LbuVqOsjMUix-ntx67a6PVEcLFeYrAN8XnCh7eJzBQgdw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Crazy display
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
X-List-Received-Date: Thu, 15 Sep 2016 20:03:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

I understand some people are seeing this issue with the progress bar, but so 
far I haven't observed any problems here - any help reproducing it would be 
much appreciated. The bugzilla entry is:

  https://bugzilla.yoctoproject.org/show_bug.cgi?id=10046

Are you guys perhaps using the same terminal application? Using screen / tmux 
/ anything similar? (I'm using screen here and haven't experienced problems 
though.)

Cheers,
Paul

On Thu, 15 Sep 2016 12:38:21 Burton, Ross wrote:
> Yes, I see this at least once a day, and there's a bug for it somewhere in
> bugzilla.
> 
> Ross
> 
> On 15 September 2016 at 12:30, Gary Thomas <gary@mlbassoc.com> wrote:
> > I haven't seen this before, just thought I'd toss it out there.
> > I was doing a build (actually three in parallel in separate
> > windows on my build box) and noticed this:
> > 
> > Currently  3 running tasks (3282 of 5081)  64%
> > 
> > |###################################################        |
> > 
> > 0: busybox-1.24.1-r0 do_compile (pid 29425)
> > Currently  3 running tasks (3283 of 5081)  64%
> > 
> > |###################################################        |
> > 
> > Currently  3 running tasks (3429 of 5081)  67%
> > 
> > |#####################################################        |
> > 
> > 0: gstreamer1.0-libav-1.8.3-r0 do_configure (pid 10393)
> > Currently  1 running tasks (3560 of 5081)  70%
> > 
> > |########################################################        |
> > 
> > 0: gstreamer1.0-libav-1.8.3-r0 do_compile (pid 17458)
> > Currently  3 running tasks (3601 of 5081)  70%
> > 
> > |########################################################        |
> > 
> > 0: gstreamer1.0-libav-1.8.3-r0 do_compile (pid 17458)
> > 1: gdk-pixbuf-2.34.0-r0 do_package_write_ipk (pid 12673)
> > 2: unifdef-native-2.11-r0 do_populate_lic (pid 24548)
> > 
> > Somehow the task tracker (that does a nice job of telling the user
> > what's going on without being overwhelming BTW) got very confused!
> > 
> > I doubt if I can every repeat this, just passing on the observation!
> > 
> > --
> > ------------------------------------------------------------
> > Gary Thomas                 |  Consulting for the
> > MLB Associates              |    Embedded world
> > ------------------------------------------------------------
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 

Paul Eggleton
Intel Open Source Technology Centre

