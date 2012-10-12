Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1TMlpD-00062d-6l
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Oct 2012 22:27:17 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q9CKE1ZB025938
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 12 Oct 2012 13:14:01 -0700 (PDT)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 12 Oct 2012 13:14:01 -0700
Message-ID: <507879F7.9030901@windriver.com>
Date: Fri, 12 Oct 2012 16:13:43 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: <tom.zanussi@intel.com>
References: <cover.1350070372.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1350070372.git.tom.zanussi@intel.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] lttng-2.0 fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Oct 2012 20:27:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-10-12 03:52 PM, tom.zanussi@intel.com wrote:
> From: Tom Zanussi<tom.zanussi@intel.com>
>
> When trying out the current lttng-2.0, I found that it didn't work in
> its current state.  This patch makes it work again, or at least a
> a quick test on qemux86 works:
>
> Before:
>
> root@qemux86:~# lttng create
> Spawning a session daemon
> FATAL: Module lttng-tracer not found.
> Error: Unable to load module lttng-tracer
> Error: Unable to remove module lttng-tracer
> Warning: No kernel tracer available
> Session auto-20121012-190712 created.
> Traces will be written in /home/root/lttng-traces/auto-20121012-190712
>
> After:
>
> root@qemux86:~# lttng create
> Spawning a session daemon
> Session auto-20121012-192342 created.
> Traces will be written in /home/root/lttng-traces/auto-20121012-192342
> root@qemux86:~# lttng enable-event --kernel --all
> All kernel events are enabled in channel channel0
> root@qemux86:~# lttng start
> Tracing started for session auto-20121012-192342
> root@qemux86:~# lttng stop
> Tracing stopped for session auto-20121012-192342
> root@qemux86:~# lttng view
> [19:27:01.661844467] (+?.?????????) hrtimer_cancel: { 0 }, { hrtimer = 3354328992 }
> [19:27:01.661854316] (+0.000009849) hrtimer_expire_entry: { 0 }, { hrtimer = 3354328992, now = \
> 318684045266, function = 3238494992 }
> [19:27:01.661870669] (+0.000016353) softirq_raise: { 0 }, { vec = 1 }
> [19:27:01.661876340] (+0.000005671) softirq_raise: { 0 }, { vec = 9 }
> [19:27:01.661887892] (+0.000011552) sched_stat_runtime: { 0 }, { comm = "lttng-sessiond", tid =
>
>

That's what I'd expect.

Looks good from here.

Bruce

> The following changes since commit 0260bb5c6978839c068007fcff2f704937805faf:
>
>    gitignore: Fix for poky repository (2012-10-11 13:52:14 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib.git tzanussi/lttng-fixes.0
>    http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/lttng-fixes.0
>
> Tom Zanussi (2):
>    lttng-modules: update SRCREV and remove is_compat_task patch
>
>   ...ls-protect-is_compat_task-from-redefiniti.patch | 41 ----------------------
>   .../lttng-2.0/lttng-modules_2.0.5.bb               |  9 +++--
>   2 files changed, 9 insertions(+), 50 deletions(-)
>   delete mode 100644 meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch
>



