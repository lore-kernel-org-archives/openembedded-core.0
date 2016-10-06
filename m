Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D7E9760770
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 10:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u96AiW2a016333; Thu, 6 Oct 2016 11:45:08 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zodz7SiSfvAf; Thu,  6 Oct 2016 11:45:08 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u96Aj6rE016580
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 6 Oct 2016 11:45:07 +0100
Message-ID: <1475750706.30475.539.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 06 Oct 2016 11:45:06 +0100
In-Reply-To: <20161006082332.29189-1-Martin.Jansa@gmail.com>
References: <20161006082332.29189-1-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: Christophe Chapuis <chris.chapuis@gmail.com>
Subject: Re: [krogoth][PATCH] binutils: fix AR issue when opkg is unpacking IPKs containing empty entries
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
X-List-Received-Date: Thu, 06 Oct 2016 10:45:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-10-06 at 10:23 +0200, Martin Jansa wrote:
> ++    # This commmand used to fail with: "Malformed archive".
> ++    set got [binutils_run $AR "-t $archive"]
> ++    if ![string match "empty
> " $got] {
> ++	fail $testname
> ++	return
> ++    }
> ++
> ++    pass $testname

The patch fails to apply due to the above corruption (line not starting
++). Could you resend or point to a branch with the patch on please?

Cheers,

Richard

