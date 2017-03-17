Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CAD7F72FEA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 11:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2HBsPg0006948; Fri, 17 Mar 2017 11:54:25 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9l1tRyqvOId5; Fri, 17 Mar 2017 11:54:25 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2HBsJQg006945
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 17 Mar 2017 11:54:20 GMT
Message-ID: <1489751659.13980.135.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 17 Mar 2017 11:54:19 +0000
In-Reply-To: <751ae73c98c1280f2b5ada3b442cf3f5828ed437.1489657029.git.liezhi.yang@windriver.com>
References: <cover.1489657029.git.liezhi.yang@windriver.com>
	<751ae73c98c1280f2b5ada3b442cf3f5828ed437.1489657029.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 4/6] oeqa/targetcontrol.py: modify it to test runqemu
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
X-List-Received-Date: Fri, 17 Mar 2017 11:54:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-03-16 at 03:13 -0700, Robert Yang wrote:
> Modify the following files to test runqemu:
>     targetcontrol.py
>     utils/commands.py
>     utils/qemurunner.py
> 
> We need simulate how "runqemu" works in command line, so when test
> "runqemu", the targetcontrol.py, utils/commands.py and
> utils/qemurunner.py don't have to find the rootfs or set env vars.
> 
> [YOCTO #10249]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/lib/oeqa/targetcontrol.py    | 20 +++++++++++++++-----
>  meta/lib/oeqa/utils/commands.py   | 13 +++++++++++--
>  meta/lib/oeqa/utils/qemurunner.py | 28 +++++++++++++++++-----------
>  3 files changed, 43 insertions(+), 18 deletions(-)

This change breaks "oe-selftest -r wic.Wic.test_qemu_efi" which just
hangs afterwards.

Cheers,

Richard

