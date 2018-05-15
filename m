Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2E07274F77
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 09:47:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2018 02:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,403,1520924400"; d="scan'208";a="55325773"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 15 May 2018 02:47:29 -0700
To: Joe Rutledge <joe.rutledge@phabrix.com>,
	openembedded-core@lists.openembedded.org
References: <1526377501-7367-1-git-send-email-joe.rutledge@phabrix.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <7fa347cd-dfcc-fe71-8807-08e3a7d45710@linux.intel.com>
Date: Tue, 15 May 2018 12:40:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1526377501-7367-1-git-send-email-joe.rutledge@phabrix.com>
Subject: Re: [PATCH] python-3.5: Include _posixsubprocess in package
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
X-List-Received-Date: Tue, 15 May 2018 09:47:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/15/2018 12:45 PM, Joe Rutledge wrote:
> Change the python-3.5-manifest.inc file to also include:
> lib-dynload/_posixsubprocess.*.so
> 
> This is needed for Python subprocess support but was not included.

You need to include [krogoth] in the subject to indicate which release 
this is for.

> -    "lib-dynload/xreadlines.*.so types.* platform.* ${bindir}/python* "  +
> +    "lib-dynload/xreadlines.*.so types.* platform.* ${bindir}/python* "  +

What has changed here?

Alex

