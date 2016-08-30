Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DDCD265CBF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 16:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7UG01FK003799; Tue, 30 Aug 2016 17:00:22 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0VNocBP__lzh; Tue, 30 Aug 2016 17:00:22 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7UG0G2p003831
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 30 Aug 2016 17:00:18 +0100
Message-ID: <1472572816.29583.31.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>,
	openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 17:00:16 +0100
In-Reply-To: <20160829115510.19560-1-git@andred.net>
References: <20160829110341.13100-1-git@andred.net>
	<20160829115510.19560-1-git@andred.net>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
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
X-List-Received-Date: Tue, 30 Aug 2016 16:00:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2016-08-29 at 12:55 +0100, Andr=C3=A9 Draszik wrote:
> An error crept into the previous series :-(, fixed now.

bitbake boost-native blew up in my local build with these applied :(

| 1472572721.0863695:     "g++"  -ftemplate-depth-128 -isystem/media/build1=
/poky/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -D_GLIBCXX_USE_=
CXX11_ABI=3D0 -O3 -finline-functions -Wno-inline -Wall -pthread -fPIC -m64 =
-fno-strict-aliasing -ftemplate-depth-1024 -fvisibility=3Dhidden -DBOOST_AL=
L_NO_LIB=3D1 -DBOOST_ATOMIC_DYN_LINK=3D1 -DBOOST_CHRONO_DYN_LINK=3D1 -DBOOS=
T_DATE_TIME_DYN_LINK=3D1 -DBOOST_FILESYSTEM_DYN_LINK=3D1 -DBOOST_LOG_BUILDI=
NG_THE_LIB=3D1 -DBOOST_LOG_DLL -DBOOST_LOG_USE_AVX2 -DBOOST_LOG_USE_NATIVE_=
SYSLOG -DBOOST_LOG_USE_SSSE3 -DBOOST_LOG_WITHOUT_EVENT_LOG -DBOOST_SPIRIT_U=
SE_PHOENIX_V3=3D1 -DBOOST_SYSTEM_DYN_LINK=3D1 -DBOOST_SYSTEM_NO_DEPRECATED =
-DBOOST_THREAD_BUILD_DLL=3D1 -DBOOST_THREAD_DONT_USE_CHRONO=3D1 -DBOOST_THR=
EAD_POSIX -DBOOST_THREAD_USE_DLL=3D1 -DDATE_TIME_INLINE -DNDEBUG -D_GNU_SOU=
RCE=3D1 -D_XOPEN_SOURCE=3D600 -D__STDC_CONSTANT_MACROS  -I"." -c -o "/media=
/build1/poky/build/tmp/work/x86_64-linux/boost-native/1.61.0-r0/boost_1_61_=
0/x86_64-linux/boost/bin.v2/libs/log/build/gcc-4.3.1/release/log-api-unix/t=
hreading-multi/text_file_backend.o" "libs/log/src/text_file_backend.cpp"
| 1472572721.0863695:
| 1472572721.0863695: In file included from ./boost/config/compiler/gcc.hpp=
:271:0,
| 1472572721.0863695:                  from ./boost/config.hpp:39,
| 1472572721.0863695:                  from ./boost/log/detail/config.hpp:3=
4,
| 1472572721.0863695:                  from libs/log/src/text_file_backend.=
cpp:16:
| 1472572721.0863695: /usr/include/x86_64-linux-gnu/bits/fenv.h:19:3: error=
: #error "Never use <bits/fenv.h> directly; include <fenv.h> instead."
| 1472572721.0863695:  # error "Never use <bits/fenv.h> directly; include <=
fenv.h> instead."
| 1472572721.0863695:    ^
| 1472572721.0863695: ...failed updating 68 targets...

and many similar errors.

Cheers,

Richard

