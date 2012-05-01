Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SPFD2-00005q-L4
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 17:41:48 +0200
Received: from mail-gy0-f180.google.com ([209.85.160.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 01 May 2012 08:32:04 -0700
Received: by ghbz12 with SMTP id z12so1876447ghb.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 May 2012 08:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=Vu7ZqIokqeBQATGHABgghm4DE7SEz+UFBdzT1HXPa8U=;
	b=jB657UM/fxquNBXwFD+Od3juRo/1HsTfWFX3bStJT/BvrBpcbh5lYJFG3zUYm5ZOiy
	kqOSHm2c5CTA9lFzveEL2sHrVj19/kkDO1KJzAnQSF4orgWpZg8Xp0bKzZfKXhx2Henl
	VVgPeWh/bBkK3FEY6Pyr2T7//DllKglH5GukYPI+Ki4MNxomQJ1cwWsgxRmlnjM7Zebg
	SVUOtmTg1+1xX88s6hcVYFaCoDQGaD03uk99Htk5r19LBc9VIQ7D3ZQAs0OO9GnKY59I
	0S6JNEuieii+ShzIxNQmjObtW3GdPVbzfQ0BbdnYC13/PlMF2ik7R4po9MYYi/s40YBJ
	T8og==
Received: by 10.68.218.7 with SMTP id pc7mr51475674pbc.4.1335886323001;
	Tue, 01 May 2012 08:32:03 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id wf6sm19476122pbc.8.2012.05.01.08.32.00
	(version=SSLv3 cipher=OTHER); Tue, 01 May 2012 08:32:01 -0700 (PDT)
Message-ID: <4FA001F0.7010705@intel.com>
Date: Tue, 01 May 2012 08:32:00 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: yocto@yoctoproject.org
X-Gm-Message-State: ALoCoQky0UQ49zhIVVQ/tLBKglJRkrksNmf013rDqUqTv19N7hQg7rI/4PG+Txx6AWGHo7CSJHyU
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Yocto Project 1.2.1 release plan.
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
X-List-Received-Date: Tue, 01 May 2012 15:41:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I'm going to be the maintainer of the Yocto Project 1.2.1 release, and 
wanted to let everyone know some details about the current status of 
this release.

Richard has already started pulling in some patches from master into the 
denzil-next branch on oe-core:

http://git.openembedded.org/openembedded-core/log/?h=denzil-next

I'll be merging these on an ongoing basis into my sgarman/denzil-next 
branch in the poky-contrib repo:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=sgarman/denzil-next

The primary focus for getting patches into 1.2.1 is bugfixing, security 
updates, and making sure the recently released Ubuntu, Fedora, and 
OpenSUSE distros work with this release. All other kinds of patches 
(e.g, performance) will have a very high bar to reach for them to be 
accepted (i.e, it will have to be very clear they pose little risk to 
introducing more bugs or stability issues). And of course anything that 
breaks APIs or compatibility is off the table.

It would help me out greatly if in your pull requests you could mention 
when you want your commit to also be included in 1.2.1.

Our intention is currently to include bugfixes for these bugs in the 
eventual release of 1.2.1:

https://bugzilla.yoctoproject.org/buglist.cgi?query_format=advanced&list_id=4572&bug_status=NEW&bug_status=ACCEPTED&bug_status=REOPENED&bug_status=NEEDINFO&bug_status=WaitForUpstream&bug_status=RESOLVED&bug_status=VERIFIED&bug_status=CLOSED&target_milestone=1.2.1

This list is not set in stone and may change at any time. My very rough 
guesstimate is that we will start testing release candidates for 1.2.1 
in about 6-8 weeks.

Thanks, and I look forward to helping to ensure that 1.2.1 is a solid 
and well-tested release!

Scott

IRC: zenlinux

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


