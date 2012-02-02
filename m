Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Rt1Ud-00066V-SC
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 19:34:48 +0100
Received: by qcso7 with SMTP id o7so1512361qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2012 10:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=aCuVNNpm0c3ghuBYqwYQUgfOlIyI+w7v4Cp9ARnPMYg=;
	b=GOh/uI7uW9tsfgUOHrKzqzj8DMOUSbvQDp3RbC+ywTOVZMpHqnOh6DhM9/KTxK3lEM
	wpaGdHR1jRKP/jF4S8C8WwciCg6X04dIdTHFax4HNajRKsQNRasHk7KPfPP3UB2PZggB
	SbMNx9lqI+ylvf8mArNGBfUPa96KvT+bSJGX0=
Received: by 10.229.78.135 with SMTP id l7mr1496790qck.113.1328207211219; Thu,
	02 Feb 2012 10:26:51 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.95.207 with HTTP; Thu, 2 Feb 2012 10:26:31 -0800 (PST)
In-Reply-To: <20120128202132.GD22106@sakrah.homelinux.org>
References: <cover.1327684024.git.chris_larson@mentor.com>
	<50e4e429330f8b48ef84eda03deffe87fd6c01b1.1327684024.git.chris_larson@mentor.com>
	<20120128202132.GD22106@sakrah.homelinux.org>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 2 Feb 2012 11:26:31 -0700
X-Google-Sender-Auth: _vC0rBRck6swvMn3882dPigZdfc
Message-ID: <CABcZANmgYHQBy1OYb+k_VuFxgshyZyAG5FYfGeUD7ww52QZ7dQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 02/10] eglibc-package.inc: don't include debug files in -pic
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
X-List-Received-Date: Thu, 02 Feb 2012 18:34:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 28, 2012 at 1:21 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On (27/01/12 11:13), Christopher Larson wrote:
>> From: Christopher Larson <chris_larson@mentor.com>
>>
>> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>> ---
>> =C2=A0meta/recipes-core/eglibc/eglibc-package.inc | =C2=A0 =C2=A02 +-
>> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-=
core/eglibc/eglibc-package.inc
>> index e5a9b9d..870b95d 100644
>> --- a/meta/recipes-core/eglibc/eglibc-package.inc
>> +++ b/meta/recipes-core/eglibc/eglibc-package.inc
>> @@ -42,7 +42,7 @@ FILES_libcidn${PKGSUFFIX} =3D "${base_libdir}/libcidn-=
*.so ${base_libdir}/libcidn.
>> =C2=A0FILES_libmemusage${PKGSUFFIX} =3D "${base_libdir}/libmemusage.so"
>> =C2=A0FILES_eglibc-extra-nss${PKGSUFFIX} =3D "${base_libdir}/libnss_*-*.=
so ${base_libdir}/libnss_*.so.*"
>> =C2=A0FILES_sln${PKGSUFFIX} =3D "/sbin/sln"
>> -FILES_${PN}-pic =3D "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/li=
bc_pic/"
>> +FILES_${PN}-pic =3D "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/li=
bc_pic/*.o"
>
> are there just .o in there which are left ? not *.os ?

I don't see any .os in libc_pic in either the packages from the eglibc
recipe from oe-core or the external csl toolchain.
--=20
Christopher Larson


