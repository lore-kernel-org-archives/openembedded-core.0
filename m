Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8D109730BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 15:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0NFxb8w030450; Mon, 23 Jan 2017 15:59:37 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CisVBFpx2YD6; Mon, 23 Jan 2017 15:59:37 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0NFxVJR030447
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 23 Jan 2017 15:59:32 GMT
Message-ID: <1485187171.30673.25.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Maxin B. John" <maxin.john@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 15:59:31 +0000
In-Reply-To: <20170123145537.GA6330@mbabyjoh-desk.ger.corp.intel.com>
References: <1481550484-3360-1-git-send-email-maxin.john@intel.com>
	<20170123145537.GA6330@mbabyjoh-desk.ger.corp.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] sstatesig: don't squash dependencies of useradd packages
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
X-List-Received-Date: Mon, 23 Jan 2017 15:59:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-01-23 at 16:55 +0200, Maxin B. John wrote:
> Ping.

This never merged as I was never 100% convinced this was the correct
way to solve this problem. I'd be interested to understand if the
sstatesig tests in oe-selftest worked after this.

I'm hoping this issue has also now been resolved in a different way
though the switch to recipe specific sysroots. Would you be able test
if recipe specific sysroots have addressed this issue?

Cheers,

Richard

