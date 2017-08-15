Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8537378506
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 11:02:28 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Aug 2017 04:02:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,377,1498546800"; d="scan'208";a="890079068"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 15 Aug 2017 04:02:28 -0700
To: Dvorkin Dmitry <dvorkin@tibbo.com>,
	openembedded-core@lists.openembedded.org
References: <1503655141-1302-1-git-send-email-stefan@agner.ch>
	<3ce69269-11b4-34b8-68fe-0ce8ac9bd103@tibbo.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <5574f618-9b75-43a2-8bdd-e6b45340ee0b@linux.intel.com>
Date: Tue, 15 Aug 2017 13:59:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <3ce69269-11b4-34b8-68fe-0ce8ac9bd103@tibbo.com>
Subject: Re: two recipes, one replaces files of another
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
X-List-Received-Date: Tue, 15 Aug 2017 11:02:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/15/2017 01:37 PM, Dvorkin Dmitry wrote:
> How to create dependencies correctly?
> I try to add
> RPROVIDES_${PN} += "recipe-brd" in both recipe-brdRevA/B  and use 
> PREFERRED_PROVIDER_recipe-brd = "..."
> into imgA/B.bb without success.

PREFERRED_PROVIDER is the right way to go. That's how a kernel variant 
is selected from multiple choices (regular, tiny, real time) for example 
- have a look at how it's done.

Alex

