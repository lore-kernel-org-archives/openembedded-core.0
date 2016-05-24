Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id C88176014F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 17:35:35 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id e131so8976154lfb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 10:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=4/9l9iDA8Sl4Iyc2j5YmTK+15XpcT4vRnWMunASB/TM=;
	b=IkLRnJPWd4ODAWBCX9ck9RwMZxahCxOZjOgUTJld2STkdsh6zpcG9ZdyKhDN8S746S
	DZRrE2Egy5jZMZQZvXlzVSQkUogplm47GycnneXJyLxeFLufZpyNqhoKgI4QYXi1S0nt
	w2YmIvleGaATY2fqLuCj8kXK5K4qHrdVe0fvf0d50kk0Yego+3zWC5eidNOOezjRgEQG
	KE8oxpNYHoSJvYGLF5kaNRhw1Q7qUkl3OOUUCzhCNSi8TRVsA+bKRU7/D+54HkfaLpec
	vGkZ4nMrnG9DYcxGxe+F7zOy+WcJW0G5ATA6JsZZKuJeR7Pf6rFfWL67XOWXcd8zxIgH
	k9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:organization:user-agent;
	bh=4/9l9iDA8Sl4Iyc2j5YmTK+15XpcT4vRnWMunASB/TM=;
	b=Qcj1oOcgV+rY/LEc0O/KdvBUP4JVNC/oZvbxNChUGt4A+4uHSWXU54fYIUY+LDNo/a
	SR2R8xHLMDbK9rQGFubfQ/51gyTeUrB4ox24INtHDM0X0ve1huVm2+PqMxz2A/80lzZb
	+qxfzFxempXe/AWPemUjqkweBi2fCKJ2+RyJaW+cQFeinXG6AOtQIDTT9seOJo1DtRxy
	Z1f0wpf/EeDYgXJZdf46kycYnYwiuWPovPqJoJfYzjyPL/kz4lOukCIIGD2BuuxxRyHm
	Kwziudm+vM3Y1cawtwpB1m8J6QXbaV/NGYsbg7AQD9zv6/1GsprGPFTPvig7CyVL+IDg
	ZL5g==
X-Gm-Message-State: AOPr4FXIhL9TqNYizkfnzz08S0NKC32436H1HUB3gITNqLtWky7bV0JG/8c7+b7JQSgACw==
X-Received: by 10.25.44.199 with SMTP id s190mr8138755lfs.146.1464111334492;
	Tue, 24 May 2016 10:35:34 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-218-130-no126.business.telia.com.
	[213.64.218.130])
	by smtp.gmail.com with ESMTPSA id l10sm627687lfb.47.2016.05.24.10.35.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 May 2016 10:35:33 -0700 (PDT)
Date: Tue, 24 May 2016 19:35:31 +0200
From: Anders Darander <anders@chargestorm.se>
To: Matthijs Vader <mvader@victronenergy.com>
Message-ID: <20160524173531.GA6413@ad.chargestorm.se>
Mail-Followup-To: Matthijs Vader <mvader@victronenergy.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <DB5PR07MB1431386E8583B4F0F5204924C54E0@DB5PR07MB1431.eurprd07.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DB5PR07MB1431386E8583B4F0F5204924C54E0@DB5PR07MB1431.eurprd07.prod.outlook.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: wic wks: data partition only mounted on second boot?
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
X-List-Received-Date: Tue, 24 May 2016 17:35:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Matthijs Vader <mvader@victronenergy.com> [160523 13:37]:

> Hi again, fixed and found it myself already. There is an error while mounting that
> partition on the first boot because the mount point (/data) doesn't exist yet.
> Then, later during first boot, some application creates it. Which explains why
> it does work on the second boot.

> Which brings me to a new question:

> Is there are reason for mountall.sh to put all errors into /dev/null? See:
> https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh#L20

Good question. To be honest, I don't know.

> Or shall I send a -tiny- patch dropping that 2>/dev/null?

As long as it doesn't produce too much noise (i.e. errors on normal
boots etc), sure do that. At least as long as you check that it goes
into the syslog / journal.

That would probably help people debugging certain issues.

Cheers,
Anders
-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

