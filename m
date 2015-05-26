Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 159847324E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 09:15:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 26 May 2015 02:15:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,497,1427785200"; d="scan'208";a="731690588"
Received: from leeshawn-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.22.214])
	by fmsmga002.fm.intel.com with ESMTP; 26 May 2015 02:15:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Randy Witt <randy.e.witt@intel.com>, Khem Raj <raj.khem@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 26 May 2015 10:15:45 +0100
Message-ID: <2981463.2asXSZhTDk@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.7-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <5564081E.1050401@windriver.com>
References: <cover.1427186518.git.Qi.Chen@windriver.com>
	<5564081E.1050401@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Support persistent /var/log
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
X-List-Received-Date: Tue, 26 May 2015 09:15:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Randy, Khem, Otavio - this area was the subject of a discussion involving you 
around the 1.8 release, if you could review this set and comment that would be 
great.

Thanks,
Paul

On Tuesday 26 May 2015 13:43:58 ChenQi wrote:
> ping ....
> 
> *ANY* comment would be welcome, really ...
> 
> Thanks,
> Chen Qi
> 
> On 03/24/2015 04:42 PM, Chen Qi wrote:
> > The following changes since commit 
d3fcfe346b3472170641d9194243c4bbe06b8585:
> >    systemd: fix firmware path to match linux-firmware (2015-03-23 11:27:13
> >    +0000)> 
> > are available in the git repository at:
> >    git://git.openembedded.org/openembedded-core-contrib
> >    ChenQi/persistent-var-log
> >    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h
> >    =ChenQi/persistent-var-log> 
> > Chen Qi (4):
> >    bitbake.conf: add VOLATILE_LOG_DIR variable
> >    base-files: respect VOLATILE_LOG_DIR
> >    initscripts: support persistent /var/log
> >    package.bbclass: support persistent /var/log
> >   
> >   meta/classes/package.bbclass                       |  2 +-
> >   meta/conf/bitbake.conf                             |  4 ++
> >   meta/files/fs-perms-persistent-log.txt             | 66
> >   ++++++++++++++++++++++
> >   meta/recipes-core/base-files/base-files_3.0.14.bb  |  4 +-
> >   .../initscripts/initscripts-1.0/volatiles          |  1 -
> >   meta/recipes-core/initscripts/initscripts_1.0.bb   |  3 +
> >   6 files changed, 76 insertions(+), 4 deletions(-)
> >   create mode 100644 meta/files/fs-perms-persistent-log.txt

-- 

Paul Eggleton
Intel Open Source Technology Centre

