Return-Path: <kamensky@cisco.com>
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
	by mail.openembedded.org (Postfix) with ESMTP id 8236360110
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2018 07:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=4516; q=dns/txt; s=iport;
	t=1540540510; x=1541750110;
	h=date:from:to:cc:subject:in-reply-to:message-id:
	references:mime-version:content-id;
	bh=C5kOItLfKySKErLtwYsuC2Ztac3FNyHiEozXULYSabM=;
	b=GTvesdXPuUJGeWAgfHpD76zkHgRX/DkJeejYsnaPRxOQAE8UutZryB43
	LM0e1jqH7HLHw89zJNcVEWqOK4yR5UVAkdlnDpqY7eKvaNvPpObei0OCP
	MnJG19Xv3Hztf8Pf24BmWD/y0lTBVQvlsrSSNi5QEd/l5PSasGGWxsT1o g=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BDAACTx9Jb/5BdJa1jGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAQGBZYIFgWUog3WId4s4gWglmRYLAQGEbAKDEyE4FgEDAQE?=
	=?us-ascii?q?CAQECbSiFOgEBAQECASNWBQsLGCoCAlcGE4UbCKZRgS6KHYtnF4IAgUSCX4g?=
	=?us-ascii?q?CglcCiGYOMYYshROKFwmKCIcPgVKEd4l7iTKNNwIECwIUgVohgVVNIxWDJ5B?=
	=?us-ascii?q?3HzCNKQEB?=
X-IronPort-AV: E=Sophos;i="5.54,427,1534809600"; d="scan'208";a="191261138"
Received: from rcdn-core-8.cisco.com ([173.37.93.144])
	by alln-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Oct 2018 07:55:09 +0000
Received: from sjc-ads-6991 (sjc-ads-6991.cisco.com [10.30.218.111])
	by rcdn-core-8.cisco.com (8.15.2/8.15.2) with ESMTPS id w9Q7t8b8007661
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 26 Oct 2018 07:55:08 GMT
Date: Fri, 26 Oct 2018 00:55:08 -0700 (PDT)
From: Victor Kamensky <kamensky@cisco.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
In-Reply-To: <445EEF2D-ABF2-4822-A390-D6D7DECAC6B9@linux.intel.com>
Message-ID: <alpine.LRH.2.00.1810260049050.5649@sjc-ads-6991.cisco.com>
References: <20181026045303.10592-1-kamensky@cisco.com>
	<445EEF2D-ABF2-4822-A390-D6D7DECAC6B9@linux.intel.com>
User-Agent: Alpine 2.00 (LRH 1167 2008-08-23)
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.218.111, sjc-ads-6991.cisco.com
X-Outbound-Node: rcdn-core-8.cisco.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sysklogd: add alternatives for klogd and syslogd
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
X-List-Received-Date: Fri, 26 Oct 2018 07:55:08 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="504000474-581238369-1540540208=:5649"
Content-ID: <alpine.LRH.2.00.1810260050280.5649@sjc-ads-6991.cisco.com>

--504000474-581238369-1540540208=:5649
Content-Type: TEXT/PLAIN; CHARSET=UTF-8; FORMAT=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.LRH.2.00.1810260050281.5649@sjc-ads-6991.cisco.com>



On Fri, 26 Oct 2018, Markus Lehtonen wrote:

> 'why would you want to have multiple, alternative
> syslog daemons on the system? Wouldn't a better
> fix be to move the syslogd and klogd symlinks to the
> busybox-syslog package? It doesn't seem to make much
> sense to have a syslogd binary on the system without
> an init script(?)
>
> The original problem really was related to managing
> init scripts with alternatives (and I think that
> problem still persists, and, it shouldn't be done).
> So, using alternatives for the binaries wouldn't
> cause any problems. The question is just why to
> do this, instead of "fixing" the (binary) package
> content so that existing rconflicts would handle it.

Thank you, Markus. Please see ChenQi reply on the
thread. I has already been fixed by Richard in the
way you suggested.

My problem was because similar fix was not present
in meta-selinux busybox.bbappend ... meta-selinux practically
has a copy of alternative handling for busybox
because of SELinux labeling requirements and it was
negating Richard's change.

So it is sorted out now.

Thanks,
Victor

> Cheers,
>  Markus
>
> ﻿On 26/10/2018, 7.55, "Victor Kamensky" <kamensky@cisco.com> wrote:
>
>    Otherwise when used in presense of busybox that provides
>    its own version of klogd and syslogd, image packaging
>    complains that klogd exists and it is not syymbolic link.
>    Failure happens only if image packaging script install
>    sysklogd package first followed by installtion of busybox
>    package. If during packaging reverse installtion order
>    happens, busybox first followed by sysklogd, packaging
>    succeed.
>
>    Note this fix along with recently committed
>    55ba9dc1f8 sysklogd: Re-enable alternatives for syslogd.8 man page
>    effectively reverts this commit
>    988aad01b2 sysklogd: don't use update-alternatives
>
>    Signed-off-by: Victor Kamensky <kamensky@cisco.com>
>    ---
>    Hi Guys,
>
>    Here is more details. Example of failure that I observe:
>
>    update-alternatives: Error: not linking /home/wd8/oe/20181021/build/tmp-glibc/work/intel_corei7_64-oe-linux/kdevel-console-devel-image/1.0-r0/rootfs/sbin/klogd to /usr/lib/busybox/sbin/klogd since /home/wd8/oe/20181021/build/tmp-glibc/work/intel_corei7_64-oe-linux/kdevel-console-devel-image/1.0-r0/rootfs/sbin/klogd exists and is not a link
>
>    Also 988aad01b2 says:
>
>    > Using update-alternatives for managing init scripts has proved to be
>    > problematic. And, sysklogd rconflicts with other syslog daemons so there
>    > is no point in using update-alternatives from this perspective, either.
>
>    I am not sure why "managing init scripts has proved to be problematic" and
>    syslogd and klogd are not really init script per se, aren't they? Also
>    klogd and syslogd actually come from busybox, not busybox-syslog as listed
>    in sysklogd RCONFLICTS. Maybe it what has changed since 988aad01b2.
>    busybox-syslog now contains only init script for syslog and its
>    configuration.
>
>    Adding Markus for further comments.
>
>     meta/recipes-extended/sysklogd/sysklogd.inc | 5 +++++
>     1 file changed, 5 insertions(+)
>
>    diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
>    index f151dd87f7..4393a39180 100644
>    --- a/meta/recipes-extended/sysklogd/sysklogd.inc
>    +++ b/meta/recipes-extended/sysklogd/sysklogd.inc
>    @@ -60,9 +60,14 @@ FILES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','systemd','${exec_prefix}
>
>     ALTERNATIVE_PRIORITY = "100"
>
>    +ALTERNATIVE_${PN} = "syslogd klogd"
>    +
>     ALTERNATIVE_${PN}-doc = "syslogd.8"
>     ALTERNATIVE_LINK_NAME[syslogd.8] = "${mandir}/man8/syslogd.8"
>
>    +ALTERNATIVE_LINK_NAME[syslogd] = "${base_sbindir}/syslogd"
>    +ALTERNATIVE_LINK_NAME[klogd] = "${base_sbindir}/klogd"
>    +
>     pkg_prerm_${PN} () {
>     	if test "x$D" = "x"; then
>     	if test "$1" = "upgrade" -o "$1" = "remove"; then
>    --
>    2.17.2
>
>
>
>
>

--504000474-581238369-1540540208=:5649--
