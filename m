Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id BFAD4609B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 17:18:00 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 25 Sep 2014 19:17:53 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 199002884E9;
	Thu, 25 Sep 2014 19:17:54 +0200 (CEST)
Date: Thu, 25 Sep 2014 19:17:54 +0200
From: "Maxin B. John" <maxin.john@enea.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20140925171754.GA7840@sestofb10.enea.se>
References: <1411644990-20122-1-git-send-email-maxin.john@enea.com>
	<CAJTo0LbhFF0g1swk1y250QOESwvjmJcuPcbZNvX_ESJTMt3GKA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbhFF0g1swk1y250QOESwvjmJcuPcbZNvX_ESJTMt3GKA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: Security Advisory - CVE-2014-3613 & CVE-2014-3620
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
X-List-Received-Date: Thu, 25 Sep 2014 17:18:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Ross,

On Thu, Sep 25, 2014 at 04:08:23PM +0100, Burton, Ross wrote:
> On 25 September 2014 12:36, Maxin B. John <maxin.john@enea.com> wrote:
> > Details of vulnerabilities are available below:
> > CVE-2014-3613: http://curl.haxx.se/docs/adv_20140910A.html
> > CVE-2014-3620: http://curl.haxx.se/docs/adv_20140910B.html
> >
> > Signed-off-by: Maxin B. John <maxin.john@enea.com>
> 
> This fails to apply:
> 
> ERROR: Command Error: exit status: 1  Output:
> Applying patch CVE-2014-3613.patch
> patching file lib/cookie.c
> patching file tests/data/test1105
> patching file tests/data/test31
> Hunk #1 FAILED at 49.
> 1 out of 2 hunks FAILED -- rejects in file tests/data/test31
> patching file tests/data/test8
> Patch CVE-2014-3613.patch does not apply (enforce with -f)
> ERROR: Function failed: patch_do_patch
> ERROR: Logfile of failure stored in:
> /data/poky-master/tmp/work/corei7-64-poky-linux/curl/7.37.1-r0/temp/log.do_patch.13247
> ERROR: Task 1 (/home/ross/Yocto/poky/meta/recipes-support/curl/curl_7.37.1.bb,
> do_patch) failed with exit code '1'

I have tried it with the latest master and it "worked for me".
Could you please confirm if it was applied on the "master" branch ?
(Couldn't recreate this failure at my PC) 

> Ross
Best Regards,
Maxin


