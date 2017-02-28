Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D41CE72F7E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 08:56:13 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2017 00:56:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,218,1484035200"; d="scan'208";a="829245558"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Feb 2017 00:56:13 -0800
To: akuster808 <akuster808@gmail.com>,
	"Jolley, Stephen K" <stephen.k.jolley@intel.com>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155E573720C5@fmsmsx111.amr.corp.intel.com>
	<956ffb9d-d58d-93b8-6989-6283009f4826@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <83c9a7c7-20c7-6e4f-5461-18bfe7196130@linux.intel.com>
Date: Tue, 28 Feb 2017 10:55:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <956ffb9d-d58d-93b8-6989-6283009f4826@gmail.com>
Subject: =?UTF-8?B?UmU6IFlvY3RvIFByb2plY3QgU3RhdHVzIFdXMDnigJkxNw==?=
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
X-List-Received-Date: Tue, 28 Feb 2017 08:56:14 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/28/2017 04:09 AM, akuster808 wrote:
 >> o   rpm v4/dnf to replace rpm v5/smart?
 >>
 > IMHO, we should include dnf in 2.3 so folks can start playing with it
 > and remove smart in 2.4.

Apologies, but there will not be a transitional period for this. Making 
smart and dnf coexist is hard and will require months of work. Anyone 
who wants to play with dnf, can do it now:

https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavin/dnf-rpm4

Alex

