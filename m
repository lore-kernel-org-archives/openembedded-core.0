Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DAD8365F09
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 01:57:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5O1vn8Q011626
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 23 Jun 2014 18:57:50 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Mon, 23 Jun 2014 18:57:49 -0700
Message-ID: <53A8DB1A.7060106@windriver.com>
Date: Tue, 24 Jun 2014 09:57:46 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1403490121.git.kai.kang@windriver.com>
	<CAJTo0LbT8HseE1T+tTCTcbr59rwjZ1zU_rDFnaQUNpqL7oDagg@mail.gmail.com>
In-Reply-To: <CAJTo0LbT8HseE1T+tTCTcbr59rwjZ1zU_rDFnaQUNpqL7oDagg@mail.gmail.com>
X-Originating-IP: [128.224.162.231]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] Update iptables runtime recommends and add default init scripts and configs
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
X-List-Received-Date: Tue, 24 Jun 2014 01:57:58 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年06月23日 18:44, Burton, Ross wrote:
>> Kai Kang (5):
>>    iptables: update RRECOMMENDS
>>    iptables: add init script and configure file
>>    iptables: update init script and bb file
> Squash these so there's a single commit that adds and integrates a
> working init script.

Though there is small change for init script, I still want to keep it 
that make clear which part is our modification.

I prefer to squash

iptables: update RRECOMMENDS
iptables: update init script and bb file

and keep
iptables: add init script and configure file




>
>>    iptables: add default rules
>>    iptables: update rules for ip6tables
> Ditto, squash these into a single commit.

I prefer to keep them too.

Regards,
Kai

>
> Ross
>
>


-- 
Regards,
Neil | Kai Kang


