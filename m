Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx18-05.smtp.antispamcloud.com (mx18-05.smtp.antispamcloud.com
	[207.244.64.174])
	by mail.openembedded.org (Postfix) with ESMTP id 18E487318F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 06:27:27 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx18.antispamcloud.com with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1aJxqv-0007P5-K6; Fri, 15 Jan 2016 07:27:25 +0100
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Fri, 15 Jan 2016 07:25:17 +0100
To: Robert Yang <liezhi.yang@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1452824908.git.liezhi.yang@windriver.com>
	<06cd5b4b25da645fae5767a44b2e5d63550cdb52.1452824908.git.liezhi.yang@windriver.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <56989142.2050800@topic.nl>
Date: Fri, 15 Jan 2016 07:27:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <06cd5b4b25da645fae5767a44b2e5d63550cdb52.1452824908.git.liezhi.yang@windriver.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarwyNwZSpVdakq5X66Q8VYQRfQ0IJyirw3z51bJ29SGfwCEOeIoF9IAWOyYoSBw4zOJzdu
	eNnf2+7fZR5g0PMoex2gXhaAqQU2X/7w/twqlH6drAYFlMEm685+7MdKnBgxXEOeXmhDDkeFXPCt
	uM7U8527Uccw9AGyERl8QW9aQkXjp7I/5YKVrRQvjAkFeQrszGbjO41FyBEqIaDudcVplPF/LmA2
	yXofPpu9UTTjJcgKoF6RdQbaL0aq6N3+IND68ZrH+sc8EjLuqCrc7WMgoj+Z3JKVmi72ocgY5kMQ
	Sjs7FfgNUKRAYCE2OIhkjrd3UxBlNuVQYCKBDREGm3Gz+6tynbBHKmj8PpjpHk0omGLE0z6bhalF
	EM/pjPCQA+BAlihTEzuhH4RXLgA+yrbzj5V7Zn6OGQcTLcl+10S2CCSFw5t/JJNzDYCqHXGiQWAF
	IavC0PSzboMv15NgMxO5GJBWBb39uS1TjWG2Inx+Ts2QCgay2O3PHOrAPSCfPk8Za9PHVX1uQF7e
	I6fa8+SQSXK7B6RHysrA21LcjzaeMI1jUI/fDof9VJyYmVuBI9C3shVgGkJqBxDT487+vMxi4cTT
	vup0mlfqBiAyNtAvTsAcBFN2Wfesu1/OIRyQoEZNQOgi7l2L6mELqRuZP6QqjQgaISu4T8NeKBFE
	97/TvIaCDiDZg0CvZWlHfEwUS9Hohw==
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Filter-Fingerprint: IFrWXGses7OKB5S5G8/dJUb3OPwsHaH0Fvg5oXltHd/JUWjZ8+qhjyB23tbDuyLOYL8Ff78gYsez
	4Rl08xudmXi4esCQ0R1MchVjt7wblGlvhFgW0MjUMRkF5sMCDfftTXNFDzN17hnrWeZYOJvLq0Ic
	WjZ+XcEjj/7Pkld0zkmvziDInX9WdMov2kn2yXjdwv61T+KDYyYtREgszdyFwv8IxCB3p/oCKvxr
	eyISh3JGb7OS5oVgiO+kDxZrVPLz3MmEGC2PrUKqLq5WmHK+Nw==
X-Originating-IP: 88.159.208.100
X-Spampanel-Domain: topic.nl
X-Spampanel-Username: 88.159.208.100
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=88.159.208.100@topic.nl
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: Combined (0.00)
X-Recommended-Action: accept
Subject: Re: [PATCH 1/8] bitbake.conf: set CONFFILES by default
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
X-List-Received-Date: Fri, 15 Jan 2016 06:27:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFHow about /etc/init.d and /etc/rcS.d? Are these now suddenly CONFF=
ILES too?

On 15-01-16 03:29, Robert Yang wrote:
> There are a lot of binary packages have files in /etc/, but only a few
> of them have set CONFFILES, more than 180 packages are not set in a
> world build.  So treat all the files in /etc/ as CONFFILES as Debian
> does:
> - All the files in /etc/ are CONFFILES
> - Move the file out of /etc/ if it is not a conffile
> - If /etc/foo can't be moved out, and is changed during
>    runtime, then create a symlink /etc/foo -> /var/foo
>
> [YOCTO #8436]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/conf/bitbake.conf |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 2fe6b24..f0e4b3a 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -271,6 +271,7 @@ PACKAGE_BEFORE_PN ?=3D ""
>   PACKAGES =3D "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-local=
e ${PACKAGE_BEFORE_PN} ${PN}"
>   PACKAGES_DYNAMIC =3D "^${PN}-locale-.*"
>   FILES =3D ""
> +CONFFILES =3D "${sysconfdir}/*"
>
>   FILES_${PN} =3D "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib=
*${SOLIBS} \
>               ${sysconfdir} ${sharedstatedir} ${localstatedir} \
>



Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail






