Return-Path: <kamensky@cisco.com>
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
	by mail.openembedded.org (Postfix) with ESMTP id 2604779C64
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 18:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=7014; q=dns/txt; s=iport;
	t=1540837642; x=1542047242;
	h=date:from:to:cc:subject:in-reply-to:message-id:
	references:mime-version:content-id;
	bh=h2UpFIvP0TaGjXeDaoX9wBLByOKLkCWforXGSTsBs30=;
	b=TnWQ9prFPwl4iWi7SxK3biT+LJR+Fl2bCw7L/wu/nMnk6VKWFlXJpaEu
	Ljc787WY487KxhSuUkZMjGboWnZ02CqOwHEJ8zQ73XOq6yO2poQ8vzGYf
	g46Q4yoc3zJ4KB1CJvoam5WCOdiAHZp4IK3NN4K5FGJSnFefToh6XFqr+ Q=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BDAAA+UNdb/4YNJK1lGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAQGBZYIFZn8og3WId4s6gWglmRoLAQEYDYRHAoMtITgWAQM?=
	=?us-ascii?q?BAQIBAQJtHAyFOgEBAQECAQEiSwsFCwsRAwECASoCAignCAYTgyKBeQgPqgG?=
	=?us-ascii?q?BLoQsAYVoi2cXggCBRIJfgxsDAoEnV4JkglcCiFcSDjGGLo8zCYZqgyGCZoQ?=
	=?us-ascii?q?rgVJMhCuJfok0gzyKBQIECwIUgVohgVVNIxU7DRWCSgmLEIVeHzABileCTQE?=
	=?us-ascii?q?B?=
X-IronPort-AV: E=Sophos;i="5.54,441,1534809600"; d="scan'208";a="193311420"
Received: from alln-core-12.cisco.com ([173.36.13.134])
	by alln-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Oct 2018 18:27:21 +0000
Received: from sjc-ads-6991 (sjc-ads-6991.cisco.com [10.30.218.111])
	by alln-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id w9TIRKia028433
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 29 Oct 2018 18:27:20 GMT
Date: Mon, 29 Oct 2018 11:27:19 -0700 (PDT)
From: Victor Kamensky <kamensky@cisco.com>
To: Mark Hatle <mark.hatle@windriver.com>
In-Reply-To: <19ff21b9-dab8-79af-7ffa-81af121ea65b@windriver.com>
Message-ID: <alpine.LRH.2.00.1810290943390.62687@sjc-ads-6991.cisco.com>
References: <20181026045303.10592-1-kamensky@cisco.com>
	<445EEF2D-ABF2-4822-A390-D6D7DECAC6B9@linux.intel.com>
	<alpine.LRH.2.00.1810260049050.5649@sjc-ads-6991.cisco.com>
	<19ff21b9-dab8-79af-7ffa-81af121ea65b@windriver.com>
User-Agent: Alpine 2.00 (LRH 1167 2008-08-23)
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.218.111, sjc-ads-6991.cisco.com
X-Outbound-Node: alln-core-12.cisco.com
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
X-List-Received-Date: Mon, 29 Oct 2018 18:27:21 -0000
Content-Type: MULTIPART/MIXED;
	BOUNDARY="504000474-2003536050-1540831634=:62687"
Content-ID: <alpine.LRH.2.00.1810291119520.6409@sjc-ads-6991.cisco.com>

--504000474-2003536050-1540831634=:62687
Content-Type: TEXT/PLAIN; CHARSET=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.LRH.2.00.1810291119521.6409@sjc-ads-6991.cisco.com>

Hi Mark,

On Mon, 29 Oct 2018, Mark Hatle wrote:

