Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D8C09731F6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 16:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5HG8PlS001190; Fri, 17 Jun 2016 17:08:25 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kjLqQE67b4Uv; Fri, 17 Jun 2016 17:08:25 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u5HG8KjG001177
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 17 Jun 2016 17:08:21 +0100
Message-ID: <1466179700.25557.15.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrew Bradford <andrew@bradfordembedded.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2016 17:08:20 +0100
In-Reply-To: <20160617125230.GA9776@kaim-eeyore.kodakalaris.net>
References: <1464205571-26293-1-git-send-email-andrew@bradfordembedded.com>
	<1464205571-26293-4-git-send-email-andrew@bradfordembedded.com>
	<20160617125230.GA9776@kaim-eeyore.kodakalaris.net>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Andrew Bradford <andrew.bradford@kodakalaris.com>
Subject: Re: [PATCH 3/3] base.bbclass: p4 fetcher supports srcrev
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
X-List-Received-Date: Fri, 17 Jun 2016 16:08:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-06-17 at 08:52 -0400, Andrew Bradford wrote:
> On 05/25 15:46, Andrew Bradford wrote:
> I noticed that this patch has not been applied to oe-core, but it is
> a
> dependency for the bitbake perforce fetcher change to support srcrev
> which has been applied to bitbake's master branch [1].
> 
> [1]:http://git.openembedded.org/bitbake/commit/?id=6298696bb94a127cde
> c7964315f6891ba92cd026
> 
> Any chance that this patch could be applied to oe-core?
> The other two patches in this series are not needed, just this one.
> Sorry if my bitbake patch was not super clear about this dependency.

Normally patches land in bitbake first, then the code which uses them
goes into OE-Core and we bump the minimum bitbake version. In this case
I doubt we need the version bump as p4 isn't widely used.

I've merged the patch, thanks for the reminder we need that one.

Cheers,

Richard



