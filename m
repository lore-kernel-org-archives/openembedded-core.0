Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 65C0871E68
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 12:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1KCrGQ3014194; Fri, 20 Feb 2015 12:53:16 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qWJp6uVGzmYS; Fri, 20 Feb 2015 12:53:16 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1KCr37Q014188
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 20 Feb 2015 12:53:15 GMT
Message-ID: <1424436783.11836.44.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Fri, 20 Feb 2015 12:53:03 +0000
In-Reply-To: <54E6C721.7060505@windriver.com>
References: <cover.1424230079.git.liezhi.yang@windriver.com>
	<eceff7d5f3e72ad90a818f7c8b42270f4c8ccb9b.1424230079.git.liezhi.yang@windriver.com>
	<54E6C721.7060505@windriver.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] gettext 0.16.1: disable native
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
X-List-Received-Date: Fri, 20 Feb 2015 12:53:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-02-20 at 13:33 +0800, Robert Yang wrote:
> Any comments on the two patches, please ?

Well, I'm not convinced these are correct.

If you have differing native and target gettext versions, I don't think
it will work well and we're storing up potential trouble.

Having said that, I haven't replied so far as you're going to ask how
this breaks and how we fix it and I simply don't know. The patches don't
look/feel right though.

Cheers,

Richard


