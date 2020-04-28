Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.248.1588040349737172799
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 19:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 03S2IAwl029193
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Mon, 27 Apr 2020 19:18:31 -0700
Received: from [128.224.162.131] (128.224.162.131) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Mon, 27 Apr 2020
 19:18:19 -0700
Subject: Re: [OE-core] [PATCH] pseudo: add macro guard for seccomp
To: Seebs <seebs@seebs.net>
CC: <richard.purdie@linuxfoundation.org>,
        <openembedded-core@lists.openembedded.org>
References: <20200427060416.40326-1-kai.kang@windriver.com>
 <20200427100123.1f7354f4@seebsdell>
From: "kai" <kai.kang@windriver.com>
Message-ID: <03eea4d3-b0d9-c54e-5a8a-e6d3a6126437@windriver.com>
Date: Tue, 28 Apr 2020 10:18:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427100123.1f7354f4@seebsdell>
Content-Type: multipart/alternative;
	boundary="------------5D2F5C8341941EFBC1AFE0D7"
Content-Language: en-US

--------------5D2F5C8341941EFBC1AFE0D7
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 03S2IAwl029193

On 2020/4/27 =E4=B8=8B=E5=8D=8811:01, Seebs wrote:
> On Mon, 27 Apr 2020 14:04:16 +0800
> "kai" <kai.kang@windriver.com> wrote:
>
>> | ports/linux/pseudo_wrappers.c:129:14: error:
>> =E2=80=98SECCOMP_SET_MODE_FILTER=E2=80=99 undeclared (first use in this=
 function)
>> |    if (cmd =3D=3D SECCOMP_SET_MODE_FILTER) {
> Should the test be against this being #defined, rather than the
> separate SYS__seccomp?

It keeps compliance with pre-section in this patch. The patch is to deal=
=20
with pseudo and seccomp, I suppose it is better to keep
the same with macro guard in the pre-section.

Regards,
Kai


>
> -s
>
>=20


--=20
Kai Kang
Wind River Linux


--------------5D2F5C8341941EFBC1AFE0D7
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 03S2IAwl029193

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-=
8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2020/4/27 =E4=B8=8B=E5=8D=8811:01, S=
eebs wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20200427100123.1f7354f4@seebsdel=
l">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Mon, 27 Apr 2020 14:04:16 =
+0800
"kai" <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:kai.kang@windriver=
.com">&lt;kai.kang@windriver.com&gt;</a> wrote:

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">| ports/linux/pseudo_wrappe=
rs.c:129:14: error:
=E2=80=98SECCOMP_SET_MODE_FILTER=E2=80=99 undeclared (first use in this fu=
nction)
|    if (cmd =3D=3D SECCOMP_SET_MODE_FILTER) {
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
Should the test be against this being #defined, rather than the
separate SYS__seccomp?</pre>
    </blockquote>
    <p>It keeps compliance with pre-section in this patch. The patch is
      to deal with pseudo and seccomp, I suppose it is better to keep<br>
      the same with macro guard in the pre-section.</p>
    <p>Regards,<br>
      Kai<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20200427100123.1f7354f4@seebsdel=
l">
      <pre class=3D"moz-quote-pre" wrap=3D"">

-s
</pre>
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------5D2F5C8341941EFBC1AFE0D7--
