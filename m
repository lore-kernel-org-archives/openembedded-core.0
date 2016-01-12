Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C2CDC60616
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 11:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0CBdDVa030385; Tue, 12 Jan 2016 11:39:13 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id V3Tn9wUofkpM; Tue, 12 Jan 2016 11:39:13 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0CBd9j1030382
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 12 Jan 2016 11:39:11 GMT
Message-ID: <1452598749.28375.13.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>,
	openembedded-core@lists.openembedded.org, ross.burton@intel.com
Date: Tue, 12 Jan 2016 11:39:09 +0000
In-Reply-To: <3cb28a7edb40f7e138cdc4c15f5cca5802a3018a.1452472146.git.hongxu.jia@windriver.com>
References: <cover.1452472146.git.hongxu.jia@windriver.com>
	<3cb28a7edb40f7e138cdc4c15f5cca5802a3018a.1452472146.git.hongxu.jia@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 6/9] ghostscript: 9.16 -> 9.18
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
X-List-Received-Date: Tue, 12 Jan 2016 11:39:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-01-11 at 08:30 +0800, Hongxu Jia wrote:
> Remove '--without-jbig2dec', since upstream did not
> support it very well which caused build failure:
> ...
> > make[1]: *** No rule to make target `obj/sjbig2_.dev',
> needed by `obj/sjbig2.dev'.  Stop.
> ...
> 
> The same to option '--without-jbig2dec'.
> 
> Already file a bug to upstream:
> http://bugs.ghostscript.com/show_bug.cgi?id=696497
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

Presumably we use this option for a reason. What effect does removing
it have? Should we backport the fixes instead?

Cheers,

Richard

