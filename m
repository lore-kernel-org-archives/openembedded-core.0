Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E01EA72491
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 20:34:13 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 25 Jun 2015 13:34:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,679,1427785200"; d="scan'208";a="594855046"
Received: from josuerfi-mobl1.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.254.73.119])
	by orsmga003.jf.intel.com with ESMTP; 25 Jun 2015 13:34:14 -0700
Message-ID: <558C65C6.7040507@linux.intel.com>
Date: Thu, 25 Jun 2015 13:34:14 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Randy MacLeod <randy.macleod@windriver.com>
References: <558C642C.9050101@windriver.com>
In-Reply-To: <558C642C.9050101@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: I'll upgrade libtiff to 4.0.4
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
X-List-Received-Date: Thu, 25 Jun 2015 20:34:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/25/2015 01:27 PM, Randy MacLeod wrote:
> Saul,
>
> I'd like to work on upreving libtiff to 4.0.4:
>     http://www.remotesensing.org/libtiff/v4.0.4.html
>  From the ChangeLog:
> 2015-06-21
>          * libtiff 4.0.4 released.
>
> You seem to be the owner:
> http://recipes.yoctoproject.org/rrs/recipedetail/743/
>
> The upgrade will let us drop a bunch of CVE patches
> as shown below.
>
> Okay with you?
>
Go for it!

> Is there a recipe lock mechanism to ensure that only
> one person works on a recipe at a time? :)
>
Verbal, or sometimes not we have had 2 people send updates very close to 
each other!

Sau!

> ../Randy
>
>
> $ ls meta/recipes-multimedia/libtiff/files/ | \
>    grep CVE| sed -e 's/.*tiff-//g' | sed -e 's/.patch//g' >
>    /tmp/tiff
>
> $ cd .../tiff/tiff-4.0.4
> $ for i in `cat ~/tmp/tiff`; do \
>     echo $i": "; grep $i ChangeLog; \
> done
> CVE-2013-1960:
>      stomp all over memory when given bogus input.  Fixes CVE-2013-1960.
> CVE-2013-1961:
>       particular to CVE-2013-1961 concerning overflow in tiff2pdf.c's
> CVE-2013-4231:
>      hostile input files (#2450, CVE-2013-4231)
> CVE-2013-4232:
>      ycbcr buffer (bug #2449, CVE-2013-4232)
> CVE-2013-4243:
>      * tools/gif2tif.c: apply patch for CVE-2013-4243 (#2451)
> CVE-2013-4244:
>      * tools/gif2tiff.c: fix possible OOB write (#2452, CVE-2013-4244)
> CVE-2012-4564:
>      * tools/ppm2tiff.c: Improve previous patch for CVE-2012-4564:
>      CVE-2012-4564 - Thanks to Huzaifa Sidhpurwala of the
>

