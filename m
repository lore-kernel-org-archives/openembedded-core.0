Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id D25F460017
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 06:43:11 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id q58so9003780wes.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 22:43:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=QuF0lg0/BQiT+sN2ka6pBHjr3dZFlBfW9mdbQb8WP+4=;
	b=lHLzvblzQodQMiX543ti5KTdnvEkbDmdbod9VU+BMNcJUpgwUiYlKeTaLjyrAfMzuU
	xMBdt1BH8Z1JpAyS1Nd+fHA1VvuBm7M+9zUbS5qdjenEe8Jw5rAcsQ+AZbpbVoTC7Yo+
	DvriHNkbgEjM2HucSR0QtMu165jeJjMP6TQm/LRs/WE9yt0D9vjkdLjxO5aMz9McwFqZ
	H0iNt/R6YhbaAO4pZ8WLjzpDoSyknVFr7cBYrie1TpkFMGNky3ySRF0LmcF6qs+K3RDk
	SoO+6Ca8Affhiq+byYbRKEqEbA0qiZ2RvotvMovJC7o1YEawLDXJQSAyKWTVvTFLF3rN
	BouA==
X-Gm-Message-State: ALoCoQkEEEgx6e6FUkNEXwpat441dT9Uhq0bzLOpfvvMrjniIpmrYubF/mmS6yUwUBdzx+fb4fwu
X-Received: by 10.194.216.68 with SMTP id oo4mr162184wjc.79.1390372991768;
	Tue, 21 Jan 2014 22:43:11 -0800 (PST)
Received: from ?IPv6:2001:610:612::dcc9:ea33:697f:4168?
	([2001:610:612:0:dcc9:ea33:697f:4168])
	by mx.google.com with ESMTPSA id q5sm16344531wia.2.2014.01.21.22.43.10
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 21 Jan 2014 22:43:11 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20140122004909.GO4100@jama>
Date: Wed, 22 Jan 2014 07:43:19 +0100
Message-Id: <D8C17D3D-12B9-41E5-AB9D-A2E916ACAB23@dominion.thruhere.net>
References: <1390347792-24649-1-git-send-email-Martin.Jansa@gmail.com>
	<1390347792-24649-2-git-send-email-Martin.Jansa@gmail.com>
	<20140122004909.GO4100@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1827)
Cc: "OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] feature-arm-thumb: Fix missing t2 suffix for armv7a MACHINEs
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
X-List-Received-Date: Wed, 22 Jan 2014 06:43:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 jan. 2014, om 01:49 heeft Martin Jansa <martin.jansa@gmail.com> =
het volgende geschreven:

> On Wed, Jan 22, 2014 at 12:43:12AM +0100, Martin Jansa wrote:
>> * unfortunatelly that note about armv7 matching also armv7a is no
>>  longer valid since armv7 include in armv7 was replaced with
>>  armv6+neon in this commit:
>>=20
>>  commit 75b8adbc042e0f65fb1286bc550d02becd3b6aea
>>  Author: Khem Raj <raj.khem@gmail.com>
>>  Date:   Tue Mar 27 18:37:45 2012 -0700
>>=20
>>    tune/armv7: Delete
>>=20
>>  since then thumb and arm feeds had the same architecture
>> * be aware that this will rename lots of feeds
>=20
> Can someone confirm that t2 should be included for armv7m or armv7r?

cortex-M is thumb2 only, no idea about cortex-r.

regards,

Koen

>=20
> It looks like armv7m definitely should include it, but it doesn't even =
have
> thumb in TUNE_FEATURES for the only armv7m user we have in oe-core =
cortexm3:
>=20
> tune-cortexm3.inc:TUNE_FEATURES_tune-cortexm3 =3D "armv7m vfp =
cortexm3"
> tune-cortexm3.inc:PACKAGE_EXTRA_ARCHS_tune-cortexm3 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7m-vfp"
>=20
> tune-cortexr4.inc:TUNE_FEATURES_tune-cortexr4 =3D "armv7r vfp =
cortexr4"
> tune-cortexr4.inc:PACKAGE_EXTRA_ARCHS_tune-cortexr4 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7r-vfp"
>=20
> Anyway I'm sending a bit bigger RFC/WIP patchset to address this.
>=20
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>> meta/conf/machine/include/arm/feature-arm-thumb.inc | 3 +--
>> 1 file changed, 1 insertion(+), 2 deletions(-)
>>=20
>> diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc =
b/meta/conf/machine/include/arm/feature-arm-thumb.inc
>> index bd754be..fa3a4e5 100644
>> --- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
>> +++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
>> @@ -9,11 +9,10 @@ ARM_THUMB_M_OPT =3D "${@['-marm', =
'-mthumb'][d.getVar('ARM_INSTRUCTION_SET', True)
>> TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "thumb", " =
${ARM_THUMB_M_OPT}", "", d)}"
>> OVERRIDES .=3D "${@bb.utils.contains("TUNE_FEATURES", "thumb", =
":thumb", "", d)}"
>>=20
>> -# Note armv7 will hit on armv7a as well
>> ARMPKGSFX_THUMB .=3D "${@bb.utils.contains("TUNE_FEATURES", [ =
"armv4", "thumb" ], "t", "", d)}"
>> ARMPKGSFX_THUMB .=3D "${@bb.utils.contains("TUNE_FEATURES", [ =
"armv5", "thumb" ], "t", "", d)}"
>> ARMPKGSFX_THUMB .=3D "${@bb.utils.contains("TUNE_FEATURES", [ =
"armv6", "thumb" ], "t", "", d)}"
>> -ARMPKGSFX_THUMB .=3D "${@bb.utils.contains("TUNE_FEATURES", [ =
"armv7", "thumb" ], "t2", "", d)}"
>> +ARMPKGSFX_THUMB .=3D "${@bb.utils.contains("TUNE_FEATURES", [ =
"armv7a", "thumb" ], "t2", "", d)}"
>>=20
>> # Whether to compile with code to allow interworking between the two
>> # instruction sets. This allows thumb code to be executed on a =
primarily
>> --=20
>> 1.8.5.3
>>=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


