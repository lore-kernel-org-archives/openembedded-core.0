Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7200D72070
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 13:28:53 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id b13so1189028wgh.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Nov 2014 05:28:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=c6pA2KqsiHseVqdCv7/bk8N+OIUOY82D7xnytevvcxI=;
	b=Iu0HqwzKnak418sgVX+AGZymyx2Wujy8aoYer6e1fgHr1USvYiM9wzQsCNHkIC0A3B
	uOhoV1GtiINlUyskMcn6o895Y/W5nVeC0SJ2UPzB5wWW7LrgWkAXHXkCIXE0XlanBlGw
	PpUr/2XXPieHrCEa3UFkukpbAy3Uqof94M4kJZ4arv7JmkoJMpgeqkH4gsZ6ZAr5vr7j
	K1rz58xTD6xDNEnH8TLR/i6BmynIzCFFoGUahZVvTMvJKF53mQigkJRwouLuRC3IRALi
	XzxfNAXJ3irytvgvJzeSsiUOe3TrWBmJzQmpzEbSrFtDOdnTl3wA+DuxWDyVfRFAKGRD
	wxsw==
X-Gm-Message-State: ALoCoQl65ckLN8Jn2lP9LAlSzLIyfZC48rmI/KywSSVzhU/txhCjtcpbMg2yJvHf7o7otXVtf7wy
X-Received: by 10.180.73.212 with SMTP id n20mr40088048wiv.59.1415280533955;
	Thu, 06 Nov 2014 05:28:53 -0800 (PST)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id f7sm8308217wiz.13.2014.11.06.05.28.52
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 06 Nov 2014 05:28:53 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <2205188.KeVNzL1xBI@peggleto-mobl5.ger.corp.intel.com>
Date: Thu, 6 Nov 2014 14:28:49 +0100
Message-Id: <FDB6E297-1CE7-499E-ACF8-CDC20BF3AD86@dominion.thruhere.net>
References: <1415259476-3411-1-git-send-email-koen@dominion.thruhere.net>
	<2205188.KeVNzL1xBI@peggleto-mobl5.ger.corp.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1878.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gptfdisk: add 0.8.10+git version
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
X-List-Received-Date: Thu, 06 Nov 2014 13:29:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 nov. 2014, om 12:27 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> Hi Koen,
>=20
> On Thursday 06 November 2014 08:37:56 Koen Kooi wrote:
>> Besides from being useful as fdisk replacement this gives us 'sgdisk'
>> which can be used to set the GUID for partitions, e.g.
>>=20
>> 	sgdisk -t 1:C12A7328-F81F-11D2-BA4B-00A0C93EC93B /dev/mmcblk0p1
>>=20
>> To mark it as ESP in scripts like mkefidisk.sh.
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta/recipes-devtools/fdisk/gptfdisk_git.bb | 22 =
++++++++++++++++++++++
>> 1 file changed, 22 insertions(+)
>> create mode 100644 meta/recipes-devtools/fdisk/gptfdisk_git.bb
>>=20
>> diff --git a/meta/recipes-devtools/fdisk/gptfdisk_git.bb
>> b/meta/recipes-devtools/fdisk/gptfdisk_git.bb new file mode 100644
>> index 0000000..62c32c3
>> --- /dev/null
>> +++ b/meta/recipes-devtools/fdisk/gptfdisk_git.bb
>> @@ -0,0 +1,22 @@
>> ...
>> +S =3D "${WORKDIR}/git"
>> +
>> +do_install() {
>> +    install -d ${D}${bindir}
>> +    install -m 0755 cgdisk ${D}${bindir}
>> +    install -m 0755 gdisk ${D}${bindir}
>> +    install -m 0755 sgdisk ${D}${bindir}
>> +    install -m 0755 fixparts ${D}${bindir}
>=20
> Technically shouldn't these be in ${sbindir} ?

Personally I think sbindir is a misguided idea, PATH is a very easy to =
get around security measure. Having said that, I have no objection to =
installing these things in $sbindir if it's requiered to get this into =
OE-core.

regards,

Koen=

