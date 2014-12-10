Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5BF77601A0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 01:39:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBA1dpSN019379
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 9 Dec 2014 17:39:51 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 9 Dec 2014 17:39:50 -0800
Message-ID: <5487A463.4000100@windriver.com>
Date: Wed, 10 Dec 2014 09:39:47 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1415350038.git.kai.kang@windriver.com>
	<32c8d18dbaf01579b0804bb19f81eb08ecb01bfa.1415350038.git.kai.kang@windriver.com>
	<CAJTo0LZUZLN5BoMcPGhdE4+bzOmcW5U6HEfJC0iM9i=kq4vUOQ@mail.gmail.com>
	<548654DF.1010301@windriver.com>
	<CAJTo0LYU0nsiL1dhNYfreEXhAkedL_wCHAH3uaWOMwmtfmpUkw@mail.gmail.com>
In-Reply-To: <CAJTo0LYU0nsiL1dhNYfreEXhAkedL_wCHAH3uaWOMwmtfmpUkw@mail.gmail.com>
X-Originating-IP: [128.224.162.231]
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/24] packagegroup-core-tools-profile: remove sysprof for aarch64
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
X-List-Received-Date: Wed, 10 Dec 2014 01:40:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年12月09日 19:56, Burton, Ross wrote:
> On 9 December 2014 at 01:48, Kang Kai <Kai.Kang@windriver.com> wrote:
>
>> In the following var definition, it uses PROFILE_TOOLS_X:
>>
>> RRECOMMENDS_${PN} = "\
>>      perf \
>>      trace-cmd \
>>      kernel-module-oprofile \
>>      blktrace \
>>      ${PROFILE_TOOLS_X} \
>>      ${PROFILE_TOOLS_SYSTEMD} \
>>      "
>>
>> I suppose that use SYSPROF_aarch64 doesn't work here.
>>
> But this is exactly what lttng does:
>
> SYSPROF="sysprof"
> SYSPROF_aarch64=""
> RRECOMMENDS_${PN} = "${SYSPROF}"

I think I misunderstood you. Do you mean update like this:

SYSPROF = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'sysprof', '', 
d)}"
SYSPROF_aarch64 = ""

RRECOMMENDS_${PN} = "\
       ... \
      ${SYSPROF} \

"

I'll update it.

Thanks,
Kai



>
> Ross
>


-- 
Regards,
Neil | Kai Kang


