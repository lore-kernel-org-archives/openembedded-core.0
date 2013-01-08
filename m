Received: from mail-vc0-f172.google.com ([209.85.220.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TsN8U-0006gU-2B
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 01:33:49 +0100
Received: by mail-vc0-f172.google.com with SMTP id fw7so20288201vcb.31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 16:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:cc
	:content-type; bh=2nlhFJCa0Om7XV07yvUo/ZupRLQJtDaCDrRMQof0psY=;
	b=sR+zgpLLbbPondlDq32QObFfke+pEXGf8gTvFN6PhZefSHbqRHMR2PUpg67WfJUV1s
	LO068iuEj3GdZngvlOym/Nbp6dfn2/GJLl/Hsva9lMMy6GTPEuYq84I/68ENdwjt3iSN
	9eLYg4pj+aVQy48i7J+8l4+Oi7ExDse+0CqdSZmr2eJcMaKwGHtbXwldCBre5nGWG7Tb
	Jl8LNuqcltAIkq7GvPgK9LIRB2d0uEH+IEzl3lynDfQS8roqth4YmZ9Xr7o5CGJYfNS/
	n3MkW5m4+ki12JYJYlTsAn6As0u298zKAF53qVf9Lv+zi7Rtj1LrMMbkL4tQxHILKkDl
	0UZA==
MIME-Version: 1.0
Received: by 10.52.21.107 with SMTP id u11mr73653183vde.101.1357604315795;
	Mon, 07 Jan 2013 16:18:35 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Mon, 7 Jan 2013 16:18:35 -0800 (PST)
In-Reply-To: <CAGiJk9di7Tt3UW47kqYGK9ekVQV=Uci-vJcT_EvSHQmjhXGozQ@mail.gmail.com>
References: <20121226113500.4490F1036A@opal>
	<CAGiJk9di7Tt3UW47kqYGK9ekVQV=Uci-vJcT_EvSHQmjhXGozQ@mail.gmail.com>
Date: Tue, 8 Jan 2013 01:18:35 +0100
Message-ID: <CALbNGRQsEjP1gscRAWyE0gp7KnUqUJHuf7fhy0yc1mY0ZSvivA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Constantin Musca : libmusicbrainz: upgrade to git SRCREV 0749dd0a35b4a543
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
X-List-Received-Date: Tue, 08 Jan 2013 00:33:49 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 7, 2013 at 1:59 PM, Samuel Stirtzel
<s.stirtzel@googlemail.com> wrote:
> 2012/12/26  <git@git.openembedded.org>:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: a9d25a8e6720ceff5cfefa3191026357dd6e0f49
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=a9d25a8e6720ceff5cfefa3191026357dd6e0f49
>>
>> Author: Constantin Musca <constantinx.musca@intel.com>
>> Date:   Fri Dec 21 15:26:27 2012 +0200
>>
>> libmusicbrainz: upgrade to git SRCREV 0749dd0a35b4a543
>>
>> include/musicbrainz3/includes.h: removed from LIC_FILES_CHKSUM
>>     - the file is not present in the new version
>> fix_build_issue_for_gcc_4.5.0.patch: removed
>>     - the patched files are removed
>>
>> [Other changes]
>> - moved to git (the last tag version doesn't support cross-compilation)
>> - we need to build the native make-c-interface executable before
>> configuring cmake for the target
>>
>> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
>> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>
>> ---
>>
>>  .../allow-libdir-override.patch                    |    0
>>  .../fix_build_issue_for_gcc_4.5.0.patch            |   39 --------------------
>>  .../musicbrainz/libmusicbrainz_3.0.3.bb            |   22 -----------
>>  .../musicbrainz/libmusicbrainz_git.bb              |   36 ++++++++++++++++++
>>  4 files changed, 36 insertions(+), 61 deletions(-)
>>
>
>> diff --git a/meta/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb b/meta/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
>> new file mode 100644
>> index 0000000..7343662
>> --- /dev/null
>> +++ b/meta/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
>> @@ -0,0 +1,36 @@
>> +SUMMARY = "MusicBrainz Client"
>> +DESCRIPTION = "The MusicBrainz client is a library which can be built into other programs.  The library allows you to access the data held on the MusicBrainz server."
>> +HOMEPAGE = "http://musicbrainz.org"
>> +LICENSE = "LGPLv2.1+"
>> +LIC_FILES_CHKSUM = "file://COPYING.txt;md5=fbc093901857fcd118f065f900982c24"
>> +DEPENDS = "expat neon"
>> +
>> +PV = "5.0.1+git${SRCPV}"
>> +PR = "r0"
>> +
>> +SRCREV = "0749dd0a35b4a54316da064475863a4ac6e28e7e"
>> +SRC_URI = "git://github.com/metabrainz/libmusicbrainz.git \
>> +           file://allow-libdir-override.patch "
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +LDFLAGS_prepend_libc-uclibc = " -lpthread "
>> +
>> +
>> +inherit cmake pkgconfig
>> +
>> +do_configure_prepend() {
>> +    mkdir build-native
>> +    cd build-native
>> +    cmake -DCMAKE_C_FLAGS=${BUILD_CFLAGS} \
>> +            -DCMAKE_C_COMPILER=${BUILD_CC} \
>> +            -DCMAKE_CXX_FLAGS=${BUILD_CXXFLAGS} \
>> +            -DCMAKE_CXX_COMPILER=${BUILD_CXX} \
>> +            -DCMAKE_LINK_FLAGS=${BUILD_LDFLAGS} \
>> +            ..
>> +    make
>> +    cd ..
>> +}
>
> Hi,
>
> this fails tests for build-hosts without libcap2 installed:
>
> | Linking CXX shared library libmusicbrainz5.so
> | [ 87%] Built target musicbrainz5
> | Scanning dependencies of target ctest
> | [ 88%] Building C object tests/CMakeFiles/ctest.dir/ctest.c.o
> | Linking C executable ctest
> | /usr/bin/ld: warning: libcap.so.2, needed by
> /home/jenkins/workspace/OpenEmbedded-Nightly/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libgcrypt.so.11,
> not found (try using -rpath or -rpath-link)
> | /home/jenkins/workspace/OpenEmbedded-Nightly/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libgcrypt.so.11:
> undefined reference to `cap_from_text'
> | /home/jenkins/workspace/OpenEmbedded-Nightly/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib/libgcrypt.so.11:
> undefined reference to `cap_set_proc'
> | collect2: ld returned 1 exit status
> | make[2]: *** [tests/ctest] Error 1
> | make[1]: *** [tests/CMakeFiles/ctest.dir/all] Error 2
> | make: *** [all] Error 2
> | ERROR: Function failed: do_configure (see
> /home/jenkins/workspace/OpenEmbedded-Nightly/build/tmp-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libmusicbrainz/5.0.1+gitAUTOINC+0749dd0a35b4a54316da064475863a4ac6e28e7e-r0/temp/log.do_configure.32319
> for further information)
> NOTE: recipe libmusicbrainz-5.0.1+gitAUTOINC+0749dd0a35b4a54316da064475863a4ac6e28e7e-r0:
> task do_configure: Failed
> ERROR: Task 6593
> (/home/jenkins/workspace/OpenEmbedded-Nightly/sources/openembedded-core/meta/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb,
> do_configure) failed with exit code '1'
>
>
> Note: libcap-native was built and deployed but not found by the linker..
>
>
and another issue on reconfigure

| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing shell function do_configure
| mkdir: cannot create directory `build-native': File exists
| ERROR: Function failed: do_configure (see
/home/Superandy/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/libmusicbrainz/5.0.1+gitAUTOINC+0749dd0a35b4a54316da064475863a4ac6e28e7e-r0/temp/log.do_configure.17634
for further information)

Andreas


