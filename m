Received: from smtp-relay2.palm.com ([64.28.152.243])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prvs=490fd1ba2=rich.pixley@palm.com>)
	id 1SZnuz-0003zl-IJ for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 20:46:49 +0200
X-IronPort-AV: E=Sophos;i="4.75,686,1330934400"; d="scan'208";a="13840076"
Received: from unknown (HELO ushqusdns3.palm.com) ([148.92.223.90])
	by smtp-relay2.palm.com with ESMTP; 30 May 2012 11:35:24 -0700
Received: from fuji-land.noir.com ([10.100.2.10])
	by ushqusdns3.palm.com (8.14.4/8.14.4) with ESMTP id q4UIZNX9016951;
	Wed, 30 May 2012 11:35:24 -0700
Message-ID: <4FC6686B.20904@palm.com>
Date: Wed, 30 May 2012 11:35:23 -0700
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: On the possibility of using upstart...
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
X-List-Received-Date: Wed, 30 May 2012 18:46:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Has anyone considered the possibility of introducing upstart to oe-core, 
perhaps as an alternative?

How would people feel about patches to do that?

I ask because "classic", (read, "former" and "proprietary"), WebOS used 
upstart and we're considering whether to attempt to continue to do so as 
we move to oe-core, or whether to attempt to convert all of our 
components over.  Either way, we have to convert a bunch of service 
scripts.  And if we're going to convert a bunch of service scripts for 
oe-core components, (as distinct from porting service scripts for Palm 
components), then it would be much easier of those patches were to find 
their way into oe-core rather than needing to be maintained separately.

--rich


