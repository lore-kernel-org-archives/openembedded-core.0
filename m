Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3F86D75794
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 15:33:57 +0000 (UTC)
Received: by iodv127 with SMTP id v127so85415485iod.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 08:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=NQzCcFjrBd53+j2Xcni+0wRWTNP/Xh1G46rgV/sz0Do=;
	b=cFn6ZL54QP4bgMMnkhjy4CxnpY546R0tMEV/jELClpOMilaYJcK413L5SwC3zd333Z
	cazohVPVQA9B37PqSgi4To9MZ5qW0QOdkyWJjfaCH4rhwfK+rgxnSdibK9ulFYPQ3ntH
	QvIiHQQe4Y+WqUuL4EE6vaGphgyun2ALLixYyELyu3n/nRECAq86TvzQGyPm8sH+XZuf
	sUUEuJAP3yO9rEaUpA4XWrQOupEpGR+2WaXQdl96lTm3pa6npchbVTkChwYk0jBXVqxf
	fNPYyUfZMnoMicbO/j8LkiyZcAidcfcwit1H+5cAOL5VTfHum4dbvZ55jTzJU2x4Efoc
	5Imw==
X-Received: by 10.107.14.203 with SMTP id 194mr8845808ioo.195.1440171237058;
	Fri, 21 Aug 2015 08:33:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Fri, 21 Aug 2015 08:33:27 -0700 (PDT)
In-Reply-To: <CAP9ODKrs70dX-K2zJ9Rhx1J+yqeDXQDX7u7UpH_bM5KGPrDa0g@mail.gmail.com>
References: <1440055967-28503-1-git-send-email-coldnew.tw@gmail.com>
	<CAMKF1srx_Jzv1gfwQ=VAiepAqL3GHfP4SJduup_GiwCSvL0MoQ@mail.gmail.com>
	<CAP9ODKrs70dX-K2zJ9Rhx1J+yqeDXQDX7u7UpH_bM5KGPrDa0g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Aug 2015 08:33:27 -0700
Message-ID: <CAMKF1srJxd1A6K+TQxsaKn7Bckfz7_eBs6+2bHj090ZzN-jYiA@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uclibc: Add SRCBRANCH for use by SRC_URI
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
X-List-Received-Date: Fri, 21 Aug 2015 15:33:58 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 21, 2015 at 3:31 AM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Thu, Aug 20, 2015 at 11:19 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Thu, Aug 20, 2015 at 12:32 AM, Yen-Chin Lee <coldnew.tw@gmail.com> wrote:
>>> -SRC_URI = "git://uclibc.org/uClibc.git;branch=master \
>>> +SRCBRANCH ??= "master"
>>> +
>>> +SRC_URI = "git://uclibc.org/uClibc.git;branch=${SRCBRANCH} \
>>
>> this is ok. Just call is BRANCH instead of SRCBRANCH
>
> Personally I prefer SRCBRANCH. This is personal option though.

consistency is what I wanted here. There is BRANCH used for same
reason in some other recipes, it can be any name I don't have a
preference.
if you prefer SRCBRANCH, propose another patch to rename other
usecases in metadata to use it as well.

>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

