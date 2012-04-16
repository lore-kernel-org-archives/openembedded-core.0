Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SJmkY-0006uw-6J
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 16:17:50 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3GE8OV4023048
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 07:08:24 -0700 (PDT)
Received: from [128.224.162.196] (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 16 Apr 2012 07:08:24 -0700
Message-ID: <4F8C27D6.3090701@windriver.com>
Date: Mon, 16 Apr 2012 22:08:22 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1334583221.git.liezhi.yang@windriver.com>
	<6d586b1ec34616f2eb4d485c58cf67ad9524d9c7.1334583221.git.liezhi.yang@windriver.com>
	<DE326386-EBAD-41FD-A618-91BA010EBE7B@dominion.thruhere.net>
In-Reply-To: <DE326386-EBAD-41FD-A618-91BA010EBE7B@dominion.thruhere.net>
Subject: Re: [PATCH 1/3] glib-2.0: fix builds on fedora 17
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
X-List-Received-Date: Mon, 16 Apr 2012 14:17:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/16/2012 09:53 PM, Koen Kooi wrote:
>
> Op 16 apr. 2012, om 15:38 heeft Robert Yang het volgende geschreven:
>
>> Generally distros keep perl at /sur/bin/perl
>
> /usr

Good catch, thanks, I've pushed all the 3 new commits to:(based on oe-core)

   git://git.pokylinux.org/poky-contrib robert/fc17_sdk
   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/fc17_sdk

// Robert

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


