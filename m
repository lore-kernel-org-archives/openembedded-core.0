Return-Path: <leimaohui@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id 5F1B16BEA6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 09:49:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.90,938,1371052800"; 
   d="scan'208";a="8569983"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 20 Sep 2013 17:46:10 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r8K9nMAH025868;
	Fri, 20 Sep 2013 17:49:22 +0800
Received: from G08FNSTD100511 ([10.167.226.63])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013092017474781-1655081 ;
	Fri, 20 Sep 2013 17:47:47 +0800 
From: "leimaohui" <leimaohui@cn.fujitsu.com>
To: "'Burton, Ross'" <ross.burton@intel.com>
References: <00d201ceb5cd$1440b070$3cc21150$@cn.fujitsu.com>
	<CAJTo0LY_doa073K_9m2Ry24nKT54MoWsBQ9p_45c2WGL+EiDJA@mail.gmail.com>
In-Reply-To: <CAJTo0LY_doa073K_9m2Ry24nKT54MoWsBQ9p_45c2WGL+EiDJA@mail.gmail.com>
Date: Fri, 20 Sep 2013 17:49:18 +0800
Message-ID: <00d501ceb5e6$ad9064f0$08b12ed0$@cn.fujitsu.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQJNp3O0zuBKJhcL6t7G1KdTvT1BQAFEKBmYmMZUqsA=
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/09/20 17:47:47,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/09/20 17:47:48,
	Serialize complete at 2013/09/20 17:47:48
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1]udev_182: creat a symbolic file /sbin/udevadm to fix haldaemon starts error.
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
X-List-Received-Date: Fri, 20 Sep 2013 09:49:24 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset="us-ascii"
Content-Language: zh-cn

On 20 September 2013 4:38 PM, Burton, Ross [mailto:ross.burton@intel.com] wrote:
> On 20 September 2013 07:46, leimaohui <leimaohui@cn.fujitsu.com> wrote:
> > The haldaemon requires /sbin/udevadm to start.
> > So creat a symbolic file  /sbin/udevadm that links to /usr/bin/udevadm.
> 
> Why not fix haldaemon to use the right path?

But  according to  udev's changlog,I think it is better to add a symlink to
udevadm.

http://upstream-tracker.org/changelogs/libudev/182/changelog.html

" The default install location of the 'udevadm' tool moved from 'sbin'
to /usr/bin. Some tools expect udevadm in 'sbin', a symlink to udevadm
needs to be manually created if needed, or --bindir=/sbin be specified."

Best Regards,
Maohui Lei





