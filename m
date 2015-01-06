Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0E1E672902
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 14:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t06EJHer002125; Tue, 6 Jan 2015 14:20:30 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MSUfHNqlQgzG; Tue,  6 Jan 2015 14:20:30 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t06EKGQT002368
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 6 Jan 2015 14:20:28 GMT
Message-ID: <1420554053.25779.42.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>
Date: Tue, 06 Jan 2015 14:20:53 +0000
In-Reply-To: <cover.1420490240.git.akuster808@gmail.com>
References: <cover.1420490240.git.akuster808@gmail.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/12] Dizzy 1.7.1 additions
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
X-List-Received-Date: Tue, 06 Jan 2015 14:21:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-01-05 at 12:40 -0800, Armin Kuster wrote:
> please consider this for inclusion for 1.7.1
> Many security fixes and kernel update.
> 
> The following changes since commit f4d9d7bc206aaf30ea5c72675df139425a2c8d90:
> 
>   lbdrm: fix build issue. (2014-12-27 08:43:41 -0800)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib akuster/dizzy_1_7_1
>   http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/dizzy_1_7_1

I've merged this but it was tricky since this isn't based of the current
dizzy branch.

Where a patch is rejected (like the sysroot poison one), please drop it
and please rebase against the current dizzy head in future.

Cheers,

Richard


