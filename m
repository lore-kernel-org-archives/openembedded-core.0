Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1R3dhj-0002oY-6T
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 02:51:55 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Sep 2011 17:46:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="48115218"
Received: from unknown (HELO [10.255.14.59]) ([10.255.14.59])
	by orsmga001.jf.intel.com with ESMTP; 13 Sep 2011 17:46:44 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2011 17:46:38 -0700
X-Mailer: Evolution 3.0.3 (3.0.3-1.fc15) 
Message-ID: <1315961204.2252.32.camel@scimitar>
Mime-Version: 1.0
Subject: [RFC] Suggestion of minor change to patch submission policy re: long descriptions in commit headers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Sep 2011 00:51:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Our patch submission policy[1] 

"Optionally, you may include pointers to defects this change corrects.
Unless the defect format is specified by the component you are
modifying, it is suggested that you use a full URL to specify the
reference to the defect information. Generally these pointers will
precede any long description, but as an optional item it may be after
the long description."

I've been guilty of always having the defect id after the description,
and have never included the defect URL (though my reading suggests this
is not required for Yocto defects I still believe this will make the
defect id's more useful for fellow OE-Core developers).

Whilst I intend to rectify the latter I'd like to propose we change the
former such that the defect information is at the end of the commit
message.

I believe this is more suitable for the project because the defect
information and its relevance should be summarised in the long
description, and therefore the defect id and link to the defect tracker
are supplemental information for interested readers.

IMHO this supplementary nature should lead us to request submitters
provide defect information after the long description.

Thoughts?

Regards,
Joshua

1.
http://openembedded.org/index.php?title=Commit_Patch_Message_Guidelines#New_Development

-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre



