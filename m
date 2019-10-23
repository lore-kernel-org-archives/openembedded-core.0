Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 294E47F81E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 19:31:16 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r1so13564371wrs.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 12:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=iW4R+9mv0KP/Us6SdIADkqT0rQy7cU4smHj8g3Lxu+M=;
	b=dn/kuVrHd9OZw/td7WYdyVmvgObZtOXJZ1X4dYe3acy5B/iYXEwpkv5aSFYIm8fXCe
	Ha2MIYgMsbWobFdEoaOy8YD/Q5EuIBwdI+zik7d8JfzUVsyR133F8CqEK98FYfYUWuhc
	KIpS0znAOBPd1SERKCiYda8NzR8G9R6wT2p8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=iW4R+9mv0KP/Us6SdIADkqT0rQy7cU4smHj8g3Lxu+M=;
	b=BdPbObzdQwa9GB0+iLkL32w5KGgHTuOPQv6mHy27xCaMk/1OMhM6IgwqKYlOTVsMtE
	YbWuU0Io1JFPFbbr0CCXuB3bSMSk9IEYJdPRCrkrYa2OM2TAhxj/HunNab04HAyJvWez
	HRc+c/0/qPnWICPclEdvV6reRIza5NnSHziwi3qOwxDzzVSjlbTyf9gn2Tyngga87tzp
	C9is4+mmA4jyIYCRaOT/v/1Gq+ynLi4dgBWTV9qkNFGYVuK/9aaceeX41jQzSNrR01Rx
	O44V14PY2uFnIbyxTveYXkluqeCW2uXw1jMRf1lY8DmsVr4EaF3LBoT1kzOZPxYIWF29
	ZUug==
X-Gm-Message-State: APjAAAXG0oxNdULiCSrozyE7KvlXakaCVJTQ2O0LqoUy7vbqQ69sfVzL
	YnrAVkw1hluRzVc9pF7W0RAtJw==
X-Google-Smtp-Source: APXvYqx/K/GcXP/P5xrwUBHZJ2CPGaQa5pk94s2+j/TSXqLWShJrUwrTGNjywaCyQsuH8BbHgYssoQ==
X-Received: by 2002:adf:e50b:: with SMTP id j11mr345663wrm.340.1571859076827; 
	Wed, 23 Oct 2019 12:31:16 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 1sm5265917wrr.16.2019.10.23.12.31.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 23 Oct 2019 12:31:15 -0700 (PDT)
Message-ID: <502fbe273fcf7a5c092e4bc93ce6e58dc8454452.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 23 Oct 2019 20:31:14 +0100
In-Reply-To: <40c36a7b-6e95-efc8-4ab0-6b9e19924e54@intel.com>
References: <CAMKF1sq83g8Zu3FmqWtdpJAePA6XsGnWZ5Z6HN9A6YvT8Socjw@mail.gmail.com>
	<40c36a7b-6e95-efc8-4ab0-6b9e19924e54@intel.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: new meta-oe failures from master-next
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
X-List-Received-Date: Wed, 23 Oct 2019 19:31:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-10-23 at 16:29 +0100, Ross Burton wrote:
> On 23/10/2019 14:03, Khem Raj wrote:
> > Hi Richard
> > 
> > New master-next I see these fails
> > 
> > https://errors.yoctoproject.org/Errors/Build/91645/
> > 
> > First two are important one's we already know why
> > ti-display-sharing-fw fails to fetch
> 
> ERROR: QA Issue: libiio: Files/directories were installed but not 
> shipped in any package:
>    /usr/lib/python2.7
>    /usr/lib/python2.7/site-packages
>    /usr/lib/python2.7/site-packages/libiio-0.18-py2.7.egg-info
>    /usr/lib/python2.7/site-packages/iio.pyc
>    /usr/lib/python2.7/site-packages/iio.py
> 
> That may have been triggered by some change in oe-core but that's 
> definitely an issue with libiio.

Its from this cmake change:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=dbba06d9153ae588c9496b40e5db18b3602bfad1


> 
> WARNING: 
> TOPDIR/build/tmp/work/mips32r2-yoe-linux/python3-astor/0.7.1-
> r0/temp/run.do_configure.7679:1 
> exit 1 from 'NO_FETCH_BUILD=1 
> TOPDIR/build/tmp/work/mips32r2-yoe-linux/python3-astor/0.7.1-
> r0/recipe-sysroot-native/usr/bin/python3-native/python3 
> setup.py clean'
> ERROR: Execution of 
> 'TOPDIR/build/tmp/work/mips32r2-yoe-linux/python3-astor/0.7.1-
> r0/temp/run.do_configure.7679' 
> failed with exit code 1:
> Traceback (most recent call last):
>    File "setup.py", line 17, in <module>
>      setup(**config['options'])
>    File 
> "TOPDIR/build/tmp/work/mips32r2-yoe-linux/python3-astor/0.7.1-
> r0/recipe-sysroot-native/usr/lib/python3.7/site-
> packages/setuptools/__init__.py", 
> line 145, in setup
>      return distutils.core.setup(**attrs)
> 
> Looks like whatever astor is doing with setuptools doesn't agree
> with the upgrade to 41.4.0?

Yes, I can confirm that reverting 
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=b9703df2853e72b974a63ef1146f09a6c197990d 
locally does make it build again.

Cheers,

Richard






