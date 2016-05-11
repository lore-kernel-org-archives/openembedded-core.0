Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A39BB6FEFA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 19:04:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 May 2016 12:04:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,608,1455004800"; d="scan'208";a="951193138"
Received: from ctaylor1-mobl3.amr.corp.intel.com ([10.254.183.134])
	by orsmga001.jf.intel.com with ESMTP; 11 May 2016 12:04:39 -0700
Date: Wed, 11 May 2016 12:04:39 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: "Puustinen, Ismo" <ismo.puustinen@intel.com>
Message-ID: <20160511190439.GA54030@ctaylor1-mobl3.amr.corp.intel.com>
References: <1462837346-27095-1-git-send-email-stephano.cetola@linux.intel.com>
	<1462963597.11059.13.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1462963597.11059.13.camel@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/2] Create systemd users at build time
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
X-List-Received-Date: Wed, 11 May 2016 19:04:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 05/11, Puustinen, Ismo wrote:
> On Mon, 2016-05-09 at 16:42 -0700, Stephano Cetola wrote:
> > Systemd has a config option sysusers which creates any users or
> > groups that
> > systemd needs on first boot. There is a rootfs-postcommand that
> > creates these
> > users in case the filesystem is readonly, however it does not take
> > into
> > account any staicids that the user may have set.
> > 
> > By adding these users at build time, we allow a check for staticids,
> > which would
> > otherwise have been skipped.
> 
> I think this is a valuable feature. However, have you considered adding
> the "m" and "r" options too? I think that at least "m" would be
> worthwhile to implement, since it's important to be able to add users
> to different groups for privilege management.
> 
> Ismo

I added "--system" to both useradd and groupadd, and I believe that is
the same as "-r". Please correct me if I am wrong there.

I do not see how the "-m" option would help with groups. I thought that
simply added a skeleton home directory. Could you give me an example?

Stephano

