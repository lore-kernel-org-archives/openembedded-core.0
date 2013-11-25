Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f42.google.com (mail-oa0-f42.google.com
	[209.85.219.42])
	by mail.openembedded.org (Postfix) with ESMTP id C4FAD6D014
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 12:28:14 +0000 (UTC)
Received: by mail-oa0-f42.google.com with SMTP id i4so4272126oah.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 04:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=MLAGgpysDNsnIUdftuoduV22OWBVMpEwbVRcwI+A7WI=;
	b=BEy+RnaXhV+4i3wcW7bqHHOos776jqGCsBeOboveDA/o2+3pWuqL/0CyaYbThF7x9T
	DMh1gcG+wfcV5JoGhsaC7SttS4uTpqPsufQOp12pvF5nnUAIOPDM7S8z7cmexLM1AVYu
	z49MqrWc7uhy4TFdrC/dW6EL8ZMKP6BbyuLnn7nO4pLt8K27fxSc3vRX4wNerQcWNnxI
	qijZfiHXlEvZhaNkPWSbTNhU8wVdqNxCT5hX+oh7rPiTprD0vtipWUoBxPwH1uncGIjw
	7m73UMiFaKNkjRLXtWvKO2O/5egXEbFv2moQ7SLJ+4KAQFwLGC+cEhtDq5xCx80VWssR
	46Ng==
MIME-Version: 1.0
X-Received: by 10.60.93.67 with SMTP id cs3mr24861621oeb.12.1385382493625;
	Mon, 25 Nov 2013 04:28:13 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Mon, 25 Nov 2013 04:28:13 -0800 (PST)
In-Reply-To: <52933DE1.3050202@windriver.com>
References: <cover.1385098685.git.Qi.Chen@windriver.com>
	<8403fc751bcf1e0b62b600ed40e00256963f357d.1385098685.git.Qi.Chen@windriver.com>
	<CAP9ODKovi8aHpfM7Tyt+rCxyYC8=YPcxaQGCA6G3=6hhau5W+w@mail.gmail.com>
	<CAAQYJAsmtSLkxnukhv=Guj5cJPhy23UixnZ-aaWB8CjsgbAaQQ@mail.gmail.com>
	<52933DE1.3050202@windriver.com>
Date: Mon, 25 Nov 2013 10:28:13 -0200
X-Google-Sender-Auth: elaJAP2At-Zai6g0mqpqM64ydeo
Message-ID: <CAP9ODKpZaWs=9zfvN_WmP7g2rRpc70po-Mdd_g75B8=XwDNAhg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] image.bbclass: depends on virtual/kernel
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
X-List-Received-Date: Mon, 25 Nov 2013 12:28:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 25, 2013 at 10:09 AM, ChenQi <Qi.Chen@windriver.com> wrote:
> On 11/23/2013 06:32 AM, Andrea Adami wrote:
>>
>> On Fri, Nov 22, 2013 at 8:58 PM, Otavio Salvador
>> <otavio@ossystems.com.br> wrote:
>>>
>>> On Fri, Nov 22, 2013 at 3:39 AM,  <Qi.Chen@windriver.com> wrote:
>>>>
>>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>>
>>>> Add 'virtual/kernel' to DEPENDS in image.bbclass so that the kernel
>>>> can get built by default. Otherwise, the kernel will not get built
>>>> unless it's required by other packages like v86d. As a result, if
>>>> we build 'core-image-minimal' for qemumips, the kernel is not built,
>>>> and we have 'bitbake linux-yocto' before we can use runqemu to start
>>>> the target.
>>>>
>>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>>
>>> If I have a board without modules there's no need to have the depends.
>>> Why you need this?
>>>
>> The first quenstion in my mind when I read the post:
>>
>> Odd...wasn't core-image-minimal purposedly lean, mutilated and without
>> kernel modules ?
>> (Not that really 'used' it, just booted 'cause was small and could
>> always fit on nand/nor)
>
>
> What I want to do here is to trigger building of kernel when building out an
> image. I'm not proposing to make all images have kernel -modules installed.

Yes but you're proposing *all* images to depends on kernel. This is not a need.

>> It has always been like this: if one needs the kernel and the modules
>> can add that in his machine.conf.
>
>
> Previously, the kernel is built out by default because
> packagegroup-core-boot has a dependency on it. Now the dependency is gone.
>
> I'm not talking about installing kernel modules onto images.

and I am not keen to have all image depending on kernel build. Sorry.

Nack!

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

