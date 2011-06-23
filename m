Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QZXic-0000WR-KY
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 02:24:26 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QZXfB-0003yd-5y from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 17:20:53 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 22 Jun 2011 17:15:32 -0700
Received: from [172.30.80.125] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 22 Jun 2011 17:20:52 -0700
Message-ID: <4E0286CD.50700@mentor.com>
Date: Wed, 22 Jun 2011 17:20:29 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 23 Jun 2011 00:15:32.0735 (UTC)
	FILETIME=[AA9F90F0:01CC313A]
Subject: sstate skips STAGING_DIR_KERNEL?
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
X-List-Received-Date: Thu, 23 Jun 2011 00:24:26 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Hey all,

As part of looking into the problem I had that I just posted a patch for
I was going "why isn't -c clean (or cleanall or cleansstate) knocking
out STAGING_DIR_KERNEL contents?  Answer, sstate is totally skipping
that out.  Is there some variable we need to be setting somewhere to add
this in?  Or are we going to have to take in the various bits of OE.dev
kernel.bbclass instead here?

-- 
Tom Rini
Mentor Graphics Corporation


