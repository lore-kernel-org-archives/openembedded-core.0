Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id C780F784AD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 07:15:21 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Nov 2017 23:15:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,407,1505804400"; 
   d="scan'208";a="6008435"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 16 Nov 2017 23:15:21 -0800
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>,
	Martyn Welch <martyn.welch@collabora.co.uk>
References: <1510844758-20290-1-git-send-email-martyn.welch@collabora.co.uk>
	<20171116172129.11b89562@lsandov1-mobl2.zpn.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <cb78b834-b34d-2b85-d4c3-e2081f90a83e@linux.intel.com>
Date: Fri, 17 Nov 2017 09:15:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171116172129.11b89562@lsandov1-mobl2.zpn.intel.com>
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [yocto] [PATCH v4 1/3] image.bbclass: add prohibited-paths QA test
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
X-List-Received-Date: Fri, 17 Nov 2017 07:15:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/17/2017 01:21 AM, Leonardo Sandoval wrote:
> isn't it this class meta/classes/insane.bbclass for this type of checks?

This was already discussed - the test should be on the image rather than 
package level:
http://lists.openembedded.org/pipermail/openembedded-core/2017-November/144335.html

Alex

