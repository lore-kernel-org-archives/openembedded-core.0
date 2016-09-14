Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id C106677214
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 09:08:49 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP; 14 Sep 2016 02:08:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,333,1470726000"; d="scan'208";a="878612815"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.49])
	([10.237.68.49])
	by orsmga003.jf.intel.com with ESMTP; 14 Sep 2016 02:08:49 -0700
To: openembedded-core@lists.openembedded.org
References: <3230301C09DEF9499B442BBE162C5E48ABE3BA3B@SESTOEX04.enea.se>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <37af20ca-62f9-7308-0b97-6ba6c46dafb1@linux.intel.com>
Date: Wed, 14 Sep 2016 12:06:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <3230301C09DEF9499B442BBE162C5E48ABE3BA3B@SESTOEX04.enea.se>
Subject: Re: CVE-2016-3116: dropbear: X11 forwarding input not validated properly
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
X-List-Received-Date: Wed, 14 Sep 2016 09:08:49 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/14/2016 11:49 AM, Sona Sarmadi wrote:
> https://matt.ucc.asn.au/dropbear/CHANGES
> .....
> 2016.72 - 9 March 2016    <<<<<<< dropbear version this CVE has been fixed
> - Validate X11 forwarding input. Could allow bypass of authorized_keys command= restrictions,
>   found by github.com/tintinweb. Thanks for Damien Miller for a patch. CVE-2016-3116
>
> 2015.71 - 3 December 2015  <<<< dropbear version in krogoth

It's *probably* this one. The commit messages in dropbear repository are 
*amazingly* vague and unprofessional.

https://secure.ucc.asn.au/hg/dropbear/rev/a3e8389e01ff

That said, I vote for updating to the version that comes with the fix. 
Backporting fixes should not be the default in the stable yocto 
releases; we should trust the upstream more.


Alex


