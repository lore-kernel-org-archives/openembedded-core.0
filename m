Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liang.Li@windriver.com>) id 1SwCms-0004Kx-Gg
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 15:47:02 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6VDZK2Q016407
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 31 Jul 2012 06:35:21 -0700 (PDT)
Received: from localhost (128.224.163.138) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 31 Jul 2012 06:35:21 -0700
Date: Tue, 31 Jul 2012 21:35:20 +0800
From: Liang Li <liang.li@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20120731133520.GA15443@localhost>
References: <1343697899-20776-1-git-send-email-liang.li@windriver.com>
	<1343732920.9526.4.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1343732920.9526.4.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] trace-cmd: Update for python-native changes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Liang Li <liang.li@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jul 2012 13:47:02 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 2012-07-31 19:08, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2012-07-31 at 09:24 +0800, Liang Li wrote:
> > Add pythonnative to the inherits list, otherwise we'll end up with
> > compiling error like:
> > 
> > | swig -Wall -python -noproxy ctracecmd.i
> > | trace-cmd.h:65: Error: Syntax error in input(1).
> > | trace-cmd.h:221: Warning(322): Redundant redeclaration of
> > | 'trace_util_ftrace_options',
> > | trace-cmd.h:196: Warning(322): previous declaration of
> > | 'trace_util_ftrace_options'.
> > | parse-events.h:275: Warning(312): Nested union not currently
> > | supported (ignored).
> > | parse-events.h:707: Warning(312): Nested union not currently
> > | supported (ignored).
> > | parse-events.h:746: Warning(312): Nested union not currently
> > | supported (ignored).
> > | make: *** [ctracecmd.so] Segmentation fault
> > 
> > Signed-off-by: Liang Li <liang.li@windriver.com>
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> > ---
> > Hi all,
> > 
> > Due to recent change to python, we've done pythonnative related change to
> > various recipes like perf, xcb etc. Now this one is for trace-cmd. :)
> > 
> > Thanks.
> > 
> >  meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> I merged Morgan's patch for this.
> 

Good to know this, thanks. :)

Regards,
		Liang Li

> Thanks,
> 
> Richard


