Return-Path: <ross.burton@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 5DA307F9BB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jan 2020 17:15:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jan 2020 09:15:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,387,1571727600"; d="scan'208";a="419778905"
Received: from hongy-mobl1.ger.corp.intel.com (HELO rburton-mac01.local)
	([10.252.50.70])
	by fmsmga005.fm.intel.com with ESMTP; 02 Jan 2020 09:15:46 -0800
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20191210120817.8374-1-ross.burton@intel.com>
	<a5e91d5ad9674452b9c9d3309884e7d3@XBOX03.axis.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <3c836a6a-995a-3b6f-c957-d07427ac8356@intel.com>
Date: Thu, 2 Jan 2020 17:15:46 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <a5e91d5ad9674452b9c9d3309884e7d3@XBOX03.axis.com>
Subject: Re: [PATCH] scripts: add pkgdataui
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
X-List-Received-Date: Thu, 02 Jan 2020 17:15:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 30/12/2019 01:16, Peter Kjellerstedt wrote:
>> pkgdataui is a Python 3/GObject Introspection/GTK+ 3 tool to browse the pkgdata
> 
> Would it make sense to rename it to oe-pkgdata-browser (based on the title it
> gives itself, and the existing oe-pkgadata-util tool)?

Makes sense.

> I get the following errors when I run it (though the GUI comes up and seems
> to work):
> 
> libGL error: No matching fbConfigs or visuals found
> libGL error: failed to load driver: swrast

That's your host system GTK+/Mesa, not pkgdataui.

>>   scripts/pkgdataui.glade | 335 ++++++++++++++++++++++++++++++++++++++++
> 
> Can the .glade file be put somewhere else than in the scripts directory?
> Because as it is now, it shows up when using tab completion (with zsh).

Why is zsh showing it? It's not executable, and a glade file shouldn't 
be ran by anything.

Ross

