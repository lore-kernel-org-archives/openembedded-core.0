Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 23353724B3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 01:45:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t081ixKP021985
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 7 Jan 2015 17:44:59 -0800 (PST)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 7 Jan 2015 17:44:59 -0800
Message-ID: <54ADE119.6060008@windriver.com>
Date: Thu, 8 Jan 2015 09:44:57 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Subject: About update binutils (2.24 to 2.25)
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
X-List-Received-Date: Thu, 08 Jan 2015 01:45:05 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Khem,

I'm trying to upgrade binutils from 2.24 to 2.25, there is
a patch binutils/libtool-2.4-update.patch which has 19317
lines, do you have any ideas on how did we make it in the past,
please ?

$ diffstat ./binutils/libtool-2.4-update.patch
  bfd/configure        | 1314 +++++++++++++++++-----
  bfd/configure.in     |    2
  binutils/configure   | 1312 +++++++++++++++++-----
  configure            |    2
  gas/configure        | 1312 +++++++++++++++++-----
  gprof/configure      | 1317 +++++++++++++++++-----
  ld/configure         | 1693 ++++++++++++++++++++++-------
  libtool.m4           | 1094 +++++++++++++------
  ltmain.sh            | 2925 ++++++++++++++++++++++++++++++++++-----------------
  ltoptions.m4         |    2
  ltversion.m4         |   12
  lt~obsolete.m4       |    2
  opcodes/configure    | 1314 +++++++++++++++++-----
  opcodes/configure.in |    2
  14 files changed, 8937 insertions(+), 3366 deletions(-)

-- 
Thanks

Robert

