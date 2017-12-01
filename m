Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2DF9471C54
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 08:24:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Dec 2017 00:24:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,344,1508828400"; d="scan'208";a="11782640"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 01 Dec 2017 00:24:33 -0800
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1512006081.git.liezhi.yang@windriver.com>
	<12c2694b20a9198d2d4f02100ced3dbdc1351f75.1512006081.git.liezhi.yang@windriver.com>
	<3d8f8bf0-84a6-d9bf-6540-3cc09196fb1a@linux.intel.com>
	<b644f3d2-de4f-186d-241e-4b3a69bfe23b@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <af30d73d-787a-3b42-9659-a9980e8bf86d@linux.intel.com>
Date: Fri, 1 Dec 2017 10:25:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <b644f3d2-de4f-186d-241e-4b3a69bfe23b@windriver.com>
Subject: Re: [PATCH 1/5] go-native: fix PATH issue when len(TMPDIR) == 410
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
X-List-Received-Date: Fri, 01 Dec 2017 08:24:34 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/01/2017 03:40 AM, Robert Yang wrote:
> So I don't think that it is worth to use malloc here, the similar to 2 3 5.
> And we had used a few similar ways to fix this kinds of issues before.

Okay, that's fair. If there is an upper limit defined somewhere else 
(kernel, glibc) and upstream doesn't mind taking the fix, then I'm fine 
with it.


Alex

