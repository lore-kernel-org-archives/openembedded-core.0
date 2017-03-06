Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3E5BD73074
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 17:47:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v26HlGUh007583
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 6 Mar 2017 09:47:16 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 6 Mar 2017 09:47:15 -0800
To: "Burton, Ross" <ross.burton@intel.com>, "Robert P. J. Day"
	<rpjday@crashcourse.ca>
References: <alpine.LFD.2.20.1702191313250.8096@localhost.localdomain>
	<CAJTo0LbM=BKU5CEcr5mVV0cw_VJS_NsCR992Q5RgpH_x8LRHOw@mail.gmail.com>
	<alpine.LFD.2.20.1702200654200.27683@localhost.localdomain>
	<CAJTo0LYVkVgQ3DgEvRU-Ey+x=3pFJD=t=cddD6_d88bXXD9OYw@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <158ae21e-23b2-aa04-4977-0e640e1f6e55@windriver.com>
Date: Mon, 6 Mar 2017 11:47:14 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYVkVgQ3DgEvRU-Ey+x=3pFJD=t=cddD6_d88bXXD9OYw@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: something seems to have happened to "gpgme" in latest oe-core
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
X-List-Received-Date: Mon, 06 Mar 2017 17:47:24 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

FYI, I'm experiencing the same issue on master.

--Mark

On 2/20/17 11:40 AM, Burton, Ross wrote:
> 
> On 20 February 2017 at 11:54, Robert P. J. Day <rpjday@crashcourse.ca
> <mailto:rpjday@crashcourse.ca>> wrote:
>>   gpgme config.log attached.
> 
> cc1: warning: include location "/usr/include/python2.7" is unsafe for
> cross-compilation [-Wpoison-system-directories]
> 
> It decided to try looking on your host for Python libraries for some reason. 
> You'll have to dig into configure.ac <http://configure.ac> to figure out why (or
> just turn Python explicitly off).
> 
> Ross
> 
> 


