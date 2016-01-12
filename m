Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EF9AB731A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 21:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0CLSvZe031576; Tue, 12 Jan 2016 21:32:10 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jZRpQTW41uQq; Tue, 12 Jan 2016 21:32:10 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0CLW4tH031625
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 12 Jan 2016 21:32:06 GMT
Message-ID: <1452634324.28375.24.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 12 Jan 2016 21:32:04 +0000
In-Reply-To: <1452583117-812-1-git-send-email-armccurdy@gmail.com>
References: <1452583117-812-1-git-send-email-armccurdy@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 0/5] strace: misc fixes + update 4.10 -> 4.11
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
X-List-Received-Date: Tue, 12 Jan 2016 21:32:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-01-11 at 23:18 -0800, Andre McCurdy wrote:
> Andre McCurdy (5):
>   strace: drop unnecessary dependency on acl
>   strace: fix --disable-aio configure option
>   strace: remove need for git-version-gen script
>   strace: fix ARCH definition in tests/Makefile
>   strace: update 4.10 -> 4.11

I included this in a -next build but it failed on the autobuilder:

http://errors.yoctoproject.org/Errors/Details/27173/
http://errors.yoctoproject.org/Errors/Details/27101/
http://errors.yoctoproject.org/Errors/Details/27101/

One is poky, one is poky-lsb, looks like it might be a debian system
specific issue :/.

Cheers,

Richard


