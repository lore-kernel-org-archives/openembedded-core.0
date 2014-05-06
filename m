Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D370B6059B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 21:44:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s46Li9Z8022221
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 May 2014 14:44:09 -0700 (PDT)
Received: from msp-dhcp25.wrs.com (172.25.34.25) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 6 May 2014 14:44:08 -0700
Message-ID: <536957A8.90300@windriver.com>
Date: Tue, 6 May 2014 16:44:08 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <536899F5.1030104@gmail.com>	<20140506205518.GE11339@denix.org>	<CAMKF1spaD8x1e2VYMwq34R2RLbz6xDw9ypDVwzr8sQJBuOpm5A@mail.gmail.com>	<5369533B.9010209@windriver.com>
	<CAMKF1srtVO7u8OU5v=V=B4Gmy6LdD21jMKftTBwcS2+Q99V5xA@mail.gmail.com>
In-Reply-To: <CAMKF1srtVO7u8OU5v=V=B4Gmy6LdD21jMKftTBwcS2+Q99V5xA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-toolchain doesn't compile working binaries
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
X-List-Received-Date: Tue, 06 May 2014 21:44:10 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/6/14, 4:40 PM, Khem Raj wrote:
>
> On May 6, 2014 2:25 PM, "Mark Hatle" <mark.hatle@windriver.com
> <mailto:mark.hatle@windriver.com>> wrote:
>  >
>  > On 5/6/14, 3:56 PM, Khem Raj wrote:
>  >>
>  >> On Tue, May 6, 2014 at 1:55 PM, Denys Dmytriyenko <denis@denix.org
> <mailto:denis@denix.org>> wrote:
>  >>>
>  >>> Do you know that OE toolchain is not relocatable?
>  >>
>  >>
>  >> is that true ?
>  >>
>  >
>  > It's the load path of the executables, they use the libc-nativesdk, so they
> need a hard path to the correct ld.so to get started.
>
> isnt this fixed by the installer when it is run

Yes, it sounds like either he moved the files after the the installer ran, or 
didn't use the installer at all and just tried to execute them out of the build 
system.

(If the installer -was- used, then it's definitely a bug.)

--Mark

>  >
>  > --Mark
>  >
>  > --
>  > _______________________________________________
>  > Openembedded-core mailing list
>  > Openembedded-core@lists.openembedded.org
> <mailto:Openembedded-core@lists.openembedded.org>
>  > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


