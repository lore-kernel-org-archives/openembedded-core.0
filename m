Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 919AF78493
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 09:33:09 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id x197-v6so8762310oix.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 02:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4refXvvDfYgIReXbYbS2jcj6D55db1zBLqgQyODnJQg=;
	b=SKxJs2PyPoFZjQ5MXaBerciU2d1cKGWpEhHGSvSlyILJlV7k5dVSZZixYbbmTMWB5J
	86XYpYjct2cBfkFKh+YWZztcBgrQ1qXNEZ821Hv3dpZTIE2Ufc2S7/RGlnJ8wuqMoioW
	mBjijko6u6zRvP6K1+zhuFS8AMpA6+tb93GjC7w+67BBlPFX6Vo8PAT+gguFpeDBQwjv
	BH7UXZHTBYvMQSHooXY8bSMS+00pBJJxo9pz6TMwmQHc8M67/2qFPTT4ulaCTjQWZePw
	ZaLH7L6GOeOIPS/6TXJjOSICz4F3Hj4ThSkuUmMscww0PiOwJxZnq9oVBSm1d/C5+NSs
	lg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4refXvvDfYgIReXbYbS2jcj6D55db1zBLqgQyODnJQg=;
	b=UIr7idvI2JljN4fxtIG7wyEA7+LUEWMXHTTSEkghzLT/BjP1pAglC6ax/Fp6ss8p2L
	nkYpYb4MwdksZUIFPvYVDzNNZOSc6jKQmKx5cud18AuKjVO4WErLu5LbMwLMb0PlcBNR
	93yCSF1sBM0Tihv4QoH7kynzZwztM2wZRdNencFlpoPHvEwooq85tpRSFyGT05374vWN
	+mpp40T1H9BV1e9urn21/vfDL1O5YfrRv7nue5sHdGX4np6mkAeE/fB/ZPp3IZJ3eX0o
	RyyTg8I3QYJSaI5RrHVQL7F6XgGXXchu2W42/dlCMOwngYHDFxNY5Z3N5hieQbN0/nqh
	ysrw==
X-Gm-Message-State: APzg51ADzMKsdAnst6XibBRjfiCEOl1bAjYW5siyHje6lIZ/kBN9znje
	Uvxs5t8w8ksd79++D6U8bhlUj/ceKIr7LUCNB+e6Yg==
X-Google-Smtp-Source: ANB0VdYAE4EnY6ZbIXmBW8Tis8znig6VsxmQeKq45HwmeLNHhZA6fJkEoIoeXOl85Wywaav0CgCn/WNiHaEeKlseNbA=
X-Received: by 2002:aca:6cd5:: with SMTP id
	h204-v6mr5666671oic.140.1536831189998; 
	Thu, 13 Sep 2018 02:33:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:7ac:0:0:0:0:0 with HTTP;
	Thu, 13 Sep 2018 02:32:49 -0700 (PDT)
In-Reply-To: <CALLMt=rAOhVp4N9amv0ohjVpAkq9FYpadKg2GP1tL+ptb6D+YQ@mail.gmail.com>
References: <1536784825-4476-1-git-send-email-geissonator@gmail.com>
	<1536784825-4476-2-git-send-email-geissonator@gmail.com>
	<CAJTo0LZo8o+RNJR1KgqfQybfcv-QfNDEs+6a5NaR0U1tQ6uSJQ@mail.gmail.com>
	<CALLMt=rAOhVp4N9amv0ohjVpAkq9FYpadKg2GP1tL+ptb6D+YQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Sep 2018 10:32:49 +0100
Message-ID: <CAJTo0LYT6rZOBAHO9HwQmUZnYa-F0k-gwdD5jpAD_z--Xx58jA@mail.gmail.com>
To: Andrew Geissler <geissonator@gmail.com>
Cc: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] python/python3: Add option to remove test files
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
X-List-Received-Date: Thu, 13 Sep 2018 09:33:09 -0000
Content-Type: text/plain; charset="UTF-8"

I'd just say that if those files are only needed by the test suite
(python3 -mtest), it's easy to move them into the python-tests package
by editing the manifest.   If they're not part of the test suite then
what are they?

I can't recall why there's a python3-sqlite3-tests package instead of
just putting those tests into python3-tests and don't want to see more
python3-[module]-tests packages.

Ross

