Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id EA77D70A48
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Aug 2014 11:23:25 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id k14so6717606wgh.32
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Aug 2014 04:23:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=kDbrK63OC5JYlv0O+aB3EDdYVseMTTYZZqJKnQLw68Q=;
	b=D8JD1W8UH4kLnko90Bbf1QR/5C3nPpDARFtqRbePqMvy6X1xZi6BTz1ghcQQeJiua9
	lYvI5Z0vdrW2JD5xEAE7DX31yyEZsOu8l72spFiSeZQhW+8lHayQsSLkm3gzn6+t6jPe
	MpJEgV1cbbnYRDlpxzO8lg746QNxqEG6vppNHqmumIudn4yCG9dzgsXcNgUr1vFF2KXa
	VouBdo/BdXN+WUQCrsDMwh0l/ddOGt/zuzEQnU8Iu+gl9nzRD5aFT8gMgIohGt66Jh8L
	HpRMUkvXYrYsQrUcEpQFKn0l/GECxECYynFKIjaFOipFDNMOq716Uy7M4dbE5bv5y9ug
	PedA==
X-Gm-Message-State: ALoCoQlRfhGakJddZiMTaJhPfyJ/UzdkXyzvTrpiNvmIJ028S6ZAFqnzDKKygu2BRzS2GLo3PQEm
X-Received: by 10.194.6.101 with SMTP id z5mr39516984wjz.79.1407583406765;
	Sat, 09 Aug 2014 04:23:26 -0700 (PDT)
Received: from ?IPv6:2001:610:612::905b:ad9f:9b63:28bc?
	([2001:610:612:0:905b:ad9f:9b63:28bc])
	by mx.google.com with ESMTPSA id 19sm24011671wjz.3.2014.08.09.04.23.25
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 09 Aug 2014 04:23:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20140809103447.GM14848@jama>
Date: Sat, 9 Aug 2014 13:23:24 +0200
Message-Id: <CF6FCEFC-5B1E-4DF3-8B21-6723E19142FE@dominion.thruhere.net>
References: <1407572810-26063-1-git-send-email-koen.kooi@linaro.org>
	<20140809103447.GM14848@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1878.6)
Cc: Koen Kooi <koen.kooi@linaro.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] nssmyhostname: fix runtime dependencies
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
X-List-Received-Date: Sat, 09 Aug 2014 11:23:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 aug. 2014, om 12:34 heeft Martin Jansa <martin.jansa@gmail.com> het =
volgende geschreven:

> On Sat, Aug 09, 2014 at 10:26:49AM +0200, Koen Kooi wrote:
>> This should fix:
>>=20
>> 19:40 <fabo> ERROR: Unable to install packages. Command =
'/mnt/ci_build/workspace/tmp/sysroots/x86_64-linux/usr/bin/opkg-cl -f =
/mnt/ci_build/workspace/tmp/work/genericarmv8-oe-linux/linaro-image-minima=
l/1.0-r0/opkg.conf -o
>>             =
/mnt/ci_build/workspace/tmp/work/genericarmv8-oe-linux/linaro-image-minima=
l/1.0-r0/rootfs --force_postinstall --prefer-arch-to-version   install =
opkg-collateral stress libnss-myhostname2 run-postinsts =
auto-serial-console
>>             util-linux-fsck stress-dbg packagegroup-co
>> 19:41 <fabo> sed: can't read =
/mnt/ci_build/workspace/tmp/work/aarch64-oe-linux/nss-myhostname/0.3-r0/im=
age/etc/nsswitch.conf: No such file or directory
>=20
> Can you please check which recipe is supposed to install
> libnss_myhostname.so.2 and kill it in the other one?
>=20
> WARNING: The recipe systemd is trying to install files into a shared
> area when those files already exist. Those files and their manifest
> location are:
>   =
/home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/lib=
nss_myhostname.so.2
>   Matched in manifest-qemux86-64-nss-myhostname.populate_sysroot

That's what http://patches.openembedded.org/patch/77643/ is for, but I'm =
not sure how to properly fix this, since not everyone has systemd in =
DISTRO_FEATURES.
Either way systemd needs to have postinst/postrm scripts for myhostname =
as well. Hopefully I'll have some time next week at work for this.

regards,

Koen

>=20
>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>> ---
>> meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb | 3 +++
>> 1 file changed, 3 insertions(+)
>>=20
>> diff --git =
a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb =
b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
>> index d8ec863..b9ddeaf 100644
>> --- a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
>> +++ b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
>> @@ -13,6 +13,9 @@ SRC_URI[sha256sum] =3D =
"2ba744ea8d578d1c57c85884e94a3042ee17843a5294434d3a7f6c4d67
>>=20
>> inherit autotools
>>=20
>> +# /etc/nsswitch.conf needs to be present
>> +RDEPENDS_${PN} =3D "base-files"
>> +
>> pkg_postinst_${PN} () {
>> 	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
>> 		-e =
's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 myhostname =
\3\4\5/' \
>> --=20
>> 1.9.3
>>=20
>> --=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


