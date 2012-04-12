Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SINh9-0002xd-H7
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 19:20:31 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3CHB5hn019644
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Apr 2012 10:11:05 -0700 (PDT)
Received: from msp-dhcp21.wrs.com (172.25.34.21) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 12 Apr 2012 10:11:05 -0700
Message-ID: <4F870CA8.9070709@windriver.com>
Date: Thu, 12 Apr 2012 12:11:04 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Steve Sakoman <sakoman@gmail.com>
References: <1334179880.31685.12.camel@ted> <4F85FACB.8080205@windriver.com>
	<CAGDS+nmSY2TD8HRzYfrcOeUjxwyb1D_dDQkTBtMseNG0cUbc6A@mail.gmail.com>
	<CAGDS+nntS5YWw0U8wSJYBdgdhnaGsnLr71F6SdMFECoMsCVHRw@mail.gmail.com>
	<4F86F8D2.2050402@windriver.com>
	<CAGDS+nnQtcD7X4xLUnWTB1aBouceo99hE-zY+w57JHE0nBYV=g@mail.gmail.com>
	<1334246884.7309.40.camel@ted>
	<CAGDS+nk+yTmthqFi+EeC9FZY49Fyiuyis1F3B-1+daa_tYpBEw@mail.gmail.com>
In-Reply-To: <CAGDS+nk+yTmthqFi+EeC9FZY49Fyiuyis1F3B-1+daa_tYpBEw@mail.gmail.com>
Cc: Patches, discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_rpm: Fix useradd preinst ordering issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Apr 2012 17:20:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/12/12 12:06 PM, Steve Sakoman wrote:
> On Thu, Apr 12, 2012 at 9:08 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org>  wrote:
>
>> For what its worth, bash here does Provides: /bin/sh so I'm a little
>> puzzled about what is going on here. If its not doing that, it would
>> certainly cause the error you're reporting...
>
> Hmm . . . while I see:
>
> Provides: /bin/sh
>
> in bash.spec, it is a different story in the pkgdata/runtime files.
>
> busybox has:
>
> FILERPROVIDES_/bin/busybox_busybox:<snip many filenames>  /bin/sh
> <snip many filenames>
>
> While bash doesn't have a FILERPROVIDES entry at all.
>
> Could this be why rpm doesn't realize bash provides /bin/sh?

They should both be equally valid for the purpose of dependency resolution.

--Mark

> Steve



