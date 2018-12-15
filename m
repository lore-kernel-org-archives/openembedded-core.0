Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 775C46BF40
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Dec 2018 10:51:35 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id a62so7919573wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Dec 2018 02:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=TLAJJExDpES/Opt0naMTI6U4h+hpleUCNrtJE6IJ8fg=;
	b=ThMsN+8/2eRfFxQpf3TSb7H8iNRJtj7jlz5mE085g0QKf/GDyl/G9nrLG7hiINFyIY
	Vtz4urcVpq/cNhlWc3rmzUJHgcloMi0q+Ep82LvQuQDsFnnX9g6lR7UcLDPUA6GKq/L6
	naKW3Bs5J8BWPFz53nv6pLF95fkmwSOQXZw+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=TLAJJExDpES/Opt0naMTI6U4h+hpleUCNrtJE6IJ8fg=;
	b=g81G5ccApbEeTinjHwbkrogUQ4iYLV50mWTYd36O0Ih1iu7iFc+8MXXZRjsIf8Wzlw
	LvksqvgdOygTpcUPCT9jXhPHGu9OmWO7FVMSqL1Ph+fOQsUAorYus2MIUJy1z0LoJcMj
	EbY4gzp02QO4f6QUaADs7IlJP4BL3q7Oa+3oYS8mI8kV4tnc7Hq3TXq1WpIpgOec3fQZ
	ct3siASJiiLKeA6/tmOcoWS/0APacil1ajenL72xczyRD1lqxcbYT7ikN4xLpYF75i3I
	KVM67GQmPcTYhxMeXyitwnmZx18J6kESyCDS4zKn5hv6JsinlSFczJG/rkwfMgmGP9Kx
	SeoA==
X-Gm-Message-State: AA+aEWb/2dA22BqALWA/inSQRHI2km9wEDYakh9OJ3UfcMOk586UUbom
	kNbRz0jB9vZJD3RwX11Xa28AlQ==
X-Google-Smtp-Source: AFSGD/V7QCdHdrva65RC9CWgzmkd1azcSjOMd4e/boTkn7uWL2qhBWKloNs9yqFORY60KXGmklk91Q==
X-Received: by 2002:a1c:1d4f:: with SMTP id d76mr5806063wmd.98.1544871095990; 
	Sat, 15 Dec 2018 02:51:35 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id m4sm28307767wmi.3.2018.12.15.02.51.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 15 Dec 2018 02:51:35 -0800 (PST)
Message-ID: <50b88771577229c99a2c9e26b6224a5f038e7bab.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Jason Andryuk <jandryuk@gmail.com>
Date: Sat, 15 Dec 2018 10:51:33 +0000
In-Reply-To: <CAKf6xptMbAqnZ34ONNXLzQMjFoDjePH8dz3bXmiTMvoBMu4wsg@mail.gmail.com>
References: <CAKf6xputiV+k9m9p1dyhZG1d0wMQoWG5tCiZjpsVVu+bXp1X6A@mail.gmail.com>
	<08a89c71b2e3e0f4380325985541c55df00b94da.camel@linuxfoundation.org>
	<CAKf6xptMbAqnZ34ONNXLzQMjFoDjePH8dz3bXmiTMvoBMu4wsg@mail.gmail.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Mis-generation of shell script (run.do_install)?
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
X-List-Received-Date: Sat, 15 Dec 2018 10:51:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-12-14 at 14:30 -0500, Jason Andryuk wrote:
> I wasn't sure how to tie into the pysh stuff, but that got me poking
> around in bitbake/lib/bb/codeparser.py .  Adding debug messages to
> parse_shell(), I see that do_install is found in the CodeParserCache,
> bb_codeparser.dat, but the returned `execs` do not include
> autotools_do_install.  Strangely, it includes a path to python -
> ...core2-32-oe-linux/python-async/0.6.2-r0/recipe-sysroot-
> native/usr/bin/python-native/python.
> It looks like `execs` could be for `distutils_do_install`.  And
> again,
> strangely, python-async is not in my tmp-glibc.  It must have been
> built at some point which left the entry in bb_codeparser.dat.
> 
> I built python-async, but its distutils_do_install hash value does
> not
> match the one in the cache.
> 
> Moving cache/bb_codeparser.dat out of the way, bitbake complains:
> ERROR: When reparsing
> /home/build/openxt/build/repos/openembedded-core/meta/recipes-
> devtools/binutils/binutils_2.28.bb.do_install,
> the basehash value changed from 80812e0772cf901b51790c205564070d to
> 493152cd3740c5420d0bf7a5d09df001. The metadata is not deterministic
> and this needs to be fixed.
> 
> `cleanall` does not clear out the message, but the package builds.

Its a little hard to make sense of this. If you move the cache out the
way it should simply get regenerated. It is long lived so things from
old builds in there is expected.

Were you able to isolate this into a smaller test case someone else
could reproduce?

Cheers,

Richard


