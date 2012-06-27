Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dennis.yxun@gmail.com>) id 1Sk1oT-0003xZ-UK
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 01:38:22 +0200
Received: by obcva7 with SMTP id va7so2202848obc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2012 16:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=tsLkavl+2oPuvm/F3z9ghSR/TltPMcAPR8GzoRGCxw0=;
	b=aZdfVIGgrAM/VdBImC2672BFyqyU5kNNwgYA1vzIB3rgXDWS2GRVXCQNZRjUGXMvxY
	fquRz1nvHpfxVnp5TgaQ/vFthnHP4fm4lOywvc/g8mu8phBV43ATcIAgzPjy3FKjmEpk
	eRwMdrEt2y54TVSvlKrXDHTFORF+Mq8h9tSaNcDk+dPEo+vICHCRzsFg5TxbXr61LSDl
	e1L+nDcmRNAn/pLiRqrIa+2XufjQaf5bMu3V9v28ShlhnbAtwzOdvnsFI/4VU82UOSJB
	P77KnT6jHbHrYeB4iWC74zYZKXTFxriFtFPDJDQR1QP1uKiZlnJmcHyhFPjz7Ex0yIAj
	TGgQ==
MIME-Version: 1.0
Received: by 10.182.50.103 with SMTP id b7mr22430091obo.15.1340839647394; Wed,
	27 Jun 2012 16:27:27 -0700 (PDT)
Received: by 10.182.37.134 with HTTP; Wed, 27 Jun 2012 16:27:27 -0700 (PDT)
In-Reply-To: <4FEB85CC.3030606@linux.intel.com>
References: <dennis.yxun@gmail.com>
	<1340834004-3614-1-git-send-email-dennis.yxun@gmail.com>
	<4FEB85CC.3030606@linux.intel.com>
Date: Thu, 28 Jun 2012 07:27:27 +0800
Message-ID: <CAF1ZMEfe-dGrL7JHSWHXPTJw3h2zev7b7VQxF5Acx=eQjKiC1g@mail.gmail.com>
From: "Dennis.Yxun" <dennis.yxun@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openjade-native: Use Getopt::Std in place of getopts.pl.
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
X-List-Received-Date: Wed, 27 Jun 2012 23:38:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

ok, thanks for pointing out
will cook another patch and resend as r2

On Thu, Jun 28, 2012 at 6:14 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 06/27/2012 02:53 PM, Dennis Lan wrote:
>>
>> Using Gentoo Linux as the build host, it fails without this patch
>> https://bugs.gentoo.org/show_bug.cgi?id=3D420083
>>
>> which following error:
>>
>> /usr/bin/perl -w ./../msggen.pl -l jstyleModule InterpreterMessages.msg
>> /usr/bin/perl -w ./../msggen.pl -l jstyleModule DssslAppMessages.msg
>> Undefined subroutine&main::Getopts called at ./../msggen.pl line 22.
>>
>> make[2]: *** [InterpreterMessages.h] Error 2
>> make[2]: *** Waiting for unfinished jobs....
>> Undefined subroutine&main::Getopts called at ./../msggen.pl line 22.
>>
>> make[2]: *** [DssslAppMessages.h] Error 2
>> ---
>> =C2=A0.../openjade/openjade-1.3.2/msggen.pl.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 32
>> ++++++++++++++++++++
>> =C2=A0.../openjade/openjade-native_1.3.2.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A01 +
>> =C2=A02 files changed, 33 insertions(+), 0 deletions(-)
>> =C2=A0create mode 100644
>> meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.patch
>>
>> diff --git a/meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.pat=
ch
>> b/meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.patch
>> new file mode 100644
>> index 0000000..1afe68b
>> --- /dev/null
>> +++ b/meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.patch
>
>
> The patch needs a header also, with comment, Upstream-status and
> Signed-off-by:
>
> Please see further details at:
>
> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
>
> Thanks
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Sau!
>
>> @@ -0,0 +1,32 @@
>> +Use Getopt::Std in place of getopts.pl.
>> +https://bugs.gentoo.org/show_bug.cgi?id=3D420083
>> +
>> +--- a/msggen.pl
>> ++++ b/msggen.pl
>> +@@ -4,6 +4,7 @@
>> + # See the file COPYING for copying permission.
>> +
>> + use POSIX;
>> ++use Getopt::Std;
>> +
>> + # Package and version.
>> + $package =3D 'openjade';
>> +@@ -18,8 +19,7 @@
>> + undef $opt_l;
>> + undef $opt_p;
>> + undef $opt_t;
>> +-do 'getopts.pl';
>> +-&Getopts('l:p:t:');
>> ++getopts('l:p:t:');
>> + $module =3D $opt_l;
>> + $pot_file =3D $opt_p;
>> +
>> +@@ -72,7 +72,7 @@
>> + =C2=A0 =C2=A0 else {
>> + =C2=A0 =C2=A0 =C2=A0 $field[0] =3D~ /^[IWQXE][0-9]$/ ||&error("invalid=
 first field");;
>> + =C2=A0 =C2=A0 =C2=A0 $type[$num] =3D substr($field[0], 0, 1);
>> +- =C2=A0 =C2=A0 =C2=A0$argc =3D int(substr($field[0], 1, 1));
>> ++ =C2=A0 =C2=A0 =C2=A0$argc =3D substr($field[0], 1, 1);
>> + =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 $nargs[$num] =3D $argc;
>> + =C2=A0 =C2=A0 $field[1] =3D~ /^[a-zA-Z_][a-zA-Z0-9_]+$/ ||&error("inva=
lid tag");
>> diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
>> b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
>> index 5b29c1f..efd1e11 100644
>> --- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
>> +++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
>> @@ -14,6 +14,7 @@ RDEPENDS_${PN} =3D "sgml-common-native"
>>
>> =C2=A0SRC_URI =3D "${SOURCEFORGE_MIRROR}/openjade/openjade-${PV}.tar.gz =
\
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://makefile.patch \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://msggen.pl.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://reautoconf.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://user-declared-default-construc=
tor.patch"
>>
>


