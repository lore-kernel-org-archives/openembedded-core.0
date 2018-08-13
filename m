Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA15778953
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 06:54:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7D6s5oi002287
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 12 Aug 2018 23:54:05 -0700 (PDT)
Received: from [128.224.162.149] (128.224.162.149) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Sun, 12 Aug 2018 23:54:04 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1533893883-11594-1-git-send-email-dengke.du@windriver.com>
	<457fafc8309867b6199293e8d3369f5e86f1cef0.camel@linuxfoundation.org>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <1b250276-6e44-9ffc-6ecf-26797efacaf0@windriver.com>
Date: Mon, 13 Aug 2018 14:50:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <457fafc8309867b6199293e8d3369f5e86f1cef0.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.149]
Subject: Re: [PATCH] nfs-utils: add runtime depends for nfs-export-root
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
X-List-Received-Date: Mon, 13 Aug 2018 06:54:05 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2018年08月11日 17:33, Richard Purdie wrote:
> On Fri, 2018-08-10 at 17:38 +0800, Dengke Du wrote:
>> When DISTRO_FEATURE enable "systemd", the nfs-server.service in nfs-
>> utils
>> depends on /etc/exports, but the file "/etc/exports" installed by
>> package
>> nfs-export-root. Otherwise the service would failed.
>>
>> So we should add the runtime depends for nfs-export-root.
>>
>> Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> ---
>>   meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.1.bb | 1 +
>>   1 file changed, 1 insertion(+)
> I suspect that this may in fact be a feature, you enable the nfs server
> by adding nfs-export-root to the image. The behaviour may therefore be
> intended as not everyone installing nfs-utils wants a server. We should
> perhaps better document that.

Yes, when enable IMAGE_FEATURE nfs-server, we install the 
nfs-server.service,
when not enable nfs-server, we don't install the nfs-server.service, 
otherwise
we install the nfs-utils, install the nfs-server.

>
> Also, when using sysvinit does this recipe generate an init script
> which starts an nfs-server?

Yes, this bb would generate an init script for sysvinit, I should let 
the nfs-export-root
working for sysvinit else.

>
> Cheers,
>
> Richard
>


