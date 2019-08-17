Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2F55D7CE27
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 18:49:53 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id c34so12580261otb.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 11:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=np89FxdJBx2eiRewQpQ0P7FOKF/trIfGVyTX2i/BQAc=;
	b=bsO9epzso1xs7v7+Ku1n4/5j2CuKwRPaniOGZVN0XZyksrRob/FAxVJV8JMSnGNq3N
	jRjoFYxuVbNqBbWfd+t29ZUezhmqAKMVDp42WbZQgtXBv1aMbvDV+EL9jdXE+RrOmJJf
	ZvtiWYF+1+k2u7cvhMkbgjpXPUJ0cWP/rq0S+fbjR6Aot0wiUtBUHOlIYQiVNt/tofro
	War4lrN77Zl9c6ljj1PD0XT6ixVRfsoBmevAbovkbeyH+z7SQjaomdZdhOpkLk8cHNgv
	oCCPyRJmooP27XrcAsUrrAevjyETAhxT3DWpuy5/qsCPpKje8aJwI2v6paMvpK+ObuzY
	yUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=np89FxdJBx2eiRewQpQ0P7FOKF/trIfGVyTX2i/BQAc=;
	b=Rlv8wXG9LDQjFCEP+HT9e/OXWmDI2D0hp+sRCwtlXXmMMf5HYydXOlWBn3iX+KpQxx
	34aW7OdvibjptFBwi9isvl15P7oRpAt2aUTFHZrWO5J54Bv/S8HusD+u6bv5EtnNZJEU
	kHCve5POwCqqsednyrp0mZZX5OC1dW3GweYtMdITX4iWDWlWi1HZr+nJVt1xkDpVFKah
	LqXxvIo76QIsRp0iGYkEPv2EfhO7+t73l3G0jFJhAm6PEBb0YLHJlGiC0uY26n63KMC4
	MmFmJ4rOq9qRm//8e8ndNM4CvXMdSajXcUNhspj1s79M7fnEqpW8eutNJPS1hjq3qlB2
	VShw==
X-Gm-Message-State: APjAAAX8VPeivUsZGvJrdDlssXmIG/V0pdY/vqfdxTKUMBHAbLm1M6nm
	HLGYDz40Tc2dt6B7F7UptPgRFb9lITp8/Q==
X-Google-Smtp-Source: APXvYqww4x9Vsh0x00+fHtdI0QrdPig1JraPlsFDukzwJfs2W/fef4JdQTnwJ7AJiqXzJ59Er5iOkQ==
X-Received: by 2002:a05:6830:200e:: with SMTP id
	e14mr11497800otp.245.1566067794587; 
	Sat, 17 Aug 2019 11:49:54 -0700 (PDT)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com.
	[209.85.167.178]) by smtp.gmail.com with ESMTPSA id
	n24sm2580990oie.19.2019.08.17.11.49.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 17 Aug 2019 11:49:53 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi1-f178.google.com with SMTP id a127so7134830oii.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 11:49:53 -0700 (PDT)
X-Received: by 2002:aca:75c2:: with SMTP id q185mr4979326oic.134.1566067792950;
	Sat, 17 Aug 2019 11:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190817153954.15805-1-otavio@ossystems.com.br>
	<CANNYZj-RD8zN7o7mX61MuATaO_7NSHY8DXAUR6TuU50M85r7Ag@mail.gmail.com>
In-Reply-To: <CANNYZj-RD8zN7o7mX61MuATaO_7NSHY8DXAUR6TuU50M85r7Ag@mail.gmail.com>
Date: Sat, 17 Aug 2019 15:49:39 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoaJt-TH7kg7oiqWTfB6r4gqhZdZezJCW69Zj_y=NpLtQ@mail.gmail.com>
Message-ID: <CAP9ODKoaJt-TH7kg7oiqWTfB6r4gqhZdZezJCW69Zj_y=NpLtQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] mesa: Upgrade 19.1.1 -> 19.1.4
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
X-List-Received-Date: Sat, 17 Aug 2019 18:49:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 17, 2019 at 1:01 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Sat, 17 Aug 2019 at 17:40, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>
>> +Subject: [PATCH] Revert "meson: Improve detection of Python when using Meson
>> + >=0.50."
>> +Organization: O.S. Systems Software LTDA.
>> +
>> +This reverts commit cb3072488cd327155206e92d1ad8eb72a23ab04e.
>> +
>> +Upstream-Status: Inappropriate [embedded specific]
>> +
>> +-if meson.version().version_compare('>=0.50')
>> +-  prog_python = import('python').find_installation('python3')
>> +-else
>> +-  prog_python = import('python3').find_python()
>> +-endif
>> ++prog_python = import('python3').find_python()
>> + has_mako = run_command(
>> +   prog_python, '-c',
>> +   '''
>
> If this is broken in meson, shouldn't it be fixed at the source (e.g. meson), rather than patched after the fact back to the 'older pre-0.50 way' in every component that trips over it?

I tried but couldn't figure out how to fix it and as I am not a meson
expect, I preferred to rather revert it and succeed with the upgrade.

Can you send a patch fixing it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

