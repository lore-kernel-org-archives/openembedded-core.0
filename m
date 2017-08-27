Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id B852B7823F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Aug 2017 21:49:24 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id d66so3768445oib.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Aug 2017 14:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=f1q6Lq6fPMxZr6Z8EYef0JYbKf6+3hzMXdLnMS1Nr5E=;
	b=nSAu0byElBV8lq9eXjJx3PuIlvVmfsKEwv269iP7xUBbaix/JusiVOaHYVIqpfcuGp
	cetoCMWaRT/KwEycW8Ev9YH1UKadhrOhf+Fq7irRAQwsZTI9wYHHkHTWIlLIKqkwcXTY
	tiuSUzTA9NR4uFBTNTZZIXztR4TxUtbI23YjRGx4OxU6rxlKvfedOnFM/8KAvTBkJmK8
	Ck0wk0MDIiXKxJmegltLhwh2eGdJcbguI6AqzqtxRc7G2UiyzedmrPvKWEq/U54Dv2dB
	28MOV3SAtbnDVOIYCJJeTdASqVDW8+RTHvbq+lk0Wl75rdN8Fsm4K7/uMlfQCBEGN0jC
	Qhkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=f1q6Lq6fPMxZr6Z8EYef0JYbKf6+3hzMXdLnMS1Nr5E=;
	b=cTEiJifl/FgGznU6YK/faRwt2Kno9U69BSzAZLkETuY978Vleuj68gOO6X+arF9GBh
	014/whO9/gfsHCkuye+2cITAX+BRSdippK1WOqB90ZeNF93qFJTbbDnwarzRFyHzg84H
	GaZdsvCBa8H7LqfIA0B9zvSZLPihtfqSMKIWQG/EKcl4w3GyESj3GNHEhofj0dU6nQrx
	L5hrFN5oB9tq5dHwrCL024B7q+Rpe3h8M0VU8X2PQC47fOYcSXLDUf5Sn7OnL6Qe/Waz
	bf5W0sEVCnG+7nQ185O5HHIdkrec/0Jbrce1Q+cmL1UY6z8/0NJ5jyknvsblZS0gDttI
	2Gnw==
X-Gm-Message-State: AHYfb5jJtcMiTQLWt4/lfh/p9+4M70OWcR2xDwLOsf8t/OiH8pHUZ3ho
	7hS3xdNdRyY1FE8RjuE=
X-Received: by 10.202.48.195 with SMTP id w186mr3946265oiw.143.1503870565457; 
	Sun, 27 Aug 2017 14:49:25 -0700 (PDT)
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com.
	[209.85.218.42]) by smtp.gmail.com with ESMTPSA id
	w199sm12354195oia.58.2017.08.27.14.49.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Aug 2017 14:49:24 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f42.google.com with SMTP id k77so32584648oib.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Aug 2017 14:49:24 -0700 (PDT)
X-Received: by 10.202.73.151 with SMTP id w145mr7413817oia.274.1503870563664; 
	Sun, 27 Aug 2017 14:49:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.1.183 with HTTP; Sun, 27 Aug 2017 14:49:22 -0700 (PDT)
In-Reply-To: <1503868912.32591.276.camel@linuxfoundation.org>
References: <20170827211005.18090-1-otavio@ossystems.com.br>
	<1503868912.32591.276.camel@linuxfoundation.org>
Date: Sun, 27 Aug 2017 18:49:22 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpou6dpqGWvQEGEH7neFsGzXPp=4W-7+agzo2YzpsWx3w@mail.gmail.com>
Message-ID: <CAP9ODKpou6dpqGWvQEGEH7neFsGzXPp=4W-7+agzo2YzpsWx3w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] initramfs-framework: Change recipe to be allarch
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
X-List-Received-Date: Sun, 27 Aug 2017 21:49:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 27, 2017 at 6:21 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sun, 2017-08-27 at 18:10 -0300, Otavio Salvador wrote:
>> There is no COMPATIBLE_HOST in the recipe neither it makes sense for
>> this to be machine specific.
>>
>> Possibly, initramfs-framework's based modules may be machine specific
>> but if there is the case they can just RDEPENDS on
>> initramfs-framework-base and provide the specific module as another
>> recipe.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>
>> Changes in v2:
>> - Add the new dependencies to the hash whitelist
>>
>>  meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 8 +++
>
> I think there may be something missing here as this looks like v1...

My fault, v3 is on the way.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

