Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id A6C576FEF5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 20:43:11 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id td3so137370930pab.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 13:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=qRt80ReGoOLZTUy5fLGdTkLbVqRtlizFkQLZE5HJYek=;
	b=cmPoL7QpD9t1oECLvb+ydCmhi2uMiFCjxq/Q7qs0cdZomH4kpUeDFJVtDXw5gjUxpb
	HQRdX/4RihLDvl6cdP8gVa+b4d6ug6jQmF/TiJAREWTX0IPhcgfJLansahC9ql0dTjSN
	b5H1NxwjnYm9Bdo81HfNNq8FxjeHEyM7vyOvHPswsOjsrJMlZJsiMW2KM3YJT1NvxQdU
	692CHb1jMDCBq8VCBgcYx5RYfhLt1Wnvuf3ln5IxMVHiXAYvCgBrckFALaL/ThcOgNt4
	5MiOUQQZvHjl0AI8OcC2cSJYs7VmCexQTyeEHnCU3AaHhXWqLkGvQbAc4DVtcbzSZEA1
	u+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=qRt80ReGoOLZTUy5fLGdTkLbVqRtlizFkQLZE5HJYek=;
	b=Ne7IFW8ZPn/ZMfrCMJQv40We1DeJJ3MNtdxr8xpiRwUtgtf4I5pJbwkjgfKmDHyy0z
	L79vyEm/T08VT//5vwtmQDvGWef4HYHIYAuSYseKdh18fl/MSJtkYZUAneNqpV0E7mdy
	EITX/fcA64iZ0jOtG4EIJek2o7+U7YdnpzV+L1hScih2FcCsg/VKeDJB1oyaknqRfuE5
	LAE22aqSjUs4Vxzo68FCxoZRnw//nDIPmRxf5XLPYZAj2iqu9yEtz+mp7FNUinszu2JR
	QCh2Y08ibFudSxc3ldpj8tYJm9EXjI1wz7ExK29DNCI8VR9c19VGkesLxj/gAY7ee9fD
	cIAQ==
X-Gm-Message-State: AD7BkJLsEUoyrFm07bYK4ZC/PulO+M7KQ/mjnSDvc6wTyKQjsep03U02ZAaw2g+OZzkPzw==
X-Received: by 10.66.231.100 with SMTP id tf4mr41063520pac.44.1457988192662;
	Mon, 14 Mar 2016 13:43:12 -0700 (PDT)
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com.
	[209.85.192.182]) by smtp.gmail.com with ESMTPSA id
	y21sm34155402pfa.85.2016.03.14.13.43.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Mar 2016 13:43:11 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f182.google.com with SMTP id x3so49940300pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 13:43:11 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.80.10 with SMTP id e10mr33145354pfb.141.1457988191049;
	Mon, 14 Mar 2016 13:43:11 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Mon, 14 Mar 2016 13:43:10 -0700 (PDT)
In-Reply-To: <CAJTo0LYfwrc+wteB+ez6gqZbXgM8dJO6PKrB+vf0S6+ANC7ggQ@mail.gmail.com>
References: <1457981210-23532-1-git-send-email-otavio@ossystems.com.br>
	<CAP9ODKpGfXsyzE91Nxak39npYTZ-yLw0NkVw91z75=vuVo1UyQ@mail.gmail.com>
	<CAJTo0LaVVaY9gmtzp7tq=77GBj+rCzGBC+2K1CnOoXEk8XCwBw@mail.gmail.com>
	<CAP9ODKq2CDKAxXijkEQH75vV6QKakt2HCSXHOU-HhZ0tCCnzwg@mail.gmail.com>
	<CAJTo0LYfwrc+wteB+ez6gqZbXgM8dJO6PKrB+vf0S6+ANC7ggQ@mail.gmail.com>
Date: Mon, 14 Mar 2016 17:43:10 -0300
X-Gmail-Original-Message-ID: <CAP9ODKopJb0SusuYNubJz9oEMjJUDLyRBjNWDjeFD+tw0iYS3g@mail.gmail.com>
Message-ID: <CAP9ODKopJb0SusuYNubJz9oEMjJUDLyRBjNWDjeFD+tw0iYS3g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsdl: Only enable X11 support when the DISTRO supports it
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
X-List-Received-Date: Mon, 14 Mar 2016 20:43:11 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 14, 2016 at 5:41 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 14 March 2016 at 20:38, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>>
>> This makes nativesdk and native feature set to differ. I don't think
>> it is a good move
>
> It's exactly the right move - nativesdk and native are different.  You want
> nativesdk to match target, but native is unrelated to the distro you've
> built (to be honest I'd prefer it if the required distro features logic
> didn't execute on native recipes).

Well, with this it is harder to know if what works on native will work
on nativesdk. I don't like this behavior.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

