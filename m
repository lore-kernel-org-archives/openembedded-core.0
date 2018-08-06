Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2419078741
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 03:05:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7635UcS001991
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 5 Aug 2018 20:05:30 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Sun, 5 Aug 2018 20:05:29 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <cf6a8d01-cdc3-c160-c586-e1a7b5bcf8b8@windriver.com>
	<CANNYZj9pA1yfOhLfHtNcbn199=wG7xie3PRSyWajijS+A2ZMKQ@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <8c9ddac7-4979-b5a8-d1fc-503fa917ac78@windriver.com>
Date: Mon, 6 Aug 2018 11:09:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj9pA1yfOhLfHtNcbn199=wG7xie3PRSyWajijS+A2ZMKQ@mail.gmail.com>
X-Originating-IP: [128.224.162.218]
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Why do we use sysklogd as the default syslog?
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
X-List-Received-Date: Mon, 06 Aug 2018 03:05:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/30/2018 08:58 PM, Alexander Kanavin wrote:
> 2018-07-30 8:48 GMT+02:00 ChenQi <Qi.Chen@windriver.com>:
>> I just noticed that we are using sysklogd as the default syslog.
>> meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb:VIRTUAL-RUNTIME_syslog
>> ?= "sysklogd"
>>
>> sysklogd has stopped development for about 4 years, and as far as I can see,
>> nobody is maintaining it.
>> Is there some specific reason why we want to keep it as the default syslog
>> for our reference images? small size?
>
> You are welcome to improve this. Quite often the answer to such
> questions is 'because no one is aware of the situation'.
>
> Alex
>
In case someone is also interested in this topic, I'll add some more 
information here.

rsyslog is GPLv3 and syslog-ng uses a very different configuration style 
from traditional sysklogd.
So I guess I'll just leave things as they are now.

Best Regards,
Chen Qi

