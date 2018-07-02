Return-Path: <prvs=0721de6c26=mike.looijmans@topicproducts.com>
X-Greylist: delayed 32397 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 02 Jul 2018 14:55:02 UTC
Received: from port25.smtp.antispamcloud.com (port25.smtp.antispamcloud.com
	[46.165.233.176])
	by mail.openembedded.org (Postfix) with ESMTP id 63662748D5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 14:55:02 +0000 (UTC)
Received: from [37.74.225.131] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx61.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.89) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1fZrnk-0007uA-VY for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2018 07:55:05 +0200
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 2 Jul 2018 07:55:02 +0200
To: <openembedded-core@lists.openembedded.org>
References: <1530441211-30826-1-git-send-email-alex.kiernan@gmail.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <6b743d05-aa53-bb1c-f96b-f604a77d2911@topic.nl>
Date: Mon, 2 Jul 2018 07:55:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1530441211-30826-1-git-send-email-alex.kiernan@gmail.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Originating-IP: 37.74.225.131
X-AntiSpamCloud-Domain: topic.nl
X-AntiSpamCloud-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-AntiSpamCloud-Outgoing-Class: ham
X-AntiSpamCloud-Outgoing-Evidence: Combined (0.03)
X-Recommended-Action: accept
X-Filter-ID: EX5BVjFpneJeBchSMxfU5oh3cwaopxtgsDvH8FU17Al602E9L7XzfQH6nu9C/Fh9KJzpNe6xgvOx
	q3u0UDjvOxznj/1iaw5TjLSMy5CpQtFmraJGWVbN0zdCh+St1How4o1YeYC8LHFWCIFgyeyJQefH
	zJ6mVE7ewsipSVIfs4YSVleacBG86y0+cB1D9Ciu4JjiDSrbcmJ1QXhuh4fWdt/Aj79cZapdKACo
	xXTB236Z3JKVmi72ocgY5kMQSjs7AS5g9nL+yeFiOR30+l159X3F2AuNuamkoUiKgQQWvzglYYyi
	NZr+/4JfE7i26Y6ctPZUPzYlTOTdwc0UsK6fWIrhylS5qWRAI3z2YWviHNUM5PgtoxLiSpsrL6hV
	WLdEFdlTez4Ep6JVGftOsEfid+kwN34980yjfCV4sX61ZxdX/LGc1HGkyge+OH1WexgDa2mBsvp2
	2+B2cECTpdAX092/BpLY2oaU3DFtoijWuhrNcgXXMYaGQeGKWD2ycTNwj/KcGIu4SeJtbJdr4/oj
	P8UWpjnmAwSMAa8SFs/lvHopOMQJvQ/Ck3iiU+4DQAj307MdygbYAwP95HY9TPHMrX3J+urMxBa8
	rTN5PXEtA+TC/4IqMDd3R3OoYwhxnciCWKpui1UIyKS8DwXlI5pcNejb5NA413zESMJef949r2it
	k/3XLTmRwzitRAMwkvBlTWlICWA/jpoCaLd/2BFWJOMRZOqWznTWYsnDz/791NupYrr9/aF/s0iU
	PFspTh2aQ3W4D2Pl5O1+R6Nzud4ZWH9EiYWtQlDY+Ex+/CmY5hsFBPG7fCFpv7jLxTCvx+CSbmI4
	udPHYXlUomKSI+ZfkuuO5TcDeKjrEmYPn2IVWRv3ELcsjTwVHlACUiCFmrbWxvQXcOyqIIgFHPwW
	X+7nurSvXNfMHiSd1NTB4ie6vtrwBTL1+6vDOMemz/4I88NDnUGe2ZB+yd/uaRCBKOKbS2wB1oCZ
	0xvT8GNaAyQKhz3CJ2dmBcMfeMs+o1d/es7A
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
Subject: Re: [PATCH] openssh: Add dependency on ssh for sftp
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
X-List-Received-Date: Mon, 02 Jul 2018 14:55:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: nl
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFThe sftp-server runs fine using dropbear as SSH backend, I'd expec=
t the same=20
to be true for the client. Isn't that the case, and will the sftp client on=
ly=20
work with openssh's ssh?

On 01-07-18 12:33, Alex Kiernan wrote:
> Add missing dependency on the ssh binary for the sftp client to avoid
> failure at runtime if it's not been installed through another dependency
> chain.
>=20
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>=20
>   meta/recipes-connectivity/openssh/openssh_7.7p1.bb | 1 +
>   1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb b/meta/re=
cipes-connectivity/openssh/openssh_7.7p1.bb
> index b3da5f6..d147f43 100644
> --- a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
> @@ -146,6 +146,7 @@ FILES_${PN}-keygen =3D "${bindir}/ssh-keygen"
>  =20
>   RDEPENDS_${PN} +=3D "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
>   RDEPENDS_${PN}-sshd +=3D "${PN}-keygen ${@bb.utils.contains('DISTRO_FEA=
TURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
> +RDEPENDS_${PN}-sftp +=3D "${PN}-ssh"
>   RDEPENDS_${PN}-ptest +=3D "${PN}-sftp ${PN}-misc ${PN}-sftp-server make=
"
>  =20
>   RPROVIDES_${PN}-ssh =3D "ssh"
>=20



Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail




