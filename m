Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QhY63-0003tN-A0
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 04:25:43 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QhXiC-0004s8-57 from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 19:01:04 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 14 Jul 2011 19:01:03 -0700
Received: from [172.30.80.62] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Thu, 14 Jul 2011 19:01:03 -0700
Message-ID: <4E1F9F59.5050305@mentor.com>
Date: Thu, 14 Jul 2011 19:00:57 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 15 Jul 2011 02:01:03.0990 (UTC)
	FILETIME=[0D6EE960:01CC4293]
Subject: Building hg/help2man not relying on them?
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
X-List-Received-Date: Fri, 15 Jul 2011 02:25:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Hey all,

As I work on bringing jenkins up on my stripped down builder machines
I've once again run into the "wait, I'm supposed to have installed...?"
problem.  Can we switch to building help2man and mercurial rather than
making the end user install them?  Perhaps some sort of test for if we
find it, ASSUME_PROVIDED it, otherwise build it?

-- 
Tom Rini
Mentor Graphics Corporation


