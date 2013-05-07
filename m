Received: from smtp.knology.net ([64.8.71.112])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kyle@farnsworthtech.com>) id 1UZklw-0005CH-0y
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 18:30:04 +0200
X_CMAE_Category: 0,0 Undefined,Undefined
X-CNFS-Analysis: v=2.0 cv=fYgvOjsF c=1 sm=0 a=gvO/T8MMVPT0XnXDMvgFBA==:17
	a=-TtDL2fbfKMA:10 a=dWUxHrtDoX8A:10 a=8nJEP1OIZ-IA:10
	a=4Du6mIFzAAAA:8 a=En1ISDDULZoA:10 a=jH8tRt3OOvNN9TImGNEA:9
	a=wPNLvfGTeEIA:10 a=gvO/T8MMVPT0XnXDMvgFBA==:117
X-CM-Score: 0
X-Scanned-by: Cloudmark Authority Engine
Authentication-Results: smtp02.knology.synacor.com
	header.from=kyle@farnsworthtech.com; sender-id=neutral
Authentication-Results: smtp02.knology.synacor.com
	smtp.mail=kyle@farnsworthtech.com; spf=neutral;
	sender-id=neutral
Authentication-Results: smtp02.knology.synacor.com
	smtp.user=kfarns@knology.net; auth=pass (LOGIN)
Received-SPF: neutral (smtp02.knology.synacor.com: 216.186.251.41 is neither
	permitted nor denied by domain of farnsworthtech.com)
Received: from [216.186.251.41] ([216.186.251.41:15125]
	helo=host.farnsworthtech.com)
	by smtp.knlogy.net (envelope-from <kyle@farnsworthtech.com>)
	(ecelerity 2.2.3.47 r(39787)) with ESMTPA
	id 5D/9A-22204-92729815; Tue, 07 May 2013 12:09:13 -0400
Received: from [192.168.1.18] (farntech1.farnsworthtech.com [192.168.1.18])
	by host.farnsworthtech.com (Postfix) with ESMTP id D09AA81459
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2013 11:09:12 -0500 (CDT)
Message-ID: <51892728.3090609@farnsworthtech.com>
Date: Tue, 07 May 2013 11:09:12 -0500
From: Kyle Farnsworth <kyle@farnsworthtech.com>
Organization: Farnsworth Technology, Inc.
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-Enigmail-Version: 1.5.1
Subject: SDK meta-toolchain
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2013 16:30:14 -0000
X-List-Received-Date: Tue, 07 May 2013 16:30:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I'm a bit confused about what exactly meta-toolchain is building?  It
seems to be bitbaking gcc and creating a toolchain with the prefix
x86_64-oesdk-linux- (default SDK_PREFIX) but I'm not sure what it is.  
Is it a cross-compile for my target MACHINE or a compiler for my build
machine?  Based on the prefix name I am assuming the latter.

Thanks for any help.
Kyle


