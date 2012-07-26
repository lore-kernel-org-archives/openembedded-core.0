Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SuPlT-0003Ge-FB
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 17:14:11 +0200
Received: by obcva7 with SMTP id va7so2774833obc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 08:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=VamjveMkHzVUoIi4h381/Oc1WunmX09RkuglquniLd8=;
	b=efADuI05Wai54akm/ZBFy1EmIZ6ja6IqOMiEbZwR9hHmJEU4cs9xfv/c+ALoQtRiKk
	gtCxzjwnY/dBSrF0zfC9DJxD2GF7FberSMdQWEefkmpUEHQOeH4yM3m03S7Mmw5bvXvg
	I1Lsi1vhNkwQ0iM/UDhm415R2jeFbP0SzWuL6CiaZU00wTWfM/0LfrJL1aYvN3OrDNVJ
	UUkSjgnAh9sSqC/JNpxzW8EHaXTGkpA8sjnwagsIndtBNJ6dh6FmU8N7dLPVJ7Q0LAgB
	1tHvHlxu08dnQ5djJz8Bty2DFqPJ7E64zLIw+3rmdg8+bY/IDJkgpldBJmCSecfFovr3
	SO8w==
MIME-Version: 1.0
Received: by 10.182.197.73 with SMTP id is9mr41701969obc.32.1343314959907;
	Thu, 26 Jul 2012 08:02:39 -0700 (PDT)
Received: by 10.76.91.170 with HTTP; Thu, 26 Jul 2012 08:02:39 -0700 (PDT)
In-Reply-To: <20120726144748.GD3621@jama.jama.net>
References: <CALbNGRS3ZaawmC1+pt_ja2+90qyan1XC3V-9s8gsKyr-PsHWwQ@mail.gmail.com>
	<CALbNGRSztH9aBbW7BeLm0YwdGZ-mEvbVMUJJNUa5bLweCXCbmg@mail.gmail.com>
	<1343308890.29991.30.camel@ted>
	<CALbNGRSSkQKgys-2u=dJ4TmYmnwyV6XTsTQ6HFDSACX5hzWYYw@mail.gmail.com>
	<20120726144748.GD3621@jama.jama.net>
Date: Thu, 26 Jul 2012 17:02:39 +0200
Message-ID: <CALbNGRSutt-hFJHahbXaCrK0=mKXuRydkw8Z7Ju5tSNUokJHPg@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: autoconf broken? (was [oe] gtk+-native configure fails)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jul 2012 15:14:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 26, 2012 at 4:47 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Thu, Jul 26, 2012 at 04:22:02PM +0200, Andreas M=FCller wrote:
>> On Thu, Jul 26, 2012 at 3:21 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Thu, 2012-07-26 at 14:59 +0200, Andreas M=FCller wrote:
>> >> On Thu, Jul 26, 2012 at 1:24 PM, Andreas M=FCller
>> >> <schnitzeltony@googlemail.com> wrote:
>> >> > I think it is not gtk+-native specific but some autoconf trouble. I
>> >> > tried a build from scratch and get:
>> >> >
>> >> > | configure.ac:171: warning: macro 'AM_PATH_GLIB_2_0' not found in =
library
>> >> > | configure.ac:195: warning: macro 'AM_GLIB_GNU_GETTEXT' not found =
in library
>> >> > | autoreconf: running:
>> >> > /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/auto=
conf
>> >> > --include=3D/home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-=
native-2.2.0-r3/atk-2.2.0/m4/
>> >> > --include=3D/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/=
usr/share/aclocal-1.12
>> >> > --include=3D/home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-=
native-2.2.0-r3/atk-2.2.0/aclocal-copy/
>> >> > --force --warnings=3Dcross
>> >> > | configure.ac:171: error: possibly undefined macro: AM_PATH_GLIB_2=
_0
>> >> > |       If this token and others are legitimate, please use m4_patt=
ern_allow.
>> >> > |       See the Autoconf documentation.
>> >> > | configure.ac:195: error: possibly undefined macro: AM_GLIB_GNU_GE=
TTEXT
>> >> > | autoreconf: /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linu=
x/usr/bin/autoconf
>> >> > failed with exit status: 1
>> >> > | ERROR: autoreconf execution failed.
>> >> > | ERROR: Function failed: do_configure (see
>> >> > /home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-native-2.2.0=
-r3/temp/log.do_configure.24422
>> >> > for further information)
>> >> > NOTE: package atk-native-2.2.0-r3: task do_configure: Failed
>> >> >
>> >> > | configure.ac:171: warning: macro 'AM_PATH_GLIB_2_0' not found in =
library
>> >> > | configure.ac:195: warning: macro 'AM_GLIB_GNU_GETTEXT' not found =
in library
>> >> > | autoreconf: running:
>> >> > /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/auto=
conf
>> >> > --include=3D/home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-=
native-2.2.0-r3/atk-2.2.0/m4/
>> >> > --include=3D/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/=
usr/share/aclocal-1.12
>> >> > --include=3D/home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-=
native-2.2.0-r3/atk-2.2.0/aclocal-copy/
>> >> > --force --warnings=3Dcross
>> >> > | configure.ac:171: error: possibly undefined macro: AM_PATH_GLIB_2=
_0
>> >> > |       If this token and others are legitimate, please use m4_patt=
ern_allow.
>> >> > |       See the Autoconf documentation.
>> >> > | configure.ac:195: error: possibly undefined macro: AM_GLIB_GNU_GE=
TTEXT
>> >> > | autoreconf: /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linu=
x/usr/bin/autoconf
>> >> > failed with exit status: 1
>> >> > | ERROR: autoreconf execution failed.
>> >> > | ERROR: Function failed: do_configure (see
>> >> > /home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-native-2.2.0=
-r3/temp/log.do_configure.24422
>> >> > for further information)
>> >> > NOTE: package atk-native-2.2.0-r3: task do_configure: Failed
>> >> >
>> >> > Suggestions?
>> >> >
>> >> > Andreas
>> >>
>> >> FYI I reverted the autoconf 2.68 -> 2.69 patch
>> >> (effb75d42098b3e367d393215fd5d52a0191e954) / start build from scratch
>> >> but the error is still same.
>> >
>> > A missing glib-2-0-native dependency for atk-native?
>> >
>> I built glib-2.0-native manually and can now build atk-native.
>> meta-oe's gtk+-native complained
>> | No package 'pango' found
>> | No package 'cairo' found
>> | No package 'gdk-pixbuf-2.0' found
>>
>> What makes me wonder (atk depends on glib-2.0):
>> AFAIK there were times when a recipe 'zzz' depending on 'foo' and
>> having BBCLASSEXTEND =3D "native", then 'zzz-native' depended on
>> 'foo-native'. Is that (still true) true? If not is it a bug or a
>> feature?
>
> Maybe you're refering to this issue:
> http://git.openembedded.org/openembedded-core/commit/?id=3D46db11c4a78903=
4b7040faf127ab865148bedad8
>
> which was together with PACKAGECONF and resulted in similar errors from
> gtk+-native.
>
> But I haven't seen this issue in my last rebuild from scratch (about
> week ago) maybe it got broken after that.
>
> Cheers,
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
bitbake -e atk-native | grep ^DEPENDS

says

DEPENDS_GETTEXT=3D"gettext-native"
DEPENDS=3D"gtk-doc-stub-native"

Is it possible that

DEPENDS_virtclass-native_append =3D " gtk-doc-stub-native"

in gtk-doc.bbclass breaks dependency-chain?

Andreas


