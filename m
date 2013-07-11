Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ADFC2600FA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 08:58:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6B8wJER007053
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 11 Jul 2013 01:58:19 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 11 Jul 2013 01:58:16 -0700
Message-ID: <51DE73A7.1070400@windriver.com>
Date: Thu, 11 Jul 2013 16:58:15 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Trevor Woerner <trevor.woerner@linaro.org>
References: <cover.1373443071.git.hongxu.jia@windriver.com>
	<5891c95b244f3b0ad5e54bcb7595fc401c1727f3.1373443071.git.hongxu.jia@windriver.com>
	<CALmOhgnqd_AEmtzgJ_4gCAJXiXYW=tHryRJVGwN-rUw5TXR5MQ@mail.gmail.com>
In-Reply-To: <CALmOhgnqd_AEmtzgJ_4gCAJXiXYW=tHryRJVGwN-rUw5TXR5MQ@mail.gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] nss: fix incorrect shebang line of perl script
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
X-List-Received-Date: Thu, 11 Jul 2013 08:58:18 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2013 04:39 PM, Trevor Woerner wrote:
> On 10 July 2013 09:03, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> Replace incorrect shebang line with `#!/usr/bin/perl'.
>
> I thought using 'env' was the preferred method?
If use 'env', should we add 'coreutils' on nss's DEPENDS?
The coreutils provides env.

//Hongxu

