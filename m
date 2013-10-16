Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id D1CB56CC4B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 11:47:04 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 16 Oct 2013 04:47:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,507,1378882800"; d="scan'208";a="411879929"
Received: from unknown (HELO helios.localnet) ([10.252.121.8])
	by fmsmga001.fm.intel.com with ESMTP; 16 Oct 2013 04:47:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>, Saul Wold <sgw@linux.intel.com>
Date: Wed, 16 Oct 2013 12:47:03 +0100
Message-ID: <1578419.2XPu0WXrbc@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <8BAC7D9C-A794-42B2-B31A-9FDC3AEB9FDC@dominion.thruhere.net>
References: <1381875766-20689-1-git-send-email-sgw@linux.intel.com>
	<1517941.hq8ryEHxA8@helios>
	<8BAC7D9C-A794-42B2-B31A-9FDC3AEB9FDC@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] packagegroup-core-basic: libuser has a hard depenency on libpam
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
X-List-Received-Date: Wed, 16 Oct 2013 11:47:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 16 October 2013 13:23:08 Koen Kooi wrote:
> Op 16 okt. 2013, om 12:25 heeft Paul Eggleton
> <paul.eggleton@linux.intel.com> het volgende geschreven:
> > On Tuesday 15 October 2013 15:22:46 Saul Wold wrote:
> >> Since libpam is only built when DISTRO_FEATURES pam is enabled we should
> >> not be trying to build libuser also.
> > 
> > Should this packagegroup be bringing in libraries such as this at all,
> > given that libraries are generally pulled in as dependencies of
> > applications that link to them?
> 
> If it is a pure library, no. But libuser doesn't seem to be a pure library
> package:
> 
> [koen@rrMBP libuser]$ cat libuser/latest
> PV = 0.58
> PR = r0
> PKGR = r0.0
> RPROVIDES =
> RDEPENDS = eglibc (>= 2.17) glib-2.0 (>= 2.34.3) libffi (>= 3.0.11) libpam
> (>= 1.1.6) popt (>= 1.16) RRECOMMENDS =
> PKGSIZE = 283679
> FILES = /usr/bin/* /usr/sbin/* /usr/lib/libuser/* /usr/lib/lib*.so.* /etc
> /com /var /bin/* /sbin/* /lib/*.so.* /lib/udev/rules.d
> /usr/lib/udev/rules.d /usr/share/libuser /usr/lib/libuser/*
> /usr/share/pixmaps /usr/share/applications /usr/share/idl /usr/share/omf
> /usr/share/sounds /usr/lib/bonobo/servers FILELIST = /etc/libuser.conf
> /usr/bin/lchfn /usr/bin/lchsh /usr/lib/libuser.so.1
> /usr/lib/libuser.so.1.4.0 /usr/lib/libuser/libuser_files.so
> /usr/lib/libuser/libuser_shadow.so /usr/sbin/lchage /usr/sbin/lgroupadd
> /usr/sbin/lgroupdel /usr/sbin/lgroupmod /usr/sbin/lid /usr/sbin/lnewusers
> /usr/sbin/lpasswd /usr/sbin/luseradd /usr/sbin/luserdel /usr/sbin/lusermod

Right, in that case, ignore me :)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

