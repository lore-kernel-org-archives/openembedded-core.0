Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A0BD971B10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 11:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uBGBW7AJ018210; Fri, 16 Dec 2016 11:32:07 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Qvrg1H5dSzWa; Fri, 16 Dec 2016 11:32:07 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uBGBW498018206
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 16 Dec 2016 11:32:06 GMT
Message-ID: <1481887924.9843.19.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Dengke Du <dengke.du@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 16 Dec 2016 11:32:04 +0000
In-Reply-To: <46f2559616e1f79721500cb2ada13657aa67e225.1481856470.git.dengke.du@windriver.com>
References: <cover.1481856470.git.dengke.du@windriver.com>
	<46f2559616e1f79721500cb2ada13657aa67e225.1481856470.git.dengke.du@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] Revert "subversion: fix "svnadmin create" fail on x86"
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
X-List-Received-Date: Fri, 16 Dec 2016 11:32:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-12-16 at 10:49 +0800, Dengke Du wrote:
> This reverts commit cfe6f3e251240c9d9a70354be0501600357f0b87.

You need to say why. 

I'm guessing you've a better fix in the following patch but it is a
guess and I shouldn't need to guess.

Cheers,

Richard

