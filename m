Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2DD32771E7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 08:33:06 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i5so1666389wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2016 01:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=37EURexSwzi4C8Bki8QPaCBdg7N57OY0u+aqufuLV/8=;
	b=HdiHkm+qDgjYoyf47BHV/2Hn/eQW9NPZgznJqG8jVhYNoPMCcdVXAihM2wArNwC8tM
	hCyKUzh1YDLCnqdyP+qY8K7yAAUfypIAcacTauAKpfYtWR/esddE6e6CFmyNC1rHc91t
	YxkPN5LY6lMeIjudBvJhJWBbaDdWSMH4aVpOzelTcPk/UcH1FnQ0q5MmCn7vDuCoihT/
	pN3M+L2efaJIOHemmyN7eoHsTBOOz69QAqh3oS7Q+Vp2W5pqiiNAtiHwxgvgcAgQV5d+
	4ix8/crknqcpc0JHOP5W7SWzamaOxe0EzVwFBMLBpbbYWIPzFO6Qs9EO1Zrli/+Wz4xs
	llFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=37EURexSwzi4C8Bki8QPaCBdg7N57OY0u+aqufuLV/8=;
	b=OCW74GJB+IE2T8lCNzWYIqkcyCPrq5dflax5jNPK9EwLroD53ejjyp0mbc5PZa2n3O
	U4AjnhEkroQGSznPxYlx4Y2DspdSxu0MPX/Hweu3EkG45vuJm5F7n+xnKHCSsU0BDP+A
	0/2H5oKHWa9KJVul6JOWTR8uNCYPaYNwL4z4zHeK25EKNNr4Qz1HL/Hx700UKEyeQelx
	ro5kNFjD3ilfUFPWcNSvIAYYu1LWqvCscHqksBl+OsHZBNiKlhznF0YZxklc0c6QeNJH
	06K3Oz8tTganOm7MFBHivAb1TTd+uZZNW/Tmbich5nlpjFdaI6CeCWJ+z8CL94prEhLD
	wF7A==
X-Gm-Message-State: AEkoousXCPN8q55UsRLXsLtpqkvvlnSXOgmQdH6k7KDKODhz2DjS5Z7FtqkVOCLo/vFC+w==
X-Received: by 10.25.44.84 with SMTP id s81mr24539950lfs.156.1470731586331;
	Tue, 09 Aug 2016 01:33:06 -0700 (PDT)
Received: from [100.96.56.24] (m77-218-224-24.cust.tele2.se. [77.218.224.24])
	by smtp.gmail.com with ESMTPSA id
	k63sm6408745lfe.48.2016.08.09.01.33.05
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Aug 2016 01:33:05 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Liu Ming <liu.ming50@gmail.com>
X-Mailer: iPhone Mail (13F69)
In-Reply-To: <57A98D3E.70106@windriver.com>
Date: Tue, 9 Aug 2016 10:33:04 +0200
Message-Id: <453A6F14-E123-4046-B72A-26A04329A1B9@gmail.com>
References: <1470729188-24979-1-git-send-email-liu.ming50@gmail.com>
	<57A98D3E.70106@windriver.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xmlto: adds libxslt to DEPENDS
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
X-List-Received-Date: Tue, 09 Aug 2016 08:33:07 -0000
Content-Type: text/plain;
	charset=gb2312
Content-Transfer-Encoding: quoted-printable



> =D4=DA 2016=C4=EA8=D4=C29=C8=D5=A3=AC=C9=CF=CE=E79:58=A3=ACRobert Yang <li=
ezhi.yang@windriver.com> =D0=B4=B5=C0=A3=BA
>=20
> Hi Ming,
>=20
> I sent a similar patch yesterday:
>=20
> [OE-core] [PATCH 0/1] xmlto: fix depends for native
>=20
> http://cgit.openembedded.org/openembedded-core-contrib/commit/?h=3Drbt/xml=
&id=3D0b7f903f8c74204bb48cc74ce1a6957534ac9ede

Arha, sorry, I have not checked OE mails(for a long time), so we can ignore m=
y commit.

//Ming Liu
>=20
> // Robert
>=20
>> On 08/09/2016 03:53 PM, Ming Liu wrote:
>> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>>=20
>> The native libxslt-bin is needed by xmlto-native, but it's not in either
>> DEPENDS or RDEPENDS of native xmlto.
>>=20
>> This fixes a following error per test:
>> | xmlto: Can't continue, xsltproc tool not found or not executable.
>> | make[2]: *** [/mnt/OE/build/tmp-glibc/work/qemux86-oe-linux/perf/1.0-r9=
/perf-1.0/perf-annotate.1] Error 3
>> | make[2]: *** Waiting for unfinished jobs....
>>=20
>> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
>> ---
>>  meta/recipes-devtools/xmlto/xmlto_0.0.28.bb | 3 +++
>>  1 file changed, 3 insertions(+)
>>=20
>> diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-d=
evtools/xmlto/xmlto_0.0.28.bb
>> index 886e7b4..cc4bccd 100644
>> --- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
>> +++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
>> @@ -14,6 +14,9 @@ SRC_URI[sha256sum] =3D "2f986b7c9a0e9ac6728147668e776d4=
05465284e13c74d4146c9cbc51f
>>=20
>>  inherit autotools
>>=20
>> +# xmlto-native needs libxslt-native
>> +DEPENDS =3D "libxslt"
>> +
>>  # xmlto needs getopt/xmllint/xsltproc/bash/tail at runtime
>>  RDEPENDS_${PN} =3D "docbook-xml-dtd4 \
>>                    docbook-xsl-stylesheets \
>>=20

