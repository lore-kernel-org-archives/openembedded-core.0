Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id C391B71A69
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Nov 2016 16:39:36 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id i88so11208551pfk.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Nov 2016 09:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=USJRcEhi1xUdnh+ebCDHilkEZ/q/D04X51g7cCoReUo=;
	b=GLsqoB0Ps+pjG9VnGCg4tlTPQHgZTd18P1jOPt/XHAi14C+SygV9NDdQhxDnTghhB3
	Jos5fJFNFHW0uslMDL5gcOF7MBp+5MfiabZLAFhYF8IzPjx6CKs7aDSYN04WOiWBMn57
	KYYWdQ1JVdGbuQ+n/VHKJUc7w++5yDLhUkTtUd1Ecdx8yhJ1EqkMmTmxi2XsyLjlWmxY
	1YLq33wEqGX5afQwtT90EzH5SehGvDlBZsnRBQiO3xzYM+JuLPKkwISG8s1Yc7dtYVF0
	hxAYYoNHuk7xZBMJ191/pmKvQo7r468KLV26NY4vFiz18JnTvK0QKgR8bcQzeULcQ7LJ
	lSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=USJRcEhi1xUdnh+ebCDHilkEZ/q/D04X51g7cCoReUo=;
	b=JQ5zB4FLffJtYFDeipS+oPPAfyz9AgJO4AEoxhmO/PEQMVFMKWPzA3b5vr93XKo7vN
	co8vuUshPvA77FTuGzsbo0iuWXuxxO4VLe+1HoQVPAl/J2yQvKEq1S0Db9dVNpz/1rdM
	1jZdiuAeKO0Tntsjn95DKkvaF7ld32PHumLTbwjNLh0i5a64yV/sdhuGzRsCJvawErHU
	UERyF0/qsckebPQF6EvitQ5TQmZI7ukq41T20g66HBfY9F1L21IfPBRTQMW0aCGfY8gJ
	UvN/93eIpfwcBXryvYLSbLtWqtwO1B1iTsjLFFHa9qb7FHcO4HZDGTTMODMwSrJhLpab
	qZ5A==
X-Gm-Message-State: ABUngvcNEIfLd9degooHjiQjL5Dh9DtoCP4IM/PCenTmS8aItm+Bt94b7Hzg+LF0Wfil7A==
X-Received: by 10.98.217.153 with SMTP id b25mr37684839pfl.77.1478363978294;
	Sat, 05 Nov 2016 09:39:38 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:553e:dac1:1449:47d2])
	by smtp.gmail.com with ESMTPSA id
	u127sm28711090pfu.21.2016.11.05.09.39.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 05 Nov 2016 09:39:37 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>
References: <20161029084707.29652-1-raj.khem@gmail.com>
	<CAJ86T=Xw0qavJpud1YSSU94dQgYp=3tueYq59Z-jFatbhTjM0Q@mail.gmail.com>
	<CAMKF1srDpKb1-+h4Y3X6nttVSCpVTAitt_w1iUPpqPpnfq0Jag@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <38e773b5-7894-1c03-1b50-d0e7eca295c9@gmail.com>
Date: Sat, 5 Nov 2016 09:39:36 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srDpKb1-+h4Y3X6nttVSCpVTAitt_w1iUPpqPpnfq0Jag@mail.gmail.com>
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
X-List-Received-Date: Sat, 05 Nov 2016 16:39:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 11/1/16 11:33 AM, Khem Raj wrote:
> On Nov 1, 2016 11:28 AM, "Andre McCurdy" <armccurdy@gmail.com
> <mailto:armccurdy@gmail.com>> wrote:
>>
>> On Sat, Oct 29, 2016 at 1:47 AM, Khem Raj <raj.khem@gmail.com
> <mailto:raj.khem@gmail.com>> wrote:
>> > This has been cause of issue where we were getting both usr/include
>> > dirs ( from target as well as native sysroot) added to compiler
>> > flags.
>> >
>> > CXX_INCLUDES in final flags.cmake would include
>> > -I<target-sysroot>/usr/include -I<native-sysroot>/usr/include
>> > most of the time it would work since headers are mostly
>> > common but netflix package failed to compile since one of
>> > the headers was including curl headers which it could not
>> > find in target sysroot and it went to next include path
>> > and found it in native sysroot which is not what we want
>> > when doing cross compile.
>> >
>> > As per https://cmake.org/Wiki/CMake_Cross_Compiling
>> > never search for programs in target sysroot but search
>> > for packages,libs,includes only.
>> >
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>> > ---
>> >  meta/classes/cmake.bbclass | 3 ++-
>> >  1 file changed, 2 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
>> > index 3e762de..3e8df37 100644
>> > --- a/meta/classes/cmake.bbclass
>> > +++ b/meta/classes/cmake.bbclass
>> > @@ -25,6 +25,7 @@ OECMAKE_PERLNATIVE_DIR ??= ""
>> >  OECMAKE_EXTRA_ROOT_PATH ?= ""
>> >
>> >  OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "ONLY"
>> > +OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-target = "NEVER"
>>
>> Using the _class-target over-ride looks odd. Perhaps making "NEVER"
>> the default and adding over-rides for the classes which need "ONLY"
>> (if there are any?) would make this clearer?
>>
> 
> Yeah I plan to rework this a bit in that direction

thinking a bit more about this problem. It doesn't seem to be solvable
with the current limitations that we have for cross compiling with cmake
in OE environment.

What we want is

1. When compiling target packages that we should be able to use binaries and
programs from native sysroot but not libraries, packages and includes

This is not possible since for this we have to add both native and target
sysroots to CMAKE_FIND_ROOT_PATH, but there is no fine grained selection
method for expressive the requirement 1 above. We only have options
ONLY - Look for files only in paths specified in CMAKE_FIND_ROOT_PATH
BOTH - Along with above also look into build hosts root dir
NEVER - Only look for files in build hosts root dir

so we can not set CMAKE_FIND_ROOT_PATH dynamically according to MODE variables
and hence the problem persists.

cmake does not cater to OE usecase where we have native sysroot along with
host to complement native packages. It only assumes there is build host and
the target sysroot.

>> >  OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-native = "BOTH"
>> >
>> >  EXTRA_OECMAKE_append = " ${PACKAGECONFIG_CONFARGS}"
>> > @@ -60,7 +61,7 @@ set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}"
> CACHE STRING "LDFLAGS" )
>> >
>> >  # only search in the paths provided so cmake doesnt pick
>> >  # up libraries and tools from the native build machine
>> > -set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE}
> ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH}
> ${EXTERNAL_TOOLCHAIN})
>> > +set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${CROSS_DIR}
> ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN})
>> >  set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
>> >  set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM
> ${OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM} )
>> >  set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
>> > --
>> > 2.10.1
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
> <mailto:Openembedded-core@lists.openembedded.org>
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

