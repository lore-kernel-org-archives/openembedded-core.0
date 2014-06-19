Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8F6FF6B5A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jun 2014 13:55:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 19 Jun 2014 06:49:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,507,1400050800"; d="scan'208";a="550392203"
Received: from akagikob-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.96])
	by fmsmga001.fm.intel.com with ESMTP; 19 Jun 2014 06:55:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 19 Jun 2014 14:54:59 +0100
Message-ID: <3503275.YjDqJfgFMA@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.7-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <1403177022-19086-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403177022-19086-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] usbinit, weston-init, run-postinsts, qt-demo-init: Drop allarch
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
X-List-Received-Date: Thu, 19 Jun 2014 13:55:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Martin,

On Thursday 19 June 2014 13:23:42 Martin Jansa wrote:
> * update-rc.d.bbclass now adds dependency on TUNE_PKGARCH initscripts, so
> these cannot be allarch

As I've said before, I really dislike this change. The system should be made 
to handle the situation properly instead of working around the issue.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

