Return-Path: <brandon@rascalmicro.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 01A5360656
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 20:25:35 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id y14so804858pdi.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 13:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:date:message-id:subject:from:to
	:content-type:x-gm-message-state;
	bh=ITj6hdZOWm0Va9AEOXBnSfJ2IAwrgIplijMG2vQmFgg=;
	b=KkSUlzx8bo4XfreJsIGx/0R8tnVtY+BF/FNWbVdjhqIf6kRV1A4A+nA3/bQHo7QNOE
	GqURWCEJHut/8mOi8jO1tRKG7+l3O6Gk3NpopvkJmd2XO2IF7WpzBq7nDD+SebrHT2CT
	z1iOCG1wKYp2pAJ9sKCu4B8nIQC6LGoTBZ9EoHyna6hhg9o21L3cAkrujWuuOS5tHBVV
	w8zMitxJQfb2kEx8f3Qwk9v2MoQVFCR1ecTIoupiAu8+k6wdAaPJrrgINhl8ijAutVYZ
	+nINrNrQY0osIma66DEqx2Bso4QAksqhpWIdZKDmL6nBQ9apY9HfjwtwuPI5x3PHaPwE
	vsxQ==
MIME-Version: 1.0
X-Received: by 10.68.223.225 with SMTP id qx1mr43915861pbc.157.1374697536609; 
	Wed, 24 Jul 2013 13:25:36 -0700 (PDT)
Received: by 10.68.62.194 with HTTP; Wed, 24 Jul 2013 13:25:36 -0700 (PDT)
X-Originating-IP: [146.115.15.122]
Date: Wed, 24 Jul 2013 16:25:36 -0400
Message-ID: <CA+b4E8z+1_okUN0-JhDoc50FoLLM=3+WUxai1BtyyCLRVkmy9Q@mail.gmail.com>
From: Brandon Stafford <brandon@rascalmicro.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmsbxnPsH6u80lCu2LoEkCxqAplwH5abPW6+50QL+oFVgntElWNxrvyN725wBX+Ntj7uaoa
Subject: Making SSL headers available during build?
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
X-List-Received-Date: Wed, 24 Jul 2013 20:25:36 -0000
Content-Type: multipart/alternative; boundary=047d7b16051557f17c04e247b64b

--047d7b16051557f17c04e247b64b
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

I'm working on updating an old recipe for uWSGI to add SSL support. I think
this requires putting a collection of SSL headers in
sysroots/ARCH/usr/include.

How do I go about telling Bitbake to do that?

If it helps, my current recipe is here:
https://github.com/rascalmicro/openembedded-rascal/blob/rascal/recipes/uwsgi/uwsgi_1.9.14.bb

Thanks.

-- 
Brandon Stafford
Rascal Micro: small computers for art and science
Somerville, MA, USA

--047d7b16051557f17c04e247b64b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>I&#39;m working on updating an =
old recipe for uWSGI to add SSL support. I think this requires putting a co=
llection of SSL headers in sysroots/ARCH/usr/include.</div><div><br></div>
<div>How do I go about telling Bitbake to do that?</div><div><br></div><div=
>If it helps, my current recipe is here:=A0<a href=3D"https://github.com/ra=
scalmicro/openembedded-rascal/blob/rascal/recipes/uwsgi/uwsgi_1.9.14.bb">ht=
tps://github.com/rascalmicro/openembedded-rascal/blob/rascal/recipes/uwsgi/=
uwsgi_1.9.14.bb</a></div>
<div><br></div><div>Thanks.<br clear=3D"all"><div><br></div>-- <br><div>Bra=
ndon Stafford</div><div>Rascal Micro: small computers for art and science</=
div><div>Somerville, MA, USA</div>
</div></div>

--047d7b16051557f17c04e247b64b--
