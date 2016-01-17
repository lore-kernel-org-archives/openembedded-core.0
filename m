Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C6787731E5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 17:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0HHi48M002805; Sun, 17 Jan 2016 17:44:04 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id aa_TpRpcSzaR; Sun, 17 Jan 2016 17:44:04 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0HHi0Vf002802
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 17 Jan 2016 17:44:02 GMT
Message-ID: <1453052640.27999.23.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>,
	openembedded-core@lists.openembedded.org, ross.burton@intel.com,
	raj.khem@gmail.com, randy.macleod@windriver.com
Date: Sun, 17 Jan 2016 17:44:00 +0000
In-Reply-To: <05d17c12cd03aa3b60ac1f864383e89623d9521e.1452673538.git.hongxu.jia@windriver.com>
References: <cover.1452673538.git.hongxu.jia@windriver.com>
	<05d17c12cd03aa3b60ac1f864383e89623d9521e.1452673538.git.hongxu.jia@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH V2 6/9] ghostscript: 9.16 -> 9.18
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
X-List-Received-Date: Sun, 17 Jan 2016 17:44:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-01-13 at 03:30 -0500, Hongxu Jia wrote:
> Backport patches to fix build failure caused by
> '--without-jbig2dec' and '--without-jbig2dec'.
> ...
> > make[1]: *** No rule to make target `obj/sjbig2_.dev',
> needed by `obj/sjbig2.dev'.  Stop.
> ...
> 
> http://bugs.ghostscript.com/show_bug.cgi?id=696497
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

This upgrade seems to have some issues on arm:

http://errors.yoctoproject.org/Errors/Details/27534/
http://errors.yoctoproject.org/Errors/Details/27528/
http://errors.yoctoproject.org/Errors/Details/27527/

Cheers,

Richard

