Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C65D072F74
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 11:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2BBOS7R014428; Sat, 11 Mar 2017 11:24:28 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4oivEqp9a0_I; Sat, 11 Mar 2017 11:24:28 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2BBOK8U014425
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 11 Mar 2017 11:24:23 GMT
Message-ID: <1489231460.13980.10.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 11 Mar 2017 11:24:20 +0000
In-Reply-To: <cover.1489209195.git.pkj@axis.com>
References: <cover.1489209195.git.pkj@axis.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 0/1] Whitelist sftp
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
X-List-Received-Date: Sat, 11 Mar 2017 11:24:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2017-03-11 at 06:14 +0100, Peter Kjellerstedt wrote:
> I have been trying out the whitelisting of tools in $PATH, and it
> seems to work very well. However, one thing that I realized is that
> the tools used by the various fetchers need to be whitelisted. This
> patch adds sftp to HOSTTOOLS_NONFATAL as that is the only fetcher we
> use appart from git and wget, but I expect other tools such as cvs,
> svn, hg, etc need to be added as well.

For some, like subversion we actually build subversion-native so they
shouldn't be listed by default.

> Feel free to squash this commit with the "base/bitbake.conf: Filter
> contents of PATH to only allow whitelisted tools" commit.

I squashed this in along with some other minor tweaks thanks.

Richard

