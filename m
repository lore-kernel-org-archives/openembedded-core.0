Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx12-out5.antispamcloud.com (mx12-out5.antispamcloud.com
	[46.165.232.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2F56265C78
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 08:51:09 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx12.antispamcloud.com with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1Z2FFI-0006s2-Fz for openembedded-core@lists.openembedded.org;
	Tue, 09 Jun 2015 10:51:09 +0200
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 9 Jun 2015 10:51:15 +0200
Message-ID: <5576A8EF.7070800@topic.nl>
Date: Tue, 9 Jun 2015 10:50:55 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1432276145-31264-1-git-send-email-mike.looijmans@topic.nl>
	<1432276145-31264-4-git-send-email-mike.looijmans@topic.nl>
In-Reply-To: <1432276145-31264-4-git-send-email-mike.looijmans@topic.nl>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw0hD9tOHsAupOgHE9PArDByM+/sFVMoIHnzxJpiwTwAmqWxCevbUegdCrqkn8BN/sbj/
	kr1uWvhVMCtfj6/xQtXS/WgqDgJCS36fZcYt9LJrV4rjKlPRsz+BPhtitYwGwSZTiSAFpJoNW13v
	/+GWkQ08CVsONrMJuGzuoGnKTKcy2xFkLpfI2GROc/TVFQ1M5w/S+L3ktki0yiouSvOolqeLT0PR
	GeOtHp8CevJaVP3RKAlmn4QY0Xa5w5mR23/WmQwqvMBYMukOyP3wW5yT57cTh6E2XHkoWr32bjya
	7gAvW4NAR0qbrlxNRt9ZoMCfLnY+akJNhL5qAttvzUBLxkQ2a3rCoHjHfcJIyKVF5T5LG2eHru/B
	zfgwTimxhZy/nuLrWedC6pqQQw+IVEM3KmRfQ4GqUWvgp7phkSqv0ZsqmdySlZou9qHIGOZDEEo7
	OyMdMb9bjBpP2U+fB0pr5dMhsfVz6trBKg1q8knCBzevPnb7rI0VfeqD9XJhW9OTh+h+CzXS8eUe
	C5gEulNqQ4FWPxtvTWQlG7LubmSVPcFB6J1fhOzjF0b4LXcjJZ5lokhecaVqDL9uaaBYOuxasEpt
	pbQqVsjuh0JlrWxsIcuBhkb6GDdB6OAsNDDRIxpg15xifUD173ICRv+qGaUPXf0=
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Filter-Fingerprint: IFrWXGses7OKB5S5G8/dJcFIkh7yuznlTeFPLSNUgKbJUWjZ8+qhjyB23tbDuyLOYL8Ff78gYsez
	4Rl08xudmXi4esCQ0R1MchVjt7wblGlvhFgW0MjUMRkF5sMCDfftTXNFDzN17hnrWeZYOJvLq0Ic
	WjZ+XcEjj/7Pkld0zkmvziDInX9WdMov2kn2yXjdwv61T+KDYyYtREgszdyFwv8IxCB3p/oCKvxr
	eyISh3JGb7OS5oVgiO+kDxZrVPLz3MmEGC2PrUKqLq5WmHK+Nw==
X-Originating-IP: 88.159.208.100
X-Spampanel-Domain: topic.nl
X-Spampanel-Username: 88.159.208.100
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=88.159.208.100@topic.nl
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: Combined (0.03)
X-Recommended-Action: accept
Subject: Re: [PATCH v2 3/3] bitbake.conf: Set GITPKGV variable
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
X-List-Received-Date: Tue, 09 Jun 2015 08:51:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 22-05-15 08:29, Mike Looijmans wrote:
> Set GITPKGV to mimic the meta-openembedded 'gitpkgv' class. This allows
> a recipe to simply set:
> PKGV=3D"1.2+${GITPKGV}"
> And no longer needs to inherit gitpkgv class.
> ---
>   conf/bitbake.conf | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index a35219d..5dafd52 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -47,3 +47,4 @@ TARGET_ARCH =3D "${BUILD_ARCH}"
>   TMPDIR =3D "${TOPDIR}/tmp"
>   WORKDIR =3D "${TMPDIR}/work/${PF}"
>   PERSISTENT_DIR =3D "${TMPDIR}/cache"
> +GITPKGV =3D "${@bb.fetch2.get_srcrev(d, 'gitpkgv_revision')}"
>

This looked okay, but when put to a practical test, I noticed that this did=
=20
not work at all. The GITPKGV variable is not set when building recipes,=20
resulting in the literal string ${GITPKGV} appearing in version numbers of=
=20
packages that try to use it.

It does work when I add this line to local.conf, but apparently bitbake.con=
f=20
never actually gets parsed?




Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
Telefax: +31 (0) 499 33 69 70
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail






