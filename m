Return-Path: <Ryan.Meulenkamp@nedap.com>
X-Greylist: delayed 591 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 27 Mar 2018 11:54:28 UTC
Received: from smtp4.nedap.com (smtp4.nedap.com [213.160.213.85])
	by mail.openembedded.org (Postfix) with ESMTP id C90C360190
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 11:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nedap.com; i=@nedap.com; q=dns/txt; s=20161201;
	t=1522151671; x=1553687671;
	h=to:from:subject:message-id:date:mime-version:
	content-transfer-encoding;
	bh=PZ9dhT3nKbloL18lVcyidfmheEVFfgpT4oFRCNquan0=;
	b=g2l5IENbX8+zATovGHdJdLpbzrjAOeWq15jEwwgrxsv1Y/Oyc3C70ccd
	EGJcvMe95fIXNrN4FZPY6kIRD5+5lLF/hVYj2q0fRcPeJ0JC1yntYrIUU
	dP4NN73VBBC1BQ9W+qBDMMyGTvafD0AvQHfku5ML+WHu/1aULR3NzJPGI c=;
X-IronPort-AV: E=Sophos;i="5.48,367,1517871600"; 
   d="scan'208";a="1277097"
Received: from nedap.nedap.local (HELO [10.2.16.212]) ([10.2.16.212])
	by smtp4.nedap.com with ESMTP; 27 Mar 2018 13:44:37 +0200
To: openembedded-core@lists.openembedded.org, yocto@yoctoproject.org
From: Ryan Meulenkamp <Ryan.Meulenkamp@nedap.com>
Message-ID: <12dbba60-2346-0020-64c8-db2dac948684@nedap.com>
Date: Tue, 27 Mar 2018 13:44:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
Subject: CPU Load
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
X-List-Received-Date: Tue, 27 Mar 2018 11:54:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi y'all,

I have some questions about CPU load and performance, but first some 
background information.

We have small embedded system running an openembedded classic (Angström) 
distro. Now to get ourselves up-to-date we started working on a new 
iteration of the OS based on openembedded core and Yocto. It is nearly 
finished now, if it weren't for one problem: The CPU load 
(/proc/loadavg) of the core/yocto based OS is more than double that of 
the classic/Angström OS.

So the way I see it this could be caused by a number of factors:

  - loadavg's calculation changed
  - certain newer versions of applications run heavier
  - The kernel itself is heavier (we upgraded from 2.6.35.14+ to 4.9.28+)
   - Possibly caused by some configs
  - ...

My question: is there something that changed since OE-classic that you 
know could be the cause of this? If not, how would I go about finding 
the cause? I don't think the top command is sufficient for this, because 
it's precision is such that many processes' CPU usage just become 0%. 
Also, both top and htop cause huge cpu loads themselves.

Any tips and tricks would be welcome!

Thanks in advance!

Ryan

