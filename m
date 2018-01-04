Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 19DAF6010B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 09:27:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jan 2018 01:27:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,506,1508828400"; 
   d="scan'208";a="7958737"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 04 Jan 2018 01:27:09 -0800
To: ChenQi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
References: <20171221130434.24427-1-alexander.kanavin@linux.intel.com>
	<20171221130434.24427-3-alexander.kanavin@linux.intel.com>
	<77edf942-1e45-d129-1af5-35809f0c94d6@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <991321f1-d190-3b20-c2c3-572bf6e5fcc5@linux.intel.com>
Date: Thu, 4 Jan 2018 11:27:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <77edf942-1e45-d129-1af5-35809f0c94d6@windriver.com>
Subject: Re: [PATCH 3/9] json-glib: convert to meson build
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
X-List-Received-Date: Thu, 04 Jan 2018 09:27:09 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01/04/2018 10:51 AM, ChenQi wrote:
>> file://0001-Do-not-disable-gobject-introspection-when-cross-comp.patch \
>> +           "
> 
> I removed this patch and the compile succeeded.
> Could you please check if this patch is really needed?
> If it is, I think we'd better make build to succeed by default anyway.

Yes, it is really needed. Without it, introspection files will not be 
generated at all. I'll try to reproduce the failure.

Alex

