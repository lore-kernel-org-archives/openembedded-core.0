Return-Path: <armccurdy@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id BC24D75D4A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 19:51:37 +0000 (UTC)
Received: by qkfm62 with SMTP id m62so88439792qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 12:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=pMHLznhKwqATs74R38tiVKAG1ooZ+ee1AKj3dsHMMgY=;
	b=xL4vEsNLv1VK0p7oTM07Vzk1lLIIPBzO7cvK4mJrUPkWZVsBNpdGtwq0AOwEb2c/KO
	H0VbyGf/Gbdlivuh++iTpN7XaQNT1HoUrShjyMzNehIkUdRaOboxpWPrlccXiskaS33H
	Nlt3LlJDu2KFv3IGYIts9DhxEpQwgHPKSVwnIXQqRTHgf9kVGUaltqUcUh5NIq6VEFFk
	RboutKzUAxGBngrd5oN9kxyZ+Slnq/8qJSVp5pOcV/vH6gryKxnxFtJJ5fa84FqzR/BM
	Vgi3Oea4yZFGpsBMw4nPf3vXILoAftpH4dLCj+Xte/m46jB7wCCw/z7iOSqs4xCZCGDG
	vxTA==
MIME-Version: 1.0
X-Received: by 10.194.90.169 with SMTP id bx9mr26670588wjb.1.1445284297297;
	Mon, 19 Oct 2015 12:51:37 -0700 (PDT)
Received: by 10.194.169.6 with HTTP; Mon, 19 Oct 2015 12:51:37 -0700 (PDT)
In-Reply-To: <CAMKF1sovTRrm3=_hnKbV3nKy4b+vk-xjV-CuNQOU21xMsMMfjQ@mail.gmail.com>
References: <1445281177-3309-1-git-send-email-armccurdy@gmail.com>
	<1445281177-3309-5-git-send-email-armccurdy@gmail.com>
	<CAMKF1sovTRrm3=_hnKbV3nKy4b+vk-xjV-CuNQOU21xMsMMfjQ@mail.gmail.com>
Date: Mon, 19 Oct 2015 12:51:37 -0700
Message-ID: <CAJ86T=X3wdWNSRHWe3eJGYWhjbQrqNEP2geKyEis-SZPDm92kQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] tune-atom.inc: include tune-bonnell.inc instead of tune-core2.inc
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
X-List-Received-Date: Mon, 19 Oct 2015 19:51:39 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 19, 2015 at 12:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
> What do we get with this change

It's mainly just a convenience for anyone with an existing machine
config using "tune-atom.inc". They would get atom specific tuning
without needing to update their machine configs.


> On Oct 19, 2015 12:00 PM, "Andre McCurdy" <armccurdy@gmail.com> wrote:
>>
>> Use 'atom' as an alias for the first generation Intel Atom CPUs.
>> ---
>>  meta/conf/machine/include/tune-atom.inc | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/conf/machine/include/tune-atom.inc
>> b/meta/conf/machine/include/tune-atom.inc
>> index 5e1bb74..24cd676 100644
>> --- a/meta/conf/machine/include/tune-atom.inc
>> +++ b/meta/conf/machine/include/tune-atom.inc
>> @@ -1,2 +1,2 @@
>> -# Atom tunings are the same as core2 for now...
>> -require conf/machine/include/tune-core2.inc
>> +# Alias for the first generation of Intel Atom CPUs.
>> +require conf/machine/include/tune-bonnell.inc
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

