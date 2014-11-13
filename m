Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1AB636FC68
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 10:04:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sADA4MVs024537
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 13 Nov 2014 02:04:23 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 13 Nov 2014 02:04:22 -0800
Message-ID: <54648223.1090200@windriver.com>
Date: Thu, 13 Nov 2014 18:04:19 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1415699201.git.hongxu.jia@windriver.com>
	<37d7153a864b4dee5748a3a30054c0c62e243f02.1415699201.git.hongxu.jia@windriver.com>
	<FB878F6E-62D1-49FB-A373-EF554D0A274D@dominion.thruhere.net>
	<54640951.3040005@windriver.com> <54640CC9.1080509@windriver.com>
	<20141113082704.GA19230@ad.chargestorm.se>
In-Reply-To: <20141113082704.GA19230@ad.chargestorm.se>
Subject: Re: [PATCH 1/3] avahi.inc: rename package to use avahi to instead of avahi-daemon
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
X-List-Received-Date: Thu, 13 Nov 2014 10:04:26 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/2014 04:27 PM, Anders Darander wrote:
> Koen means that you should use
> IMAGE_INSTALL_append += "avahi-daemon"
> and not avahi... (I.e. package name, not recipe name).
>
> If you still insist on creating a package named avahi, you might as well
> create avahi as an empty package, RDEPEND'ing on all sub-packages.
>

Oh, thanks, I know what you mean, please drop these patches

//Hongxu

