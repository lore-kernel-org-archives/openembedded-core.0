Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id CF8E4600EA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2016 00:19:33 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id l126so11864130vkh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2016 16:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=LQ3nQfac0BsBGGFyVXTzoE/ka8FUEmsVhiS07BXU8UM=;
	b=00AnLgOuZRysJ1mL6KqzY1kNchjO1eHbkYEjQEqxtkZPUXaVCffRmKBYt3U2z6PSma
	YkchuFj5ni7FEaFua4Vmm4GDb9syEMfybi4oZTqSDxDqSBKCcVr+jlaHRl1qAeG/ZpmN
	e5IV4HqsDA2JWZBLX57XbTBcC2sHTvnBD9mt8vv0bsELdU36E5VbpumrK1peWpW3fgF7
	YHh2XEuQp09fGgCBN4sNXbCQY2+TAL5w7P5Y5/FNT0d1P6nbiz0cbgLN6xdlfMYil5Im
	km+IyPcLHoISXz04NHMYkQiMH2TgB+PCObn7/oti1iPNnvWMzpx6lnH90kv3TBU3eI7w
	NiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=LQ3nQfac0BsBGGFyVXTzoE/ka8FUEmsVhiS07BXU8UM=;
	b=gWHgPfU4Gk+LfkheYThCYMrVVJW68ZVjvKGHvDQ0OAfGj+de98s+bc1pBe3kaf2yda
	IjuFUfSqLTLMTEAb8GUuY/+VIK3H+k2qgplEZ53m43xG2MXmcNXvGU2GiI3qg12kvml0
	kAnegBugzcR5Rws/z9JQewO5fzSH9ERbKrXnQ2DN7A0SOHdvhgSN0TPS1bhNK3o+oUFq
	+yLznsw9JgUwtX0mYK0xn5LU3riyexcx6GHcN/v4MgkBRuD/n7kPXg0aWdkfyr/W2oPJ
	yZEOyYmeZQRRIjDgVSYfenIG1h3W0pPUDdwxDSb4YDZnZH6VP4htMUDk8yr9RB3QlClw
	Kh6Q==
X-Gm-Message-State: AKaTC03hQNYlGBHEI4dhG1ULtqrAy8V/WAmwFdtGsIJbRDhWoIgzkdbYMYW7Gh2xT5udPMW5qBhyoDLladTBgw==
X-Received: by 10.31.168.7 with SMTP id r7mr15077782vke.148.1480637974568;
	Thu, 01 Dec 2016 16:19:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Thu, 1 Dec 2016 16:19:04 -0800 (PST)
In-Reply-To: <5840A839.5070704@linux.intel.com>
References: <1480610065-25697-1-git-send-email-anibal.limon@linux.intel.com>
	<CAMKF1srq2VD3En90FNXLB6p4YvLYh=fEz6mzEmC-O4bBHV1Q7A@mail.gmail.com>
	<5840A839.5070704@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Dec 2016 16:19:04 -0800
Message-ID: <CAMKF1srD4Nzzo=tB8PbRCOTKckqe1T0C_5XCiAK2Wn2kASekhA@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perl-native: Remove usage of -fstack-protector=strong
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
X-List-Received-Date: Fri, 02 Dec 2016 00:19:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 1, 2016 at 2:46 PM, An=C3=ADbal Lim=C3=B3n
<anibal.limon@linux.intel.com> wrote:
>
>
> On 12/01/2016 04:39 PM, Khem Raj wrote:
>> On Thu, Dec 1, 2016 at 8:34 AM, An=C3=ADbal Lim=C3=B3n
>> <anibal.limon@linux.intel.com> wrote:
>>> Some distributions (like opensuse421) supported by the project
>>> comes with older gcc releases, -fstack-protector=3Dstrong is supported
>>> by GCC>=3D4.9.
>>>
>>> This causes a build failure when install perl-native from a sstate that
>>> comes from a machine supporting -fstack-protector=3Dstrong [1].
>>>
>>> So disable usage of this flag in perl-native builds, this patch could
>>> be removed when all supported distros comes with GCC>=3D4.9.
>>
>>
>> Instead of disabling it. Can it be made detectable during configure.
>
> The issue here is that comes from SSTATE mirror so the configure step
> isn't executed again when a other machine without
> -fstack-protector=3Dstrong download the sstate artifact was generate in
> other machine with -fstack-protector=3Dstrong support. This is only for
> native builds for target builds in enabled.
>
> We have similar patches for example in rpm,
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools=
/rpm/rpm/popt-disable-auto-stack-protector.patch
>

yeah I see, thanks, I guess we need to bring it down to lowest common
denominator I guess.
maybe we should start thinking about gcc-native


