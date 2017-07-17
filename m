Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CFF2671A36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 09:43:39 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jul 2017 02:43:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,374,1496127600"; d="scan'208";a="108846773"
Received: from premisze-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.49.230])
	by orsmga004.jf.intel.com with ESMTP; 17 Jul 2017 02:43:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jul 2017 10:43:38 +0100
Message-ID: <3670690.plkd45hik7@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <50B33AC5ED75F74F991980326F1C438D1F11FF60@PGSMSX103.gar.corp.intel.com>
References: <1498615159-6719-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<50B33AC5ED75F74F991980326F1C438D1F11FF60@PGSMSX103.gar.corp.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] Enhancement on devtool edit-recipe
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
X-List-Received-Date: Mon, 17 Jul 2017 09:43:40 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

I've looked at these already, in case that's a concern.

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

On Tuesday, 11 July 2017 2:50:44 AM BST Chang, Rebecca Swee Fun wrote:
> Ping in case maintainer has missed this series.
> Please let me know if there are any concern to merge this enhancement on
> devtool edit-recipe and I would rework it asap for 2.4M2.
> Thank you very much.
> 
> Rebecca
> 
> > -----Original Message-----
> > From: Chang, Rebecca Swee Fun
> > Sent: Wednesday, June 28, 2017 9:59 AM
> > To: OpenEmbedded Core Mailing List <openembedded-
> > core@lists.openembedded.org>
> > Cc: Chang, Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
> > Subject: [PATCH 0/3] Enhancement on devtool edit-recipe
> > 
> > Hi,
> > 
> > The patches in this series are to enhance devtool edit-recipe as a request from
> > Bugzilla #11434.
> > 
> > This first enhancement I did was to ensure devtool edit-recipe not to print out
> > ugly tracebacks that is not informative by catching the exception.
> > 
> > However, this has introduced new tracebacks where python complaints about
> > NameError: name 'logger' is not defined in run_editor definition. We could pass
> > in logger as a parameter from run_editor function call. This was fixed in the
> > second patch in this series.
> > 
> > Lastly, I have enable additional subcommand 'find-recipe' for devtool. This will
> > help users to find the path to the recipes in workspace and it can be extended
> > to find recipe outside of workspace using '-a/--any-recipe' option.
> > 
> > Regards,
> > Rebecca
> > 
> > Chang Rebecca Swee Fun (3):
> >   scriptutils: exit politely when no text editor available
> >   scriptutils: pass in logger as parameter
> >   devtool: find-recipe: enable new subcommand for devtool
> > 
> >  scripts/lib/devtool/utilcmds.py     | 18 ++++++++++++++----
> >  scripts/lib/recipetool/newappend.py |  2 +-
> >  scripts/lib/scriptutils.py          |  6 +++---
> >  3 files changed, 18 insertions(+), 8 deletions(-)
> > 
> > --
> > 2.7.4
> 
> 


-- 

Paul Eggleton
Intel Open Source Technology Centre

