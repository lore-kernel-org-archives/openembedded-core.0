Return-Path: <yaoxp@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id D45226D3A7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 10:08:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.93,651,1378828800"; 
   d="scan'208";a="8971491"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 07 Nov 2013 18:04:38 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id rA7A80hA028612;
	Thu, 7 Nov 2013 18:08:00 +0800
Received: from G08FNSTD100620 ([10.167.226.76])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013110718060568-2847293 ;
	Thu, 7 Nov 2013 18:06:05 +0800 
From: "yaoxp" <yaoxp@cn.fujitsu.com>
To: "'Saul Wold'" <sgw@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <008a01cec5bd$b1797160$146c5420$@cn.fujitsu.com>
	<5272914B.9040702@linux.intel.com>
In-Reply-To: <5272914B.9040702@linux.intel.com>
Date: Thu, 7 Nov 2013 18:07:55 +0800
Message-ID: <011001cedba1$3b5fba30$b21f2e90$@cn.fujitsu.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQIU92tc48HBX406VtW6r7xjCW2jdgKT/hSomXizYcA=
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/11/07 18:06:05,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/11/07 18:06:06,
	Serialize complete at 2013/11/07 18:06:06
Subject: Re: [PATCH 1/1] cronie: build cronie with --with-syscrontab
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
X-List-Received-Date: Thu, 07 Nov 2013 10:08:05 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset="UTF-8"
Content-Language: zh-cn


> On 10/10/2013 06:36 AM, yaoxp wrote:
> > Hi all,
> >
> > If build cronie without --with-syscrontab, the /etc/crontab will not work.
> >
> 
> I ran a test without this and the /etc/crontab file was read and the
> cron entry was executed, can you explain more clearly what you observed?
> 
My build environment:
	Yocto version: 1.4.2
	Cronie version: 1.4.9
/etc/crontab will not read if build cronie without --with-syscrontab from 1.4.9 
If /etc/crontab doesn't work, may be inconvenient to the user

Yaoxp


> The default seems to have it enabled unless it's explicitly disabled.
> This might be a change from 1.4.9 to 1.4.11 as the recipe was recently
> updated.
> 
> Sau!
> 
> 
> 
> > Signed-off-by: Yao Xinpan <yaoxp@cn.fujitsu.com>
> > ---
> >   meta/recipes-extended/cronie/cronie_1.4.9.bb |    4 +++-
> >   1 files changed, 3 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta/recipes-extended/cronie/cronie_1.4.9.bb
> b/meta/recipes-extended/cronie/cronie_1.4.9.bb
> > index 7db0381..0fbb815 100644
> > --- a/meta/recipes-extended/cronie/cronie_1.4.9.bb
> > +++ b/meta/recipes-extended/cronie/cronie_1.4.9.bb
> > @@ -34,7 +34,9 @@ SRC_URI[sha256sum] =
> "bd7f6f118460c452bd1217a24b80fd3c000425d3de28731b98354a81a2
> >   inherit autotools update-rc.d useradd
> >
> >   EXTRA_OECONF += "\
> > -                ${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam',
> '--without-pam', d)}"
> > +                ${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam',
> '--without-pam', d)} \
> > +                --with-syscrontab \
> > +                "
> >
> >   INITSCRIPT_NAME = "crond"
> >   INITSCRIPT_PARAMS = "start 90 2 3 4 5 . stop 60 0 1 6 ."
> > --
> > 1.7.1
> >
> > -------------------------------------------
> > Yao Xinpan
> > TEL: 8559
> >
> >
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >



