Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BDE2F7F2A8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2019 08:42:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x798gc5D007390
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 9 Aug 2019 01:42:38 -0700 (PDT)
Received: from [128.224.162.188] (128.224.162.188) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Fri, 9 Aug 2019 01:42:37 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <1565333257-171001-1-git-send-email-hongzhi.song@windriver.com>
	<CANNYZj9vnr9Gx=guzr9426JqSd3w5AUSXvgzbmJ2ppC+s4TgMA@mail.gmail.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <37f5c4f7-43bf-ddf3-ce17-494d8324195d@windriver.com>
Date: Fri, 9 Aug 2019 16:42:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj9vnr9Gx=guzr9426JqSd3w5AUSXvgzbmJ2ppC+s4TgMA@mail.gmail.com>
X-Originating-IP: [128.224.162.188]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lttng-tools: enable manpages option for configure
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
X-List-Received-Date: Fri, 09 Aug 2019 08:42:37 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Alex,

Sorry, I will send v2 using 'api-documentation' .


--Hongzhi



On 8/9/19 4:32 PM, Alexander Kanavin wrote:
> On Fri, 9 Aug 2019 at 08:49, Hongzhi.Song <hongzhi.song@windriver.com 
> <mailto:hongzhi.song@windriver.com>> wrote:
>
>     If disable this option, production will prompt "No manual entry for
>     lttng-help" when execute "lttng --help" series commands.
>
>     Enable the option will make lttng-tools compile manpages and then
>     package them into lttng-tools-doc/.
>
>
> Enabling manpages is generally subject to 'api-documentation' 
> DISTRO_CONFIG option. Why make an exception here?
>
> Alex

