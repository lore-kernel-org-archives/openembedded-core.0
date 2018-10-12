Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 04BBD60851
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 01:28:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9C1SeHZ014663
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 11 Oct 2018 18:28:40 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 11 Oct 2018 18:28:39 -0700
To: <richard.purdie@linuxfoundation.org>
References: <cover.1539267480.git.kai.kang@windriver.com>
	<eedd956a3e7af4d2c64033d1b06944036c5d6536.1539267480.git.kai.kang@windriver.com>
	<ae1bccd3a002637aef132d5cee1316bfe717e018.camel@linuxfoundation.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <35f60046-1548-2e70-cb7b-020f6dce50a5@windriver.com>
Date: Fri, 12 Oct 2018 09:25:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <ae1bccd3a002637aef132d5cee1316bfe717e018.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] nss: fix non-determinism when create blank certificate
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
X-List-Received-Date: Fri, 12 Oct 2018 01:28:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年10月12日 02:55, richard.purdie@linuxfoundation.org wrote:
> On Thu, 2018-10-11 at 22:24 +0800, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> It uses tool certutil from nss to create a blank certificate. But the
>> checksum of output file key4.db changes every time:
>>
>> $ certutil -N -d sql:. --empty-password
>> $ md5sum *
>> f9dac2cfcb07cc8ca6db442a9a570906  cert9.db
>> b892c5ff7c1977d4728240b0cf628377  key4.db
>> 7b9136cb03f07ae62eb213a5239fda71  pkcs11.txt
>> $ rm *
>>
>> $ certutil -N -d sql:. --empty-password
>> $ md5sum *
>> f9dac2cfcb07cc8ca6db442a9a570906  cert9.db
>> 405d55178e866a115c1aa975fccfa764  key4.db
>> 7b9136cb03f07ae62eb213a5239fda71  pkcs11.txt
>>
>> Provide pre-created blank database files to fix non-determinism
>> issue.
>> And these files are from nss qemux86-64 build.
> I agree with this however can we leave a comment in the recipe about
> why we're including these and instructions on how to rebuild them
> please?

OK. V2 will be sent.

Regards,
Kai

>
> Cheers,
>
> Richard
>
>

-- 
Regards,
Neil | Kai Kang


