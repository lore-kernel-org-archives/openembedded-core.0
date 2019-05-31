Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 641CC7E50D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 08:01:33 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id u16so45310wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 01:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=p+7KX/BROrubWoEz+wjoR8Df/364rtAIlXssxGpxFRU=;
	b=D7YNnIvPuAKRiamgiF7lXiuCUioCjh4+YvyXPfve6DB25WEpAANs68cJnOu4tJwJGz
	vcyysdFiwFMQJenZLgegnP6lGYvA30qMmm4zq1KFPtZs21dJTz5wIDWD8gVaydFxswor
	pkSJsoNnRvQWB4CzbWjLsKSu7VhL/qcLSjxiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=p+7KX/BROrubWoEz+wjoR8Df/364rtAIlXssxGpxFRU=;
	b=YJ9NdzzMUitSj3qIQOOEXL1K19m6vce7YRNWZjFgq+09QHYVdUN28Dscb/I2j1fg88
	pvG8JeMqiTlF+LbMZVA5SAqyafmWsSzrW3JTOw1nhEAuAtssaVkb0H3rIm31nngY3k3P
	eOAGPxwzntCg0ZUpE/IvWx+zbX1uzR2Ros8vO75rE3pjt47/FeVi8YL7PAfo+o4S5pvw
	K5hlk2BaZUVV2Q/47buqNgOMk8XY5XyHZX7OAgsbfVOq19OUgwiyvunNEn7tz21aLPWI
	FxCYo6IrUO4DEB6BCmvxXskjDkkNzN2StoUsC2W3WxM8XkZuVZK2LpU3Y6Kqp1nQ34Nm
	lTWQ==
X-Gm-Message-State: APjAAAVwGvomw9j+LrQe8zDMZxROLDQ6KsEpRVVQTwY/A4NIZ5cq5sHs
	AdEWwkkhnrLuN1WWGTl8Zq8omQ==
X-Google-Smtp-Source: APXvYqwuaLxVeivqoHOGJPNKE8CSVYXnkeXZ2ZnZalPeXutq86rE9JSNAL5H5UgOyjzxVe6KAJCR8g==
X-Received: by 2002:a1c:f205:: with SMTP id s5mr4944440wmc.14.1559289694100;
	Fri, 31 May 2019 01:01:34 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	197sm5233772wma.36.2019.05.31.01.01.32
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 31 May 2019 01:01:33 -0700 (PDT)
Message-ID: <18e169f17346d84787ec550696cf0cc19ea83256.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: bruce.ashfield@gmail.com
Date: Fri, 31 May 2019 09:01:31 +0100
In-Reply-To: <cover.1559220004.git.bruce.ashfield@gmail.com>
References: <cover.1559220004.git.bruce.ashfield@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/9] linux-yocto: consolidated pull request
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
X-List-Received-Date: Fri, 31 May 2019 08:01:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Bruce,

On Thu, 2019-05-30 at 08:44 -0400, bruce.ashfield@gmail.com wrote:
> Here's the latest round of -stable and -dev bumps for linux-yocto.
> Looking at
> the timing, v5.2 could be the new reference kernel introduced in the
> next
> release, so I gave it some extra test cycles while doing this update.
> 
> Also note that I updated 4.9, 4.4 and other non-master kernels with
> -stable
> updates. So if you are using linux-yocto as a reference, you can
> manually bump
> your SRCREVs to pickup those chnages.
> 
> The only non-uprev in this series is the one kernel packaging tweak
> to grab
> a new artifact introduced with the 5.2 kernel. It is packaged along
> side the
> other module outputs, and won't add signficant size or time to
> anyone's feeds.
> (and it is safe for older kernels as well, I tested just to be sure).

This fails in testing with one failure on qemuarm:

Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/qemuarm/build/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-worker/qemuarm/build/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-worker/qemuarm/build/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-worker/qemuarm/build/meta/lib/oeqa/runtime/cases/stap.py", line 37, in test_stap
    self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
AssertionError: 1 != 0 : stap --disable-cache -DSTP_NO_VERREL_CHECK /tmp/hello.stp
WARNING: Kernel function symbol table missing [man warning::symbols]
WARNING: "__aeabi_unwind_cpp_pr1" [/tmp/stapEqi01F/stap_21486.ko] undefined!
ERROR: Couldn't insert module '/tmp/stapEqi01F/stap_21486.ko': Unknown symbol in module
WARNING: /usr/bin/staprun exited with status: 1
Pass 5: run failed.  [man error::pass5]

RESULTS - stap.StapTest.test_stap: FAILED (336.07s)

https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/648/steps/7/logs/step1c

Cheers,

Richard


