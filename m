Received: from smtp-relay2.palm.com ([64.28.152.243])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prvs=46288fa7a=rich.pixley@palm.com>)
	id 1SPeLd-0003yG-E7 for Openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 20:32:21 +0200
X-IronPort-AV: E=Sophos;i="4.75,518,1330934400"; d="scan'208";a="13269527"
Received: from unknown (HELO ushqusdns3.palm.com) ([148.92.223.90])
	by smtp-relay2.palm.com with ESMTP; 02 May 2012 11:21:30 -0700
Received: from fuji.noir.com ([10.100.2.13])
	by ushqusdns3.palm.com (8.14.4/8.14.4) with ESMTP id q42ILUqv032041;
	Wed, 2 May 2012 11:21:30 -0700
Message-ID: <4FA17B2A.5060903@palm.com>
Date: Wed, 02 May 2012 11:21:30 -0700
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: SetScene tasks hang forever?
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
X-List-Received-Date: Wed, 02 May 2012 18:32:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm seeing a lot of builds apparently hanging forever, (the ones that 
work seem to work within seconds - the ones that hang seem to hang for 
at least 10's of minutes), with:

rich@dolphin> nice tail -f Log
MACHINE           = "qemux86"
DISTRO            = ""
DISTRO_VERSION    = "oe-core.0"
TUNE_FEATURES     = "m32 i586"
TARGET_FPU        = ""
meta              = "master:35b5fb2dd2131d4c7dc6635c14c6e08ea6926457"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks

If I run top, I see one processor pinned at 98 - 99% utilization running 
python, but no other clues.

Can anyone point me to doc, explain what's going on here, or point me in 
the right direction to debug this?

--rich


