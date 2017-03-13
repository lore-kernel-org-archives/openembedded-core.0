Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DC8D3776BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 13:59:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2DDxb4E019734
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Mar 2017 06:59:37 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 13 Mar 2017 06:59:36 -0700
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, Khem Raj <raj.khem@gmail.com>
References: <alpine.LFD.2.20.1703110315570.17105@localhost.localdomain>
	<97985b49-64ba-3fae-58a6-6eee4ad8126c@gmail.com>
	<alpine.LFD.2.20.1703110455070.18594@localhost.localdomain>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <a2a91404-5204-b9e8-0506-40d7680d64ab@windriver.com>
Date: Mon, 13 Mar 2017 08:59:36 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1703110455070.18594@localhost.localdomain>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: how does files/fs-perms.txt affect building base-files rpm?
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
X-List-Received-Date: Mon, 13 Mar 2017 13:59:47 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 3/11/17 3:57 AM, Robert P. J. Day wrote:
> On Sat, 11 Mar 2017, Khem Raj wrote:
> 
>> On 3/11/17 12:30 AM, Robert P. J. Day wrote:
>>>
>>>   potentially a dumb question, but do the settings in
>>> files/fs-perms.txt affect the building of the base-files rpm just
>>> as they would affect the building of any other rpm?
>>
>> it should be executing fixup_perms() in PKGD before splitting the
>> package, so yes it should run for all recipes.
> 
>   so it is possible that, despite the manual settings in the
> base-files do_install() task, fs-perms.txt might override some of
> those settings. i'm not saying i've seen anything like that, just
> clarifying the possibility.

Yes, same for all packages.

At one point I thought there was a comment in both the base-files and
fs-perms.txt files reminding people they should be kept in sync.  I am not
finding that comment.

--Mark

> rday
> 


