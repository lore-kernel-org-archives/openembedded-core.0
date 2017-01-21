Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C0AEC60670
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jan 2017 12:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0LCSsiX028542; Sat, 21 Jan 2017 12:28:54 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uYAZmbB6rE1r; Sat, 21 Jan 2017 12:28:54 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0LCSq1h028536
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 21 Jan 2017 12:28:54 GMT
Message-ID: <1485001732.30673.0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 21 Jan 2017 12:28:52 +0000
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 00/55] OEQA Framework Refactor & Improvements
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
X-List-Received-Date: Sat, 21 Jan 2017 12:31:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-01-20 at 11:09 -0600, Aníbal Limón wrote:
> This patchset is related to OEQA Framework for details read the RFC
> send to the
> Openembedded architecture ML.
> 
> http://lists.openembedded.org/pipermail/openembedded-architecture/201
> 6-December/000351.html
> 
> Also adds the migration of the runtime testing leaving only selftest
> remains
> to migrate.
> 
> The testing was made using GDC Autobuilder building in different
> archs and running selftest.

Thanks, I'm testing this on the autobuilder, it seems mostly good but
so far we've seen this issue:

https://autobuilder.yocto.io/builders/nightly-qa-skeleton/builds/145/st
eps/Running%20Sanity%20Tests/logs/stdio

Please send any further patches on top of this series.

Cheers,

Richard

