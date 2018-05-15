Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 8045375085
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 08:43:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2018 01:43:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,403,1520924400"; d="scan'208";a="55312420"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 15 May 2018 01:43:28 -0700
To: Joe Rutledge <joe.rutledge@phabrix.com>,
	openembedded-core@lists.openembedded.org
References: <6b04a571-cf20-5f25-8147-d2fe72fdeb90@phabrix.com>
	<3a2ff1bf-fa18-9b6b-83ce-e6d7fdd271bc@phabrix.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <05bac2d0-0f90-27ac-13fd-f26da087aa86@linux.intel.com>
Date: Tue, 15 May 2018 11:35:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <3a2ff1bf-fa18-9b6b-83ce-e6d7fdd271bc@phabrix.com>
Subject: Re: Krogoth branch Python 3.5 package maintainer
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
X-List-Received-Date: Tue, 15 May 2018 08:43:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/15/2018 11:35 AM, Joe Rutledge wrote:
> I'm not sure if this is the right address to ask the question to but I 
> thought you may be able to help? Apologies for the cross post to 
> poky@yoctoproject.org, I've only just found out that that's for more 
> general issues.
> 
> I have an issue with the Python 3.5 packaging within the Krogoth branch 
> of Poky. It doesn't seem to package the _posixsubprocess library needed 
> for deployment onto the target, even when the rest of the subprocess 
> python files are there. I've fixed this within python-3.5-manifest.inc 
> and am looking for the maintainer to see if the patch is valid and if 
> they want to include it within the mainline Krogoth branch. Can you 
> point me in the right direction?

Prepare the patch and send it here to oe-core list. However, you're 
better off upgrading to a supported release of YP.

Alex

