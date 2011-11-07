Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RNZ0j-0001lt-OF
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 00:53:54 +0100
Received: from mail-pz0-f44.google.com ([209.85.210.44])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 07 Nov 2011 15:47:35 -0800
Received: by pzk32 with SMTP id 32so762891pzk.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2011 15:47:35 -0800 (PST)
Received: by 10.68.7.166 with SMTP id k6mr3146071pba.128.1320709653941;
	Mon, 07 Nov 2011 15:47:33 -0800 (PST)
Received: from [127.0.0.1] (masterfoo.zenlinux.com. [207.192.74.254])
	by mx.google.com with ESMTPS id d8sm27836503pbb.6.2011.11.07.15.47.31
	(version=SSLv3 cipher=OTHER); Mon, 07 Nov 2011 15:47:32 -0800 (PST)
Message-ID: <4EB86E07.5020907@intel.com>
Date: Mon, 07 Nov 2011 15:47:19 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4EB8225D.6000804@intel.com>
	<1320700315-11952-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1320700315-11952-1-git-send-email-eric@eukrea.com>
Subject: Re: [PATCH 1/2] useradd.bbclass: handle nativesdk case
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
X-List-Received-Date: Mon, 07 Nov 2011 23:53:54 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Eric,

Sorry to throw more churn into this, but can I ask you to submit a new 
pull request for this?

In discussions with Richard today, he pointed out a few tricks that 
would improve the patchset:

DEPENDS_append = "${USERADDDEPENDS}"
USERADDDEPENDS = " base-passwd shadow-native shadow-sysroot"
USERADDDEPENDS_virtclass-nativesdk = ""

do_install[prefuncs] += "${SYSROOTFUNC}"
SYSROOTFUNC = "useradd_sysroot"
SYSROOTFUNC_virtclass-nativesdk = ""

I didn't want to take away credit for your patch, so if you'd be willing 
to make these changes and respin your patch set, we'll take that.

The second thing is to avoid merge conflicts, can you rebase you 
patchset on top of this branch:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=sgarman/useradd-rdepends-final

...and Saul has been warned to apply these patches in the correct order.

Thanks,

Scott

PS - if this is a hassle, just let me know and I'm happy to take care of it.

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


