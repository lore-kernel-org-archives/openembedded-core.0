Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RYYhR-0005wx-Ty
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 08:47:26 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pB87eZt2008438
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Dec 2011 23:40:35 -0800 (PST)
Received: from [128.224.162.146] (128.224.162.146) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 7 Dec 2011 23:40:35 -0800
Message-ID: <4EE06925.3050205@windriver.com>
Date: Thu, 8 Dec 2011 15:37:09 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1323246565.git.xiaofeng.yan@windriver.com>	<697ca68b7e47d0392273fa5a07df0e4396e709bf.1323246565.git.xiaofeng.yan@windriver.com>
	<1323253643.26081.311.camel@phil-desktop>
In-Reply-To: <1323253643.26081.311.camel@phil-desktop>
X-Originating-IP: [128.224.162.146]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	pB87eZt2008438
Subject: Re: [PATCH 07/10] pango: add directfb DISTRO_FEATURE
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
X-List-Received-Date: Thu, 08 Dec 2011 07:47:26 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011=E5=B9=B412=E6=9C=8807=E6=97=A5 18:27, Phil Blundell wrote:
> On Wed, 2011-12-07 at 16:58 +0800, Xiaofeng Yan wrote:
>> +PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'x11', 'x11'=
, '', d)} \
>> +           ${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb'=
, '', d)}"
>> +PACKAGECONFIG[x11] =3D "--with-x,--without-x,${X11DEPENDS}"
>> +PACKAGECONFIG[directfb] =3D ",,directfb"
> Hm, really?  I didn't think pango had any inbuilt support for DirectFB.
> Does this really accomplish anything?
>
pango hadn't any inbuilt support for DirectFB.
PACKAGECONFIG[directfb] =3D ",,directfb" just express that directfb is=20
built by dependence relationship when building an image based on directfb.
>> +       [ ! -d "/etc/pango" ]&&  mkdir -p /etc/pango/
Thanks, I will fix my patches according to your suggestion.
> That will fail with a read-only rootfs, and I think it will also give a=
n
> error if /etc/pango already exists.  It would be better to just ship
> this directory in the package.  (Also, it should be ${sysconfdir}.)
>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



