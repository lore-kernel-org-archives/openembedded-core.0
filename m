Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5C9976FFE8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 16:05:42 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i138so3791638wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 09:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=oMlXmH2WN9EAKWgk0dthagyGGLwGC2981xBS2I8Dc+Q=;
	b=R/feo2dcgcTlE48438ym6gtvWXRYPjIBzYk2dF52YIQq/kohHcE6EIh8lsr06goshd
	nkbAAOMrrR39L8Ql6WWVDpX5rx4K7FvOSbwTB4G4U+yyjVzCLkeh8qOSsKhsqovfEtg0
	+obs0zvL1EUvxG3Dc8gMB68dvsovP6xfgWFpQbaEptpror5aQaWRTVo+JRtx2kQ2h4kg
	m7hhBjNHZId29FvKOyZjCzGRq89INgajokASaYkY0ITLQTE4fDPsyEtJY4vQ5DJZ4xeT
	cUC2xf+Gs8znxohLoyXV9FVs/W16Fqaj+KxMmE0VSgVFi/IfbDPQe6kb7EB9URPcRSBb
	uong==
X-Gm-Message-State: AE9vXwPQoPE121XAQy8VxyQGpv0yGqyKh0QSyoYqafQzjlLVAOsQTeOGDQB2Wr9t82/Evw==
X-Received: by 10.194.89.228 with SMTP id br4mr3949756wjb.187.1472573143229;
	Tue, 30 Aug 2016 09:05:43 -0700 (PDT)
Received: from localhost ([185.46.212.59]) by smtp.gmail.com with ESMTPSA id
	q139sm19336852wmb.18.2016.08.30.09.05.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Aug 2016 09:05:42 -0700 (PDT)
Message-ID: <1472573140.8449.40.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 17:05:40 +0100
In-Reply-To: <1472572816.29583.31.camel@linuxfoundation.org>
References: <20160829110341.13100-1-git@andred.net>
	<20160829115510.19560-1-git@andred.net>
	<1472572816.29583.31.camel@linuxfoundation.org>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH v2 0/3] boost mips16e and soft-float fixes
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
X-List-Received-Date: Tue, 30 Aug 2016 16:05:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Di, 2016-08-30 at 17:00 +0100, Richard Purdie wrote:
> 1472572721.0863695:     "g++"  -ftemplate-depth-128
> > -isystem/media/build1/poky/build/tmp/sysroots/x86_64-linux/usr/include
> > -O2 -pipe -D_GLIBCXX_USE_CXX11_ABI=0 -O3 -finline-functions -Wno-inline
> > -Wall -pthread -fPIC -m64 -fno-strict-aliasing -ftemplate-depth-1024
> > -fvisibility=hidden -DBOOST_ALL_NO_LIB=1 -DBOOST_ATOMIC_DYN_LINK=1
> > -DBOOST_CHRONO_DYN_LINK=1 -DBOOST_DATE_TIME_DYN_LINK=1
> > -DBOOST_FILESYSTEM_DYN_LINK=1 -DBOOST_LOG_BUILDING_THE_LIB=1
> > -DBOOST_LOG_DLL -DBOOST_LOG_USE_AVX2 -DBOOST_LOG_USE_NATIVE_SYSLOG
> > -DBOOST_LOG_USE_SSSE3 -DBOOST_LOG_WITHOUT_EVENT_LOG
> > -DBOOST_SPIRIT_USE_PHOENIX_V3=1 -DBOOST_SYSTEM_DYN_LINK=1
> > -DBOOST_SYSTEM_NO_DEPRECATED -DBOOST_THREAD_BUILD_DLL=1
> > -DBOOST_THREAD_DONT_USE_CHRONO=1 -DBOOST_THREAD_POSIX
> > -DBOOST_THREAD_USE_DLL=1 -DDATE_TIME_INLINE -DNDEBUG -D_GNU_SOURCE=1
> > -D_XOPEN_SOURCE=600 -D__STDC_CONSTANT_MACROS  -I"." -c -o
> > "/media/build1/poky/build/tmp/work/x86_64-linux/boost-native/1.61.0-
> > r0/boost_1_61_0/x86_64-linux/boost/bin.v2/libs/log/build/gcc-
> > 4.3.1/release/log-api-unix/threading-multi/text_file_backend.o"
> > "libs/log/src/text_file_backend.cpp"
> > 1472572721.0863695:
> > 1472572721.0863695: In file included from
> > ./boost/config/compiler/gcc.hpp:271:0,
> > 1472572721.0863695:                  from ./boost/config.hpp:39,
> > 1472572721.0863695:                  from
> > ./boost/log/detail/config.hpp:34,
> > 1472572721.0863695:                  from
> > libs/log/src/text_file_backend.cpp:16:
> > 1472572721.0863695: /usr/include/x86_64-linux-gnu/bits/fenv.h:19:3:
> > error: #error "Never use <bits/fenv.h> directly; include <fenv.h>
> > instead."
> > 1472572721.0863695:  # error "Never use <bits/fenv.h> directly; include
> > <fenv.h> instead."
> > 1472572721.0863695:    ^
> > 1472572721.0863695: ...failed updating 68 targets...
> 
> and many similar errors.

I will send a version 3, taking in some comments from the boost bug tracker
as well.

Sorry for that!
Andre'


