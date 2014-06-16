Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3518C6FF1A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 15:32:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5GFWYLb001381
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Jun 2014 08:32:34 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 16 Jun 2014 08:32:33 -0700
Message-ID: <539F0E10.2080407@windriver.com>
Date: Mon, 16 Jun 2014 23:32:32 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1402926503.git.liezhi.yang@windriver.com>
	<f304fb8b27c04e7099b22978c44e30346fb25dea.1402926503.git.liezhi.yang@windriver.com>
	<CAJTo0LbGfC9+VNjOHQiN1z3KUD0c8ynbxbzSmE-htLsRbEKe6A@mail.gmail.com>
In-Reply-To: <CAJTo0LbGfC9+VNjOHQiN1z3KUD0c8ynbxbzSmE-htLsRbEKe6A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] libpcap: Avoid libpcap build error when libnl1 is involved
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
X-List-Received-Date: Mon, 16 Jun 2014 15:32:37 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/16/2014 11:13 PM, Burton, Ross wrote:
> On 16 June 2014 14:49, Robert Yang <liezhi.yang@windriver.com> wrote:
>> +PACKAGECONFIG[libnl1] = "--with-libnl,--without-libnl,libnl1,libnl1"
>
> Why did you need to specify a runtime dependency?

Sorry, please drop this one, I will check with the original author.

// Robert

>
> Ross
>
>

