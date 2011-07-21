Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1QjoJZ-0002Oj-Rw
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 10:09:02 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6L84ru1018356
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Jul 2011 01:04:53 -0700 (PDT)
Received: from [128.224.162.154] (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 21 Jul 2011 01:04:53 -0700
Message-ID: <4E27DDAC.1060707@windriver.com>
Date: Thu, 21 Jul 2011 16:05:00 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: Kang Kai <kai.kang@windriver.com>
References: <cover.1311234759.git.kai.kang@windriver.com>
In-Reply-To: <cover.1311234759.git.kai.kang@windriver.com>
X-Originating-IP: [128.224.162.154]
Cc: openembedded-core@lists.openembedded.org, scott.a.garman@intel.com
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
X-List-Received-Date: Thu, 21 Jul 2011 08:09:02 -0000
Content-Type: multipart/alternative;
	boundary="------------000104050204070804010009"

--------------000104050204070804010009
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2011?07?21? 16:00, Kang Kai wrote:
> From: Kang Kai<kai.kang@windriver.com>
>
> Hi Scott,
>
> This is the current work of adding pam supports.
>
> After update libpam to 1.1.4, we enable the packages pam support. And if the pacakge
> doesn't have a pam configure file, import from Fedora.
>
> The following changes since commit fa4bcfdb73167f8159b88e5a4d711c0d37627a70:
>
>    bb-matrix: correct BB and PM number canonicalization (2011-07-14 22:23:09 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib kangkai/distro
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/pam-commits

sorry, the branch info is wrong, should be

*http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/distro*

>
> Kang Kai (5):
>    libpam: update to 1.1.4 and add subpackage xtests
>    cups: add pam support
>    screen: add pam support
>    sudo: add pam support
>    shadow: update pam related configure files
>
> Wenzong Fan (2):
>    cronie: enable PAM support for cronie
>    at: enable pam support
>
> Xiaofeng Yan (3):
>    dropbear: Support PAM
>    openssh: Support PAM
>    polkit: Support PAM
>
>   .../openssh/openssh-5.8p2/sshd                     |   10 +
>   meta/recipes-connectivity/openssh/openssh_5.8p2.bb |    7 +-
>   meta/recipes-core/dropbear/dropbear.inc            |    6 +-
>   .../dropbear/dropbear/dropbear-enable-pam.patch    |   21 +++
>   .../at/at-3.1.12/configure-add-enable-pam.patch    |   23 +++
>   meta/recipes-extended/at/at-3.1.12/pam.conf.patch  |   16 ++
>   meta/recipes-extended/at/at_3.1.12.bb              |   13 +-
>   .../cronie/cronie/crond_pam_config.patch           |   13 ++
>   meta/recipes-extended/cronie/cronie_1.4.7.bb       |    9 +-
>   meta/recipes-extended/cups/cups_1.4.6.bb           |    8 +-
>   .../pam/libpam/libpam-xtests.patch                 |   35 ++++
>   .../pam/{libpam_1.1.3.bb =>  libpam_1.1.4.bb}       |   14 +-
>   .../polkit/polkit-0.101/polkit-1_pam.patch         |   23 +++
>   meta/recipes-extended/polkit/polkit_0.101.bb       |    6 +-
>   .../screen/screen-4.0.3/screen.pamd                |    2 +
>   meta/recipes-extended/screen/screen_4.0.3.bb       |   14 +-
>   .../shadow/files/shadow-update-pam-conf.patch      |  175 ++++++++++++++++++++
>   meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |    5 +-
>   meta/recipes-extended/sudo/files/sudo.pamd         |    6 +
>   meta/recipes-extended/sudo/sudo_1.8.1p2.bb         |   11 +-
>   20 files changed, 389 insertions(+), 28 deletions(-)
>   create mode 100644 meta/recipes-connectivity/openssh/openssh-5.8p2/sshd
>   create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear-enable-pam.patch
>   create mode 100644 meta/recipes-extended/at/at-3.1.12/configure-add-enable-pam.patch
>   create mode 100644 meta/recipes-extended/at/at-3.1.12/pam.conf.patch
>   create mode 100644 meta/recipes-extended/cronie/cronie/crond_pam_config.patch
>   create mode 100644 meta/recipes-extended/pam/libpam/libpam-xtests.patch
>   rename meta/recipes-extended/pam/{libpam_1.1.3.bb =>  libpam_1.1.4.bb} (85%)
>   create mode 100644 meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch
>   create mode 100644 meta/recipes-extended/screen/screen-4.0.3/screen.pamd
>   create mode 100644 meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
>   create mode 100644 meta/recipes-extended/sudo/files/sudo.pamd
>


--------------000104050204070804010009
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    On 2011&#24180;07&#26376;21&#26085; 16:00, Kang Kai wrote:
    <blockquote cite="mid:cover.1311234759.git.kai.kang@windriver.com"
      type="cite">
      <pre wrap="">From: Kang Kai <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>

Hi Scott,

This is the current work of adding pam supports. 

After update libpam to 1.1.4, we enable the packages pam support. And if the pacakge
doesn't have a pam configure file, import from Fedora.

The following changes since commit fa4bcfdb73167f8159b88e5a4d711c0d37627a70:

  bb-matrix: correct BB and PM number canonicalization (2011-07-14 22:23:09 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/distro
  <a class="moz-txt-link-freetext" href="http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/pam-commits">http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/pam-commits</a></pre>
    </blockquote>
    <br>
    sorry, the branch info is wrong, should be <br>
    <br>
    <b><a class="moz-txt-link-freetext" href="http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/distro">http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/distro</a></b><br>
    <br>
    <blockquote cite="mid:cover.1311234759.git.kai.kang@windriver.com"
      type="cite">
      <pre wrap="">

Kang Kai (5):
  libpam: update to 1.1.4 and add subpackage xtests
  cups: add pam support
  screen: add pam support
  sudo: add pam support
  shadow: update pam related configure files

Wenzong Fan (2):
  cronie: enable PAM support for cronie
  at: enable pam support

Xiaofeng Yan (3):
  dropbear: Support PAM
  openssh: Support PAM
  polkit: Support PAM

 .../openssh/openssh-5.8p2/sshd                     |   10 +
 meta/recipes-connectivity/openssh/openssh_5.8p2.bb |    7 +-
 meta/recipes-core/dropbear/dropbear.inc            |    6 +-
 .../dropbear/dropbear/dropbear-enable-pam.patch    |   21 +++
 .../at/at-3.1.12/configure-add-enable-pam.patch    |   23 +++
 meta/recipes-extended/at/at-3.1.12/pam.conf.patch  |   16 ++
 meta/recipes-extended/at/at_3.1.12.bb              |   13 +-
 .../cronie/cronie/crond_pam_config.patch           |   13 ++
 meta/recipes-extended/cronie/cronie_1.4.7.bb       |    9 +-
 meta/recipes-extended/cups/cups_1.4.6.bb           |    8 +-
 .../pam/libpam/libpam-xtests.patch                 |   35 ++++
 .../pam/{libpam_1.1.3.bb =&gt; libpam_1.1.4.bb}       |   14 +-
 .../polkit/polkit-0.101/polkit-1_pam.patch         |   23 +++
 meta/recipes-extended/polkit/polkit_0.101.bb       |    6 +-
 .../screen/screen-4.0.3/screen.pamd                |    2 +
 meta/recipes-extended/screen/screen_4.0.3.bb       |   14 +-
 .../shadow/files/shadow-update-pam-conf.patch      |  175 ++++++++++++++++++++
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |    5 +-
 meta/recipes-extended/sudo/files/sudo.pamd         |    6 +
 meta/recipes-extended/sudo/sudo_1.8.1p2.bb         |   11 +-
 20 files changed, 389 insertions(+), 28 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh-5.8p2/sshd
 create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear-enable-pam.patch
 create mode 100644 meta/recipes-extended/at/at-3.1.12/configure-add-enable-pam.patch
 create mode 100644 meta/recipes-extended/at/at-3.1.12/pam.conf.patch
 create mode 100644 meta/recipes-extended/cronie/cronie/crond_pam_config.patch
 create mode 100644 meta/recipes-extended/pam/libpam/libpam-xtests.patch
 rename meta/recipes-extended/pam/{libpam_1.1.3.bb =&gt; libpam_1.1.4.bb} (85%)
 create mode 100644 meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch
 create mode 100644 meta/recipes-extended/screen/screen-4.0.3/screen.pamd
 create mode 100644 meta/recipes-extended/shadow/files/shadow-update-pam-conf.patch
 create mode 100644 meta/recipes-extended/sudo/files/sudo.pamd

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------000104050204070804010009--
