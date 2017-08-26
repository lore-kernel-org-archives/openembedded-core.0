Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8259877BC3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Aug 2017 00:48:55 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id c28so27401pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 17:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=wl5Cc4Vxr/W8eIBiQJuTV+FwIN8TiD/G7U/h/yyL3HQ=;
	b=RViRJacgEPptZ41O/DFRUcLDpCiYoZJq4Zsc0nXX3Tuz8lrCoQQs6zbfUDuEZqbA8a
	iBFqlSGhMWTNMaakcSmiv8acD+ODg1/E2BXJZKOXh3ZUVOeNK4SimPAnNLMAcs9obrKU
	+6IsYdl9LvahieX6leEM+xfUsxwntsCbRpJ9VWJtvBPNh1BLUYm4cpcKHFVw201/pwSa
	tbonZnesJ/kSukCxGZ30I0e9Fea2P3f01icBJej1ML+YKHyD/j62jWqQUBqhwaycPCVA
	6pAkrkMWGgEpVbuqlEdvI+I7E4QS0WXF3mo3R1KiPNr/G0cfmMw04rWH+rqH+4DooyaE
	LvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=wl5Cc4Vxr/W8eIBiQJuTV+FwIN8TiD/G7U/h/yyL3HQ=;
	b=FiDAll/2AeZw/pJ/sRMscl+9Wn1Y1XsSX0xVmBNcqGZbRXwh2OmGXuafokWXEy8/Wc
	tB052y7KRsAWXlaxSh44vWWYVYnmnXWn6+djzWia6dNvSCcO0h5RvorruSIjKZ+Atw+f
	zEsPp3ig9SrZ0Q6CcTBXd9StByeyxMMhCrGujdKTpWN+kxeys8e0jUgde7R5AqRpToig
	POOaNbI/GWJ32lyjh/qyaC4mXvRhGc0lATJbm92i1eFOjeRyVZwj+bHU/7K/mSiAclGc
	G3KXOsO2wYyLlHaudK5iyP3HRf07S2htUCF4T9HbxyWATqRnIghIDuQA1jRg5TLLlKJx
	sJPA==
X-Gm-Message-State: AHYfb5iundiefgvU8RgVKk4hsUqgfRBN+e8sSjEURCtwwcrxHdduxO7L
	bbiX345oJ99fIvtgjuI=
X-Received: by 10.101.89.69 with SMTP id g5mr282282pgu.270.1503708536585;
	Fri, 25 Aug 2017 17:48:56 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:9019:a157:b45:44d5?
	([2601:646:8882:b8c:9019:a157:b45:44d5])
	by smtp.gmail.com with ESMTPSA id
	x124sm12859428pfx.65.2017.08.25.17.48.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Aug 2017 17:48:56 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>
References: <20170824053753.36121-1-jose.alarcon@ge.com>
	<CAJ86T=Uip8WChxD_q_jWxCPPmUqw87yJLyn5F29ztbJfMpVMOQ@mail.gmail.com>
	<17938e56-c1d0-5316-0263-b954006f9015@ge.com>
	<CAJ86T=VczP+UyDTzRb8zcRreNVp7Ez43cfDquh2ysKy_fqGnFw@mail.gmail.com>
	<1a320d13-7d4a-7412-5377-e64a728afdfc@windriver.com>
	<CA+chaQcvg_rktq4iOazbzJzWGa6m6EdDA=RM-x8yg=4_aMtqyg@mail.gmail.com>
	<CAMKF1sos=AR9916RZgoDMjNYTrOyo8uka6cKfPB2wLujjg3n5Q@mail.gmail.com>
	<CAJ86T=Xrtt5xn+DKO1=aC76cWDgMmpqmXbaArSjemU2rC14-dA@mail.gmail.com>
	<CAMKF1srnsbiCdnoF1tUM8-c-dKGTnv7nsqShKaO_Vqr9Sm0FZg@mail.gmail.com>
	<CAJ86T=V=DTXGbR4_gCmc-feHR6DH-bhCENHRAJab26koZvFn-Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <e93caa35-871b-b15b-f97d-542ceed73b0c@gmail.com>
Date: Fri, 25 Aug 2017 17:48:54 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:56.0)
	Gecko/20100101 Thunderbird/56.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=V=DTXGbR4_gCmc-feHR6DH-bhCENHRAJab26koZvFn-Q@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: EXT: Re: [PATCH] libinput: remove obsolete touchpad patch
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
X-List-Received-Date: Sat, 26 Aug 2017 00:48:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/25/17 5:44 PM, Andre McCurdy wrote:
> On Fri, Aug 25, 2017 at 5:16 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Fri, Aug 25, 2017 at 4:37 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>> On Fri, Aug 25, 2017 at 3:42 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> OE-core minimal kernel has been bumped to 4.4
>>>> so at this point I think its fine to remove it since there
>>>> is no reliable way for OE-Core to test out validity of
>>>> this patch
>>>
>>> If that's the official policy then let's bump OLDEST_KERNEL and make
>>> the point clear to everyone.
>>
>> its not official policy. However we do try to minimise patches we
>> carry as much as we can moreover I was thinking from testability point
>> of view, we don't know what harm it can cause when you dont need this
>> patch.
> 
> Yes we do. The case where we don't need the patch (ie kernel 4.4) is
> the case we *can* test.
> 
> If the patch is found to cause problems with newer kernels then
> certainly it should be removed (or updated as Martin suggested), but I
> haven't seen anyone suggest that it's causing any issues.
> 

Just being there it could have side-effects too, I dont think we have
enough testing scenario to establish the effect. so removing is best
unless someone with 4.1 kernel or older can test it out with newer
kernels and establish that its not causing any undesired effects on
kernels where its not required. Until then it should stay removed.

