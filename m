Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6D63565CC3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 21:58:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 22 Mar 2016 14:58:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,379,1455004800"; d="scan'208";a="939497274"
Received: from cmdeoliv-mobl4.amr.corp.intel.com ([10.254.120.177])
	by orsmga002.jf.intel.com with ESMTP; 22 Mar 2016 14:58:01 -0700
Message-ID: <1458683881.18406.35.camel@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Tue, 22 Mar 2016 14:58:01 -0700
In-Reply-To: <CAP9ODKrtzYwE-Y2pCD7wCMcwY9CVixxAg+dmNJkL2o=CQrmL=w@mail.gmail.com>
References: <1458670391-26915-1-git-send-email-sgw@linux.intel.com>
	<1458670391-26915-5-git-send-email-sgw@linux.intel.com>
	<CAP9ODKrtzYwE-Y2pCD7wCMcwY9CVixxAg+dmNJkL2o=CQrmL=w@mail.gmail.com>
X-Mailer: Evolution 3.18.5.1 (3.18.5.1-1.fc23) 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] linux-firmware: Break out some additional firmware
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
X-List-Received-Date: Tue, 22 Mar 2016 21:58:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-03-22 at 18:07 -0300, Otavio Salvador wrote:
> Hello Saul,
> 
> First I would like to thank you to manage this upgrade and
> refactoring. This recipe was indeed requiring some love and you did a
> great job.
> 
I want to go further, but not before the release, I am thinking of some
mappings and automation to have all the firmware packaged in smaller
blobs, but will require some name mapping I think.

Sau!

> On Tue, Mar 22, 2016 at 3:13 PM, Saul Wold <sgw@linux.intel.com>
> wrote:
> > 
> > This breaks out new firmware from the iwlwifi firmware along with
> > the i915 graphics firmware.
> > 
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > ---
> >  .../linux-firmware/linux-firmware_git.bb           | 25
> > +++++++++++++++++++---
> >  1 file changed, 22 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta/recipes-kernel/linux-firmware/linux-
> > firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-
> > firmware_git.bb
> > index 04d9471..6f6581a 100644
> > --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> > +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> > @@ -224,6 +224,9 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink
> > \
> >               ${PN}-iwlwifi-6050-4 ${PN}-iwlwifi-6050-5 \
> As done in the other one, this might make sense to consolidate into a
> single one.
> 
> > 
> >               ${PN}-iwlwifi-7260 \
> >               ${PN}-iwlwifi-7265 \
> > +             ${PN}-iwlwifi-7265D ${PN}-iwlwifi-8000C ${PN}-
> > iwlwifi-8265 \
> Does it make sense to split D out ? I think adding it inside the
> former might avoid too much fragmentation.
> 

