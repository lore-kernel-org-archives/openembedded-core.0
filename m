Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2D50375894
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 20:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1TKeoQ2031125; Mon, 29 Feb 2016 20:40:50 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qcqTEeiVksHN; Mon, 29 Feb 2016 20:40:50 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1TKeng4031121
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 29 Feb 2016 20:40:50 GMT
Message-ID: <1456778449.11498.183.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 29 Feb 2016 20:40:49 +0000
In-Reply-To: <1456773039-5178-1-git-send-email-Martin.Jansa@gmail.com>
References: <1456773039-5178-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] no-static-libs.inc: add gdb
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
X-List-Received-Date: Mon, 29 Feb 2016 20:40:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-02-29 at 20:10 +0100, Martin Jansa wrote:
> * gdb has own bundled version of readline and do_compile fails with:
>   | config.status: creating config.h
>   | make[2]: *** No rule to make target '../readline/libreadline.a',
> needed by 'gdb'.  Stop.
>   | make[2]: *** Waiting for unfinished jobs....
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

I'm a bit puzzled as our autobuilders build this all the time and we
don't see failures. Any idea what the configuration difference might
be?

Cheers,

Richard

