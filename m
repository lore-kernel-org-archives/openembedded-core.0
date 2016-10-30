Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 954D471A51
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Oct 2016 17:38:32 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id 50so4283218uae.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Oct 2016 10:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=RLx/wSRvZ0Qnq4LRxhUv7Gr5HEvQfres6rCS377HJ4c=;
	b=gFyvBoR2KCQGz/9JIIgiwDRdIkwJNSJtnDdTaKnG+U3TcE4Mdqlmjt3KDYFK35v5Mb
	pTOBO2Lr9dhRkdhCKN8OMIT7ikMKbohX1rr5Z939YS/T0pFG15m52WeipAptgL3JORI6
	1jW/t/VjVLZyZ1yqC2GKHZHDy+dVokxaBMPPYcADnROuaYdHiAsrvT776y9Ojh8QKCNr
	m0DJWhTPv/gOAqgUdz2ojYSOmzpz4Iyyr/h/GEsSg/Izzb04hiy+X08WMJBnZU2l3mlV
	uGCdMMQcqO3oxq5Nx9au0HxSG0wkQIRWBt7Gk/ZFIt4dC9bhEXg1oZ+a0GXVuOwgiclt
	P0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=RLx/wSRvZ0Qnq4LRxhUv7Gr5HEvQfres6rCS377HJ4c=;
	b=Np07v1Jxz8DVEDqRbgcL5X5qAXDhHRyOe7Gz6CsroQY9UpcHTzu2ODQScA9l4v/CAk
	FQNLZwx6+UayEZq50C0kOR4LJt6k/k4TbKxcHXCZtnX3RWcjnZl7uYeHNOwdDkNMNmMW
	7vsJuhqKm+jq95CBfIGcx89p8nJFnfG+ZHc5QqCDjWc7dOtkxtbGKRx6Bf0LtNjYpipP
	KY3GpJEJrIAJmiehd7T2002oZgSEbTVvRCErzeQ0TShOvg1K84h+hBsG2IbEB/ie7Tsi
	lLlTIydiMkR2bnRGhMDBYHuh+wF0gtveCDspyvzdf2vKnzL2Y46JTIAF2nEvqQh6lesT
	SJBw==
X-Gm-Message-State: ABUngveRfntsEAr9tzyTw9xt6LFXoIS/xLsJzJEIJNyaOIFddWC4++De+GB6c/KY0ncMadWlJKQeJWNWzFgCtA==
X-Received: by 10.176.1.17 with SMTP id 17mr17727317uak.143.1477849113510;
	Sun, 30 Oct 2016 10:38:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Sun, 30 Oct 2016 10:38:03 -0700 (PDT)
In-Reply-To: <CALbNGRSvqDHCA-3VPt379-Np29hZo-0ONbj=ZFd+Eew1K=4zFw@mail.gmail.com>
References: <20161029084707.29652-1-raj.khem@gmail.com>
	<CALbNGRSvqDHCA-3VPt379-Np29hZo-0ONbj=ZFd+Eew1K=4zFw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 30 Oct 2016 10:38:03 -0700
Message-ID: <CAMKF1sr=VwcPUpdV9BTfVKuq_sD0Btnm6zkW3xFWNh=e_T=ZHw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake.bbclass: Exclude native sysroot from CMAKE_FIND_ROOT_PATH
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
X-List-Received-Date: Sun, 30 Oct 2016 17:38:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 30, 2016 at 6:34 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Sat, Oct 29, 2016 at 10:47 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> This has been cause of issue where we were getting both usr/include
>> dirs ( from target as well as native sysroot) added to compiler
>> flags.
>>
>> CXX_INCLUDES in final flags.cmake would include
>> -I<target-sysroot>/usr/include -I<native-sysroot>/usr/include
>> most of the time it would work since headers are mostly
>> common but netflix package failed to compile since one of
>> the headers was including curl headers which it could not
>> find in target sysroot and it went to next include path
>> and found it in native sysroot which is not what we want
>> when doing cross compile.
>>
>> As per https://cmake.org/Wiki/CMake_Cross_Compiling
>> never search for programs in target sysroot but search
>> for packages,libs,includes only.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/classes/cmake.bbclass | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
>> index 3e762de..3e8df37 100644
>> --- a/meta/classes/cmake.bbclass
>> +++ b/meta/classes/cmake.bbclass
>> @@ -25,6 +25,7 @@ OECMAKE_PERLNATIVE_DIR ??=3D ""
>>  OECMAKE_EXTRA_ROOT_PATH ?=3D ""
>>
>>  OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM =3D "ONLY"
>> +OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-target =3D "NEVER"
> ^ Split this into a second patch please you are changing two more or
> less unrelated settings in one patch.

These changes are related and should stay together in same patch
otherwise it will break.

>>  OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-native =3D "BOTH"
>>
>>  EXTRA_OECMAKE_append =3D " ${PACKAGECONFIG_CONFARGS}"
>> @@ -60,7 +61,7 @@ set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}" =
CACHE STRING "LDFLAGS" )
>>
>>  # only search in the paths provided so cmake doesnt pick
>>  # up libraries and tools from the native build machine
>> -set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${C=
ROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_T=
OOLCHAIN})
>> +set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${CROSS_DIR} ${OECMAKE_PE=
RLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN})
> ^ Are you sure this doesn't break native builds? I am a bit scared: In
> meta-qt5-extra I have lot's of native builds for build-helpers. KDE
> guys seem to prefer this over shell scripts...

It hasnt broken anything for my world builds thus far. I dont use
meta-qt5-extras though. So testing help is welcome.

