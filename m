Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D77D26A596
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 12:07:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rATC78Ww027408
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 29 Nov 2013 04:07:08 -0800 (PST)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Fri, 29 Nov 2013 04:07:09 -0800
Message-ID: <5298838D.4060204@windriver.com>
Date: Fri, 29 Nov 2013 20:07:41 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1385725803.git.Qi.Chen@windriver.com>
	<b47acc0003f5c8d6e963da9edcf910951bcbe7be.1385725803.git.Qi.Chen@windriver.com>
	<CAJTo0Lbcs4d8q+ujMAsaais9vDjJ9iSh=1B_fyf7_tpHLV8xjw@mail.gmail.com>
In-Reply-To: <CAJTo0Lbcs4d8q+ujMAsaais9vDjJ9iSh=1B_fyf7_tpHLV8xjw@mail.gmail.com>
X-Originating-IP: [128.224.162.213]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] busybox: add busybox_git.bb recipe
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
X-List-Received-Date: Fri, 29 Nov 2013 12:07:11 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/29/2013 08:04 PM, Burton, Ross wrote:
> On 29 November 2013 11:56,  <Qi.Chen@windriver.com> wrote:
>> +PREFERRED_VERSION_busybox ?= "1.21.1"
> A better long-term solution is to set DEFAULT_PREFERENCE="-1" in the
> git recipe itself.
>
> Ross
>
>

Thanks!

I'll send out a V2 :)

Best Regards,
Chen Qi

