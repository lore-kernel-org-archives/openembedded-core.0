Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8209D76A51
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 13:24:42 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 10 Nov 2015 05:24:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,270,1444719600"; d="scan'208";a="832864856"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 10 Nov 2015 05:24:18 -0800
Message-ID: <5641F042.5080704@linux.intel.com>
Date: Tue, 10 Nov 2015 15:25:22 +0200
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
	<74d946dc65eb898819b81599cc6ae3a43297056d.1447080392.git.alexander.kanavin@linux.intel.com>
	<CAHiDW_GnidM1ee=8WwAgcSU5fKS9Mei5LfKzbEx_3u+9ji+3xA@mail.gmail.com>
In-Reply-To: <CAHiDW_GnidM1ee=8WwAgcSU5fKS9Mei5LfKzbEx_3u+9ji+3xA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/29] python-pygtk: remove the recipe
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
X-List-Received-Date: Tue, 10 Nov 2015 13:24:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/2015 03:13 PM, Jussi Kukkonen wrote:
> Are the pygtk changes directly related to the introspection changes? If
> not then maybe they should happen in another patch set.

They are; pygtk requires an old (2.x) non-introspection based version of 
pygobject, and the introspection patchset updates pygobject to latest 
3.x release which is a much thinner layer on top of libgirepository and 
is incompatible with pygtk.

Alex


