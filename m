Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8D29B731EC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 15:17:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 Jan 2016 07:17:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,325,1449561600"; d="scan'208";a="865485903"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 21 Jan 2016 07:16:59 -0800
To: openembedded-core@lists.openembedded.org
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56A0F5D4.5090701@linux.intel.com>
Date: Thu, 21 Jan 2016 17:14:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
Subject: proposal: let's move oe-core to ffmpeg (from libav)
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
X-List-Received-Date: Thu, 21 Jan 2016 15:17:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

let's replace libav with ffmpeg in oe-core. The reasons are:

- all of the major distributions are using ffmpeg now (the last holdout 
was Debian, and they switched to ffmpeg in summer 2015 after a long 
discussion and deliberation [1][2])
- ffmpeg is much more responsive to security issues
- ffmpeg does regular releases, while libav hasn't had one since spring 2015
- other reasons listed in [2]

[1] https://lwn.net/Articles/650816/
[2] https://wiki.debian.org/Debate/libav-provider/ffmpeg

Objections, thoughts?


Alex

