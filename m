Return-Path: <tom.zanussi@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 02BBD605F2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2013 01:18:32 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 29 Sep 2013 18:18:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1006,1371106800"; d="scan'208";a="402923363"
Received: from unknown (HELO [10.255.15.164]) ([10.255.15.164])
	by fmsmga001.fm.intel.com with ESMTP; 29 Sep 2013 18:18:33 -0700
Message-ID: <1380503913.31937.161.camel@empanada>
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Date: Sun, 29 Sep 2013 20:18:33 -0500
In-Reply-To: <CALmOhgmcxAgG2D3SNYiH_OK_nxMRKUmsWhLi9VAjqxO7kJH7MQ@mail.gmail.com>
References: <cover.1380234931.git.tom.zanussi@linux.intel.com>
	<CALmOhgmcxAgG2D3SNYiH_OK_nxMRKUmsWhLi9VAjqxO7kJH7MQ@mail.gmail.com>
X-Mailer: Evolution 3.4.1 (3.4.1-2.fc17) 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] 'wic'- OpenEmbedded Image Creator
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
X-List-Received-Date: Mon, 30 Sep 2013 01:18:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2013-09-28 at 13:10 -0400, Trevor Woerner wrote:
> On 26 September 2013 22:17, Tom Zanussi <tom.zanussi@linux.intel.com> wrote:
> > This patchset implements a new command named 'wic' (for OpenEmbedded
> > Image Creator).  Please see [YOCTO #3847] for extensive background on
> > what's implemented here.
> 
> Wow Tom, this is really AWESOME work! And thanks for the excellent
> detailed description of the current system which you documented in
> [YOCTO #3847]!
> 

Thanks!

> One question comes to mind: if I have a package which installs files
> to two (or more) different directories and I have decided (for
> whatever reason) that those directories should be on separate
> partitions, is this supported?

No, the current code doesn't, but what I had planned on doing was adding
hyphenated suffixes onto the --source rootfs param which would be
treated as subdividing the rootfs (passed in using -r) and creating
separate partitions with those contents e.g.

--source rootfs-home
--source rootfs-usr-local

So in the above, the contents of /home would be split out into a
separate partition (and subtracted from rootfs) as well as /usr/local,
and fstab entries would be created to mount those partitions as /home
and /usr/local...

Tom 

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



