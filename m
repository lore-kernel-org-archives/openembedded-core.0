Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 725566FF5B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 15:30:48 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 12 May 2016 08:30:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,610,1455004800"; d="scan'208";a="804815960"
Received: from ssailer-mobl2.amr.corp.intel.com ([10.254.2.179])
	by orsmga003.jf.intel.com with ESMTP; 12 May 2016 08:30:49 -0700
Date: Thu, 12 May 2016 08:30:49 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: "Puustinen, Ismo" <ismo.puustinen@intel.com>
Message-ID: <20160512153049.GA1719@ssailer-mobl2.amr.corp.intel.com>
References: <1462837346-27095-1-git-send-email-stephano.cetola@linux.intel.com>
	<1462963597.11059.13.camel@intel.com>
	<20160511190439.GA54030@ctaylor1-mobl3.amr.corp.intel.com>
	<1463051851.16808.27.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1463051851.16808.27.camel@intel.com>
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
X-List-Received-Date: Thu, 12 May 2016 15:30:51 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 05/12, Puustinen, Ismo wrote:
> On Wed, 2016-05-11 at 12:04 -0700, Stephano Cetola wrote:
> > > I think this is a valuable feature. However, have you considered
> > > adding
> > > the "m" and "r" options too? I think that at least "m" would be
> > > worthwhile to implement, since it's important to be able to add
> > > users
> > > to different groups for privilege management.
> >
> > I added "--system" to both useradd and groupadd, and I believe that
> > is
> > the same as "-r". Please correct me if I am wrong there.
> > 
> > I do not see how the "-m" option would help with groups. I thought
> > that
> > simply added a skeleton home directory. Could you give me an example?
> 
> I mean that when you parse the sysusers.d configuration file
> in create_systemd_sysusers() function, you only parse the lines
> starting with 'u' and 'g'. You are skipping 'm' and 'r'. See:
> 
> https://www.freedesktop.org/software/systemd/man/sysusers.d.html
> 
> What I'm after is a generic mechanism for reading all sysusers.d/
> configuration files during image creation and creating the necessary
> users and groups during that time. You could also separate mechanism
> and policy, meaning that the list of files to parse could come from
> outside of the create_systemd_sysusers() function.
> 
> Ismo

Ah, I see.  Yes, I agree this would be of value. I think that "m" should
be straight forward to implement, though "r" might get a little
complicated with the staticids class. I'll look into both of these.

Cheers,
Stephano

