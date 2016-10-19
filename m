Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A72F66011F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 22:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u9JMBduZ023055; Wed, 19 Oct 2016 23:11:39 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id o_mtZdMnehMl; Wed, 19 Oct 2016 23:11:38 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u9JMBWG1023021
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 19 Oct 2016 23:11:33 +0100
Message-ID: <1476915092.2166.105.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
Date: Wed, 19 Oct 2016 23:11:32 +0100
In-Reply-To: <alpine.LFD.2.20.1610191733110.26015@localhost.localdomain>
References: <alpine.LFD.2.20.1610191112240.15586@ca624034.mitel.com>
	<2130816.2i4mC23lpe@peggleto-mobl.ger.corp.intel.com>
	<alpine.LFD.2.20.1610191541370.14839@localhost.localdomain>
	<1542758.b0vWq7N0OP@peggleto-mobl.ger.corp.intel.com>
	<alpine.LFD.2.20.1610191733110.26015@localhost.localdomain>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: how can i ask to keep all the generated "nativesdk" rpms?
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
X-List-Received-Date: Wed, 19 Oct 2016 22:11:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-10-19 at 17:34 -0400, Robert P. J. Day wrote:
>   so, i'm home and on a different system about to do a build ...
> refresh my memory, where are all those nativesdk rpms supposed to
> show
> up? if memory serves, they were under tmp/deploy/rpm/x86_64_linux.
> anything i should set before i attempt a build?

For SDKMACHINE="x86_64", the would appear in:

tmp/deploy/rpm/x86_64_nativesdk/

and SDKMACHINE="i686" in:

tmp/deploy/rpm/i686_nativesdk/

Switching SDKMACHINE might have been a trigger for one set
disappearing, particularly on older versions. Which version was this?
There were some bugs fixed in master/morty related to it.

Cheers,

Richard


