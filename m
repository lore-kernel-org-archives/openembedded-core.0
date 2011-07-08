Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QfDMW-0002As-PH
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 17:53:04 +0200
Received: by bwf20 with SMTP id 20so2159031bwf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2011 08:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=WykjaEzjf1OgcbBfYWBvBM0P2JjHfSa5IE2MpVgvH24=;
	b=ZVUInA8BMW9iOCnmQ5oJhI23IVNDlkvr/i5YIcBwhrMCRJ2mMvyWwOGqICJj7lKlrP
	9QRrENCJQqWRTVFsPzRuEg88weby/7di10f2KjDNnqPs7LsM/VIpfhx2oZl8m05THomR
	CyjTW2TSZU4ATVffRKBFc3MasZZWEB93CCl5o=
MIME-Version: 1.0
Received: by 10.204.144.197 with SMTP id a5mr406916bkv.281.1310140152170; Fri,
	08 Jul 2011 08:49:12 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.120.75 with HTTP; Fri, 8 Jul 2011 08:49:12 -0700 (PDT)
In-Reply-To: <1310138939.20015.883.camel@rex>
References: <cover.1310132765.git.otavio@ossystems.com.br>
	<4ed38d13d68e132c90e0c41cb9584c414334e01c.1310132765.git.otavio@ossystems.com.br>
	<1310138939.20015.883.camel@rex>
Date: Fri, 8 Jul 2011 12:49:12 -0300
X-Google-Sender-Auth: mBsJqPZ6BJIK5IeCMECuylxsV-I
Message-ID: <CAP9ODKpcSZcKOjgBa3LEZTXEtizBUe219dzLNn_tvb6Pk=3K+A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/8] cmake: add nativesdk and target versions
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
X-List-Received-Date: Fri, 08 Jul 2011 15:53:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 8, 2011 at 12:28, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2011-07-08 at 13:47 +0000, Otavio Salvador wrote:
>> Adds a recipe that provides the nativesdk and target versions of
>> CMake.
>>
>> This recipe is based on code from OpenEmbeeded (rev
>> b1f2e1501c19540617a829b37415c0616101c7ad).
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
> [...]
>
>> +# FIXME: Hack due gcc-crosssdk not being able to detect those automatic=
ally
>> +CXXFLAGS_virtclass-nativesdk +=3D " \
>> + =A0 -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/include/c++ \
>> + =A0 -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/include/c++/${TARGET_SYS=
} \
>> + =A0 "
>
> I get worried when I see things like this :(
>
> Has anyone attempted to work out why gcc-crosssdk can't locate c++
> include files?

Not sure why but this is the same things as done on qt4-tools-nativesdk.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


