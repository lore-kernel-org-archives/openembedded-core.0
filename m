Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SuNqZ-00086E-1T
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 15:11:19 +0200
Received: by ggnp4 with SMTP id p4so1728747ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 05:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=hm8gfQYlww3/qL/syMHBGTRSvicusfnWg6BqQgorDvk=;
	b=bjNazUcBm+Up2U0W/6jIU3ZRB7UKQc5IN1PV84PvvvVwNrWT6PcDirHr3JwWdXvLFz
	5u1hzCdjnJFx9jfnEyrTsItX3fvDbZBlmZJyQbtWQGlSpYchFoHBZusgp2YePewawL/b
	oLEqomYndDTtIj9AJ8wJqmE9k9C2BvGySy3/wnLMY/53N9VfoPO+cQ6aIaydlhwJNZH9
	SgIf3nZHXJXScTun8+irB3yCNpAMzRvTGNFNiaYZES04kq3gNfMKbI8cvYNWQsVf1Gm8
	t05ddwGuy/lOx71CRMd7Wdq+uDis1d4QbwOf09wuz4WNBKsO7LgT7l/3PhvtuJqac9v3
	bFTg==
MIME-Version: 1.0
Received: by 10.50.187.226 with SMTP id fv2mr1505540igc.47.1343307587519; Thu,
	26 Jul 2012 05:59:47 -0700 (PDT)
Received: by 10.64.9.165 with HTTP; Thu, 26 Jul 2012 05:59:47 -0700 (PDT)
In-Reply-To: <CALbNGRS3ZaawmC1+pt_ja2+90qyan1XC3V-9s8gsKyr-PsHWwQ@mail.gmail.com>
References: <CALbNGRS3ZaawmC1+pt_ja2+90qyan1XC3V-9s8gsKyr-PsHWwQ@mail.gmail.com>
Date: Thu, 26 Jul 2012 14:59:47 +0200
Message-ID: <CALbNGRSztH9aBbW7BeLm0YwdGZ-mEvbVMUJJNUa5bLweCXCbmg@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 26 Jul 2012 13:11:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 26, 2012 at 1:24 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> I think it is not gtk+-native specific but some autoconf trouble. I
> tried a build from scratch and get:
>
> | configure.ac:171: warning: macro 'AM_PATH_GLIB_2_0' not found in librar=
y
> | configure.ac:195: warning: macro 'AM_GLIB_GNU_GETTEXT' not found in lib=
rary
> | autoreconf: running:
> /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/autoconf
> --include=3D/home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-native=
-2.2.0-r3/atk-2.2.0/m4/
> --include=3D/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/sh=
are/aclocal-1.12
> --include=3D/home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-native=
-2.2.0-r3/atk-2.2.0/aclocal-copy/
> --force --warnings=3Dcross
> | configure.ac:171: error: possibly undefined macro: AM_PATH_GLIB_2_0
> |       If this token and others are legitimate, please use m4_pattern_al=
low.
> |       See the Autoconf documentation.
> | configure.ac:195: error: possibly undefined macro: AM_GLIB_GNU_GETTEXT
> | autoreconf: /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/=
bin/autoconf
> failed with exit status: 1
> | ERROR: autoreconf execution failed.
> | ERROR: Function failed: do_configure (see
> /home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-native-2.2.0-r3/te=
mp/log.do_configure.24422
> for further information)
> NOTE: package atk-native-2.2.0-r3: task do_configure: Failed
>
> | configure.ac:171: warning: macro 'AM_PATH_GLIB_2_0' not found in librar=
y
> | configure.ac:195: warning: macro 'AM_GLIB_GNU_GETTEXT' not found in lib=
rary
> | autoreconf: running:
> /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/autoconf
> --include=3D/home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-native=
-2.2.0-r3/atk-2.2.0/m4/
> --include=3D/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/sh=
are/aclocal-1.12
> --include=3D/home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-native=
-2.2.0-r3/atk-2.2.0/aclocal-copy/
> --force --warnings=3Dcross
> | configure.ac:171: error: possibly undefined macro: AM_PATH_GLIB_2_0
> |       If this token and others are legitimate, please use m4_pattern_al=
low.
> |       See the Autoconf documentation.
> | configure.ac:195: error: possibly undefined macro: AM_GLIB_GNU_GETTEXT
> | autoreconf: /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/=
bin/autoconf
> failed with exit status: 1
> | ERROR: autoreconf execution failed.
> | ERROR: Function failed: do_configure (see
> /home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-native-2.2.0-r3/te=
mp/log.do_configure.24422
> for further information)
> NOTE: package atk-native-2.2.0-r3: task do_configure: Failed
>
> Suggestions?
>
> Andreas

FYI I reverted the autoconf 2.68 -> 2.69 patch
(effb75d42098b3e367d393215fd5d52a0191e954) / start build from scratch
but the error is still same.

Andreas


