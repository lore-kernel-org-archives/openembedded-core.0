Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id B73B572002
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 11:47:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jun 2018 04:47:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,490,1520924400"; d="scan'208";a="235494058"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 08 Jun 2018 04:47:10 -0700
To: Andrej Valek <andrej.valek@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20180607072501.27158-1-andrej.valek@siemens.com>
	<20180607073209.27240-1-andrej.valek@siemens.com>
	<59452b23-7470-588c-75fb-7445aaa13ba1@linux.intel.com>
	<e09f86d5-ef04-fa9c-8cbf-c0b0f4fa4172@siemens.com>
	<c407b9de-5921-0512-eeba-9ea6f9464386@siemens.com>
	<0edc5efa-5836-2b76-7af1-a4261a345e56@linux.intel.com>
	<f3f86e10-d9a6-264f-53a5-861f2bf40edc@siemens.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <24e47452-9ff5-778c-5146-599589458a3f@linux.intel.com>
Date: Fri, 8 Jun 2018 14:47:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <f3f86e10-d9a6-264f-53a5-861f2bf40edc@siemens.com>
Subject: Re: [PATCH v2] feat(openssl-1.1): rework packaging
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
X-List-Received-Date: Fri, 08 Jun 2018 11:47:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06/08/2018 02:31 PM, Andrej Valek wrote:
> Unknown regexp modifier "/b" at ./c_rehash line 15, at end of line
> Unknown regexp modifier "/W" at ./c_rehash line 28, at end of line
> Unknown regexp modifier "/3" at ./c_rehash line 28, at end of line
> Unknown regexp modifier "/2" at ./c_rehash line 28, at end of line
> No such class installdir at ./c_rehash line 63, near "Prefix our installdir"
>    (Might be a runaway multi-line // string starting on line 28)
> syntax error at ./c_rehash line 63, near "Prefix our installdir"
> Can't redeclare "my" in "my" at ./c_rehash line 68, near ""
> Execution of ./c_rehash aborted due to compilation errors.

A google search for the last line revealed that Debian has a patch to 
address this:

https://salsa.debian.org/debian/openssl/blob/debian/unstable/debian/patches/Revert-util-dofile.pl-only-quote-stuff-that-actually-need.patch

Alex