> On 10/26/18 2:55 AM, Victor Kamensky wrote:
>>
>>
>> On Fri, 26 Oct 2018, Markus Lehtonen wrote:
>>
>>> 'why would you want to have multiple, alternative
>>> syslog daemons on the system? Wouldn't a better
>>> fix be to move the syslogd and klogd symlinks to the
>>> busybox-syslog package? It doesn't seem to make much
>>> sense to have a syslogd binary on the system without
>>> an init script(?)
>>>
>>> The original problem really was related to managing
>>> init scripts with alternatives (and I think that
>>> problem still persists, and, it shouldn't be done).
>>> So, using alternatives for the binaries wouldn't
>>> cause any problems. The question is just why to
>>> do this, instead of "fixing" the (binary) package
>>> content so that existing rconflicts would handle it.
>>
>> Thank you, Markus. Please see ChenQi reply on the
>> thread. I has already been fixed by Richard in the
>> way you suggested.
>>
>> My problem was because similar fix was not present
>> in meta-selinux busybox.bbappend ... meta-selinux practically
>> has a copy of alternative handling for busybox
>> because of SELinux labeling requirements and it was
>> negating Richard's change.
>
> As a maintainer for meta-selinux, if meta-selinux is broken.. it's
> meta-selinux's fault.. NOT oe-core.
> oe-core must work for itself first.
>
> Fix OE-core properly and the other layers will follow.

Please see

http://lists.openembedded.org/pipermail/openembedded-core/2018-October/157078.html

oe-core is fine: ef11c54ba9. In order to follow
meta-selinux needs something like this to avoid
'update-alternatives: Error:' mentioned on the thead:

From dd75b2ca77b3bfcb14030c353e6b2bfc7df8dfec Mon Sep 17 00:00:00 2001
From: Victor Kamensky <kamensky@cisco.com>
Date: Mon, 29 Oct 2018 11:16:09 -0700
Subject: [PATCH] busybox: Put klogd/syslogd alternative links in syslog
  package

Port "ef11c54ba9 busybox: Put klogd/syslogd alternative links in
syslog package" from oe-core to meta-selinux copy of
update-alternative handling in busybox.bbappend

Signed-off-by: Victor Kamensky <kamensky@cisco.com>
---
  recipes-core/busybox/busybox_selinux.inc | 6 +++++-
  1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-core/busybox/busybox_selinux.inc b/recipes-core/busybox/busybox_selinux.inc
index df7c117..b8cfcd7 100644
--- a/recipes-core/busybox/busybox_selinux.inc
+++ b/recipes-core/busybox/busybox_selinux.inc
@@ -37,7 +37,11 @@ python create_sh_wrapper_reset_alternative_vars () {
              # Match coreutils
              if alt_name == '[':
                  alt_name = 'lbracket'
-            d.appendVar('ALTERNATIVE_%s' % (pn), ' ' + alt_name)
+            if alt_name == 'klogd' or alt_name == 'syslogd':
+                d.appendVar('ALTERNATIVE_%s-syslog' % (pn), ' ' + alt_name)
+            else:
+                d.appendVar('ALTERNATIVE_%s' % (pn), ' ' + alt_name)
+
              d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, alt_link_name)
              if os.path.exists(alt_wppath_dest):
                  d.setVarFlag('ALTERNATIVE_TARGET', alt_name, alt_wppath)
-- 
2.14.4

I don't know yet what mailing list I should use for meta-selinux. As
time permits I'll try to figure out and post above patch there, if
it is still needed.

Thanks,
Victor

> --Mark
>
>> So it is sorted out now.
>>
>> Thanks,
>> Victor
>>
>>> Cheers,
>>>  Markus
>>>
>>> ﻿On 26/10/2018, 7.55, "Victor Kamensky" <kamensky@cisco.com> wrote:
>>>
>>>    Otherwise when used in presense of busybox that provides
>>>    its own version of klogd and syslogd, image packaging
>>>    complains that klogd exists and it is not syymbolic link.
>>>    Failure happens only if image packaging script install
>>>    sysklogd package first followed by installtion of busybox
>>>    package. If during packaging reverse installtion order
>>>    happens, busybox first followed by sysklogd, packaging
>>>    succeed.
>>>
>>>    Note this fix along with recently committed
>>>    55ba9dc1f8 sysklogd: Re-enable alternatives for syslogd.8 man page
>>>    effectively reverts this commit
>>>    988aad01b2 sysklogd: don't use update-alternatives
>>>
>>>    Signed-off-by: Victor Kamensky <kamensky@cisco.com>
>>>    ---
>>>    Hi Guys,
>>>
>>>    Here is more details. Example of failure that I observe:
>>>
>>>    update-alternatives: Error: not linking /home/wd8/oe/20181021/build/tmp-glibc/work/intel_corei7_64-oe-linux/kdevel-console-devel-image/1.0-r0/rootfs/sbin/klogd to /usr/lib/busybox/sbin/klogd since /home/wd8/oe/20181021/build/tmp-glibc/work/intel_corei7_64-oe-linux/kdevel-console-devel-image/1.0-r0/rootfs/sbin/klogd exists and is not a link
>>>
>>>    Also 988aad01b2 says:
>>>
>>>   > Using update-alternatives for managing init scripts has proved to be
>>>   > problematic. And, sysklogd rconflicts with other syslog daemons so there
>>>   > is no point in using update-alternatives from this perspective, either.
>>>
>>>    I am not sure why "managing init scripts has proved to be problematic" and
>>>    syslogd and klogd are not really init script per se, aren't they? Also
>>>    klogd and syslogd actually come from busybox, not busybox-syslog as listed
>>>    in sysklogd RCONFLICTS. Maybe it what has changed since 988aad01b2.
>>>    busybox-syslog now contains only init script for syslog and its
>>>    configuration.
>>>
>>>    Adding Markus for further comments.
>>>
>>>     meta/recipes-extended/sysklogd/sysklogd.inc | 5 +++++
>>>     1 file changed, 5 insertions(+)
>>>
>>>    diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
>>>    index f151dd87f7..4393a39180 100644
>>>    --- a/meta/recipes-extended/sysklogd/sysklogd.inc
>>>    +++ b/meta/recipes-extended/sysklogd/sysklogd.inc
>>>    @@ -60,9 +60,14 @@ FILES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','systemd','${exec_prefix}
>>>
>>>     ALTERNATIVE_PRIORITY = "100"
>>>
>>>    +ALTERNATIVE_${PN} = "syslogd klogd"
>>>    +
>>>     ALTERNATIVE_${PN}-doc = "syslogd.8"
>>>     ALTERNATIVE_LINK_NAME[syslogd.8] = "${mandir}/man8/syslogd.8"
>>>
>>>    +ALTERNATIVE_LINK_NAME[syslogd] = "${base_sbindir}/syslogd"
>>>    +ALTERNATIVE_LINK_NAME[klogd] = "${base_sbindir}/klogd"
>>>    +
>>>     pkg_prerm_${PN} () {
>>>     	if test "x$D" = "x"; then
>>>     	if test "$1" = "upgrade" -o "$1" = "remove"; then
>>>    --
>>>    2.17.2
>>>
>>>
>>>
>>>
>>>
>>
>
>

--504000474-2003536050-1540831634=:62687--
