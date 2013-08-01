Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id DEA9F61883
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 17:02:56 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 01 Aug 2013 10:02:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,795,1367996400"; d="scan'208";a="340236601"
Received: from unknown (HELO helios.localnet) ([10.252.122.169])
	by azsmga001.ch.intel.com with ESMTP; 01 Aug 2013 10:02:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Laszlo Papp <lpapp@kde.org>
Date: Thu, 01 Aug 2013 18:02:41 +0100
Message-ID: <1981575.9KzFInvyxm@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CAOMwXhM5ofGEhzDoQCiuuknpuFyg+6vB-LwuNh8m9yibmGFT3Q@mail.gmail.com>
References: <1375351656-12261-1-git-send-email-ross.burton@intel.com>
	<CAP9ODKrXScWCUTfL8_hO6Jm+gFHUbzgADZoBd-iW7xjZW1679w@mail.gmail.com>
	<CAOMwXhM5ofGEhzDoQCiuuknpuFyg+6vB-LwuNh8m9yibmGFT3Q@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][V2] u-boot: state the MACHINE when skipping u-boot
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
X-List-Received-Date: Thu, 01 Aug 2013 17:02:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 01 August 2013 17:52:13 Laszlo Papp wrote:
> On Thu, Aug 1, 2013 at 5:50 PM, Otavio Salvador 
<otavio@ossystems.com.br>wrote:
> > On Thu, Aug 1, 2013 at 1:38 PM, Laszlo Papp <lpapp@kde.org> wrote:
> > > On Thu, Aug 1, 2013 at 5:35 PM, Burton, Ross <ross.burton@intel.com>
> > 
> > wrote:
> > >> On 1 August 2013 17:33, Laszlo Papp <lpapp@kde.org> wrote:
> > >> >> I'm not sure what you meant here.  Do you mean a situation where the
> > >> >> local.conf says MACHINE=foo and the user also sets MACHINE=foo in
> > >> >> the
> > >> >> environment?
> > >> > 
> > >> > Yes.
> > >> 
> > >> But there's nothing wrong with the user doing that at all.
> > > 
> > > Why do you think compilers warn in such use cases? Because they cannot
> > 
> > know
> > 
> > > if you are doing something silly, or something unintentional. It might
> > 
> > just
> > 
> > > well be that the user wanted to type something else, but got confused in
> > > which case he might get a hard to debug issue later, or even if not
> > 
> > hard, it
> > 
> > > is additional issue due to his.
> > 
> > Please provide the message you preferred so it can be seen and
> > discussed. An example might make it easier to get what you really
> > mean.
> 
> "Warning: "foo", specified manually on the command line, is the same as in
> the /path/to/the/relevant/background/file.stuff file"
> 
> Please do not hang on the grammar as I am a non-native speakers.

I'm afraid this is not practical. The ability to specify the value for MACHINE 
and other variables from the external environment is not just there for folks 
running bitbake manually from the command line, but also external scripts as 
well, and they could quite legitimately set it to the same value that has been 
specified in the configuration file and showing a warning in that case would be 
undesirable.

I'm not sure I understand the value of showing this warning in any case. The 
system is not going to do anything that the user won't expect - the user 
specified the value of MACHINE on the command line and that's the value that is 
being used. The fact that it is the same as what's in the configuration file is 
incidental.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

