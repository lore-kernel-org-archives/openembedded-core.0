Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 561676B1C3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 01:30:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6I1UI2p015751
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Jul 2013 18:30:20 -0700 (PDT)
Received: from [128.224.162.145] (128.224.162.145) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Wed, 17 Jul 2013 18:30:18 -0700
Message-ID: <51E74526.8010700@windriver.com>
Date: Thu, 18 Jul 2013 09:30:14 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1374050497-20809-1-git-send-email-ming.liu@windriver.com>
	<CAJTo0LZ+FnMvQ+b0orzchp2Aez4TB6_DYgCgr3wugc5ZDM4P7g@mail.gmail.com>
In-Reply-To: <CAJTo0LZ+FnMvQ+b0orzchp2Aez4TB6_DYgCgr3wugc5ZDM4P7g@mail.gmail.com>
X-Originating-IP: [128.224.162.145]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] util-linux: replace += with _append to EXTRA_OECONF_class-native
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
X-List-Received-Date: Thu, 18 Jul 2013 01:30:20 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/17/2013 08:07 PM, Burton, Ross wrote:
> On 17 July 2013 09:41, Ming Liu <ming.liu@windriver.com> wrote:
>> +EXTRA_OECONF_append_class-native = "--disable-fallocate --disable-use-tty-group"
>> +EXTRA_OECONF_append_class-nativesdk = "--disable-fallocate --disable-use-tty-group"
> _append won't add a leading space so you're making a massive
> assumption here, please add a leading space for safety.
Yes, thanks for the reminding, I will send the V3.

the best,
thank you

> Ross
>
>


