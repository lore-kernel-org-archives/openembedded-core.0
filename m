Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5672A6057B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 12:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2TCSilq023042; Tue, 29 Mar 2016 13:28:44 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xlgVBo1yM8ZE; Tue, 29 Mar 2016 13:28:44 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2TCSgD5023035
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 29 Mar 2016 13:28:43 +0100
Message-ID: <1459254522.21672.24.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Cliff Brake <cliff.brake@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 29 Mar 2016 13:28:42 +0100
In-Reply-To: <56FA743B.5030200@gmail.com>
References: <56F59D2B.2010108@gmail.com>
	<1458978069.3073.62.camel@linuxfoundation.org>
	<56F98CDF.7080205@gmail.com>
	<1459204121.21672.12.camel@linuxfoundation.org>
	<56FA743B.5030200@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: How to use externalsrc with git workspace
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
X-List-Received-Date: Tue, 29 Mar 2016 12:28:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-03-29 at 08:25 -0400, Cliff Brake wrote:
> On 03/28/2016 06:28 PM, Richard Purdie wrote:
> > > I tried nobranch=1;rev=HEAD, but then that conflicts with
> > > ${AUTOREV}.
> > Did you just try nobranch=1 and leave rev to get set from SRCREV?
> 
> That will parse, but it puts the wrong git rev in the PV:
> 
> The following package gets built:
> 
> blkqcl-app-tune_1.4+gitr1+a97fcb58e6-r1.0_cortexa9hf-vfp-neon.ipk
> 
> But, the actual version of the source that gets built is
> 0edb656fc9a1a77d75eaa49a17586deb4c986bb1.
> 
> a97... is the version of the branch (default is master) in the
> workspace.
> 
> So this would work if we did not care what gitv got put in the PV. 
>  There is
> also the issue of bitbake not rebuilding the source if you change the
> git
> version of the workspace, but the branch happens to not change.

At least from my perspective, this is what *should* work and the fact
it doesn't is a bug somewhere. Adding extra things to the fetcher would
likely just workaround it. Filing a bug report for it would be the
likely next step.

Cheers,

Richard


