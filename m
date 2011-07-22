Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1Qk5OB-0006tP-UF
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 04:22:56 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6M2IkRU004241
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Jul 2011 19:18:46 -0700 (PDT)
Received: from [128.224.162.154] (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 21 Jul 2011 19:18:45 -0700
Message-ID: <4E28DE0A.70308@windriver.com>
Date: Fri, 22 Jul 2011 10:18:50 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1311234759.git.kai.kang@windriver.com>
	<4E285B8E.4070502@linux.intel.com>
In-Reply-To: <4E285B8E.4070502@linux.intel.com>
X-Originating-IP: [128.224.162.154]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	p6M2IkRU004241
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/10] works of adding packages pam support
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
X-List-Received-Date: Fri, 22 Jul 2011 02:22:56 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011=E5=B9=B407=E6=9C=8822=E6=97=A5 01:02, Saul Wold wrote:
> On 07/21/2011 01:00 AM, Kang Kai wrote:
>> From: Kang Kai<kai.kang@windriver.com>
>>
>> Hi Scott,
>>
>> This is the current work of adding pam supports.
>>
>> After update libpam to 1.1.4, we enable the packages pam support. And=20
>> if the pacakge
>> doesn't have a pam configure file, import from Fedora.
>>
> Kai,
>
> Thanks for this work, you have already gotten some feedback, I have a=20
> few general comments to add that are across many of these patches, so=20
> I will note them here.
>
> Whitespace: you seem to be using tabs instead of spaces, please check=20
> that you have spaces and your items are lined up. Yocto uses 4 spaces=20
> for python and bb recipes and tabs for shell scripts and shell=20
> functions in bb recipes.
>
> As has already been noted in a couple of places, ensure that you only=20
> install things pam specific when the pam DISTRO_FEATURE is enabled,=20
> there are multiple places that need this (not just the ones already=20
> noted).
>
> Worth noting here also make sure you check all your PR bumps are correc=
t.
>

Hi Saul,

We will check the commits and send them again. Thanks for you comments.

> Commit messages and comments for things to oe-core should talk about=20
> oe-core not yocto or poky as this upsets people ;-)

I am a little confused about this. Do you mean the commits about=20
packages under directory meta/ should use word "oe-core" rather than=20
Yocto? Would you like to tell me that how do you merge the commits,=20
merge the commits to the oe-core master first and then merge the oe-core=20
master to Yocto master or some branch?

At the same time, tests we did are based on core-image-sato/lsb. Should=20
we test them again base on the image create by oe-core?

>
> I am going to hold of on taking this series until you fix it up.
>
> Sau!
>

Regards,
Kai

>
>
>> The following changes since commit=20
>> fa4bcfdb73167f8159b88e5a4d711c0d37627a70:
>>
>> bb-matrix: correct BB and PM number canonicalization (2011-07-14=20
>> 22:23:09 +0100)
>>
>> are available in the git repository at:
>> git://git.pokylinux.org/poky-contrib kangkai/distro
>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dkangkai/pam-co=
mmits
>>
>> Kang Kai (5):
>> libpam: update to 1.1.4 and add subpackage xtests
>> cups: add pam support
>> screen: add pam support
>> sudo: add pam support
>> shadow: update pam related configure files
>>
>> Wenzong Fan (2):
>> cronie: enable PAM support for cronie
>> at: enable pam support
>>
>> Xiaofeng Yan (3):
>> dropbear: Support PAM
>> openssh: Support PAM
>> polkit: Support PAM
>>
>> .../openssh/openssh-5.8p2/sshd | 10 +
>> meta/recipes-connectivity/openssh/openssh_5.8p2.bb | 7 +-
>> meta/recipes-core/dropbear/dropbear.inc | 6 +-
>> .../dropbear/dropbear/dropbear-enable-pam.patch | 21 +++
>> .../at/at-3.1.12/configure-add-enable-pam.patch | 23 +++
>> meta/recipes-extended/at/at-3.1.12/pam.conf.patch | 16 ++
>> meta/recipes-extended/at/at_3.1.12.bb | 13 +-
>> .../cronie/cronie/crond_pam_config.patch | 13 ++
>> meta/recipes-extended/cronie/cronie_1.4.7.bb | 9 +-
>> meta/recipes-extended/cups/cups_1.4.6.bb | 8 +-
>> .../pam/libpam/libpam-xtests.patch | 35 ++++
>> .../pam/{libpam_1.1.3.bb =3D> libpam_1.1.4.bb} | 14 +-
>> .../polkit/polkit-0.101/polkit-1_pam.patch | 23 +++
>> meta/recipes-extended/polkit/polkit_0.101.bb | 6 +-
>> .../screen/screen-4.0.3/screen.pamd | 2 +
>> meta/recipes-extended/screen/screen_4.0.3.bb | 14 +-
>> .../shadow/files/shadow-update-pam-conf.patch | 175 ++++++++++++++++++=
++
>> meta/recipes-extended/shadow/shadow_4.1.4.3.bb | 5 +-
>> meta/recipes-extended/sudo/files/sudo.pamd | 6 +
>> meta/recipes-extended/sudo/sudo_1.8.1p2.bb | 11 +-
>> 20 files changed, 389 insertions(+), 28 deletions(-)
>> create mode 100644 meta/recipes-connectivity/openssh/openssh-5.8p2/ssh=
d
>> create mode 100644=20
>> meta/recipes-core/dropbear/dropbear/dropbear-enable-pam.patch
>> create mode 100644=20
>> meta/recipes-extended/at/at-3.1.12/configure-add-enable-pam.patch
>> create mode 100644 meta/recipes-extended/at/at-3.1.12/pam.conf.patch
>> create mode 100644=20
>> meta/recipes-extended/cronie/cronie/crond_pam_config.patch
>> create mode 100644 meta/recipes-extended/pam/libpam/libpam-xtests.patc=
h
>> rename meta/recipes-extended/pam/{libpam_1.1.3.bb =3D> libpam_1.1.4.bb=
}=20
>> (85%)
>> create mode 100644=20
>> meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch
>> create mode 100644 meta/recipes-extended/screen/screen-4.0.3/screen.pa=
md
>> create mode 100644=20
>> meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
>> create mode 100644 meta/recipes-extended/sudo/files/sudo.pamd
>>



