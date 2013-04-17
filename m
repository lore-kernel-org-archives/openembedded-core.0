Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sergey_Matyukevich@mentor.com>) id 1USTGO-0000Oz-Rb
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 16:23:14 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1USSzH-0006Pg-EC from Sergey_Matyukevich@mentor.com ;
	Wed, 17 Apr 2013 07:05:27 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 17 Apr 2013 07:05:27 -0700
Received: from [137.202.140.158] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.1.289.1; Wed, 17 Apr 2013 15:05:26 +0100
Message-ID: <516EAC25.40109@mentor.com>
Date: Wed, 17 Apr 2013 18:05:25 +0400
From: Sergey Matyukevich <Sergey_Matyukevich@mentor.com>
Organization: Mentor Graphics
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.16) Gecko/20121216 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1366200612-22469-1-git-send-email-sergey_matyukevich@mentor.com>
	<CADkTA4Mrw50x2SXjwpug9QA-VgwpQZrAH6OpbU-F+SB2-G0uPw@mail.gmail.com>
In-Reply-To: <CADkTA4Mrw50x2SXjwpug9QA-VgwpQZrAH6OpbU-F+SB2-G0uPw@mail.gmail.com>
X-OriginalArrivalTime: 17 Apr 2013 14:05:27.0421 (UTC)
	FILETIME=[9CDBAAD0:01CE3B74]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] map_kernel_arch: x86 sub-architectures
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Apr 2013 14:23:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

>> Suppose we build software for x86 targets on x86 build hosts. There are use-cases
>> when it is not enough to specify x86 as a kernel architecture. It is necessary
>
> What are the details of the use cases ? I've never run into this myself, and
> almost no parts of the kernel build infrastructure differentiates between
> x86 and x86_64 .. so I'm curious to know what is breaking.

So far we observed this problem in two cases:
- build systemtap modules for x86_32 target on x86_64 build hosts
- build virtualbox-guest modules for x86_32 target on x86_64 build hosts

Sergey


