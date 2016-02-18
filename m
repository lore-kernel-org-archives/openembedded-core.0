Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DF046601D4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 00:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1I01MPt005958; Thu, 18 Feb 2016 00:01:22 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id aTtH1qo3jNpu; Thu, 18 Feb 2016 00:01:22 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1I00CVa005776
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 18 Feb 2016 00:01:20 GMT
Message-ID: <1455753612.28376.72.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 18 Feb 2016 00:00:12 +0000
In-Reply-To: <1455735734-17911-1-git-send-email-akuster808@gmail.com>
References: <1455735734-17911-1-git-send-email-akuster808@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [jethro][PATCH v2] glibc CVE-2015-7547
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
X-List-Received-Date: Thu, 18 Feb 2016 00:01:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-02-17 at 11:02 -0800, Armin Kuster wrote:
> V2  includes changes not committed  before sending.
> 
> This is being submitted to comply to Yocto compatability.
> 
> Master is affected but waiting for 2.23 to be merged before sending
> patches.

Thanks for this.

I've queued up the various CVE glibc patches in master-next, they're
testing on the autobuilder now I'll merge these for master tomorrow
assuming no issues.

For jethro, we've just got a build out of QA, I think we'll likely
release, release note the CVE, then push this onto the jethro branch
straight after.

Cheers,

Richard

