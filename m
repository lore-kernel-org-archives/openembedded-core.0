Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 31BB271C7E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 07:33:26 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 28 Jun 2017 00:33:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,274,1496127600"; d="scan'208";a="118283934"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 28 Jun 2017 00:33:27 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 72EE358075B;
	Wed, 28 Jun 2017 00:33:26 -0700 (PDT)
Date: Wed, 28 Jun 2017 10:31:21 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Message-ID: <20170628073121.GA11425@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1498569961.git.ed.bartosh@linux.intel.com>
	<CAP9ODKopDxEYw9vereQjoHve=n2Of2v-3EHbxaiumZN3T0hH8Q@mail.gmail.com>
	<823180ba-066d-747d-8112-a110633a03a8@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <823180ba-066d-747d-8112-a110633a03a8@ossystems.com.br>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: [PATCH v2 0/5] #11662 - wic should mount /boot
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
X-List-Received-Date: Wed, 28 Jun 2017 07:33:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 27, 2017 at 05:41:45PM -0300, Fabio Berton wrote:
> The last patch I sent is here:
> https://patchwork.openembedded.org/patch/139252/
> 
> We're using this patch internally with Pyro branch. I can rework to
> apply on master.
> 
> On 06/27/2017 05:35 PM, Otavio Salvador wrote:
> >On Tue, Jun 27, 2017 at 10:28 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> >>The patchset also fixes long standing bug: wic updated fstab
> >>inplace in rootfs directory. This causes other tasks working with
> >>rootfs directory to produce incorrect results or crash. This is
> >>fixed by copying rootfs to the temporary directory before updating
> >>fstab.
> >
> >As you is working on this, please also include Fabio's patch on the
> >patchset. It includes a command like option to disable fstab change at
> >all. For delta-based updates this is imperative.
> >
> >Fabio, could you point him the last patch revision?
> >

Do we really need that?

JFYI: Mount point in .wks is an optional field. It makes sense to use it only
if partition needs to be mounted on boot. fstab will not be updated
unless it's explicitly requested by specifying mount points in .wks

--
Regards,
Ed

