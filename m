Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 685B46069C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jan 2017 16:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v03GGkfR027853; Tue, 3 Jan 2017 16:16:46 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3S8LFhIfsf5Q; Tue,  3 Jan 2017 16:16:46 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v03GGhPo027835
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 3 Jan 2017 16:16:44 GMT
Message-ID: <1483460203.4367.60.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Jolley, Stephen K" <stephen.k.jolley@intel.com>, "yocto@yoctoproject.org"
	<yocto@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 03 Jan 2017 16:16:43 +0000
In-Reply-To: <9ADD3FDE8B189B4AA2F8A3C711F8155E5732C512@fmsmsx111.amr.corp.intel.com>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155E5732C512@fmsmsx111.amr.corp.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Re: Yocto Project Status WW01
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
X-List-Received-Date: Tue, 03 Jan 2017 16:16:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-01-03 at 15:51 +0000, Jolley, Stephen K wrote:
> Current Dev Position: YP 2.3 M2 -> M3
> Next Deadline: YP 2.3 M2 by Jan 23, 2017
>  
> SWAT team rotation: Maxin -> Joshua
> https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team
>  
> Key Status/Updates:
> ·        M1 is having some QA difficulties due to some kind of bad
> interaction between the PR service and tinfoil2. We’re waiting until
> people are back from vacation and up to speed before we decide what
> to do about this.

One question which came up was whether just to cherry-pick fixes for M1
into a branch, or whether we use master. For me personally master is
tempting but its probably safer just to use an M1 branch as master has
moved on a fair bit. I wanted to give people an opportunity to express
opinions either way.

Cheers,

Richard

