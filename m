Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 968FC607BA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 13:03:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 May 2015 06:02:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,458,1427785200"; d="scan'208";a="731744045"
Received: from linux-8hqz.fi.intel.com (HELO linux-8hqz.site) ([10.237.68.142])
	by orsmga002.jf.intel.com with ESMTP; 19 May 2015 06:02:51 -0700
Message-ID: <555B3497.8090207@linux.intel.com>
Date: Tue, 19 May 2015 16:03:19 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1431997609.git.kai.kang@windriver.com>
	<7dfa7bda72262c9e998f4b37e2fe69d80d930858.1431997609.git.kai.kang@windriver.com>
In-Reply-To: <7dfa7bda72262c9e998f4b37e2fe69d80d930858.1431997609.git.kai.kang@windriver.com>
Subject: Re: [PATCH 4/4] gst-ffmpeg: fix CVEs
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
X-List-Received-Date: Tue, 19 May 2015 13:03:33 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/19/2015 04:08 AM, Kai Kang wrote:
> Backport patches to fix CVEs: CVE-2014-7933, CVE-2014-9318 and
> CVE-2014-9603.
>

Gstreamer 0.10 is moving to meta-multimedia, so you might want to hold 
this one off until it lands there.


Alex

