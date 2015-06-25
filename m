Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2D47772491
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 20:27:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5PKRP11000132
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Jun 2015 13:27:25 -0700 (PDT)
Received: from [172.25.44.10] (172.25.44.10) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 25 Jun 2015 13:27:25 -0700
Message-ID: <558C642C.9050101@windriver.com>
Date: Thu, 25 Jun 2015 16:27:24 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
X-Originating-IP: [172.25.44.10]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: I'll upgrade libtiff to 4.0.4
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
X-List-Received-Date: Thu, 25 Jun 2015 20:27:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Saul,

I'd like to work on upreving libtiff to 4.0.4:
    http://www.remotesensing.org/libtiff/v4.0.4.html
 From the ChangeLog:
2015-06-21
         * libtiff 4.0.4 released.

You seem to be the owner:
http://recipes.yoctoproject.org/rrs/recipedetail/743/

The upgrade will let us drop a bunch of CVE patches
as shown below.

Okay with you?

Is there a recipe lock mechanism to ensure that only
one person works on a recipe at a time? :)

../Randy


$ ls meta/recipes-multimedia/libtiff/files/ | \
   grep CVE| sed -e 's/.*tiff-//g' | sed -e 's/.patch//g' >
   /tmp/tiff

$ cd .../tiff/tiff-4.0.4
$ for i in `cat ~/tmp/tiff`; do \
    echo $i": "; grep $i ChangeLog; \
done
CVE-2013-1960:
	stomp all over memory when given bogus input.  Fixes CVE-2013-1960.
CVE-2013-1961:
  	particular to CVE-2013-1961 concerning overflow in tiff2pdf.c's
CVE-2013-4231:
	hostile input files (#2450, CVE-2013-4231)
CVE-2013-4232:
	ycbcr buffer (bug #2449, CVE-2013-4232)
CVE-2013-4243:
	* tools/gif2tif.c: apply patch for CVE-2013-4243 (#2451)
CVE-2013-4244:
	* tools/gif2tiff.c: fix possible OOB write (#2452, CVE-2013-4244)
CVE-2012-4564:
	* tools/ppm2tiff.c: Improve previous patch for CVE-2012-4564:
	CVE-2012-4564 - Thanks to Huzaifa Sidhpurwala of the

-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

