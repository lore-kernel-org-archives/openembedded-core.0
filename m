Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QEmP9-0002cA-Qa
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Apr 2011 19:50:31 +0200
Received: by ewy5 with SMTP id 5so281796ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2011 10:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=MFZIRdMxVW86LSSAGuea1cd6+4P1I9DjI/wE/5QlOvw=;
	b=ogyc/V5KrLBGUWdiqAdpUMGb2QkETg7IQPprOxFnJ2ycjSt1oqPYmxxkkJaYSRq5SG
	gkPfmq9u0XzVsp3JZF/eJGgr82PpDtqE0GWoifWizYRolz/VCYysF6xjZOgRAel1/KWf
	e+nzivNXo0MbJl7mAGji31L0USbuZlDEopvag=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=XZBK+kgEDEFAQmOa1pyHHlk7yI9PEFWaKjkR93cHiqd5o9fBnzHVc788r49oZ7Vqp4
	HHegDZJrZxo2odBnMkBKb3X+d/e86NGUga8wbziGMNZ7LjCpQ7XIUXguczbvj4eQdjYj
	YfGPzly5MLPIsFTuL8iJgzBLkIjKQYnb1W3DU=
Received: by 10.14.34.88 with SMTP id r64mr509470eea.77.1303840081342; Tue, 26
	Apr 2011 10:48:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Tue, 26 Apr 2011 10:47:30 -0700 (PDT)
In-Reply-To: <4DB6F055.7010505@linux.intel.com>
References: <cover.1303757256.git.raj.khem@gmail.com>
	<e5c0091a01641a3a2b55321cf5b4a5a9e91ef8e5.1303757256.git.raj.khem@gmail.com>
	<4DB6F055.7010505@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Apr 2011 10:47:30 -0700
Message-ID: <BANLkTi=ugN3zEb-B6VoRr9ZFhbt1RZhVaA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/17] perl_5.12.2.bb: Undefine features not found in uclibc
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
X-List-Received-Date: Tue, 26 Apr 2011 17:50:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 26, 2011 at 9:18 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 04/25/2011 11:55 AM, Khem Raj wrote:
>>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> ---
>> =C2=A0.../perl/perl-5.12.2/native-ssp.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 16
>> ----------------
>> =C2=A0meta/recipes-devtools/perl/perl_5.12.2.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 16
>> ++++++++++++++++
>> =C2=A02 files changed, 16 insertions(+), 16 deletions(-)
>> =C2=A0delete mode 100644
>> meta/recipes-devtools/perl/perl-5.12.2/native-ssp.patch
>>
> Khem,
>
> Looking further at this patch, what affects will removing these features
> have on LSB for example?
>
> What's the bigger affect of removing the stack-protector flags, in the
> do_configure?
>

No effect. Patch was not applied. It is useless to keep unapplied
patches. and the real changes are only for uclibc based targets
so it has no effect for eglibc builds

> Sau!
>
>
>> diff --git a/meta/recipes-devtools/perl/perl-5.12.2/native-ssp.patch
>> b/meta/recipes-devtools/perl/perl-5.12.2/native-ssp.patch
>> deleted file mode 100644
>> index e1e6f08..0000000
>> --- a/meta/recipes-devtools/perl/perl-5.12.2/native-ssp.patch
>> +++ /dev/null
>> @@ -1,16 +0,0 @@
>> -Upstream-Status:Inappropriate [embedded specific]
>> -
>> -Fix for compiling with ssp enabled gcc:
>> -See http://bugs.openembedded.net/show_bug.cgi?id=3D1980
>> -
>> -diff -Naur perl-5.8.7.orig/cflags.SH perl-5.8.7/cflags.SH
>> ---- perl-5.8.7.orig/cflags.SH =C2=A02002-09-30 10:59:07.000000000 +0000
>> -+++ perl-5.8.7/cflags.SH =C2=A0 =C2=A0 =C2=A0 2005-10-02 04:08:39.00000=
0000 +0000
>> -@@ -165,6 +165,8 @@
>> - esac
>> -
>> - =C2=A0 =C2=A0 : Can we perhaps use $ansi2knr here
>> -+ =C2=A0 =C2=A0[[ $file =3D=3D regcomp ]]&& =C2=A0export ccflags=3D"${c=
cflags}
>> -fno-stack-protector"
>> -+ =C2=A0 =C2=A0[[ $file =3D=3D regexec ]]&& =C2=A0export ccflags=3D"${c=
cflags}
>> -fno-stack-protector"
>> - =C2=A0 =C2=A0 echo "$cc -c -DPERL_CORE $ccflags $optimize $warn"
>> - =C2=A0 =C2=A0 eval "$also "'"$cc -DPERL_CORE -c $ccflags $optimize $wa=
rn"'
>> diff --git a/meta/recipes-devtools/perl/perl_5.12.2.bb
>> b/meta/recipes-devtools/perl/perl_5.12.2.bb
>> index 9ce8156..b841e7d 100644
>> --- a/meta/recipes-devtools/perl/perl_5.12.2.bb
>> +++ b/meta/recipes-devtools/perl/perl_5.12.2.bb
>> @@ -131,6 +131,12 @@ do_configure() {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 -e "s,\(getnetent_r_proto=3D\)'\w+',\1'0',g" \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 -e "s,\(d_sockatmark=3D\)'define',\1'undef',g" \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 -e "s,\(d_sockatmarkproto=3D\)'\w+',\1'0',g" \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -e "s,\(d_eaccess=3D\)'define',\1'undef',g" \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -e "s,\(d_stdio_ptr_lval=3D\)'define',\1'undef',g" \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -e
>> "s,\(d_stdio_ptr_lval_sets_cnt=3D\)'define',\1'undef',g" \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -e "s,\(d_stdiobase=3D\)'define',\1'undef',g" \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -e "s,\(d_stdstdio=3D\)'define',\1'undef',g" \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -e "s,-fstack-protector,-fno-stack-protector,g" \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0config.sh-${TARGET_ARCH}-${TARGET_OS}
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>>
>> @@ -145,6 +151,16 @@ do_configure() {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e 's,/perl5,/perl,g' \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config.sh-${TARGET_ARCH}=
-${TARGET_OS}
>>
>> + =C2=A0 =C2=A0 =C2=A0 case "${TARGET_ARCH}" in
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0x86_64 | powerp=
c | s390)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0sed -i -e
>> "s,\(need_va_copy=3D\)'undef',\1'define',g" \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config.sh-${TARGET_ARCH}-${TARGET_=
OS}
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0;;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arm)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0sed -i -e "s,\(d_u32align=3D\)'undef',\1'define',g"
>> \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config.sh-${TARGET_ARCH}-${TARGET_=
OS}
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0;;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0esac
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# These are strewn all over the source=
 tree
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for foo in `grep -I -m1 \/usr\/include=
\/.*\\.h ${WORKDIR}/* -r |
>> cut -f 1 -d ":"` ; do
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo Fixing: $foo
>


