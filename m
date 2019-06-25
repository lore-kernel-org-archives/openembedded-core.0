Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5CCE87DE36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 08:03:13 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id f17so1870737wme.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 01:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=VeE5FzQ7Ae72wWZBlbrFOeN+RsfCb73oz0w3F9GqSro=;
	b=cYcw9+yYllIx9S3133WGevqcv5ED/e+hXFMXMq0LndOaDM/fN1KSHV5EDTnnjpQeF4
	G2TihdUEIMN3hkc77khjn5VLEgUhzbUWLMQWb6KvT6c1DPL0kHb0XYevErJoCHMRP+Je
	sjCD6ITcmQyeE/SLdfe0cfPRHyhCfbqZJPh/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=VeE5FzQ7Ae72wWZBlbrFOeN+RsfCb73oz0w3F9GqSro=;
	b=s6R4LV8uSFCLGeEGObvhdZgiydTu3u2X/zgChGjkUqPe9F5Dbm2DCAqOiP2rhAZfKh
	CyZdwnc8i6yBZ0EP/Af0qzjuLfBTohStVqox7VlxCz/hdrtCDA5BLzq4+7HscUP1EwTr
	ZUFbIt2bKII0yql9FDo1s6/07P+1O/+lBPEeYl0fKMKLCQPIbC7i2t47qj1hE+T3vkeM
	h88/alezTQuUsVSgwKjpM1SLtFwH5pWMpnkYlDuK7cv2NCG1Z09kja+cbcnuIyCbqx4a
	YXNvBAFCGwtpO3jJ9+2uQoIlw+E8y9fGJ8QQMynFmXHUPPfaXW7HIA13PqyrJzlI0vRg
	ZZ/A==
X-Gm-Message-State: APjAAAVuUyifzNVM2tkw3tObYBAlYQuQXAua9tv8a2l/kFOqFtbXN2tl
	8UMsRI9dj94HUI1z0lBIVY0G7g==
X-Google-Smtp-Source: APXvYqy9md31sK2RLQv5q02XCREudN9cqOvKM5f+rMbcxz9g9R4tbIyD6iZoyhuSv/1Rjn3SjzCC1g==
X-Received: by 2002:a1c:ab06:: with SMTP id u6mr18380202wme.125.1561449794064; 
	Tue, 25 Jun 2019 01:03:14 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g10sm11447135wrw.60.2019.06.25.01.03.12
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 25 Jun 2019 01:03:13 -0700 (PDT)
Message-ID: <24b339d3b414d7f32a9525e2480d2c7c4ffa0aa3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Nikolai Merinov <n.merinov@inango-systems.com>
Date: Tue, 25 Jun 2019 09:03:11 +0100
In-Reply-To: <1341931304.2173628.1561371858860.JavaMail.zimbra@inango-systems.com>
References: <20190514150416.10902-1-n.merinov@inango-systems.com>
	<75cc94f6-8e4c-68ff-3c65-a2b8f98e8842@gmail.com>
	<1186752783.2036656.1561040167582.JavaMail.zimbra@inango-systems.com>
	<1341931304.2173628.1561371858860.JavaMail.zimbra@inango-systems.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3] cmake.bbclass: pass mandatory compiler flags through CMAKE_<LANG>_COMPILER_ARG1
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
X-List-Received-Date: Tue, 25 Jun 2019 08:03:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-06-24 at 13:24 +0300, Nikolai Merinov via Openembedded-
core wrote:
> Patch updated with "Signed-off-by" field as required by automatic
> checks.
> 
> ----- Original Message -----
> From: "openembedded-core" <openembedded-core@lists.openembedded.org>
> To: "Khem Raj" <raj.khem@gmail.com>
> Cc: "openembedded-core" <openembedded-core@lists.openembedded.org>
> Sent: Thursday, June 20, 2019 7:16:07 PM
> Subject: [OE-core] [PATCHv2] cmake.bbclass: pass mandatory compiler
> flags through CMAKE_<LANG>_COMPILER_ARG1
> 
> Hi,
> 
> Updated patch for the current "master" branch is attached.
> 
> > have you also tried building SDK and see if these changes are
> > reflected in SDK as well ?
> 
> I checked that the changes reflected in the Extensible SDK for the
> "core-image-sato" image of the poky.
> 
> Regards,
> Nikolai
> 
> ----- Original Message -----
> From: "Khem Raj" <raj.khem@gmail.com>
> To: "n merinov" <n.merinov@inango-systems.com>, "openembedded-core" <
> openembedded-core@lists.openembedded.org>
> Sent: Tuesday, May 21, 2019 1:41:46 AM
> Subject: Re: [OE-core] [PATCH] cmake.bbclass: pass mandatory compiler
> flags through CMAKE_<LANG>_COMPILER_ARG1
> 
> On 5/14/19 8:04 AM, Nikolai Merinov wrote:
> > The CMake takes mandatory compiler arguments from the following
> > variables:
> > - CMAKE_SYSROOT -- path to sysroot that should be passed to
> > compiler.
> > - CMAKE_<LANG>_COMPILER_TARGET -- target architecture, used for
> > compilers
> >    that supports several targets through command line options.
> >    e.g. "clang --target ${CMAKE_C_COMPILER_TARGET}".
> > - CMAKE_<LANG>_COMPILER_EXTERNAL_TOOLCHAIN -- path to external
> > toolchain,
> >    used for compilers that support build with external toolchain.
> >    e.g. "clang --gcc-toolchain
> > ${CMAKE_C_COMPILER_EXTERNAL_TOOLCHAIN}".
> > - CMAKE_<LANG>_COMPILER_ARG1 -- other mandatory arguments to a
> > compiler
> >    command.
> > 
> > CMAKE_<LANG>_COMPILER_ARG1 is the most suitable variable to pass
> > mandatory
> > arguments, that belongs to CC variable with other build systems, to
> > a
> > compiler.
> > 
> > Additionally usage of CMAKE_<LANG>_COMPILER_ARG1 instead of
> > CMAKE_<LANG>_FLAGS reduce the risk that a variable can be overrided
> > by
> > CMakeLists.txt files.
> 
I'm afraid this caused a number of build failures and selftest issues:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/236

(most of the selftest failures there for example are from this, as is 
https://autobuilder.yoctoproject.org/typhoon/#/builders/69/builds/746/steps/7/logs/step7b
)

Cheers,

Richard


