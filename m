Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SuP8A-0002JQ-EQ
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 16:33:34 +0200
Received: by ggnp4 with SMTP id p4so1820848ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 07:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=NLOorNZIfe6yCGed3wIzQneG6v+LjoT3z/MUalHwgl8=;
	b=byMxI2tRQ0t3C9HtSGlpyMzCeWtPCyXuTqlHB5OW1141P4ZE80eQiDYz029rauTHcJ
	oUVdOGW2nshRtad6GkOb92wnFR9yAR1e6Qen0hOrDk5Mawf6P+AWL8T3xgQA31UB1Ufs
	NI04A17f+Ouctk1wd7uC50UPnvdcjdDYOgHENqm/ZiQ19aNMFzlX4xBfuDiusUkHq3AW
	jCm1aEC5UkPfHctq5KoMJ08+bZsD9eokiawKq/lSwwe5Hv9TA36OcCel3GI1bHkQ6CIb
	36GMaYlNfh/XwpO3c+ErVm1FC65/l5K6aEH3sTFNvH4GkOqvSjBXQ0U9RNEZwjxjNzm5
	YtJQ==
MIME-Version: 1.0
Received: by 10.50.181.232 with SMTP id dz8mr1786170igc.36.1343312522912; Thu,
	26 Jul 2012 07:22:02 -0700 (PDT)
Received: by 10.64.9.165 with HTTP; Thu, 26 Jul 2012 07:22:02 -0700 (PDT)
In-Reply-To: <1343308890.29991.30.camel@ted>
References: <CALbNGRS3ZaawmC1+pt_ja2+90qyan1XC3V-9s8gsKyr-PsHWwQ@mail.gmail.com>
	<CALbNGRSztH9aBbW7BeLm0YwdGZ-mEvbVMUJJNUa5bLweCXCbmg@mail.gmail.com>
	<1343308890.29991.30.camel@ted>
Date: Thu, 26 Jul 2012 16:22:02 +0200
Message-ID: <CALbNGRSSkQKgys-2u=dJ4TmYmnwyV6XTsTQ6HFDSACX5hzWYYw@mail.gmail.com>
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
X-List-Received-Date: Thu, 26 Jul 2012 14:33:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 26, 2012 at 3:21 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2012-07-26 at 14:59 +0200, Andreas M=FCller wrote:
>> On Thu, Jul 26, 2012 at 1:24 PM, Andreas M=FCller
>> <schnitzeltony@googlemail.com> wrote:
>> > I think it is not gtk+-native specific but some autoconf trouble. I
>> > tried a build from scratch and get:
>> >
>> > | configure.ac:171: warning: macro 'AM_PATH_GLIB_2_0' not found in lib=
rary
>> > | configure.ac:195: warning: macro 'AM_GLIB_GNU_GETTEXT' not found in =
library
>> > | autoreconf: running:
>> > /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/autocon=
f
>> > --include=3D/home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-nat=
ive-2.2.0-r3/atk-2.2.0/m4/
>> > --include=3D/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr=
/share/aclocal-1.12
>> > --include=3D/home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-nat=
ive-2.2.0-r3/atk-2.2.0/aclocal-copy/
>> > --force --warnings=3Dcross
>> > | configure.ac:171: error: possibly undefined macro: AM_PATH_GLIB_2_0
>> > |       If this token and others are legitimate, please use m4_pattern=
_allow.
>> > |       See the Autoconf documentation.
>> > | configure.ac:195: error: possibly undefined macro: AM_GLIB_GNU_GETTE=
XT
>> > | autoreconf: /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/u=
sr/bin/autoconf
>> > failed with exit status: 1
>> > | ERROR: autoreconf execution failed.
>> > | ERROR: Function failed: do_configure (see
>> > /home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-native-2.2.0-r3=
/temp/log.do_configure.24422
>> > for further information)
>> > NOTE: package atk-native-2.2.0-r3: task do_configure: Failed
>> >
>> > | configure.ac:171: warning: macro 'AM_PATH_GLIB_2_0' not found in lib=
rary
>> > | configure.ac:195: warning: macro 'AM_GLIB_GNU_GETTEXT' not found in =
library
>> > | autoreconf: running:
>> > /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/autocon=
f
>> > --include=3D/home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-nat=
ive-2.2.0-r3/atk-2.2.0/m4/
>> > --include=3D/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr=
/share/aclocal-1.12
>> > --include=3D/home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-nat=
ive-2.2.0-r3/atk-2.2.0/aclocal-copy/
>> > --force --warnings=3Dcross
>> > | configure.ac:171: error: possibly undefined macro: AM_PATH_GLIB_2_0
>> > |       If this token and others are legitimate, please use m4_pattern=
_allow.
>> > |       See the Autoconf documentation.
>> > | configure.ac:195: error: possibly undefined macro: AM_GLIB_GNU_GETTE=
XT
>> > | autoreconf: /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/u=
sr/bin/autoconf
>> > failed with exit status: 1
>> > | ERROR: autoreconf execution failed.
>> > | ERROR: Function failed: do_configure (see
>> > /home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-native-2.2.0-r3=
/temp/log.do_configure.24422
>> > for further information)
>> > NOTE: package atk-native-2.2.0-r3: task do_configure: Failed
>> >
>> > Suggestions?
>> >
>> > Andreas
>>
>> FYI I reverted the autoconf 2.68 -> 2.69 patch
>> (effb75d42098b3e367d393215fd5d52a0191e954) / start build from scratch
>> but the error is still same.
>
> A missing glib-2-0-native dependency for atk-native?
>
I built glib-2.0-native manually and can now build atk-native.
meta-oe's gtk+-native complained
| No package 'pango' found
| No package 'cairo' found
| No package 'gdk-pixbuf-2.0' found

What makes me wonder (atk depends on glib-2.0):
AFAIK there were times when a recipe 'zzz' depending on 'foo' and
having BBCLASSEXTEND =3D "native", then 'zzz-native' depended on
'foo-native'. Is that (still true) true? If not is it a bug or a
feature?

Andreas


