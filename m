Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1234965D4F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 02:51:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAB2ptHh013429
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Nov 2014 18:51:55 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Mon, 10 Nov 2014 18:51:54 -0800
Message-ID: <546179C6.1000401@windriver.com>
Date: Tue, 11 Nov 2014 10:51:50 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1415350038.git.kai.kang@windriver.com>
	<CANyK_8eJXjkRzPNsEnvbj6ve=DQ-8YkXUnG9uTE5RqmG-GEF+Q@mail.gmail.com>
	<5460849B.9070403@windriver.com>
	<CAJTo0LbNiXyo3dND_1rJU7A5OcfxNM9wdr=7kUrs1DdficXS7Q@mail.gmail.com>
In-Reply-To: <CAJTo0LbNiXyo3dND_1rJU7A5OcfxNM9wdr=7kUrs1DdficXS7Q@mail.gmail.com>
X-Originating-IP: [128.224.162.231]
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/24] V2: Add machine qemuarm64
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
X-List-Received-Date: Tue, 11 Nov 2014 02:52:03 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年11月10日 19:26, Burton, Ross wrote:
> On 10 November 2014 09:25, Kang Kai <Kai.Kang@windriver.com> wrote:
>
>>     gcc-4.9: redefine default library install directory
>>>>     Revert "gcc-4.9: redefine default library install directory"
>>>>
>>> Can the original commit just be removed from the series rather than
>>> reverted?
>>>
>> We just want to keep the history how we get here. If nobody cares it, I'll
>> remove them.
>>
> Nothing is gained by knowing that you tried something and it was wrong.  If
> nothing else is required to be done to this series then we'll remove that
> pair when merging.

OK. I also dropped the 2 commit on branch poky-contrib/kangkai/qemuarm64.

--Kai

>
> Ross
>


-- 
Regards,
Neil | Kai Kang


