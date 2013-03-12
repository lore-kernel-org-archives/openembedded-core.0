Received: from mail-ea0-f177.google.com ([209.85.215.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UFK2Q-0007ma-Ba
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 08:54:29 +0100
Received: by mail-ea0-f177.google.com with SMTP id r16so1526134ead.36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 00:37:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=OG/dHVKFaUCBFywRStr3nGrIGFeFLQcPEc7/D/ewOek=;
	b=Y6EUkqJ9fDNzYiW33GIFfa9dJo0QcsUdludUvVDr5Z+ZCZ3tb6IR7FTz5NBUAz33AG
	5DwdyEKF4vRWCmmlatzW2xqLmq3XE1if1f+ILBEXCRlCjMiurwxDsJOnqphEsJB10ord
	D3ZApEzSaEEsn5CZzgzEXdgzQ/54kCTjI+rgfuDyATb76qwx5+uTtGUoAyVTnVshOObE
	TeScgM9tZySMnAE9jQAokPkj+UwWP9/la3DP+5OhoaM7+q7AHPBKjKWk6QlT+5U6vJ3g
	0gXTFku0f0sZtDRcjd6x+2Hi/NELZPETL/hSsmvw2rklFC7g7aIRm7771vFMIsFLk6z5
	mQpA==
X-Received: by 10.14.183.67 with SMTP id p43mr44966467eem.10.1363073862947;
	Tue, 12 Mar 2013 00:37:42 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id a1sm27953566eep.2.2013.03.12.00.37.41
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 Mar 2013 00:37:41 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20130312070827.GF9724@jama.dyndns-home.com>
Date: Tue, 12 Mar 2013 08:37:40 +0100
Message-Id: <05A4DB94-1EF7-400D-910E-3DF7280C10CB@dominion.thruhere.net>
References: <cover.1363025917.git.ross.burton@intel.com>
	<228e005f888afff7bd97f015e321a62071c09307.1363025917.git.ross.burton@intel.com>
	<20130312070827.GF9724@jama.dyndns-home.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQlYEgiuJRqMfyvbNsTlYcSmXtcawvEimn4mmpxhae9UfBysdcTIlMRk3B3gxHN8y01HygT6
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 06/12] systemd-compat-units: add missing systemd-systemctl-native dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Mar 2013 07:54:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 mrt. 2013, om 08:08 heeft Martin Jansa <martin.jansa@gmail.com> =
het volgende geschreven:

> On Mon, Mar 11, 2013 at 11:24:49AM -0700, Ross Burton wrote:
>> This package has postinsts that run on the build host, but wasn't =
depending on
>> systemd-systemctl-native.
>>=20
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>> meta/recipes-core/systemd/systemd-compat-units.bb |    2 ++
>> 1 file changed, 2 insertions(+)
>>=20
>> diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb =
b/meta/recipes-core/systemd/systemd-compat-units.bb
>> index a7bfee3..19a1ea1 100644
>> --- a/meta/recipes-core/systemd/systemd-compat-units.bb
>> +++ b/meta/recipes-core/systemd/systemd-compat-units.bb
>> @@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D =
"file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3
>>=20
>> PR =3D "r18"
>>=20
>> +DEPENDS =3D "systemd-systemctl-native"
>=20
> Do you want RDEPENDS_${PN} here?

I don't think a -native package will do something usefull on the target =
:)=


