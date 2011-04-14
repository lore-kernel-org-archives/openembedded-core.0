Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QAOQj-0000ql-Sk
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Apr 2011 17:26:01 +0200
Received: by fxm19 with SMTP id 19so1483609fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2011 08:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=qPSw7D0H+8Wt51TK545g59kokhrFTBiszIGklTQ4730=;
	b=XDgmKhGyqKXj2ToR4Nm5Wro8r2soaEMvF4Syn0Xdoa4FQ9s+N/DOUdXVn08F8KiYtF
	pfEv511ySizoLnI5ku7r0/aY6eiTc+Km1Ln5ACiuPtdvoeCdyszenFOKtVir1ShUXSrG
	HWLkgnVgqQLvcxBPEyPWxTh7oAlv1d+Q3zzMQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=pTnnxnOwBcdl4m2f3CUvKj0PZwnEVXTcHR5QFi3hHVp9ocLbOA0SASaljkXM2Jkqap
	zTB5W13NUCKBh85hLnYWpIzJx5bq/NDIYsYOsnRfzVo3ZEtT9ImlziNaletkkdAuWnAL
	bs0FQR7LX+bmG6AJLiATgaDtbblHVTwasSfn4=
Received: by 10.223.6.198 with SMTP id a6mr940966faa.130.1302794623837; Thu,
	14 Apr 2011 08:23:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.115.82 with HTTP; Thu, 14 Apr 2011 08:23:13 -0700 (PDT)
In-Reply-To: <20110414020059.GA21398@qhe2-db>
References: <cover.1302686656.git.qing.he@intel.com>
	<b94c6ce5656dd4bd312feda0eaf2423cae505ccd.1302686656.git.qing.he@intel.com>
	<BANLkTikg2Bb8bCrnjJU3JyP0mHTYHFoRgg@mail.gmail.com>
	<20110414020059.GA21398@qhe2-db>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Apr 2011 08:23:13 -0700
Message-ID: <BANLkTi=Y454r0KQuorJM2HxUafA+Gkzmag@mail.gmail.com>
To: Qing He <qing.he@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] quilt: fix test for target build
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
X-List-Received-Date: Thu, 14 Apr 2011 15:26:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 13, 2011 at 7:00 PM, Qing He <qing.he@intel.com> wrote:
> On Wed, 2011-04-13 at 23:36 +0800, Khem Raj wrote:
>> On Wed, Apr 13, 2011 at 2:26 AM, Qing He <qing.he@intel.com> wrote:
>> > From: Qing He <qing.he@intel.com>
>> >
>> > fixes [YOCTO #969]
>> >
>> > Signed-off-by: Qing He <qing.he@intel.com>
>> > ---
>> > ??.../quilt/quilt/gnu_patch_test_fix_target.patch ?? ??| ?? 66 +++++++=
+++++++++++++
>> > ??meta/recipes-devtools/quilt/quilt_0.48.bb ?? ?? ?? ?? ??| ?? ??6 +-
>> > ??2 files changed, 70 insertions(+), 2 deletions(-)
>> > ??create mode 100644 meta/recipes-devtools/quilt/quilt/gnu_patch_test_=
fix_target.patch
>> >
>> > diff --git a/meta/recipes-devtools/quilt/quilt/gnu_patch_test_fix_targ=
et.patch b/meta/recipes-devtools/quilt/quilt/gnu_patch_test_fix_target.patc=
h
>> > new file mode 100644
>> > index 0000000..784fe76
>> > --- /dev/null
>> > +++ b/meta/recipes-devtools/quilt/quilt/gnu_patch_test_fix_target.patc=
h
>> > @@ -0,0 +1,66 @@
>> > +The test of patch and diff should not be run for cross build,
>> > +rather, assume them as gnu version is rather safe. This is a
>> > +workaround to remove it altogether.
>> > +
>>
>> why is this patch needed. I assume all linux distributions use GNU
>> diff and patch
>> and that what is being checked so why remove the checks ? these messages
>> are atleast useful for folks who are trying other build hosts e.g. darwi=
n
>
> Because patch is used at runtime rather than build time. It is used
> mainly in patch-wrapper and some other scripts.
>
> configure.ac of quilt practically doesn't differentiate them,
> this leads to problems in cross-compiling:
> =C2=A01. the QUILT_COMPAT_PROG_PATH finds the wrong patch, say we are
> =C2=A0 =C2=A0 building on darwin with a non-GNU patch, host patch found i=
n
> =C2=A0 =C2=A0 /usr/bin or /sw/bin is irrelevant, what should be tested is
> =C2=A0 =C2=A0 <target sysroot>/path/to/patch(which may not be /usr/bin), =
and
> =C2=A0 =C2=A0 then @PATCH@ should be set to a value with <target sysroot>
> =C2=A0 =C2=A0 removed.
> =C2=A02. the test is performed by running "patch --version", this obvious=
ly
> =C2=A0 =C2=A0 doesn't work for cross-compiling.
>
> The right way to do this may be something like:
> =C2=A0if test "x$cross_compiling" =3D "xyes"; then
> =C2=A0 =C2=A0AC_CHECK_PROG in target sysroot
> =C2=A0 =C2=A0PATCH=3Dstrip sysroot in the absolute path
> =C2=A0else
> =C2=A0 =C2=A0QUILT_COPAT_PROG_PATH
> =C2=A0 =C2=A0original test
> =C2=A0fi
>
> This is troublesome and error prone, since a separate SYSROOT needs to
> be handled by configure, and target patch may as well not in a standard
> path. The simplest way to do it is to remove the test, as we have
> separate recipes for quilt and quilt-native.
>
>
> The reason to touch this part of code is that the test itself doesn't
> work for newer versions of GNU patch, see:
> =C2=A0http://lists.nongnu.org/archive/html/quilt-dev/2010-06/msg00002.htm=
l
> This surely fixes the configure error, but is logically not suitable for
> cross compiling.

As I understand you are trying to fix quilt target recipe. Then may it
will be better to take the above
patch for both target and native but apply this
workaround conditionally only for target recipe

there are options --with-patch --with-diff also
there to point these utilities
>
> Thanks,
> Qing
>


