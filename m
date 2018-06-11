Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 683E078BBA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 12:44:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jun 2018 05:44:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,501,1520924400"; d="scan'208";a="236161275"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 11 Jun 2018 05:44:56 -0700
To: Andrej Valek <andrej.valek@siemens.com>
References: <24e47452-9ff5-778c-5146-599589458a3f@linux.intel.com>
	<20180608140403.27855-1-andrej.valek@siemens.com>
	<CANNYZj9ecWrsg61KiAirO5YnkATOtEihRgym0iD5o1c0po5KNA@mail.gmail.com>
	<78456fb6-d8a1-c681-792a-36e78d7fb790@siemens.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <58fa6d36-737b-da77-d1ec-f72d50c75e5d@linux.intel.com>
Date: Mon, 11 Jun 2018 15:45:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <78456fb6-d8a1-c681-792a-36e78d7fb790@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/2] openssl-1.1: rework packaging
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
X-List-Received-Date: Mon, 11 Jun 2018 12:44:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06/11/2018 09:19 AM, Andrej Valek wrote:
> Hi Alex,
> 
> I have tested your branch and seems to be, that openssl is working
> correctly.
> 
> We are now using original (perl) c_rehash script, but dependency to perl
> is missing. Are you ok with adding runtime dependency to bin package?
> Just for notice, it will install perl on target.

Yes, of course. If c_rehash needs perl interpreter to run, then it has 
to pull it in.

Alex

