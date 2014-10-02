Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id EFB446017E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 14:13:22 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1; Thu, 2 Oct 2014
	16:13:15 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id E02D8288D4E;
	Thu,  2 Oct 2014 16:13:15 +0200 (CEST)
Date: Thu, 2 Oct 2014 16:13:15 +0200
From: "Maxin B. John" <maxin.john@enea.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20141002141315.GA33194@sestofb10.enea.se>
References: <1412170188-50070-1-git-send-email-maxin.john@enea.com>
	<CAJTo0LYN74cjhqQqNCB58_03Wq8_XLYbZ5_hBdQcc9mzKiOcUw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYN74cjhqQqNCB58_03Wq8_XLYbZ5_hBdQcc9mzKiOcUw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] curl: Security Advisory - CVE-2014-3613 & CVE-2014-3620
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
X-List-Received-Date: Thu, 02 Oct 2014 14:13:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Ross,

On Thu, Oct 02, 2014 at 02:54:05PM +0100, Burton, Ross wrote:
> On 1 October 2014 14:29, Maxin B. John <maxin.john@enea.com> wrote:
> > Details of vulnerabilities are available below:
> > CVE-2014-3613: http://curl.haxx.se/docs/adv_20140910A.html
> > CVE-2014-3620: http://curl.haxx.se/docs/adv_20140910B.html
> >
> > Signed-off-by: Maxin B. John <maxin.john@enea.com>
> > ---
> 
> Still fails to apply the patches (different failure to before).
> 
> ERROR: Command Error: exit status: 1  Output:
> Applying patch CVE-2014-3620.patch
> patching file lib/cookie.c
> patching file tests/data/test61
> Hunk #1 FAILED at 23.
> 1 out of 1 hunk FAILED -- rejects in file tests/data/test61
> Patch CVE-2014-3620.patch does not apply (enforce with -f)
> ERROR: Function failed: patch_do_patch
> ERROR: Logfile of failure stored in:
> /data/poky-master/tmp/work/corei7-64-poky-linux/curl/7.37.1-r0/temp/log.do_patch.18104
> ERROR: Task 6649
> (/home/ross/Yocto/poky/meta/recipes-support/curl/curl_7.37.1.bb,
> do_patch) failed with exit code '1'

Extremely sorry this time. I remember fixing this one and probably
sent a wrong version. Guess, I should take a vacation soon.
 
> Ross
Best Regards,
Maxin

