Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id DDC4A6E713
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 16:41:46 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id r1so1741874igi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 08:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zkrW7BAciwdBsnOTdcROTr09a6QslyPn5O1wFPtmSSA=;
	b=RZv95+pt/UyoeAEGATjdeCqF2kw2i70hMAQaPpo8nk5mDCS6oc91vR/7Z/EiuebXi4
	BUIliUVeJW1TeNXOAaJrIFOD+ahn7QEnZmg65Yj+Y2JEKdZXQzyB3MsH3cGA7e2cjQJG
	PoOLmnY0cK5VfLrqv5T20MNh9DE+anHXsxKldHzU7OpuyhcbGyEFPl7K95r4v1SOlovc
	ofn58ltWxh3GNtAgjVXfRiIggm1Q6P+x8Gs/eJ2Go2GXjzrN5aKEcEf61rWuvS4ZDsQT
	2s3kFDrk2eR2Hi8vL5tWnUudZfvv8a+KI67jPH5O0a11BbJ3KsLc96x+Bo3IyOcjQMSb
	xlYw==
X-Received: by 10.50.143.69 with SMTP id sc5mr21138734igb.2.1393346507347;
	Tue, 25 Feb 2014 08:41:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.137 with HTTP; Tue, 25 Feb 2014 08:41:16 -0800 (PST)
In-Reply-To: <CAP9ODKoCwUtYzbhnj2Ka1HOEdYo=UZk6vPVHxsCB43Z1k0hcFw@mail.gmail.com>
References: <1393280958-18379-1-git-send-email-diego.sueiro@gmail.com>
	<CAP9ODKpGE22EOaUgqnaYGF47dsidsAF5_zFxUdNz=EzfSeQOWg@mail.gmail.com>
	<CAMCfZKG7ZQUdaFJ8MfCyyKR17p0w=MagQNMNeZR9cGTmiMasPw@mail.gmail.com>
	<CAP9ODKoCwUtYzbhnj2Ka1HOEdYo=UZk6vPVHxsCB43Z1k0hcFw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Feb 2014 08:41:16 -0800
Message-ID: <CAMKF1srJ5Gi1j-m+rObvMwNYnrfgeKhJwy3LyLhCx=kNtWgsGA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, "Eggleton,
	Paul" <paul.eggleton@intel.com>
Subject: Re: [PATCH v2] packagegroup-qt-toolchain-target.inc: add libQtUiTools static library
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
X-List-Received-Date: Tue, 25 Feb 2014 16:41:49 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 25, 2014 at 5:50 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Hello Diego,
>
> (adding Khem and Paul in Cc)
>
> On Tue, Feb 25, 2014 at 10:35 AM, Diego Sueiro <diego.sueiro@gmail.com> wrote:
>> On Tue, Feb 25, 2014 at 10:24 AM, Otavio Salvador <otavio@ossystems.com.br>
>> wrote:
>>>
>>> This license is the same of Qt itself so I don't think it needs to be
>>> quoted here. Do you see any reason for it?
>>
>> I've just followed Khem's instructions:
>> http://lists.openembedded.org/pipermail/openembedded-core/2014-February/089888.html
>
> I see; however this license is no different of rest of Qt so we can
> assume the user of Qt knows the license (and has reviewed possible
> impacts of it with their legal department).

ofcourse, however all I was suggesting to make it a little more
understood with some
comments.

>
> What others think?
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

