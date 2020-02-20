Return-Path: <jpewhacker@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 746A560B59
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 22:51:00 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z3so6464878wru.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 14:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bcTpgWGuFvSp+WJVgMSchqmBZXy5xmpb4bVJ4AHeUpY=;
	b=pZ/5f/yKg2b6Jyb0BoN9117JdUDdyMQqrOA/HUK/+JjLhVE5VHIt2mC+P7sfkT7k2G
	+IMW5x3Kia9smbNRoP4BeKU4zrp0qqBg2fBEmhNSF6vjtcII4CosdkOOr8j0fAq05rGy
	6DATTsENGdQOK4expnclR8PjQTKIamaRH/j2THi39AV6CCkdrFSQShRW180dBvatrhfj
	BBOLUfstFyChMnYfPik3lR6z2oQxwwbmcDcXjvft0ymGvrFS9xVihZtEBC0x3dZzS+C1
	6bHWG9agqynaygIOt9GRFEz+wPs/dr1GDK1RYjwYSGD2FB5d25wYpuFVBn37WwHyG+km
	tlEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bcTpgWGuFvSp+WJVgMSchqmBZXy5xmpb4bVJ4AHeUpY=;
	b=DOK/bfDOwWpCMxd1AzTnl1gZMATJdEyJ+UeJn5YTJOHDOsAQoz3pqPm8qRy5KXTug1
	fKUD8aahWACeXpR+fuebBpP4Kmx9kNLu6lsLpGV7F/cL2T0DkLDGcPq+kKpnibzGLTdL
	iDNjS8KB71O/K6nztFv/3KfDmVnPQNCYwJtj9uYdRsgyxQyBUFrtvoB/sCNI6gV5MIko
	9WKyI/b0Fw6ffd5jcjXxrrTcOEzfWQusRdMUb4ZasNIa9vpTFNAbzwlNy3tM/9nDJbua
	+g6R5LE7Ko7d9rsNG9PLj0vPNqTBpy9Ctxuy3RkrpJy7xsmnkVqD0F6501oPmUA/6puB
	MSsA==
X-Gm-Message-State: APjAAAWLZ8M6k9b+73V8NvQ6VhIOdax+YauXztJJP99qJ6kVKx60/5GG
	g7IJHMpXj2/TJfMN5R6iVSywo9vIo927hLGRvVI=
X-Google-Smtp-Source: APXvYqzM790588IheFHQK9+FRYTp2fNErx9VvR1PYxL8bCI/0jToFkx8gLbYX1ZqrieeFtuUv2Jr/Ga50L4I2UfhN6U=
X-Received: by 2002:adf:f7c4:: with SMTP id a4mr44739814wrq.361.1582239061073; 
	Thu, 20 Feb 2020 14:51:01 -0800 (PST)
MIME-Version: 1.0
References: <20200220185150.23422-1-JPEWhacker@gmail.com>
	<e81900d2-4692-ca05-841d-d2fbceac70c2@gmail.com>
	<CAJdd5GYXyaT+YnRTs4nvRucini2QEYMbBNRoBcrVu9SSpTr9Eg@mail.gmail.com>
In-Reply-To: <CAJdd5GYXyaT+YnRTs4nvRucini2QEYMbBNRoBcrVu9SSpTr9Eg@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 20 Feb 2020 16:50:49 -0600
Message-ID: <CAJdd5GaOhQsES_1w63qoVpRS6Yn9adNMsv01PcxS0T_t1cMwOg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/meson.bbclass: Explicitly mark functions as missing in MinGW
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
X-List-Received-Date: Thu, 20 Feb 2020 22:51:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 20, 2020 at 2:44 PM Joshua Watt <jpewhacker@gmail.com> wrote:
>
>
>
> On Thu, Feb 20, 2020, 1:30 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On 2/20/20 10:51 AM, Joshua Watt wrote:
>> > meson (with some help from GCC) misdetects certain builtin functions as
>> > being present on MinGW, when in fact they are not. Fix it by explicitly
>> > marking the functions as missing. This requires rearranging the
>> > meson.cross file to put the [properties] section at the end so the
>> > append works properly (meson can't handle duplicate sections).
>> >
>>
>> patch is fine workaround, but I think meson should look for strndup in
>> string.h
>
>
> Agreed. I think the upstream fix would be better, and I will look at that also.

Fixed in http://lists.openembedded.org/pipermail/openembedded-core/2020-February/293233.html
if that is preferable.

>
>>
>> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> > ---
>> >   meta/classes/meson.bbclass | 25 +++++++++++++++++--------
>> >   1 file changed, 17 insertions(+), 8 deletions(-)
>> >
>> > diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
>> > index 06034e8b47..5c74658d01 100644
>> > --- a/meta/classes/meson.bbclass
>> > +++ b/meta/classes/meson.bbclass
>> > @@ -96,14 +96,6 @@ readelf = ${@meson_array('READELF', d)}
>> >   pkgconfig = 'pkg-config'
>> >   llvm-config = 'llvm-config${LLVMVERSION}'
>> >
>> > -[properties]
>> > -needs_exe_wrapper = true
>> > -c_args = ${@meson_array('CFLAGS', d)}
>> > -c_link_args = ${@meson_array('LDFLAGS', d)}
>> > -cpp_args = ${@meson_array('CXXFLAGS', d)}
>> > -cpp_link_args = ${@meson_array('LDFLAGS', d)}
>> > -gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
>> > -
>> >   [host_machine]
>> >   system = '${@meson_operating_system('HOST_OS', d)}'
>> >   cpu_family = '${@meson_cpu_family('HOST_ARCH', d)}'
>> > @@ -115,6 +107,23 @@ system = '${@meson_operating_system('TARGET_OS', d)}'
>> >   cpu_family = '${@meson_cpu_family('TARGET_ARCH', d)}'
>> >   cpu = '${TARGET_ARCH}'
>> >   endian = '${@meson_endian('TARGET', d)}'
>> > +
>> > +[properties]
>> > +needs_exe_wrapper = true
>> > +c_args = ${@meson_array('CFLAGS', d)}
>> > +c_link_args = ${@meson_array('LDFLAGS', d)}
>> > +cpp_args = ${@meson_array('CXXFLAGS', d)}
>> > +cpp_link_args = ${@meson_array('LDFLAGS', d)}
>> > +gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
>> > +EOF
>> > +}
>> > +
>> > +do_write_config_append_mingw32() {
>> > +    # meson mis-detects the presence of several builtin functions in MinGW
>> > +    # (see https://github.com/mesonbuild/meson/issues/3672).
>> > +    # Explicitly mark these functions as missing in the cross file
>> > +    cat >>${WORKDIR}/meson.cross <<EOF
>> > +has_function_strndup = false
>> >   EOF
>> >   }
>> >
>> >
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

