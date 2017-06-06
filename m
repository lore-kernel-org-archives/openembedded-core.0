Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 77955608B7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 14:15:25 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jun 2017 07:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,306,1493708400"; d="scan'208";a="95205238"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 06 Jun 2017 07:15:25 -0700
To: Jan Kiszka <jan.kiszka@siemens.com>,
	openembedded-core@lists.openembedded.org
References: <15e918fb-c2e6-3005-6221-08601c804271@siemens.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <a60f39a6-8355-82dc-20b2-5f7b3d6397b3@linux.intel.com>
Date: Tue, 6 Jun 2017 17:12:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <15e918fb-c2e6-3005-6221-08601c804271@siemens.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: Fun with npm shrinkwrap
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
X-List-Received-Date: Tue, 06 Jun 2017 14:15:26 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/06/2017 01:17 PM, Jan Kiszka wrote:
> devtool add / recipetool create do not work properly /wrt shrinkwrap
> when it comes to node-red-node-serialport. npm shrinkwrap finds a number
> of extraneous packages and refuses to generate an output.
>
> There are various workarounds discussed in [1]. For me this seems to
> work:

You forgot to include the actual [1] :)

> But it may have unwanted side effects. So, what would be the proper way
> to address this issue?

A few months ago we had a long, big discussion about how to support 
these kinds of language environments in a way that is sustainable (I 
personally do not think the current approach with npm is viable in the 
long term). Here's the initial couple of emails:

http://lists.openembedded.org/pipermail/openembedded-architecture/2017-March/000480.html

http://lists.openembedded.org/pipermail/openembedded-architecture/2017-March/000481.html

Alex

