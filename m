Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qo7Fz-0008Ka-Qr
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 07:11:07 +0200
Received: by wyg30 with SMTP id 30so2247278wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2011 22:06:47 -0700 (PDT)
Received: by 10.227.197.194 with SMTP id el2mr6881261wbb.55.1312261606688;
	Mon, 01 Aug 2011 22:06:46 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fx12sm4699264wbb.59.2011.08.01.22.06.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Aug 2011 22:06:45 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1443716.1agPb8MbFj@perseus>
Date: Tue, 2 Aug 2011 07:06:39 +0200
Message-Id: <CB80DCD2-F1B5-45EA-B740-6FF0675882E0@dominion.thruhere.net>
References: <1312233054-8118-1-git-send-email-schnitzeltony@gmx.de>
	<1443716.1agPb8MbFj@perseus>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [angstrom] xfce-base-image: Add image for xfce48 desktop image
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
X-List-Received-Date: Tue, 02 Aug 2011 05:11:07 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


Op 2 aug. 2011, om 04:31 heeft Khem Raj het volgende geschreven:

> On Monday, August 01, 2011 11:10:54 PM Andreas Mueller wrote:
>> * This patch requires patch series [1] to be committed in meta-oe
>>=20
>> [1]
>> =
http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-August/034221=
.
>> html
>>=20
>> Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
>> ---
>> recipes-angstrom/images/xfce-base-image.bb |   26
>> ++++++++++++++++++++++++++ 1 files changed, 26 insertions(+), 0
>> deletions(-)
>> create mode 100644 recipes-angstrom/images/xfce-base-image.bb
>>=20
>=20
> this recipe belongs to meta-angstrom or may be meta-xfce

While I agree with the general idea...

>=20
>> diff --git a/recipes-angstrom/images/xfce-base-image.bb
>> b/recipes-angstrom/images/xfce-base-image.bb new file mode 100644
>> index 0000000..80f5062
>> --- /dev/null
>> +++ b/recipes-angstrom/images/xfce-base-image.bb
>> @@ -0,0 +1,26 @@
>> +LICENSE =3D "MIT"
>> +LIC_FILES_CHKSUM =3D
>> "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58" =
+PR =3D
>> "r0"
>> +
>> +require console-base-image.bb

=85 this file is only present in meta-angstrom.=


