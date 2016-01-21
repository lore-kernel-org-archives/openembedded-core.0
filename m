Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4E53573179
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 18:29:22 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 21 Jan 2016 10:29:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,326,1449561600"; d="scan'208";a="895552227"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.181.236])
	by orsmga002.jf.intel.com with ESMTP; 21 Jan 2016 10:29:19 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jan 2016 07:29:17 +1300
Message-ID: <2992852.OT1HfBaFUF@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.3-300.fc23.x86_64; KDE/4.14.14; x86_64; ;
	)
In-Reply-To: <56A099D8.4020908@windriver.com>
References: <cover.1453363852.git.liezhi.yang@windriver.com>
	<20160121081654.GD31212@axis.com> <56A099D8.4020908@windriver.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] insane.bbclass: do_package_qa depends on WARN_QA and ERROR_QA
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
X-List-Received-Date: Thu, 21 Jan 2016 18:29:23 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thu, 21 Jan 2016 16:42:00 Robert Yang wrote:
> On 01/21/2016 04:16 PM, Olof Johansson wrote:
> > On 16-01-21 00:11 -0800, Robert Yang wrote:
> >> --- a/meta/classes/insane.bbclass
> >> +++ b/meta/classes/insane.bbclass
> >> @@ -1098,6 +1098,7 @@ python do_package_qa () {
> >> 
> >>   do_package_qa[vardepsexclude] = "BB_TASKDEPDATA"
> >>   do_package_qa[rdeptask] = "do_packagedata"
> >> 
> >> +do_package_qa[vardeps] += "${WARN_QA} ${ERROR_QA}"
> > 
> > Shouldn't this be "WARN_QA ERROR_QA"? Or you'll get the expanded
> > values of the variables.
> 
> Sorry, please drop this patch, need more work it.

Aside from that, didn't we already have a discussion on whether changing these 
variables should force do_package_qa to re-execute? Ross, I seem to recall you 
were involved last time.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

