Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 85D3E6159C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 00:10:49 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 04 Sep 2013 17:10:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,843,1371106800"; d="scan'208";a="290951039"
Received: from unknown (HELO helios.localnet) ([10.252.123.116])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Sep 2013 17:10:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org, yocto@yoctoproject.org
Date: Thu, 05 Sep 2013 01:10:47 +0100
Message-ID: <1497435.xtb1AxO9Wj@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-29-generic; KDE/4.10.5; i686; ; )
MIME-Version: 1.0
Subject: OpenEmbedded Layer Index updated
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
X-List-Received-Date: Thu, 05 Sep 2013 00:10:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi all,

The OpenEmbedded layer index has just been updated:

  http://layers.openembedded.org/

This update includes a number of significant changes that have been in the 
pipeline for a while. A summary of the changes follows.


Branches
----------

Recipe data for the dylan and danny branches is now available. You can switch 
between branches on the top-level pages using the drop-down at the left of the 
navigation bar.

Note: If a layer isn't visible when a branch other than master is selected, it 
is likely because there is no corresponding "dylan" or "danny" branch in that 
layer.


OE-Classic
-----------

We now provide a static index of OE-Classic recipes, and record extra editable 
information to track migration of recipes to the layer ecosystem, replacing 
the old wiki pages used for this purpose. The migration data has been imported 
from the wiki pages, and probably could do with some further tweaking (a login 
is required to edit this). A couple of simple graphs give a summary of the 
migration status based on this data.


Bulk Change tool
-------------------

The new Bulk Change tool that allows you to easily change the values of "meta" 
variables such as DESCRIPTION and LICENSE across multiple recipes, and 
download the result as a patch or set of patches against each layer suitable 
for applying on top of a repository. From there, proper patches can be created 
and submitted. This should hopefully make it easier to make the values of 
these variables more consistently filled in across all recipes.

(Note that you need to create an account to access this tool.)


Duplicates tool
-----------------

The "duplicates" tool gives you a list of recipes with the same name in 
multiple layers, helping to highlight possible duplicates.

(Note that you need to create an account to access this tool.)


Additional data
-----------------

* We now track bbappends in each layer, and list the appends for a recipe in 
all layers on each recipe page

* We now track bbclasses, so you can see the classes provided by each layer

* The value of the BUGTRACKER variable is now recorded for each recipe if set


Navigation improvements
-----------------------------

* The front page has been optimised out as it wasn't particularly useful - you 
now get taken straight to the layer list

* Added a clear top-level navigation bar

* Added a simple breadcrumb at the top of layer / recipe pages

* The update script now tries to preserve recipe ID numbers as much as 
possible, so in most situations a bookmarked URL to a recipe page should point 
to the same recipe even when it gets upgraded. (This is not guaranteed however 
particularly where an older versioned recipe is removed in a separate commit 
after a newer version has been added.)


Misc
-----

Other minor improvements:

* Wider page layouts improving readability

* Recipe page sections are now shown in tabs

* For layer maintainers, editing and saving a layer now takes you back to the 
layer detail page instead of showing the edit layer page again

* Added a change log (link at the bottom of every page) that shows an audit 
log of changes to the layer database

* Layer type filter drop-down now stays open to allow ticking/unticking 
multiple items

* Added a user profile page


Thanks to Belen Barros Pena for help with the design and HTML/CSS, and Michael 
Halstead for helping me with the upgrade process and continued administration.

As always, feedback is welcome.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

