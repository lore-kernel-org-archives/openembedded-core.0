Received: from ams-iport-4.cisco.com ([144.254.224.147])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1TEbAn-0003Lq-8H
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Sep 2012 09:27:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=5034; q=dns/txt; s=iport;
	t=1348125305; x=1349334905;
	h=message-id:date:from:mime-version:to:cc:subject:
	references:in-reply-to:content-transfer-encoding;
	bh=cxxZgmtovWsXtVyGBo4NQ5UjPlFFVw/Uc+akD7/0WpE=;
	b=GGEQotbYDzrxlbC/6nEed/JcpCsDx0KAbxI4h8DZTwZJhoKbMkoxEAKr
	TsJrwai5p0vPmLQenGsd0D++2J/23Ox2Fjp/Jt7xvi68nXiW2CEEgb0g2
	eWBfKoNX07uiUz4OQMNLSPTgHDdM0o8oKWZOeihOcSp3L0A5IlAIQ7Epp A=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AgAFAN/BWlCQ/khR/2dsb2JhbABFFrx9gQiCIAEBAQQSAR8BGAEsARALDgoJFg8JAwIBAgFFBg0BBQIBAR6HYQuaCZFXAY42ixyGQQOVZIEUhEyIWIFpgmg
X-IronPort-AV: E=Sophos;i="4.80,453,1344211200"; 
   d="scan'208";a="8179245"
Received: from ams-core-1.cisco.com ([144.254.72.81])
	by ams-iport-4.cisco.com with ESMTP; 20 Sep 2012 07:15:02 +0000
Received: from [10.54.74.11] (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-1.cisco.com (8.14.5/8.14.5) with ESMTP id q8K7F2eu003422;
	Thu, 20 Sep 2012 07:15:02 GMT
Message-ID: <505AC23D.4060808@cisco.com>
Date: Thu, 20 Sep 2012 09:14:05 +0200
From: =?ISO-8859-1?Q?Martin_Erts=E5s?= <mertsas@cisco.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.7) Gecko/20120911 Thunderbird/10.0.7
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1348039015-27100-1-git-send-email-mertsas@cisco.com>
	<5059DE91.9060709@linux.intel.com> <505AB23E.10607@cisco.com>
	<505ABC27.9000909@linux.intel.com>
In-Reply-To: <505ABC27.9000909@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] bash: Make it possible to run bash 3.2.48 instead of 4.2.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Sep 2012 07:27:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 09/20/12 08:48, Saul Wold wrote:
> On 09/19/2012 11:05 PM, Martin Ertsås wrote:
>> On 09/19/12 17:02, Saul Wold wrote:
>>> On 09/19/2012 12:16 AM, Martin Ertsaas wrote:
>>>> bash-3.2.48 did not provide the linking from sh to bash, making it
>>>> unusable.
>>>> Moving the license part out of the bash.inc file, and into
>>>> bash_4.2.bb file makes
>>>> us able to use that file also for bash_3.2.48.bb, which makes
>>>> maintaining both
>>>> at the same time a lot easier.
>>>>
>>> This is good, but I forgot to ask you to include the size change in
>>> here, it's helpful for tracking, I am still considering this change,
>>> but we have constantly adding little change like this adds up to bigger
>>> change.
>>>
>>> Is there any other way to do the equivalent of what you are attempting
>>> to do in the other patch without adding size to busy box?
>>>
>>> Thanks
>>>
>>> Sau!
>> What size change is that? I'm not sure what you are referring to here,
>> sorry. As far as I see I'm not adding any size to busybox either, but I
>> might be wrong as I don't know the internals of busybox. If you could
>> elaborate a bit more, I can see what I can do about your concerns.
>>
> Sorry, today's been a bit crazy!  I confused a change to busybox with
> your change to bash!  My bad, ignore me.
>
> I will revisit this tomorrow.
>
> Sau!

Ok. No wonder I was a bit confused then.

