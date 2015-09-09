Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx18-11.smtp.antispamcloud.com (mx18-11.smtp.antispamcloud.com
	[207.244.64.180])
	by mail.openembedded.org (Postfix) with ESMTP id D54B574197
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 12:38:33 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx18.antispamcloud.com with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1ZZedx-0000jC-If for openembedded-core@lists.openembedded.org;
	Wed, 09 Sep 2015 14:38:32 +0200
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Wed, 9 Sep 2015 14:37:52 +0200
Message-ID: <55F02841.6000209@topic.nl>
Date: Wed, 9 Sep 2015 14:38:25 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1441800588-25217-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1441800588-25217-1-git-send-email-ross.burton@intel.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw0hD9tOHsAupOgHE9PArDByM+/sFVMoIHnzxJpiwTwAmqWxCevbUegdCrqkn8BN/sbj/
	kr1uWvhVMCtfj6/xQtXS/WgqDgJCS36fZcYt9LJrGtNcxnQwynR7l8nttu4cTyys3cffC6AWwRxk
	2lbTlRU8CVsONrMJuGzuoGnKTKcy2xFkLpfI2GROc/TVFQ1M5w/S+L3ktki0yiouSvOolqeLT0PR
	GeOtHp8CevJaVP3RKAlmn4QY0Xa5w5mR23/WmQwqvMBYMukOyP3wW5yT57cTh6E2XHkoWr32bjya
	7gAvW4NAR0qbrlxNRt9ZoMCfLnY+akJNhL5qAttvzUBLxkQ2a3rCoHjHfcJIyKVF5T5LG2eHru/B
	zfgwTimxhZy/nuLrWedC6pqQQw+IVEM3KmRfQ4GqUWvgp7phkSqv0ZsqmdySlZou9qHIGOZDEEo7
	OyMdMb9bjBpP2U+fB0pr5dMhsfVz6trBKg1q8knCBzevPnb7rI0VfeqD9XJhW9OTh11z/z4WnEoC
	8C13cWABWlhWPxtvTWQlG7LubmSVPcFB6J1fhOzjF0b4LXcjJZ5lorygWaquS4QUc2X9/UmaFDUh
	sTbOm0n23gAH4LW5RBSd12aoSjUKxdXaKO35Ea/DrU+pok6SWPRM754kFPO4pu4=
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
X-Spampanel-Outgoing-Evidence: SB/global_tokens (0.00542055754891)
X-Recommended-Action: accept
Subject: Re: [PATCH] ptest: fix file ownerships in ${PTEST_PATH}
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
X-List-Received-Date: Wed, 09 Sep 2015 12:38:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFJust posting a related idea here:

There are quite a few recipes that just contain a bunch of (data) files, an=
d=20
use a simple "cp -r" in the install phase. Instead of peppering these with=
=20
"chown" calls, it might be better to create a small utility that basically=
=20
runs the "install" command recursively, and replace the "cp -r" with=20
"install_recursive".

On 09-09-15 14:09, Ross Burton wrote:
> As most upstreams don't have installable test suites it's fairly common t=
o copy
> files directly out of a source tree for ptests, but this results in files=
 in the
> recipe being owned by the user running bitbake:
>
>    WARNING: QA Issue: .../sed/4.2.2-r0/packages-split/sed-ptest/usr/lib64=
/
>    sed/ptest/testsuite/bug-regex21 is owned by uid 1000, which is the sam=
e
>    as the user running bitbake. This may be due to host contamination
>    [host-user-contaminated]
>
> Instead of needing to fix this in every recipe that has this problem simp=
ly
> chown the files to root:root in do_install_ptest_base.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/classes/ptest.bbclass | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
> index 2ac9143..b5f470f 100644
> --- a/meta/classes/ptest.bbclass
> +++ b/meta/classes/ptest.bbclass
> @@ -43,6 +43,7 @@ do_install_ptest_base() {
>               oe_runmake DESTDIR=3D${D}${PTEST_PATH} install-ptest
>           fi
>           do_install_ptest
> +        chown -R root:root ${D}${PTEST_PATH}
>       fi
>   }
>
>



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






