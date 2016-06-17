Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0FBDC76312
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 18:34:52 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 17 Jun 2016 11:34:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,484,1459839600"; d="scan'208";a="990001176"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2016 11:34:52 -0700
To: openembedded-core@lists.openembedded.org
References: <cover.1466134497.git.Qi.Chen@windriver.com>
	<37ce8eaba328c8312072cc877cbbf04c595d12ca.1466134498.git.Qi.Chen@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <cf8e5656-1e7c-0329-7297-d69ba4103fb5@linux.intel.com>
Date: Fri, 17 Jun 2016 21:34:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <37ce8eaba328c8312072cc877cbbf04c595d12ca.1466134498.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 4/4] util-linux: upgrade to 2.28
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
X-List-Received-Date: Fri, 17 Jun 2016 18:34:56 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/17/2016 06:36 AM, Chen Qi wrote:
> ptest is disabled as the related codes are changed a lot, and the
> related patches are removed.

Excuse me, but you should not remove ptest support altogether just 
because upstream has rearranged it in the new version. Please figure it 
out, rebase the patches, or rewrite them altogether. If the code is 
complicated, or you get confusing errors, we're all ready to help.

Alex