On 13 September 2018 at 01:46, Andrew Geissler <geissonator@gmail.com> wrote:
> On Wed, Sep 12, 2018 at 4:11 PM Burton, Ross <ross.burton@intel.com> wrote:
>>
>> What are these files?  Are they needed by the test suite?  If so, lets
>> just put them into python-tests along with the test suite.
>
> I did have a brief email exchange with Alejandro in
> http://lists.openembedded.org/pipermail/openembedded-core/2018-September/155471.html
> where we talked about how certain packages require the test files
> during build, so they'd need to be removed during install.   I figured
> it was easiest to just do them all during install.
>
> I see that python2-manifest.json does have a sqlite3 and sqlite3-tests
> entry.  Is that the type of thing I should try with the other packages
> or were you thinking something else?
>
> I'm definitely very new to the python recipe, but willing to try out
> whatever you guys think best.
>
> Thanks!
> Andrew
>>
>> Ross
>>
>> On 12 September 2018 at 21:40, Andrew Geissler <geissonator@gmail.com> wrote:
>> > A quick search in the python package shows the following test
>> > directories being included in the python image:
>> > ./Python-2.7.14/Lib/bsddb/test
>> > ./Python-2.7.14/Lib/sqlite3/test
>> > ./Python-2.7.14/Lib/ctypes/test
>> > ./Python-2.7.14/Lib/unittest/test
>> > ./Python-2.7.14/Lib/lib-tk/test
>> > ./Python-2.7.14/Lib/email/test
>> >
>> > In some distributions, the extra space taken up by these test files
>> > is very valuable.
>> >
>> > The default is to still include the test files.
>> >
>> > Signed-off-by: Andrew Geissler <geissonator@gmail.com>
>> > ---
>> >  meta/recipes-devtools/python/python3_3.5.5.bb | 9 +++++++++
>> >  meta/recipes-devtools/python/python_2.7.15.bb | 9 +++++++++
>> >  2 files changed, 18 insertions(+)
>> >
>> > diff --git a/meta/recipes-devtools/python/python3_3.5.5.bb b/meta/recipes-devtools/python/python3_3.5.5.bb
>> > index c919a97..5d1397a 100644
>> > --- a/meta/recipes-devtools/python/python3_3.5.5.bb
>> > +++ b/meta/recipes-devtools/python/python3_3.5.5.bb
>> > @@ -160,6 +160,11 @@ EOF
>> >         fi
>> >  }
>> >
>> > +# Some packages include test/ directories and files. Provide option
>> > +# to not include them.
>> > +
>> > +INCLUDE_TESTS ?= "1"
>> > +
>> >  do_install() {
>> >         # make install needs the original Makefile, or otherwise the inclues would
>> >         # go to ${D}${STAGING...}/...
>> > @@ -189,6 +194,10 @@ do_install() {
>> >         fi
>> >
>> >         oe_multilib_header python${PYTHON_BINABI}/pyconfig.h
>> > +
>> > +    if [ "${INCLUDE_TESTS}" -ne "1" ]; then
>> > +        find ${D}${libdir}/python${PYTHON_MAJMIN} -name test -exec rm -rf {} +;
>> > +    fi
>> >  }
>> >
>> >  do_install_append_class-nativesdk () {
>> > diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
>> > index 82b65d2..1839624 100644
>> > --- a/meta/recipes-devtools/python/python_2.7.15.bb
>> > +++ b/meta/recipes-devtools/python/python_2.7.15.bb
>> > @@ -90,6 +90,11 @@ do_compile() {
>> >                 OPT="${CFLAGS}"
>> >  }
>> >
>> > +# Some packages include test/ directories and files. Provide option
>> > +# to not include them.
>> > +
>> > +INCLUDE_TESTS ?= "1"
>> > +
>> >  do_install() {
>> >         # make install needs the original Makefile, or otherwise the inclues would
>> >         # go to ${D}${STAGING...}/...
>> > @@ -127,6 +132,10 @@ do_install() {
>> >      if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'bdb', d)}" ]; then
>> >          rm -rf ${D}/${libdir}/python${PYTHON_MAJMIN}/bsddb
>> >      fi
>> > +
>> > +    if [ "${INCLUDE_TESTS}" -ne "1" ]; then
>> > +        find ${D}${libdir}/python${PYTHON_MAJMIN} -name test -exec rm -rf {} +;
>> > +    fi
>> >  }
>> >
>> >  do_install_append_class-nativesdk () {
>> > --
>> > 2.7.4
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

