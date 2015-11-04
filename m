Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0B1E373D46
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Nov 2015 05:57:58 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so42387442pab.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Nov 2015 21:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Ou4BPxHDG+vXAIb3mmQq1czS4PPSlLnP9+1jidFqaK8=;
	b=xppQUHvNdG7QoOiuHfNJNG5jPAGmd/DKn6QwupYQ7UfLSHZPg+kSNKakrfD3s0wgJa
	MU5bnD9YU+D/qxf0VLbNSo3ExwyJVFqSLNmHKzqaLHaEc4jZvrVPm88KFWgee3ql7F9l
	Z5Mf0j/UB81D+2G7fmbY8Lb1skV8B+1M3blBLDS+bZhTTO8uN141FSzeg/oLKDmMjBZj
	CHPbUoKAZm21WP0EHg8Nvz9ltTXjgen4VZ0OzT8BbUpGyMxivAbdzhzfq+rJwn/Ktma2
	puym5/OQq2wv01KFG7gSAjTmI48dJjqkC5GKLyZTXc5rSgyn+uBelwINL5EWOor/cSWf
	faYA==
X-Received: by 10.68.68.132 with SMTP id w4mr35135211pbt.137.1446616678734;
	Tue, 03 Nov 2015 21:57:58 -0800 (PST)
Received: from ?IPv6:2601:646:8601:4580:d569:400a:606a:dec?
	([2601:646:8601:4580:d569:400a:606a:dec])
	by smtp.gmail.com with ESMTPSA id
	qc16sm168749pab.47.2015.11.03.21.57.57
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Nov 2015 21:57:57 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3106\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <56387CE7.5040907@windriver.com>
Date: Tue, 3 Nov 2015 21:57:51 -0800
Message-Id: <6A9FCF09-82E7-4A16-AEDD-D081F67704E7@gmail.com>
References: <1446445418-31492-1-git-send-email-jian.liu@windriver.com>
	<CAMKF1sqBfdSMphfZJ_O3nEd3cMA7A=5tKa2Xu0wGUsSr-HtuNg@mail.gmail.com>
	<56387CE7.5040907@windriver.com>
To: Jian Liu <jian.liu@windriver.com>
X-Mailer: Apple Mail (2.3106)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] archiver.bbclass: do checkout for kernel
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
X-List-Received-Date: Wed, 04 Nov 2015 05:57:59 -0000
X-Groupsio-MsgNum: 72864
Content-Type: multipart/signed;
	boundary="Apple-Mail=_90624324-9737-4753-B9BC-A34643463BAA";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_90624324-9737-4753-B9BC-A34643463BAA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Nov 3, 2015, at 1:22 AM, Jian Liu <jian.liu@windriver.com> wrote:
>=20
> Hi,
>=20
> I test linux-dummy linux-yocto-dev linux-yocto-rt linux-yocto-tiny and =
the result is as follows,
>=20
> linux-dummy: this package just meets some dependency and there is no =
source code for it.
>                      The patch does not impact it
> linux-yocto, linux-yocto-dev, linux-yocto-rt, linux-yocto-tiny: The S =
variable of all packages is set to STAGING_KERNEK_DIR.
>                       do_fetch and do_unpack just leave a bare git =
repo of kernel and do_kernel_checkout gets the source code
>=20

does it cover the case when kernel is not linux-yocto was basic =
question, I am not clear if thats covered in any of above

> Thanks!
> Jian
>=20
> On 2015=E5=B9=B411=E6=9C=8803=E6=97=A5 05:30, Khem Raj wrote:
>> On Sun, Nov 1, 2015 at 10:23 PM, Jian Liu <jian.liu@windriver.com> =
wrote:
>>> The repo of kernel is bare git repository and we need to checkout to =
get
>>> the source code.
>> it should be linux-yocto I think, or do we have all kernels as bare =
git repos ?
>>=20
>>> Signed-off-by: Jian Liu <jian.liu@windriver.com>
>>>=20
>>> diff --git a/meta/classes/archiver.bbclass =
b/meta/classes/archiver.bbclass
>>> index 41a552c..7387fbf 100644
>>> --- a/meta/classes/archiver.bbclass
>>> +++ b/meta/classes/archiver.bbclass
>>> @@ -66,6 +66,11 @@ python () {
>>>      ar_recipe =3D d.getVarFlag('ARCHIVER_MODE', 'recipe', True)
>>>=20
>>>      if ar_src =3D=3D "original":
>>> +        # For kernel, it is bare repo, we need to checkout
>>> +        if bb.data.inherits_class('kernel-yocto', d):
>>> +            bb.build.addtask('do_ar_original', =
'do_kernel_metadata', 'do_validate_branches', d)
>>> +        else:
>>> +            bb.build.addtask('do_ar_original', None, 'do_unpack', =
d)
>>>          d.appendVarFlag('do_deploy_archives', 'depends', ' =
%s:do_ar_original' % pn)
>>>      elif ar_src =3D=3D "patched":
>>>          d.appendVarFlag('do_deploy_archives', 'depends', ' =
%s:do_ar_patched' % pn)
>>> @@ -113,6 +118,12 @@ python do_ar_original() {
>>>=20
>>>      ar_outdir =3D d.getVar('ARCHIVER_OUTDIR', True)
>>>      bb.note('Archiving the original source...')
>>> +    # For kernel, the source code is shared
>>> +    if bb.data.inherits_class('kernel-yocto', d):
>> is this linux-yocto specific
>>=20
>>> +        srcdir =3D d.getVar('S', True)
>>> +        create_tarball(d, srcdir, 'original', ar_outdir)
>>> +        return
>>> +
>>>      fetch =3D bb.fetch2.Fetch([], d)
>>>      for url in fetch.urls:
>>>          local =3D fetch.localpath(url).rstrip("/");
>>> @@ -346,7 +357,6 @@ python do_deploy_archives_setscene () {
>>>  do_deploy_archives[sstate-inputdirs] =3D "${ARCHIVER_TOPDIR}"
>>>  do_deploy_archives[sstate-outputdirs] =3D "${DEPLOY_DIR_SRC}"
>>>=20
>>> -addtask do_ar_original after do_unpack
>>>  addtask do_ar_patched after do_unpack_and_patch
>>>  addtask do_ar_configured after do_unpack_and_patch
>>>  addtask do_dumpdata
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20
>=20


--Apple-Mail=_90624324-9737-4753-B9BC-A34643463BAA
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlY5nmQACgkQuwUzVZGdMxRGKgCfajiL51q12YjPzOcce/0tr8DI
daAAnROeczxYCVDjlAb9ZS1FvKomrQl5
=3Go7
-----END PGP SIGNATURE-----

--Apple-Mail=_90624324-9737-4753-B9BC-A34643463BAA--
