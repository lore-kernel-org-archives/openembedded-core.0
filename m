Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 163406C747
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 22:32:07 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id c11so1523049lbj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 14:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=UrpphVAmttzo9K24u5K2avvmxqmA7QYa8fPDRQw93Jg=;
	b=n3YgQJvmheoQQukBHGQbuxpDUI7n2SQQR9Voie1n2315skiqNr5LFhfB2FnYYYaerG
	8oRCH5Ww8/mAWgNKSVSJZblSTYcysOMh+yQjo2lbbNskPsjomx9dNtg3YKx5flcSGeCQ
	KKo5p8SlWsfD2dA+emTDj0iLckZiDHhFOMhk7w9QcX3AlQ+gkKmnhcjnyIR6JIHMQFJQ
	tv/71u39tKOUqk8km8xEiiyCEbyGXhQIOoqLEH7BLk4JEoQ3DeadOZBRyHpeTIiTA15Z
	45nbouwUfUQUA/LDyO1ZpPVeTV4sA8UG5YvT/pDWWFizBCIRclxVfe68u30fnrB5X1TH
	6hPg==
MIME-Version: 1.0
X-Received: by 10.112.128.226 with SMTP id nr2mr10801757lbb.17.1385159526867; 
	Fri, 22 Nov 2013 14:32:06 -0800 (PST)
Received: by 10.112.52.74 with HTTP; Fri, 22 Nov 2013 14:32:06 -0800 (PST)
In-Reply-To: <CAP9ODKovi8aHpfM7Tyt+rCxyYC8=YPcxaQGCA6G3=6hhau5W+w@mail.gmail.com>
References: <cover.1385098685.git.Qi.Chen@windriver.com>
	<8403fc751bcf1e0b62b600ed40e00256963f357d.1385098685.git.Qi.Chen@windriver.com>
	<CAP9ODKovi8aHpfM7Tyt+rCxyYC8=YPcxaQGCA6G3=6hhau5W+w@mail.gmail.com>
Date: Fri, 22 Nov 2013 23:32:06 +0100
Message-ID: <CAAQYJAsmtSLkxnukhv=Guj5cJPhy23UixnZ-aaWB8CjsgbAaQQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
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
X-List-Received-Date: Fri, 22 Nov 2013 22:32:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 22, 2013 at 8:58 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Fri, Nov 22, 2013 at 3:39 AM,  <Qi.Chen@windriver.com> wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Add 'virtual/kernel' to DEPENDS in image.bbclass so that the kernel
>> can get built by default. Otherwise, the kernel will not get built
>> unless it's required by other packages like v86d. As a result, if
>> we build 'core-image-minimal' for qemumips, the kernel is not built,
>> and we have 'bitbake linux-yocto' before we can use runqemu to start
>> the target.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>
> If I have a board without modules there's no need to have the depends.
> Why you need this?
>

The first quenstion in my mind when I read the post:

Odd...wasn't core-image-minimal purposedly lean, mutilated and without
kernel modules ?
(Not that really 'used' it, just booted 'cause was small and could
always fit on nand/nor)

It has always been like this: if one needs the kernel and the modules
can add that in his machine.conf.
For more demanding tasks, the next logical step is core-image-base.


My 2 cents

Andrea



> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

