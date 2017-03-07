Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 33EEF7756D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 22:33:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Mar 2017 14:33:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,260,1486454400"; d="scan'208";a="1119712724"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.135.32])
	by fmsmga001.fm.intel.com with ESMTP; 07 Mar 2017 14:33:20 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Matthew McClintock <msm-oss@mcclintock.net>
Date: Wed, 08 Mar 2017 11:33:17 +1300
Message-ID: <2425083.J11tCAZyJx@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <1488919643.22968.47.camel@linuxfoundation.org>
References: <1488916121-30447-1-git-send-email-msm-oss@mcclintock.net>
	<1488919643.22968.47.camel@linuxfoundation.org>
MIME-Version: 1.0
Subject: Re: [PATCH] utility-task: Add do_patchall task
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
X-List-Received-Date: Tue, 07 Mar 2017 22:33:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 8 March 2017 9:47:23 AM NZDT Richard Purdie wrote:
> On Tue, 2017-03-07 at 13:48 -0600, Matthew McClintock wrote:
> > This is useful in a few scenarios:
> > 
> > 1) A developer wants to be able to grep all the code in a particular
> > without having to run patch on various components until they guess
> > the
> > right one (e.g. which component is generating an error/warning?)
> > 
> > 2) Other code scanning tools that can be run without requiring a full
> > image to be built (legal, static code analysis, etc)
> > 
> > Signed-off-by: Matthew McClintock <msm-oss@mcclintock.net>
> > ---
> >  meta/classes/utility-tasks.bbclass | 7 +++++++
> >  meta/conf/documentation.conf       | 1 +
> >  2 files changed, 8 insertions(+)
> 
> I have mixed feelings on this. Whilst I can see the attraction, extra
> tasks like this do actually have a parsing overhead. We already have a
> lot of them and its only a question of time before someone wants
> another XXXall task adding.
> 
> I'm wondering if we can solve this at the bitbake level instead with a
> new parameter instead? That would allow us to delete tasks and speed up
> parsing rather than slow things down.

FYI there is a bug open for this (currently assigned to me, but it's in the 
"new" state so anyone's welcome to take it):

  https://bugzilla.yoctoproject.org/show_bug.cgi?id=7733

I suspect most of this would need to be handled in lib/bb/runqueue.py; 
actually adding the option would be in main.py.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

