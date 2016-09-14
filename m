Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3C687770F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 10:33:17 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 14 Sep 2016 03:33:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,333,1470726000"; d="scan'208";a="168016272"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.49])
	([10.237.68.49])
	by fmsmga004.fm.intel.com with ESMTP; 14 Sep 2016 03:33:16 -0700
To: Sona Sarmadi <sona.sarmadi@enea.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <3230301C09DEF9499B442BBE162C5E48ABE3BA3B@SESTOEX04.enea.se>
	<37af20ca-62f9-7308-0b97-6ba6c46dafb1@linux.intel.com>
	<1473846188.7207.57.camel@linuxfoundation.org>
	<fd30a088-4a2f-9e4b-1289-d5bababdc3e2@linux.intel.com>
	<3230301C09DEF9499B442BBE162C5E48ABE3BB09@SESTOEX04.enea.se>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <6d86b220-85ac-f28a-3d7f-824526e7d97a@linux.intel.com>
Date: Wed, 14 Sep 2016 13:31:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <3230301C09DEF9499B442BBE162C5E48ABE3BB09@SESTOEX04.enea.se>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 14 Sep 2016 10:33:18 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/14/2016 01:24 PM, Sona Sarmadi wrote:

> Thanks guys for your feedbacks. I agree that by default we shouldn't upgrade package
> versions in stable branches as far as possible but sometimes we have to. If there isn't a
> suitable patch I personally prefer upgrading (only if it is minor changes) rather than
> sticking to a vulnerable version. We have done this in the past e.g. for OpenSSL (from
> 1.0.1x to 1.0.1y).

See, often the upstream does have a way to get security fixes out to 
users in a way that doesn't bundle unrelated feature additions and 
changes. By saying 'we should trust the upstream' I mean that we should 
try to fix security in a way provided by upstream instead of doing the 
backporting ourselves (where frequently we have no idea what we're 
really doing because we don't know the codebase, or it's otherwise too 
hard for various reasons).

> I will do some investigation to find out if https://secure.ucc.asn.au/hg/dropbear/rev/a3e8389e01ff
> is the fix for CVE-2016-3116 (by quick analysis it looks the right patch) and use that patch and NOT
> upgrade the dropbear version in krogoth !!

After looking at commit tree, I'm pretty certain that it is. And you can 
just update to 2016.72 because it is the only change in that version.

Alex

