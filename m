Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5B66E65E8B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 05:52:28 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id m15so5038115wgh.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 May 2014 22:52:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=U3eGzo8BrUXmrgDDQ0kzsL0URbGW8KKeAXAbMYSW1PQ=;
	b=ivqNU5sZ/XnP888kMUjgblOnwAvXldiZHYE5sVkEw1kjBLZRX4VCdhPGiSl62MKmG5
	IgnCFlI+e/c0EDkDODTiE3qUlr8khgwySoJ+zAr7dI5FkYXMWJm+7cGMcspJb0vXaoET
	ZMT9P/QNg9HF5GRPMavoRHyTD9KA9z9y0zwRKnHG8hdAuoyWM6wgBV6JDj+S6DIaPgvm
	je+cq+d/bO0BibkOAssa6+A/bDMa5N9SNqJmPfUE8WnQqmX1OrwZJhEHB3KMWhb02Yeu
	ryXSEnxyY1whgnTU5knNvguT9donr7ZlXZUmsIqVRGJJGWltBQxnbYsfn3R7m4xGZc4X
	7ERA==
X-Gm-Message-State: ALoCoQnW26C1fkx4amW6SncZzEV8Urx6OV/BfnV1RWztFgNLjlBSP4RELAeurz9QqJ6ERMXEt3I8
X-Received: by 10.180.207.47 with SMTP id lt15mr746661wic.46.1399355548273;
	Mon, 05 May 2014 22:52:28 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id
	h19sm22373474wiw.17.2014.05.05.22.52.25 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 05 May 2014 22:52:25 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <53680880.30402@linux.intel.com>
Date: Tue, 6 May 2014 07:52:23 +0200
Message-Id: <A4B8EEBF-A117-4A52-B23E-FB09372AC3DF@dominion.thruhere.net>
References: <1399289179-5662-1-git-send-email-koen.kooi@linaro.org>
	<53680880.30402@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1874)
Cc: Koen Kooi <koen.kooi@linaro.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libarchive: add missing e2fsprogs dependency
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
X-List-Received-Date: Tue, 06 May 2014 05:52:33 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 5 mei 2014, om 23:54 heeft Saul Wold <sgw@linux.intel.com> het =
volgende geschreven:

> On 05/05/2014 04:26 AM, Koen Kooi wrote:
>> This fixes the following build error:
>> 	| libarchive/archive_entry.c:59:55: fatal error: =
ext2fs/ext2_fs.h: No such file or directory
>>=20
>> There is no configure options to avoid this dependency.
>>=20
>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>> ---
>>  meta/recipes-extended/libarchive/libarchive_3.1.2.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>=20
>> diff --git a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb =
b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
>> index eedbaa7..277d8c8 100644
>> --- a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
>> +++ b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
>> @@ -5,6 +5,8 @@ SECTION =3D "devel"
>>  LICENSE =3D "BSD"
>>  LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Db4e3ffd607d6686c6cb2f63394370841"
>>=20
>> +DEPENDS =3D "e2fsprogs"
>> +
>=20
> By doing this we also have to extend e2fprogs to be a nativesdk =
target.
>=20
> Is there not a way to make this optional by editing the configure.ac =
and adding a switch?  What functionality to we gain or loose with / =
without the ext2fs extensions?

I really have no idea, I just had the above buildfailure yesterday.

regards,

Koen=

