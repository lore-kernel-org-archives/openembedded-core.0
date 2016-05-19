Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 421E760767
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 12:18:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 19 May 2016 05:18:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,334,1459839600"; d="scan'208";a="980400412"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 19 May 2016 05:18:40 -0700
To: openembedded-core@lists.openembedded.org
References: <cover.1463557068.git.liezhi.yang@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <573DAF56.50601@linux.intel.com>
Date: Thu, 19 May 2016 15:19:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <cover.1463557068.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/7][python3] buildtools-tarball: replace python with python3
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
X-List-Received-Date: Thu, 19 May 2016 12:18:40 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/18/2016 10:43 AM, Robert Yang wrote:

> Robert Yang (7):
>    python3-smmap: add it for python3-gitdb
>    python3-async: add it for python3-gitdb
>    python3-gitdb: add it for python3-git
>    python3-git: add it for buildtools-tarball

You can remove the Python 2 versions at the same time. Nothing is 
requiring them in oe-core or meta-oe.

Alex


