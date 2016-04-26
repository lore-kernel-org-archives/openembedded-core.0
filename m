Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7C77471E63
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 08:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3Q8u6vH030036; Tue, 26 Apr 2016 09:56:06 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id e8Bv9vEqxFB3; Tue, 26 Apr 2016 09:56:05 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3Q8u3dk030033
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 26 Apr 2016 09:56:04 +0100
Message-ID: <1461660963.31320.147.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 26 Apr 2016 09:56:03 +0100
In-Reply-To: <e1d663a4f78339b9df14168beec65fa0d3a1e45f.1461592183.git.liezhi.yang@windriver.com>
References: <cover.1461592183.git.liezhi.yang@windriver.com>
	<e1d663a4f78339b9df14168beec65fa0d3a1e45f.1461592183.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/6] insane.bbclass: package_qa_check_license -> do_qa_populate_lic
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
X-List-Received-Date: Tue, 26 Apr 2016 08:56:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-04-25 at 06:51 -0700, Robert Yang wrote:
> The package_qa_check_license() was in do_qa_configure which had a
> potential problem, when the recipe sets do_configure[noexec] = "1",
> then
> the license checking won't run, which may hidden license issues.
> Rename
> it to do_qa_populate_lic() and run in do_populate_lic[postfuncs]
> which
> is more reasonable (when no populate license, no license checking).
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/insane.bbclass | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)

There is a convention that "do_" as a function prefix means its a task.
In this case its not a task but a function, so can you use a different
prefix please?

Cheers,

Richard

