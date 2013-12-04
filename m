Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E1F3761612
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 02:00:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rB420qIN001834
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Dec 2013 18:00:52 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 3 Dec 2013 18:00:52 -0800
Message-ID: <529E8CCB.2070204@windriver.com>
Date: Wed, 4 Dec 2013 10:00:43 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <cover.1386078157.git.hongxu.jia@windriver.com>	
	<ae7e0f907b72ad9af0a078bdf317a7eb10315c7f.1386078157.git.hongxu.jia@windriver.com>
	<1386108562.8293.8.camel@x121e.pbcl.net>
In-Reply-To: <1386108562.8293.8.camel@x121e.pbcl.net>
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] dhclient-script: let resolv.conf and resolv.conf.dhclient on the same direcotry
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
X-List-Received-Date: Wed, 04 Dec 2013 02:00:57 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/04/2013 06:09 AM, Phil Blundell wrote:
> On Tue, 2013-12-03 at 21:46 +0800, Hongxu Jia wrote:
>> +-      echo search $new_domain_search >> /etc/resolv.conf.dhclient
>> ++      echo search $new_domain_search >> $sysconfdir/esolv.conf.dhclient
> Should that be "$sysconfdir/resolv.conf.dhclient"?

Yes, sorry for the missing, I have updated the git tree to fix this.

//Hongxu

> p.
>
>


