Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0F01871B90
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 07:59:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBD7x9e2008751
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 12 Dec 2016 23:59:09 -0800 (PST)
Received: from [128.224.162.184] (128.224.162.184) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Mon, 12 Dec 2016 23:59:06 -0800
To: Patrick Ohly <patrick.ohly@intel.com>
References: <cover.1479809328.git.Qi.Chen@windriver.com>
	<4d5b1453815a0fe2389ced2a0a152249b3a97e62.1479809328.git.Qi.Chen@windriver.com>
	<1481529942.17535.198.camel@intel.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <3fb4f7c8-66d3-60b3-8d2d-60934f648e94@windriver.com>
Date: Tue, 13 Dec 2016 16:00:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1481529942.17535.198.camel@intel.com>
X-Originating-IP: [128.224.162.184]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] initscripts: support persistent /var/log
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
X-List-Received-Date: Tue, 13 Dec 2016 07:59:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/2016 04:05 PM, Patrick Ohly wrote:
> On Tue, 2016-11-22 at 18:10 +0800, Chen Qi wrote:
>> ${WORKDIR}/volatiles         ${D}${sysconfdir}/default/volatiles/00_core
>> +       if [ "${VOLATILE_LOG_DIR}" = "log" ]; then
>> +               echo "l root root 0755 /var/log /var/volatile/log" >>
>> ${D}${sysconfdir}/default/volatiles/00_core
>> +       fi
> Why are you checking for "log" here? I thought VOLATILE_LOG_DIR was
> supposed to be a boolean?
>
> Using oe.types.boolean in shell code is a bit awkward, but would be
> necessary for the sake of consistency when allowing VOLATILE_LOG_DIR to
> have more than just yes/no. Untested (relies on bool->str conversion):
>
> if [ ${@ oe.types.boolean('${VOLATILE_LOG_DIR}') } = True ]; then
>

Thanks for your suggestion.

I'll send out V2.

Best Regards,

Chen Qi


