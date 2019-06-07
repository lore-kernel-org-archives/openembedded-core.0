Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id F0ED07E4E1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 20:27:40 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id m138so3025315ita.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2019 13:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:references:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=7EBwo0HxzB4j2/bzQXACYr6GVUR583inoilGvc1JsHg=;
	b=WfBM9ssh2qGxxCe3LZwaTDtEovnya8YM9QRMZNHdu8kFBZgz9iJYakVlfMNVEvMnbH
	cWAZk3Ywukby6N/4Xp9+3HfDIUizCe6D9+M7nh9/GeYo4POn8slplEPH7oh1+rm3HplO
	KKfwT9q7wFIFszjSOnU9CyBtgD5rlEDEuiWG7UnNhhnNN6oGlWwIQhamF5yrmDPTBf6y
	ZjMygxTgAtMnZPmCMlTDDoMsBwsgBr68+HKil/GD5hP19vRaVj0qZag4Z7B6D/LjysRD
	FCrRJfxhoZuDcOBJIzEcb7g6wSOAxL9O3qhe4jVIhK8rYYzusZjnp9Lsn7VWCD+JAmVU
	UchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=7EBwo0HxzB4j2/bzQXACYr6GVUR583inoilGvc1JsHg=;
	b=VGUBpCQW3Y5Kr8lQKN1KtoHGNkypj1LQKDM6+N4nN8/PoZHCSZpl1VC0DeNgD0XSr4
	oK6EGkXj6zQuB44nbsaUyy2OACHS6Aa+hBE2fAT7NbLsVDSw595zjcqX234FYhjpa1Y4
	7/gCYiKjaKDtkfKy2e175bytpbSWXmK4qcUyBMlY5+C8pTXYydkOUUKvyjmwoVI56yrL
	1S7imOsVdu31CvPgNKxId7V86vC4imXblKBtpeChXVhwCRZyvWdFnkMKRhTrlPe7xKoL
	eJ+1HlUkrhPDB10fE19owJaZTPilMeMKEbr3ewQxiy9VRK0wyocsl0CQ6kablj0SPjFO
	Jv3A==
X-Gm-Message-State: APjAAAV/Erx5OHSxVpcyRp6ESXvXzwdHJ5gxziwc6pamWtFVDHCX6VHq
	W/v+cOWP9G4tq+6QRDkF0vK8ZVSG
X-Google-Smtp-Source: APXvYqwY8jug+/5htmkbWGK1dxnsv81qJffK6hXhpjTOqEfcw8bpMLryfBiLHxctiWCta3zhoi10EQ==
X-Received: by 2002:a24:2407:: with SMTP id f7mr1884281ita.21.1559939261710;
	Fri, 07 Jun 2019 13:27:41 -0700 (PDT)
Received: from [10.30.197.57] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	d75sm1361703itd.10.2019.06.07.13.27.40
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Jun 2019 13:27:41 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: akuster808 <akuster808@gmail.com>, Joshua Watt <JPEW.hacker@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20190607154805.15741-1-richard.purdie@linuxfoundation.org>
	<ff680a45-8b31-6167-d5b5-e1a242fc006d@gmail.com>
	<643c0139-f738-a603-fd93-cb4c6ee02f37@gmail.com>
Message-ID: <f8367cfb-1b4c-0136-f984-db7b7ae72045@gmail.com>
Date: Fri, 7 Jun 2019 15:27:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <643c0139-f738-a603-fd93-cb4c6ee02f37@gmail.com>
Subject: Re: [PATCH] multiconfig: Adapt to bitbake switch 'multiconfig' -> 'mc'
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
X-List-Received-Date: Fri, 07 Jun 2019 20:27:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 6/7/19 3:08 PM, akuster808 wrote:
>
> On 6/7/19 8:51 AM, Joshua Watt wrote:
>> Is there a reason for this change other than aesthetics?
>>
>> FWIW, we maintain some recipes across several versions of poky, so
>> this rename is going to cause me some headaches
> Versions.. as in stable branches?

Yes.

>
> - armin
>> On 6/7/19 10:48 AM, Richard Purdie wrote:
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> ---
>>>    .../recipes-test/multiconfig/multiconfig-image-packager_0.1.bb  | 2 +-
>>>    meta/lib/oe/sstatesig.py                                        | 2 +-
>>>    2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git
>>> a/meta-selftest/recipes-test/multiconfig/multiconfig-image-packager_0.1.bb
>>> b/meta-selftest/recipes-test/multiconfig/multiconfig-image-packager_0.1.bb
>>>
>>> index 3dbc0f5d155..a76a6bea1b8 100644
>>> ---
>>> a/meta-selftest/recipes-test/multiconfig/multiconfig-image-packager_0.1.bb
>>> +++
>>> b/meta-selftest/recipes-test/multiconfig/multiconfig-image-packager_0.1.bb
>>> @@ -8,7 +8,7 @@ MCIMGTYPE_virtclass-mcextend-tiny = "cpio.gz"
>>>      MC_DEPLOY_DIR_IMAGE =
>>> "${TOPDIR}/tmp-mc-${MCNAME}/deploy/images/${MCMACHINE}"
>>>    -do_install[mcdepends] +=
>>> "multiconfig::${MCNAME}:core-image-minimal:do_image_complete
>>> multiconfig::${MCNAME}:virtual/kernel:do_deploy"
>>> +do_install[mcdepends] +=
>>> "mc::${MCNAME}:core-image-minimal:do_image_complete
>>> mc::${MCNAME}:virtual/kernel:do_deploy"
>>>      do_install () {
>>>        install -d ${D}/var/lib/machines/${MCNAME}
>>> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
>>> index 417943db902..13af16e473c 100644
>>> --- a/meta/lib/oe/sstatesig.py
>>> +++ b/meta/lib/oe/sstatesig.py
>>> @@ -155,7 +155,7 @@ class
>>> SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
>>>            else:
>>>                def get_mc(tid):
>>>                    tid = tid.rsplit('.', 1)[0]
>>> -                if tid.startswith('multiconfig:'):
>>> +                if tid.startswith('mc:'):
>>>                        elems = tid.split(':')
>>>                        return elems[1]
>>>                def recipename_from_dep(dep):

