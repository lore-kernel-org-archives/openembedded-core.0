Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id EAB7D6AE9E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 19:58:44 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id wm4so1808852obc.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 11:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=TNprOZMxP8jSA3mJrFbe0y9ZwiqVvlQmxfRPV5GYd78=;
	b=nQ0BcjsbYBHvInaxeVm1CUzd8DBbgmt7aBw3NzUA0elaulgFepIZ7ViMwjYsadQJ93
	bTEspmIfbq77AeC7kaDMxXAxfzI7SHf01/xyYPHwbfkAGeXAOZhW0Muh+4XYPLJBzyok
	LgCs89wSLI/4HteycTVPqjRbSd7Sg83b9iHmZIFXWqm8W0DK25irOtH4bNQPBYD8UXy9
	2bVomEnQE1U9TSb3Dhbpe5799oA7DU1T3iOUNpLxtQSniQRmkGfP7VT+yEn8KaiPf0ai
	c0KPc2yNHectkcUCgsPO2AvRmh2AP4J+DI1ibEuXxud9LfiUo6muVKftcJgcWMWg+KQQ
	BvGQ==
MIME-Version: 1.0
X-Received: by 10.60.44.141 with SMTP id e13mr173267oem.84.1385150324097; Fri,
	22 Nov 2013 11:58:44 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 22 Nov 2013 11:58:44 -0800 (PST)
In-Reply-To: <8403fc751bcf1e0b62b600ed40e00256963f357d.1385098685.git.Qi.Chen@windriver.com>
References: <cover.1385098685.git.Qi.Chen@windriver.com>
	<8403fc751bcf1e0b62b600ed40e00256963f357d.1385098685.git.Qi.Chen@windriver.com>
Date: Fri, 22 Nov 2013 17:58:44 -0200
X-Google-Sender-Auth: y2pXvZeIWM7erYYVMmCYZCU3igY
Message-ID: <CAP9ODKovi8aHpfM7Tyt+rCxyYC8=YPcxaQGCA6G3=6hhau5W+w@mail.gmail.com>
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
X-List-Received-Date: Fri, 22 Nov 2013 19:58:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 22, 2013 at 3:39 AM,  <Qi.Chen@windriver.com> wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Add 'virtual/kernel' to DEPENDS in image.bbclass so that the kernel
> can get built by default. Otherwise, the kernel will not get built
> unless it's required by other packages like v86d. As a result, if
> we build 'core-image-minimal' for qemumips, the kernel is not built,
> and we have 'bitbake linux-yocto' before we can use runqemu to start
> the target.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>

If I have a board without modules there's no need to have the depends.
Why you need this?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

