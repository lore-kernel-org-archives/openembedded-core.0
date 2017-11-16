Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5CEBC78792
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 10:31:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Nov 2017 02:32:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,402,1505804400"; 
   d="scan'208";a="5635497"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 16 Nov 2017 02:31:59 -0800
To: Martyn Welch <martyn.welch@collabora.co.uk>, yocto@yoctoproject.org,
	openembedded-core@lists.openembedded.org
References: <1510758646-19268-1-git-send-email-martyn.welch@collabora.co.uk>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <842129f5-aa24-f8a0-0e54-f2268c33b406@linux.intel.com>
Date: Thu, 16 Nov 2017 12:32:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1510758646-19268-1-git-send-email-martyn.welch@collabora.co.uk>
Subject: Re: [PATCH v3 1/2] image.bbclass: add prohibited-paths QA test
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
X-List-Received-Date: Thu, 16 Nov 2017 10:31:59 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/15/2017 05:10 PM, Martyn Welch wrote:
> Sometimes we wish to ensure that files or directories are not installed
> somewhere that may prove detrimental to the operation of the system. For
> example, this may be the case if files are placed in a directory that is
> utilised as a mount point at run time, thus making them inaccessible once
> when the mount point is being utilised.
> 
> Implement the prohibited paths QA test, which enables such locations to be
> specified in a "PROHIBITED_PATHS" variable. This implementation allows for
> a colon separated list of paths to be provided. Shell style wildcards can
> be used.

The test does nothing if PROHIBITED_PATHS is not set. Can you set it in 
core-image.bbclass to some reasonable default common to reference 
images? Something like /mnt /media /tmp /run /var/run /var/tmp (not sure 
at the moment what the mount points in those images are).

Alex

