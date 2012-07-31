Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SwAVB-0001Hc-EQ for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 13:20:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6VB8pUR020172;
	Tue, 31 Jul 2012 12:08:51 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20153-01; Tue, 31 Jul 2012 12:08:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6VB8enT020165
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 31 Jul 2012 12:08:42 +0100
Message-ID: <1343732920.9526.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Liang Li <liang.li@windriver.com>
Date: Tue, 31 Jul 2012 12:08:40 +0100
In-Reply-To: <1343697899-20776-1-git-send-email-liang.li@windriver.com>
References: <1343697899-20776-1-git-send-email-liang.li@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] trace-cmd: Update for python-native changes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Tue, 31 Jul 2012 11:20:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-07-31 at 09:24 +0800, Liang Li wrote:
> Add pythonnative to the inherits list, otherwise we'll end up with
> compiling error like:
> 
> | swig -Wall -python -noproxy ctracecmd.i
> | trace-cmd.h:65: Error: Syntax error in input(1).
> | trace-cmd.h:221: Warning(322): Redundant redeclaration of
> | 'trace_util_ftrace_options',
> | trace-cmd.h:196: Warning(322): previous declaration of
> | 'trace_util_ftrace_options'.
> | parse-events.h:275: Warning(312): Nested union not currently
> | supported (ignored).
> | parse-events.h:707: Warning(312): Nested union not currently
> | supported (ignored).
> | parse-events.h:746: Warning(312): Nested union not currently
> | supported (ignored).
> | make: *** [ctracecmd.so] Segmentation fault
> 
> Signed-off-by: Liang Li <liang.li@windriver.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
> Hi all,
> 
> Due to recent change to python, we've done pythonnative related change to
> various recipes like perf, xcb etc. Now this one is for trace-cmd. :)
> 
> Thanks.
> 
>  meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I merged Morgan's patch for this.

Thanks,

Richard



