Return-Path: <peter@berginkonsult.se>
Received: from mailrelay2.public.one.com (mailrelay2.public.one.com
	[91.198.169.125])
	by mail.openembedded.org (Postfix) with ESMTP id B069977AC5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 10:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=berginkonsult.se; s=20140924;
	h=from:subject:date:message-id:to:mime-version:content-type:
	content-transfer-encoding;
	bh=oAsJRYTN3pKQ8D4prVNBLkKSsl+EX/KXB8mxaoKrr7o=;
	b=pTK6iEMTzhu5tazAvHZ91P7zBBiLGJBDxg7GRgteGcm7x1JMavBFmXpQEo/oZsEtukBf5LdmQxbrc
	bITs+9h1ELLoD/Ax9SaXKnwjr+r8xfk5P5xEv/cylH+oYHQ3ZOI3zPMAkKf9N7fdVcxeX6KBHsLYSa
	foF6bC9QnnOlQ3uc=
X-HalOne-Cookie: 40c9bff480bdd37d082164c6b006f099a2b1b0b1
X-HalOne-ID: 6fa9cea1-0fb6-11e7-bc04-b82a72d03b9b
Received: from [192.168.0.100] (unknown [83.185.246.110])
	by smtpfilter2.public.one.com (Halon) with ESMTPSA
	id 6fa9cea1-0fb6-11e7-bc04-b82a72d03b9b;
	Thu, 23 Mar 2017 10:49:49 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <c55b01a9-d7a0-f583-6651-e8d9cd327472@berginkonsult.se>
Date: Thu, 23 Mar 2017 11:49:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
Subject: busybox - providing your own defconfig
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
X-List-Received-Date: Thu, 23 Mar 2017 10:49:51 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm currently looking into the configuration of busybox. What I want to 
do is to have my own defconfig in my own layer added by a bbappend file. 
During configuration of busybox I want use my defconfig file. What 
happens is that my defconfig is used as a base but then a couple of .cfg 
files with config fragments are added to my config.

Since the support of config fragments was added 
(56dc1720caa48344238d352c7b6e9b0f0d41aa54) to the busybox package all 
.cfg files added to the SRC_URI is unconditionally merged to your 
config. Probably an easy fix in my case is to add a do_configure_prepend 
step and remove all .cfg files from my WORKDIR. But my question that I 
want to raise is if this is intended and if it not should be possible to 
have your own untampered defconfig for busybox?

If the .cfg files are always unconditionally merged I can not see the 
benefit of them as you could have them in the default defconfig instead. 
I see in later commits of busybox.inc that some .cfg files now have 
conditionals in the SRC_URI, I think this is the way .cfg files should 
be handled.

Regards,
/Peter


