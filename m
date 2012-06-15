Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SfXlz-0008M3-PZ
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 16:45:15 +0200
Received: by eekd49 with SMTP id d49so959595eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 07:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=wAFruWJa/2AkoWMdqPaWcgE41U8ZQRnJjmIsW3lvJa8=;
	b=Sl/t4UZvNvxvp4K7y+XGQJtm7Nm/K5BrgKz6Z/T8nE46tKlAX9olANZaVeHvMMuggK
	Pbd4W9xNWJM+iVCFiFDc1nFnVQtfcghYS2L4LR5hvJqRemIYteF1SlGpuK4nIWxCBtvf
	pbc/12mrWs0fAEclD+a36yRhEWQvnxE18U3zpOdhWrLZmzrmDBnVH5bUD54zA+4jSl5p
	bm5ayOF/W9TKfzc8BIF5OCitikjTwChaiPq/aI+KoTLiWDxyw5GMgdDYsdjwi6/9kcmW
	fLqDODlcinNupGhF2CIrlTh4tNlwvQ6e2daKsk2JS7PxfKi/DH+qqBQmlfK+5NdwzgTq
	U8xg==
Received: by 10.14.97.135 with SMTP id t7mr1413409eef.177.1339770877284; Fri,
	15 Jun 2012 07:34:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Fri, 15 Jun 2012 07:34:06 -0700 (PDT)
In-Reply-To: <1339764210.24333.114.camel@ted>
References: <1366d81a5719e42af8bf24d46b86352491fc0e67.1339740433.git.raj.khem@gmail.com>
	<1f0884d8428c923c1b18670877c85cb3dc09cfda.1339740433.git.raj.khem@gmail.com>
	<1339764210.24333.114.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Jun 2012 07:34:06 -0700
Message-ID: <CAMKF1srejEP1B70=CEyG66RFyVMgY-TDzs0G_aUyTQaV=3u4=A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/9] rpm: Use link time check for libssp
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
X-List-Received-Date: Fri, 15 Jun 2012 14:45:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 15, 2012 at 5:43 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2012-06-14 at 23:12 -0700, Khem Raj wrote:
>> -fstack-protector needs libssp to link with
>> so when checking for this option support we
>> need to find if libssp is staged in root file
>> system
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0.../rpm/rpm/fstack-protector-configure-check.patch | =C2=A0 13 +++=
++++++++++
>> =C2=A0meta/recipes-devtools/rpm/rpm_5.4.9.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | =C2=A0 =C2=A01 +
>> =C2=A02 files changed, 14 insertions(+), 0 deletions(-)
>> =C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/fstack-protector-=
configure-check.patch
>>
>> diff --git a/meta/recipes-devtools/rpm/rpm/fstack-protector-configure-ch=
eck.patch b/meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.=
patch
>> new file mode 100644
>> index 0000000..84d0430
>> --- /dev/null
>> +++ b/meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.pat=
ch
>
>
> This is a rather subtle patch with no header information (author,
> explaination, upstream status).


oversight on my part. I have added a patch header to it and updated
the pull request.

>
> Cheers,
>
> Richard
>
>> @@ -0,0 +1,13 @@
>> +Index: rpm-5.4.0/configure.ac
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- rpm-5.4.0.orig/configure.ac =C2=A0 =C2=A0 =C2=A02012-06-01 11:41:19=
.741480143 -0700
>> ++++ rpm-5.4.0/configure.ac =C2=A0 2012-06-01 11:41:51.773481676 -0700
>> +@@ -193,7 +193,7 @@
>> + =C2=A0my_save_cflags=3D"$CFLAGS"
>> + =C2=A0CFLAGS=3D$c
>> + =C2=A0AC_MSG_CHECKING([whether GCC supports $c])
>> +- AC_COMPILE_IFELSE([AC_LANG_PROGRAM([])],
>> ++ AC_LINK_IFELSE([AC_LANG_PROGRAM([])],
>> + =C2=A0 =C2=A0 [AC_MSG_RESULT([yes])]
>> + =C2=A0 =C2=A0 [my_cflags=3D$c],
>> + =C2=A0 =C2=A0 [AC_MSG_RESULT([no])]
>> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devto=
ols/rpm/rpm_5.4.9.bb
>> index 404916a..ccf015a 100644
>> --- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
>> +++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
>> @@ -74,6 +74,7 @@ SRC_URI =3D "http://www.rpm5.org/files/rpm/rpm-5.4/rpm=
-5.4.9-0.20120508.src.rpm;ex
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://rpm-pkgconfigdeps.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://uclibc-support.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://rpmatch.patch \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fstack-protector-configure-check.pat=
ch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>>
>> =C2=A0SRC_URI[md5sum] =3D "60d56ace884340c1b3fcac6a1d58e768"
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


