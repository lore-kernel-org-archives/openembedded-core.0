Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1RGMLg-0000vq-V6
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 04:57:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9J2pqjI000073
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Oct 2011 19:51:52 -0700 (PDT)
Received: from [128.224.162.225] (128.224.162.225) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 18 Oct 2011 19:51:52 -0700
Message-ID: <4E9E3B97.7070504@windriver.com>
Date: Wed, 19 Oct 2011 10:53:11 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Saul Wold <saul.wold@intel.com>
References: <cover.1318991782.git.kai.kang@windriver.com>
	<4E9E3983.4070008@intel.com>
In-Reply-To: <4E9E3983.4070008@intel.com>
X-Originating-IP: [128.224.162.225]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	p9J2pqjI000073
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] Update packages V2
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
X-List-Received-Date: Wed, 19 Oct 2011 02:57:45 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011=E5=B9=B410=E6=9C=8819=E6=97=A5 10:44, Saul Wold wrote:
> On 10/18/2011 07:42 PM, Kang Kai wrote:
>> Hi All,
>>
>> Please omit the previous letter, send by mistake. Sorry!
>>
>> Version 2: only add libsdl update
>>
>> Update ghostscript, xdg-utils, libxml-sax-perl and liburi-perl to=20
>> latest version.
>>
> How about updates to the distro_tracking_fields also? Version, and=20
> Dates, please ensure you use MMM DD, YYYY for all date related fields.
>
> Thanks
> Sau!

Hi Saul,

I will remove the ghostscript and libsdl obsolete patches, drop=20
xdg-utils update, and update distro_tracking fields, then send the 3rd=20
version.

Thanks,
Kai


>
>> Regards,
>>
>> The following changes since commit=20
>> 3c517bfe6c6d7781658f65bda4e0fdb499ca2b62:
>>
>> bind 9.8.1: fix build after recent update (2011-10-17 16:58:14 +0100)
>>
>> are available in the git repository at:
>> git://git.pokylinux.org/poky-contrib kangkai/update-pkgs
>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dkangkai/update=
-pkgs
>>
>> Kang Kai (5):
>> ghostscript: update to 9.04
>> xdg-utils: update to 1.1.0 rc1
>> libxml-sax-perl: update to 0.96
>> liburi-perl: update to 1.59
>> libsdl: update to 1.2.14
>>
>> .../{liburi-perl_1.58.bb =3D> liburi-perl_1.59.bb} | 6 +-
>> .../ghostscript-9.02-prevent_recompiling.patch | 74 +++---
>> .../{ghostscript_9.02.bb =3D> ghostscript_9.04.bb} | 24 +-
>> ...ml-sax-perl_0.96.bb =3D> libxml-sax-perl_0.99.bb} | 7 +-
>> .../{xdg-utils_1.0.2.bb =3D> xdg-utils_1.1.0rc1.bb} | 20 +-
>> .../libsdl/files/configure_tweak.patch | 281 +++++++++-----------
>> .../libsdl/{libsdl_1.2.11.bb =3D> libsdl_1.2.14.bb} | 17 +-
>> 7 files changed, 206 insertions(+), 223 deletions(-)
>> rename meta/recipes-devtools/perl/{liburi-perl_1.58.bb =3D>=20
>> liburi-perl_1.59.bb} (81%)
>> rename meta/recipes-extended/ghostscript/{ghostscript_9.02.bb =3D>=20
>> ghostscript_9.04.bb} (81%)
>> rename meta/recipes-extended/perl/{libxml-sax-perl_0.96.bb =3D>=20
>> libxml-sax-perl_0.99.bb} (85%)
>> rename meta/recipes-extended/xdg-utils/{xdg-utils_1.0.2.bb =3D>=20
>> xdg-utils_1.1.0rc1.bb} (57%)
>> rename meta/recipes-graphics/libsdl/{libsdl_1.2.11.bb =3D>=20
>> libsdl_1.2.14.bb} (81%)
>>
>



