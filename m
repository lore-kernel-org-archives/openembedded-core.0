Return-Path: <rich@richelberger.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C73C636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 13:16:40 +0000 (UTC)
Received: from a11-70.smtp-out.amazonses.com (a11-70.smtp-out.amazonses.com [54.240.11.70])
 by mx.groups.io with SMTP id smtpd.web10.12443.1676898994949843075
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 05:16:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@richelberger.com header.s=5u2mht5g5nbgnd5xxu4iibla5zobc5bd header.b=rzfRLij/;
 spf=pass (domain: amazonses.com, ip: 54.240.11.70, mailfrom: 010001866ef8069e-ee6f258b-8c1d-4479-97be-12f07e22df02-000000@amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=5u2mht5g5nbgnd5xxu4iibla5zobc5bd; d=richelberger.com;
	t=1676898994;
	h=Subject:From:To:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id;
	bh=p1S6LFi251WwE4ZqZ7qSPeJmTv4FfxCD+gqquDMDNqE=;
	b=rzfRLij/b/5GgFN+Mif2J0IPeyoTeF031eyRRUEV8GOYR0S+RhcsdhEFQdT5qL3d
	uXk8VlaYFzNOtGvd/UGcP5uMN5hLrRyUeTqq6cicmeqPV6MYc9nuGxe1olFtZRt+J9O
	XgS9zxQ13dVG8t9lxhKI+FfKho1a7dhGqaSt6Lcs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1676898994;
	h=Subject:From:To:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id:Feedback-ID;
	bh=p1S6LFi251WwE4ZqZ7qSPeJmTv4FfxCD+gqquDMDNqE=;
	b=LTuufHuCPIjBjBi62FTs7Hrw+rISaaympxyFEmSDPwDWF3P0da1gqU4zc1Uw+UkO
	z+CddD6zVdX5ACcS5Dw4pPiES509An69aQYTUaXwx0PT7puyJE4XO7It+MAC9gRrnwi
	gi0gBp4Z9bYbcj/L6JT12EqNvUjmWgqOHbVxZW+I=
Subject: Re: [OE-core] [PATCH 1/2] [YOCTO #13270] Refactor the docbook-xml
 recipe to use docbook.org packages rather than hacked up debian package
From: =?UTF-8?Q?Richard_Elberger?= <rich@richelberger.com>
To: =?UTF-8?Q?Richard_Purdie?= <richard.purdie@linuxfoundation.org>, 
 =?UTF-8?Q?openembedded-core=40lists=2Eopenembedded=2Eorg?=
  <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Feb 2023 13:16:33 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
In-Reply-To: 
 <fc03a41ca8542e5f7f83e828f310f57ea8ff1209.camel@linuxfoundation.org>
References: <20230219213807.3415938-1-rich@richelberger.com> 
 <010001866b9cf531-82d2c73e-d459-4055-93f9-a7c83fcce6f9-000000@email.amazonses.com> 
 <fc03a41ca8542e5f7f83e828f310f57ea8ff1209.camel@linuxfoundation.org> 
 <986ef4b3-c87c-7342-045d-dc920b4e2680@richelberger.com>
X-Mailer: Amazon WorkMail
Thread-Index: AQHZRKp3Rd+89yRvQFycCVf28l/dgwAghC9UACDFYKo=
Thread-Topic: [OE-core] [PATCH 1/2] [YOCTO #13270] Refactor the docbook-xml
 recipe to use docbook.org packages rather than hacked up debian package
X-Wm-Sent-Timestamp: 1676898992
Message-ID: <010001866ef8069e-ee6f258b-8c1d-4479-97be-12f07e22df02-000000@email.amazonses.com>
Feedback-ID: 1.us-east-1.LF00NED762KFuBsfzrtoqw+Brn/qlF9OYdxWukAhsl8=:AmazonSES
X-SES-Outgoing: 2023.02.20-54.240.11.70
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 13:16:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177402

Thank you for the additional tips. This morning I was trying to close=20=0D=
=0Aout the asks from yesterday. I was about to submit yet again and then =
I=20=0D=0Asaw your message :D. I will need to try to get to the additiona=
l asks=20=0D=0Athis evening instead given the workday is about to begin f=
ull on.=0D=0A=0D=0AOn 2/20/23 08:09, Richard Purdie wrote:=0D=0A> Hi Rich=
ard,=0D=0A>=0D=0A> Thanks for the patch!=0D=0A>=0D=0A> There are a few th=
ings that need tweaking. Firstly, the shortlog and=0D=0A> commit log aren=
't quite right. The shortlog needs to be along the lines=0D=0A> of:=0D=0A=
>=0D=0A> <area/recipename>: <short summary of the change>=0D=0A>=0D=0A> s=
o something like:=0D=0A>=0D=0A> docbook-xml: Switch from debian packages =
to upstream docbook sources=0D=0A>=0D=0A> This means someone glancing at =
the shortlogs can know which area it=0D=0A> applies to and what it was ab=
out (in summary).=0D=0A>=0D=0A> After this you'd have a more verbose log =
message and I usually put the=0D=0A> [YOCTO #13270] at the end on a line =
of it's own.=0D=0A>=0D=0A> I've commented a little more below inline.=0D=0A=
>=0D=0A> I think 4.0 support was removed, if so, that should be mentioned=
 in the=0D=0A> commit message log. I then noticed the note about that is =
in the other=0D=0A> commit, it should be in this one!=0D=0A>=0D=0A> On Su=
n, 2023-02-19 at 21:38 +0000, Richard Elberger wrote:=0D=0A>> ---=0D=0A>>=
   .../docbook-xml/docbook-xml-dtd4_4.5.bb       | 74 ++++++++++++-------=
=0D=0A>>   1 file changed, 49 insertions(+), 25 deletions(-)=0D=0A>>=0D=0A=
>> diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb=
 b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4.5.bb=0D=0A>> inde=
x 2bec1442af..71aa8c14ec 100644=0D=0A>> --- a/meta/recipes-devtools/docbo=
ok-xml/docbook-xml-dtd4_4.5.bb=0D=0A>> +++ b/meta/recipes-devtools/docboo=
k-xml/docbook-xml-dtd4_4.5.bb=0D=0A>> @@ -1,30 +1,54 @@=0D=0A>>   SUMMARY=
 =3D "Document type definitions for verification of XML data files"=0D=0A=
>>   DESCRIPTION =3D "Document type definitions for verification of XML d=
ata \=0D=0A>> -files against the DocBook rule set, it ships with the late=
st DocBook 4.5 \=0D=0A>> -XML DTD, as well as a selected set of legacy DT=
Ds for use with older \=0D=0A>> -documents, including 4.0, 4.1.2, 4.2, 4.=
3 and 4.4"=0D=0A>> -HOMEPAGE =3D "http://www.docbook.org/xml/"=0D=0A>> +f=
iles against the DocBook rule set."=0D=0A>> +HOMEPAGE =3D "https://docboo=
k.org"=0D=0A>>  =20=0D=0A>> -LICENSE =3D "OASIS"=0D=0A>> -LIC_FILES_CHKSU=
M =3D "file://${WORKDIR}/LICENSE-OASIS;md5=3Dc608985dd5f7f215e669e7639a0b=
1d2e"=0D=0A>> +inherit allarch=0D=0A>> +BBCLASSEXTEND =3D "native"=0D=0A>=
 BBCLASSEXTEND by concention is at the end of the recipe. I see it moves=0D=
=0A> in the second patch and it wasn't clear what the two different purpo=
ses=0D=0A> of the patch were. Style fixes are ok as patch but if the firs=
t patch=0D=0A> is introducing them, we may as well squash things=3F=0D=0A=
>> -# Note: the upstream sources are not distributed with a license file.=
=0D=0A>> -# LICENSE-OASIS is included as a "patch" to workaround this. Wh=
en=0D=0A>> -# upgrading this recipe, please verify whether this is still =
needed.=0D=0A>> -SRC_URI =3D "http://snapshot.debian.org/archive/debian/2=
0160728T043443Z/pool/main/d/docbook-xml/docbook-xml_${PV}.orig.tar.gz \=0D=
=0A>> -           file://LICENSE-OASIS \=0D=0A>> -           file://docbo=
ok-xml-update-catalog.xml.patch \=0D=0A>> -"=0D=0A>> +# To support apps w=
ith xml schema backward compatibility, we must=0D=0A>> +# install a set o=
f schemas. Install the latest based on PV and then=0D=0A>> +# name any sp=
ecific versions as required. TODO: Figure out a mechanism=0D=0A>> +# to f=
ilter exactly which versions are necessary, if that's even=0D=0A>> +# pos=
sible.=0D=0A>> +#=0D=0A>> +# DocBook.org lists available packages at http=
s://docbook.org/xml/=0D=0A>> +#=0D=0A>> +# These packages are available a=
s source but it requires the ability=0D=0A>> +# to use the Gradle build s=
ystem to do so. It might be safer to use=0D=0A>> +# the source tree which=
 would also enable proper SBOM generation=0D=0A>> +# through the bitbake =
build system. https://github.com/docbook/docbook=0D=0A> "packages" is an =
overloaded term. Do you mean packages here=3F Components=0D=0A> maybe=3F=0D=
=0A>=0D=0A>> +#=0D=0A>>  =20=0D=0A>> -SRC_URI[md5sum] =3D "487b4d44e15cff=
b1f4048af23f98208e"=0D=0A>> -SRC_URI[sha256sum] =3D "b0f8edcf697f5318e63d=
d98c9a931f3fee167af0805ba441db372e0f17b2a44f"=0D=0A>> +S =3D "${WORKDIR}"=
=0D=0A>>  =20=0D=0A>> -UPSTREAM_CHECK_URI =3D "${DEBIAN_MIRROR}/main/d/do=
cbook-xml/"=0D=0A>> +SRC_URI +=3D "https://docbook.org/xml/4.1.2/docbkx41=
2.zip;name=3Dpayload412;subdir=3Ddocbook-xml-4.1.2"=0D=0A>> +SRC_URI[payl=
oad412.md5sum] =3D "900d7609fb7e6d78901b357e4acfbc17"=0D=0A> We've effect=
ively dropped md5sums so there is no need to add new ones.=0D=0A>=0D=0A> =
Cheers,=0D=0A>=0D=0A> Richard=0D=0A