> Cheers,
>         alimon
>
>
>>
>>>
>>> [YOCTO #10338]
>>>
>>> [1] http://errors.yoctoproject.org/Errors/Details/109589/
>>>
>>> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
>>> ---
>>>  meta/recipes-devtools/perl/perl-native_5.24.0.bb   |   1 +
>>>  ...emove-fstack-protector-strong-for-native-.patch | 103 +++++++++++++=
++++++++
>>>  2 files changed, 104 insertions(+)
>>>  create mode 100644 meta/recipes-devtools/perl/perl/0001-Configure-Remo=
ve-fstack-protector-strong-for-native-.patch
>>>
>>> diff --git a/meta/recipes-devtools/perl/perl-native_5.24.0.bb b/meta/re=
cipes-devtools/perl/perl-native_5.24.0.bb
>>> index af2ad7b..b1f0179 100644
>>> --- a/meta/recipes-devtools/perl/perl-native_5.24.0.bb
>>> +++ b/meta/recipes-devtools/perl/perl-native_5.24.0.bb
>>> @@ -11,6 +11,7 @@ SRC_URI +=3D "\
>>>             file://debian/errno_ver.diff \
>>>             file://dynaloaderhack.patch \
>>>             file://perl-PathTools-don-t-filter-out-blib-from-INC.patch =
\
>>> +           file://0001-Configure-Remove-fstack-protector-strong-for-na=
tive-.patch \
>>>            "
>>>
>>>  SRC_URI[md5sum] =3D "59456ae4bd4b06cb6e57cb19a3b2d349"
>>> diff --git a/meta/recipes-devtools/perl/perl/0001-Configure-Remove-fsta=
ck-protector-strong-for-native-.patch b/meta/recipes-devtools/perl/perl/000=
1-Configure-Remove-fstack-protector-strong-for-native-.patch
>>> new file mode 100644
>>> index 0000000..7391ac5
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/perl/perl/0001-Configure-Remove-fstack-prot=
ector-strong-for-native-.patch
>>> @@ -0,0 +1,103 @@
>>> +Some distributions (like opensuse421) supported by the project
>>> +comes with older gcc releases, -fstack-protector=3Dstrong is supported
>>> +by GCC>=3D4.9.
>>> +
>>> +This causes a build failure when install perl-native from a sstate tha=
t
>>> +comes from a machine supporting -fstack-protector=3Dstrong [1].
>>> +
>>> +So disable usage of this flag in perl-native builds, this patch could
>>> +be removed when all supported distros comes with GCC>=3D4.9.
>>> +
>>> +[YOCTO #10338]
>>> +
>>> +Upstream-status: Inappropriate [configuration]
>>> +
>>> +[1] http://errors.yoctoproject.org/Errors/Details/109589/
>>> +
>>> +Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
>>> +---
>>> + Configure | 54 ------------------------------------------------------
>>> + 1 file changed, 54 deletions(-)
>>> +
>>> +diff --git a/Configure b/Configure
>>> +index efbdcfd..d5bd98c 100755
>>> +--- a/Configure
>>> ++++ b/Configure
>>> +@@ -5468,30 +5468,6 @@ default|recommended)
>>> +               eval $checkccflag
>>> +               ;;
>>> +       esac
>>> +-
>>> +-      # on x86_64 (at least) we require an extra library (libssp) in =
the
>>> +-      # link command line. This library is not named, so I infer that=
 it is
>>> +-      # an implementation detail that may change. Hence the safest ap=
proach
>>> +-      # is to add the flag to the flags passed to the compiler at lin=
k time,
>>> +-      # as that way the compiler can do the right implementation depe=
ndant
>>> +-      # thing. (NWC)
>>> +-      case "$osname" in
>>> +-      amigaos) ;; # -fstack-protector builds but doesn't work
>>> +-      *)      case "$gccversion" in
>>> +-              ?*)     set stack-protector-strong -fstack-protector-st=
rong
>>> +-                      eval $checkccflag
>>> +-                      case "$dflt" in
>>> +-                      *-fstack-protector-strong*) ;; # It got added.
>>> +-                      *) # Try the plain/older -fstack-protector.
>>> +-                         set stack-protector -fstack-protector
>>> +-                         eval $checkccflag
>>> +-                         ;;
>>> +-                      esac
>>> +-                      ;;
>>> +-              esac
>>> +-              ;;
>>> +-      esac
>>> +-      ;;
>>> + esac
>>> +
>>> + case "$mips_type" in
>>> +@@ -5634,21 +5610,6 @@ case "$ldflags" in
>>> +       ;;
>>> + *) dflt=3D"$ldflags";;
>>> + esac
>>> +-# See note above about -fstack-protector
>>> +-case "$ccflags" in
>>> +-*-fstack-protector-strong*)
>>> +-      case "$dflt" in
>>> +-      *-fstack-protector-strong*) ;; # Don't add it again
>>> +-      *) dflt=3D"$dflt -fstack-protector-strong" ;;
>>> +-      esac
>>> +-      ;;
>>> +-*-fstack-protector*)
>>> +-      case "$dflt" in
>>> +-      *-fstack-protector*) ;; # Don't add it again
>>> +-      *) dflt=3D"$dflt -fstack-protector" ;;
>>> +-      esac
>>> +-      ;;
>>> +-esac
>>> +
>>> + : Try to guess additional flags to pick up local libraries.
>>> + for thislibdir in $libpth; do
>>> +@@ -8571,21 +8532,6 @@ EOM
>>> +           ''|' ') dflt=3D'none' ;;
>>> +       esac
>>> +
>>> +-      case "$ldflags" in
>>> +-          *-fstack-protector-strong*)
>>> +-              case "$dflt" in
>>> +-                  *-fstack-protector-strong*) ;; # Don't add it again
>>> +-                  *) dflt=3D"$dflt -fstack-protector-strong" ;;
>>> +-              esac
>>> +-              ;;
>>> +-          *-fstack-protector*)
>>> +-              case "$dflt" in
>>> +-                  *-fstack-protector*) ;; # Don't add it again
>>> +-                  *) dflt=3D"$dflt -fstack-protector" ;;
>>> +-              esac
>>> +-              ;;
>>> +-      esac
>>> +-
>>> +       rp=3D"Any special flags to pass to $ld to create a dynamically =
loaded library?"
>>> +       . ./myread
>>> +       case "$ans" in
>>> +--
>>> +2.1.4
>>> +
>>> --
>>> 2.1.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

