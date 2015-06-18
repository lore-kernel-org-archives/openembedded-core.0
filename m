Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0823D601DF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 13:16:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 18 Jun 2015 06:16:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,638,1427785200"; d="scan'208";a="729934208"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 18 Jun 2015 06:16:28 -0700
Message-ID: <5582C4B8.4010408@linux.intel.com>
Date: Thu, 18 Jun 2015 16:16:40 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@googlemail.com>
References: <1434547172-24620-1-git-send-email-alexander.kanavin@linux.intel.com>	<1434547172-24620-6-git-send-email-alexander.kanavin@linux.intel.com>	<CAHiDW_EwLwe52-VXnJTctjMS5+4pevuOE1CZwHuEbc_xRQ=4Zw@mail.gmail.com>	<5582AA4A.9000202@linux.intel.com>
	<CALbNGRQ5C5cMEPZEyYe03dJfMdAkyH-WiaWjoZCH77Y-DJ+f4A@mail.gmail.com>
In-Reply-To: <CALbNGRQ5C5cMEPZEyYe03dJfMdAkyH-WiaWjoZCH77Y-DJ+f4A@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/22] Update libnotify to version 0.7.6
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
X-List-Received-Date: Thu, 18 Jun 2015 13:16:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/18/2015 03:35 PM, Andreas Müller wrote:

> I think gtk3 is not the problem here it is the API change libnotify
> 0.6 -> 0.7 which cannot (or only by ugly hacks) be installed parallel.
> Do we know what happens to meta-gnome/meta-xfce?

The packages in meta-gnome that fail because of new libnotify are all 
five year old, unmaintained 2.32.something versions.

Let's just accept that meta-gnome needs to get a massive update to 3.x, 
those who don't like gnome 3.x need to seek alternative desktops and 
move on.

Regards,
Alex

