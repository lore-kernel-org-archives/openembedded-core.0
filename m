Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7516265E1A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 01:18:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s821ISRv003000
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Sep 2014 18:18:28 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 1 Sep 2014 18:18:27 -0700
Message-ID: <54051AE2.9070309@windriver.com>
Date: Tue, 2 Sep 2014 09:18:26 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1407836032.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1407836032.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/1] perf.bb: fix multilib build
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
X-List-Received-Date: Tue, 02 Sep 2014 01:18:31 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Any comments on this one, please ? This can fix the qa error when build
multilib:

     ERROR: QA Issue: lib32-perf: Files/directories were installed but not shipped
       /usr/lib64
       /usr/lib64/traceevent
       /usr/lib64/traceevent/plugins
       /usr/lib64/traceevent/plugins/plugin_function.so
       /usr/lib64/traceevent/plugins/plugin_scsi.so
       /usr/lib64/traceevent/plugins/plugin_hrtimer.so
       /usr/lib64/traceevent/plugins/plugin_kmem.so
       /usr/lib64/traceevent/plugins/plugin_jbd2.so
       /usr/lib64/traceevent/plugins/plugin_xen.so
       /usr/lib64/traceevent/plugins/plugin_mac80211.so
       /usr/lib64/traceevent/plugins/plugin_cfg80211.so
       /usr/lib64/traceevent/plugins/plugin_sched_switch.so
       /usr/lib64/traceevent/plugins/plugin_kvm.so [installed-vs-shipped]


And I usually see it.

// Robert

On 08/12/2014 07:10 PM, Robert Yang wrote:
> The following changes since commit 4321c553d5ae816e566234e981a0815bba046d39:
>
>    SIGGEN_EXCLUDERECIPES_ABISAFE: add initscripts (2014-08-11 17:44:09 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib rbt/perf
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/perf
>
> Robert Yang (1):
>    perf.bb: fix multilib build
>
>   meta/recipes-kernel/perf/perf.bb |    8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>

