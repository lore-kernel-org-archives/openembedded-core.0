Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D066E78A64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 07:26:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5E7QV3X009325
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Jun 2018 00:26:31 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Thu, 14 Jun 2018 00:26:31 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <cover.1528951773.git.Qi.Chen@windriver.com>
	<0273521858960b5e6bc63bd83284115dc97a566f.1528951773.git.Qi.Chen@windriver.com>
	<CANNYZj_Lj=bieGAFpzSU+U0TWKJyfiyL5r8OtgC+brYGVFn=fA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <edf223f6-4bff-c460-1247-5289d9966157@windriver.com>
Date: Thu, 14 Jun 2018 15:29:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj_Lj=bieGAFpzSU+U0TWKJyfiyL5r8OtgC+brYGVFn=fA@mail.gmail.com>
X-Originating-IP: [128.224.162.218]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] oeqa/runtime/cases/rpm.py: change to use base-passwd-doc
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
X-List-Received-Date: Thu, 14 Jun 2018 07:26:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/14/2018 02:57 PM, Alexander Kanavin wrote:
> 2018-06-14 7:52 GMT+03:00 Chen Qi <Qi.Chen@windriver.com>:
>> The test cases assume that rpm-doc is built out, as it says it its
>> comment. This is not always true. And it sometimes results in
>> following error.
>>
>>    |     cls.tc.target.copyTo(test_file, dst)
>>    | UnboundLocalError: local variable 'test_file' referenced before assignment
> Wait, you need to explain this further. What is the situation when it
> isn't true?
>
> Alex
>

Hi Alex,

For any image that does not have rpm installed, rpm package is not 
likely to be built out.
Having PACKAGE_CLASSES set to "package_rpm" will only ensure rpm-native 
to be built out.

Best Regards,
Chen Qi

