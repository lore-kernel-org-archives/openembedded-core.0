Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0DC626FFDA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 09:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0K9XXUG010369; Wed, 20 Jan 2016 09:33:33 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xmXyjO2rlpq5; Wed, 20 Jan 2016 09:33:33 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0K9XTrH010365
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 20 Jan 2016 09:33:30 GMT
Message-ID: <1453282408.27999.143.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Dengke Du <dengke.du@windriver.com>
Date: Wed, 20 Jan 2016 09:33:28 +0000
In-Reply-To: <2a8d19d4ef60a323c8770722ec7f60811ced53ca.1453281406.git.dengke.du@windriver.com>
References: <cover.1453281406.git.dengke.du@windriver.com>
	<2a8d19d4ef60a323c8770722ec7f60811ced53ca.1453281406.git.dengke.du@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] ncurses: drop the compatible option
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
X-List-Received-Date: Wed, 20 Jan 2016 09:33:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-01-20 at 04:30 -0500, Dengke Du wrote:
> drop the compatible option --with-abi-version=5

This says what the patch does, but not why.

Why should we do this? Does any of our software depend on the v5 ABI?
How did you test this?

Cheers,

Richard

