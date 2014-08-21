Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 278D765DB1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 19:27:33 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id w10so14605936pde.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 12:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=s0BoX+bY2uH3zfFu1Ut0KlyAbguOujAhfos0qtQVJZ8=;
	b=MWHDYQVUAWfok4AMTJoSW7qqJT1W7/y42L2QEbUgu9pzCz4Y74jmZ5K2MTHfNunR6S
	Up3sIcyFwS0xR3+VN8QQhT30i61/2biqHhooiZ7fgrYTLvU42SOxETl1v/NwFVjSoVsc
	7jVblZsD5egbmRzcbEUb3sOCcQrsnyx4m5pqkI7WINcr9SBZ9xmfat2K4GVLhokn/qip
	gnDaumg1kHe7LIb4iQ7liFtMTS0MNNhSH66s5CI4fyos3QV1CgXCcFGsoV+ZF7apK61n
	CEA6WMwSp5MKeb4y6WDwt7RwugLdh1lXyGL7C1zamseAhRoCFM2O9dpqOc5HVhueWAFu
	3htQ==
X-Received: by 10.66.124.199 with SMTP id mk7mr612410pab.89.1408649255155;
	Thu, 21 Aug 2014 12:27:35 -0700 (PDT)
Received: from ?IPv6:2601:c:9380:601:9535:8428:c995:6c7e?
	([2601:c:9380:601:9535:8428:c995:6c7e])
	by mx.google.com with ESMTPSA id
	ob14sm39998078pdb.40.2014.08.21.12.27.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Aug 2014 12:27:34 -0700 (PDT)
Message-ID: <53F64823.7070705@gmail.com>
Date: Thu, 21 Aug 2014 12:27:31 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1408316808-13486-1-git-send-email-akuster808@gmail.com>	<1408606690.1669.103.camel@ted>
	<53F60350.4010005@gmail.com>
	<CAP9ODKr7T+64hTcNr6-L=c11RxzX_QPXQioeu6hx5LZatTFx4w@mail.gmail.com>
In-Reply-To: <CAP9ODKr7T+64hTcNr6-L=c11RxzX_QPXQioeu6hx5LZatTFx4w@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] nettle: update nettle to version 3.0
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
X-List-Received-Date: Thu, 21 Aug 2014 19:27:40 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 08/21/2014 09:55 AM, Otavio Salvador wrote:
> On Thu, Aug 21, 2014 at 11:33 AM, akuster808 <akuster808@gmail.com> wrote:
>>
>>
>> On 08/21/2014 12:38 AM, Richard Purdie wrote:
>>>
>>> On Sun, 2014-08-17 at 16:06 -0700, Armin Kuster wrote:
>>>>
>>>> With this update, LGPLv3 or GPLv3 where  added to many files.
>>>> Each supported algorithms govern which license they want.
>>>> Many are stated as  "ether v2 or v3 or both in parallel".
>>>> Update license to be v2 or LGPLv3 or GPLv3.
>>>>
>>>> The previous verion had one GPLv3 file so the license was incorrect.
>>>
>>>
>>> With this change, "bitbke gnutls" stops working.
>>>
>>
>>   gnutls is targeting to port to nettle 3.0 in gnutls version 3.4.
>>
>> what should I do?
>
> Revert for now? :)

Its only in the patch queue from what i can tell. Do I ask for it to be 
dropped or do send a 'revert' patch for the patch?

- Armin

