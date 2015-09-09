Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9B63173D27
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 02:45:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t892jvu2020053
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 Sep 2015 19:45:57 -0700 (PDT)
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 8 Sep 2015 19:45:57 -0700
To: "Reshetova, Elena" <elena.reshetova@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <2236FBA76BA1254E88B949DDB74E612B41976CB1@IRSMSX102.ger.corp.intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <55EF9D64.8000601@windriver.com>
Date: Tue, 8 Sep 2015 22:45:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <2236FBA76BA1254E88B949DDB74E612B41976CB1@IRSMSX102.ger.corp.intel.com>
X-Originating-IP: [172.25.44.6]
Subject: Re: How to put a correct dependency with regards to gcc?
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
X-List-Received-Date: Wed, 09 Sep 2015 02:45:58 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015-09-04 01:03 PM, Reshetova, Elena wrote:
> Hi,
>
> I have a simple problem but not able to come with simple and elegant
> solution for it, so would be very thankful for the suggestions.
>
> I have a task that is specified to run after do_fetch. The task needs
> the source to be **actually** fetched, since it operates on archives. It
> works well for everything apart gcc.
>
> For example in fido branch, my task run for libgcc will fail, because
> do_fetch task for libgcc actually **does not** not fetch the gcc sources
> (only puts a nice lock file in the download folder).
>
> When I noticed this, I tried to put the dependency on
> gcc-source:do_fetch for my task (because that actually fetches the gcc
> sources) and it works in fido, but in master after changes to gcc
> nothing provides gcc-source and it wants to specify the version, which I
> don’t want to do (ideally I don’t want to put any dependencies to gcc,
> since I don’t really depend on it!). In master a run for libgcc-initial
> fails for the same reasons: gcc tar ball is not there.
>
> Is there a way to make it work correctly?

Maybe we have to fix gcc-source after all rather than use the
EXCLUDE_WORLD change I made in:
    https://bugzilla.yoctoproject.org/show_bug.cgi?id=7878
Does your scheme work for the kernel source? See:

Search for "kernel-devsrc" here:
  http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/68352

../Randy

>
> Here is the history of issue we are trying to solve:
> https://github.com/01org/meta-security-isafw/issues/1
>
> Best Regards,
> Elena.
>
>
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

