Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DF620784F8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 12:53:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 04:53:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,393,1505804400"; 
   d="scan'208";a="7470491"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 14 Nov 2017 04:53:56 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: Martyn Welch <martyn.welch@collabora.co.uk>, yocto@yoctoproject.org,
	openembedded-core@lists.openembedded.org
References: <1510600788-27455-1-git-send-email-martyn.welch@collabora.co.uk>
	<ac750826-9931-85d1-35b4-106d774ee829@linux.intel.com>
Message-ID: <8291e8fe-44b3-6ec3-b0c7-f0075dde9317@linux.intel.com>
Date: Tue, 14 Nov 2017 14:54:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <ac750826-9931-85d1-35b4-106d774ee829@linux.intel.com>
Subject: Re: [PATCH v2 1/2] package.bbclass: add prohibited-path qa test
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
X-List-Received-Date: Tue, 14 Nov 2017 12:53:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/14/2017 02:47 PM, Alexander Kanavin wrote:

> I think this situation is an image configuration problem, not a package 
> qa problem. If a package wants to install something in a location that 
> is deemed inappropriate by the local config, there's a reason behind it, 
> the fix may not be easy to develop, and will likely be useless or even 
> unacceptable to other users of the recipe. It's better to reconfigure 
> the mount points.

Oh and another point I forgot: some files are created at do_rootfs time 
when packages are installed onto the image, so they won't be caught by 
this check at all. Better to do it at the last moment.

Alex

