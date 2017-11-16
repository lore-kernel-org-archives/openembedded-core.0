Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 9AC7178792
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 10:39:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Nov 2017 02:39:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,402,1505804400"; 
   d="scan'208";a="5637007"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 16 Nov 2017 02:39:29 -0800
To: Stefan Agner <stefan@agner.ch>, Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <a316ea0c483e68f37d624e742472d248@agner.ch>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <da5f7d07-f51c-e1f4-56dd-78e4febe9da7@linux.intel.com>
Date: Thu, 16 Nov 2017 12:39:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <a316ea0c483e68f37d624e742472d248@agner.ch>
Subject: Re: Error when connecting to OpenSSH server using rocko
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
X-List-Received-Date: Thu, 16 Nov 2017 10:39:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/16/2017 11:48 AM, Stefan Agner wrote:
> In a quick test I removed the PREFERRED_VERSION_openssl to get 1.1.0f,
> removed openssl10 DEPENDS in the openssh recipe and added the ArchLinux'
> openssl-1.1.0.patch:
> 
> # ssh -V
> OpenSSH_7.5p1, OpenSSL 1.1.0f  25 May 2017
> 
> With that I could login.
> 
> User nayfe on IRC reported the same issue.
> 
> I guess moving rocko to OpenSSL 1.1 is not really an option at this
> point? Thoughts?

Openssl 1.0 is what the openssh upstream officially supports. All the 
1.1 patches are vendor hacks.

Can you try to bisect the issue with the rocko branch? Find some commit 
in the past where it still works, and take it from there. And do 
everything you can to enable additional diagnostics on the server side 
when it fails. Note that we use ssh on the autobuilder to run commands 
on test images, and this surely would've been noticed if it was a common 
issue.

Alex

