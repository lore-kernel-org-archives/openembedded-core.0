Return-Path: <osama.abdelkader@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E0E1CA0EE8
	for <webhook@archiver.kernel.org>; Sun, 14 Sep 2025 18:40:11 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.15161.1757875204853892641
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 11:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=McH7evOP;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: osama.abdelkader@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ea3e223ba2so468101f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 11:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757875203; x=1758480003; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GTUlYS6rY6wL4aPo0B/h7nrN24RSRjyiJpky0LeR2fU=;
        b=McH7evOP9v8LsA+OmFn5IdwdxKITuRiTgyFYfPEOGb5IAZjZi9aNJp9uoEu8RL3mQ0
         82cAnzVSYu6bQ3/qXJxf1sSifpJM0nY0Ih+ucf/RJsMYQtZ45aZT5LaGM68MYL3uRAHB
         VfZRkcFsSRxwajtuFDjwqtACiuxUYaW8iEE1uyN9BHgT27czAB8lvC8bojlhYHpPzh0L
         hHah9C/NF4t1tk/V+CHb7lngD/idpbzHz1k6J9uQBukICqB6c7ptPwq94rAOFZwOdQwi
         bgi0OWwE4xiE7aI2NxclzLWA14YwPIApVaU4yWUXNgqYOOsTM+cavXB7JC/F+kaMD8e1
         MVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757875203; x=1758480003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTUlYS6rY6wL4aPo0B/h7nrN24RSRjyiJpky0LeR2fU=;
        b=TaMBAj2DHoj1NyWAouznwMeLg0zlS6z0Me3ozSeTAjLbKOz2xOdU2QlAgoIowF/Otp
         9SCIl64NjrIvG7+R9Bmz+zBpbIbiSBGKJeWf8KTQKyyca+W61VEZ4NJze4VYSH+h+PX/
         oOgcKvs2D0AVaYnK01Zisc9DsytBIGMcMQ0XWQuqxlm8ScJnSaRkyRH8S3a8u1qIG/XN
         e1wWiAlP0YolBPuxhv90Rj4z6kpDI0pHo/I0Q59LBuBrkIoCVWc0xU3gpZxIl/5QYfP6
         Ckis/r45+FG0PdGJuuxWrUSNaX6ORqdwVlK4p6XSk0ONadGqexdXslLWYrLEJ8FtF8Vz
         Kdqw==
X-Gm-Message-State: AOJu0Yxix2kM73CctiVMVoyadBJdEw3xjI2lsnDZBpTj9rIV+ub9AYue
	8MIHSUzZ0QljkJOwV+S4ZtDObD2yKQ59sQUZp0hQS7X9AabgOgwiYpIM
X-Gm-Gg: ASbGncurK5y38g5fwaKyIQ/W5/5MLHrjugP5PFXtbhXLxslN2kB/aOXDF+Zb2vBsNXk
	OYoGBhE583mzXEUao3XuXJdZbgvhgza0IF4K0cX8rhcYhQw8oI6D3NUiqX5RtcIZAJVvgOh0LYJ
	s2lydpBEU4zy61CURftK0dpBmSM4hrNlkTa8D9xhlnI1MdSy6PitZbCQ29ToVxxEJgFIuobMmHt
	pGo0XoyJFTot67GA74AqkOP4eBK5F15xTMHTshd46GWq9bjeaN6xirpy30AwMvsNDAyriGnwugW
	36RZhosckAw5rIPpcaeHtPeirmEPi8FKJd5IHPF4zJXBEOqDpUWb71qk9Q7P24EB5bcBNKYfEtd
	UU5GNwz2ZUqnRfKdcbWOAP1TesLRaZBcC3EluxdYbIQgVXqTOVlzOQYA0L5JsV/Pl97dxNKx9ty
	bF
X-Google-Smtp-Source: AGHT+IGsPSPrAfYn0vaGZtY55A5GOOecQw6FbQmm36TDauAgRTRopGdKdx6RCV7zzegXS89Wow6Cqw==
X-Received: by 2002:a05:6000:430c:b0:3ea:87f8:da54 with SMTP id ffacd0b85a97d-3ea87f8de98mr1076781f8f.33.1757875202984;
        Sun, 14 Sep 2025 11:40:02 -0700 (PDT)
Received: from osama ([156.223.20.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e774a3fb5bsm10287612f8f.58.2025.09.14.11.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 11:40:02 -0700 (PDT)
Date: Sun, 14 Sep 2025 20:39:58 +0200
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, alex.kanavin@gmail.com
Subject: Re: [OE-core] [PATCH 1/2] go: extend runtime test
Message-ID: <aMcL_v01pp3WPplX@osama>
References: <20250912232110.1794088-1-osama.abdelkader@gmail.com>
 <DCSFD04X28ZX.G5LWHQA6861E@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DCSFD04X28ZX.G5LWHQA6861E@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 18:40:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223370

On Sun, Sep 14, 2025 at 11:44:25AM +0200, Mathieu Dubois-Briand wrote:
> On Sat Sep 13, 2025 at 1:21 AM CEST, Osama Abdelkader via lists.openembedded.org wrote:
> > extend go runtime test with a simple test file, and simple
> > go module test to validate go compilation and execution on
> > target.
> >
> > Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> > ---
> 
> Hi Osama,
> 
> Thanks for your patches.
> 
> It looks like one of these is triggering this error:
> 
> oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /srv/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/core-image-sato/1.0/testimage-sdk/environment-setup-cortexa8hf-neon-poky-linux-gnueabi > /dev/null; cd /srv/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/core-image-sato/1.0/testimage-sdk/; go build -o test test.go;' returned non-zero exit status 127.
> Standard Output: /bin/bash: line 1: go: command not found
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/2360
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/16/builds/2408
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/2396
> 
> Can you have a look at this, please?
> 
> Thanks,
> Mathieu
> 
> -- 
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

Thanks Mathieu. It looks "go" & "go-runtime" are missing in the image
I just sent v3 which skip those tests if "go & go-runtime" are missing.

Thanks,
Osama