- Martin
>
>
>
>
>> - Martin
>>>
>>>> Signed-off-by: Martin Ertsaas <mertsas@cisco.com>
>>>> ---
>>>>    meta/recipes-extended/bash/bash.inc       |    3 --
>>>>    meta/recipes-extended/bash/bash_3.2.48.bb |   31
>>>> +---------------------------
>>>>    meta/recipes-extended/bash/bash_4.2.bb    |    6 ++++-
>>>>    3 files changed, 7 insertions(+), 33 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-extended/bash/bash.inc
>>>> b/meta/recipes-extended/bash/bash.inc
>>>> index 3684191..ae4b681 100644
>>>> --- a/meta/recipes-extended/bash/bash.inc
>>>> +++ b/meta/recipes-extended/bash/bash.inc
>>>> @@ -2,9 +2,6 @@ DESCRIPTION = "An sh-compatible command language
>>>> interpreter."
>>>>    HOMEPAGE = "http://cnswww.cns.cwru.edu/~chet/bash/bashtop.html"
>>>>    SECTION = "base/shell"
>>>>
>>>> -# GPLv2+ (< 4.0), GPLv3+ (>= 4.0)
>>>> -LICENSE = "GPLv3+"
>>>> -LIC_FILES_CHKSUM =
>>>> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>>>>    DEPENDS = "ncurses bison-native"
>>>>
>>>>    inherit autotools gettext update-alternatives
>>>> diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb
>>>> b/meta/recipes-extended/bash/bash_3.2.48.bb
>>>> index 509d7a0..828d629 100644
>>>> --- a/meta/recipes-extended/bash/bash_3.2.48.bb
>>>> +++ b/meta/recipes-extended/bash/bash_3.2.48.bb
>>>> @@ -1,12 +1,9 @@
>>>> -DESCRIPTION = "An sh-compatible command language interpreter."
>>>> -HOMEPAGE = "http://cnswww.cns.cwru.edu/~chet/bash/bashtop.html"
>>>> -SECTION = "base/shell"
>>>> +require bash.inc
>>>>
>>>>    LICENSE = "GPLv2+"
>>>>    LIC_FILES_CHKSUM =
>>>> "file://COPYING;md5=fd5d9bcabd8ed5a54a01ce8d183d592a"
>>>> -DEPENDS = "ncurses"
>>>>
>>>> -PR = "r10"
>>>> +PR = "r11"
>>>>
>>>>    SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
>>>>
>>>> ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-049;apply=yes;striplevel=0;name=patch001
>>>>
>>>> \
>>>> @@ -24,27 +21,3 @@ SRC_URI[patch003.sha256sum] =
>>>> "354886097cd95b4def77028f32ee01e2e088d58a98184fede
>>>>
>>>>    SRC_URI[md5sum] = "338dcf975a93640bb3eaa843ca42e3f8"
>>>>    SRC_URI[sha256sum] =
>>>> "128d281bd5682ba5f6953122915da71976357d7a76490d266c9173b1d0426348"
>>>> -
>>>> -inherit autotools gettext
>>>> -
>>>> -PARALLEL_MAKE = ""
>>>> -
>>>> -bindir = "/bin"
>>>> -sbindir = "/sbin"
>>>> -
>>>> -EXTRA_OECONF = "--with-ncurses"
>>>> -export CC_FOR_BUILD = "${BUILD_CC}"
>>>> -
>>>> -export AUTOHEADER = "true"
>>>> -
>>>> -do_configure_prepend () {
>>>> -    if [ ! -e acinclude.m4 ]; then
>>>> -        cat aclocal.m4 > acinclude.m4
>>>> -    fi
>>>> -}
>>>> -
>>>> -pkg_postinst_${PN} () {
>>>> -    touch $D${sysconfdir}/shells
>>>> -    grep -q "bin/bash" $D${sysconfdir}/shells || echo /bin/bash >>
>>>> $D${sysconfdir}/shells
>>>> -    grep -q "bin/sh" $D${sysconfdir}/shells || echo /bin/sh >>
>>>> $D${sysconfdir}/shells
>>>> -}
>>>> diff --git a/meta/recipes-extended/bash/bash_4.2.bb
>>>> b/meta/recipes-extended/bash/bash_4.2.bb
>>>> index 384eb62..5a0f015 100644
>>>> --- a/meta/recipes-extended/bash/bash_4.2.bb
>>>> +++ b/meta/recipes-extended/bash/bash_4.2.bb
>>>> @@ -1,6 +1,10 @@
>>>>    require bash.inc
>>>>
>>>> -PR = "r4"
>>>> +# GPLv2+ (< 4.0), GPLv3+ (>= 4.0)
>>>> +LICENSE = "GPLv3+"
>>>> +LIC_FILES_CHKSUM =
>>>> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>>>> +
>>>> +PR = "r5"
>>>>
>>>>    SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
>>>>
>>>> ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-001;apply=yes;striplevel=0;name=patch001
>>>>
>>>> \
>>>>
>>
>>
>>



