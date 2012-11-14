Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TYSeG-0005JB-7H
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 03:24:18 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAE29gbG025796
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2012 18:10:17 -0800 (PST)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 13 Nov 2012 18:10:06 -0800
Message-ID: <50A2FDA9.3090508@windriver.com>
Date: Wed, 14 Nov 2012 10:10:49 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1352101205.git.kai.kang@windriver.com>
In-Reply-To: <cover.1352101205.git.kai.kang@windriver.com>
X-Originating-IP: [128.224.162.205]
Subject: Re: [PATCH 0/2] Update perl populate_package and dependency creating scripts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Nov 2012 02:24:19 -0000
Content-Type: multipart/alternative;
	boundary="------------010407020800050205040909"

--------------010407020800050205040909
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2012?11?05? 16:56, Kang Kai wrote:
> The following changes since commit e421e95de0ce430cc2c6db9b0712a66ab96288a1:
>
>    gnome-desktop: Now we depend on gnome-common-native, use the correct sysroot (2012-11-02 16:18:32 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib kangkai/update-perl
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/update-perl
>
> Kang Kai (2):
>    perl: update dependency creating script
>    perl: update RPROVIDES and popuate_package script
>
>   .../recipes-devtools/perl/perl-rdepends_5.14.2.inc | 2335 +++++++++++++++++++-
>   meta/recipes-devtools/perl/perl_5.14.2.bb          |    8 +-
>   2 files changed, 2292 insertions(+), 51 deletions(-)
>

Recall these two patches. Dependencies between same name .pm and .so 
files(A.pm Vs. A.so) need update.

Sorry for inconvenience.

Regards,
Kai

--------------010407020800050205040909
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 2012&#24180;11&#26376;05&#26085; 16:56, Kang Kai wrote:
    <blockquote cite="mid:cover.1352101205.git.kai.kang@windriver.com"
      type="cite">
      <pre wrap="">The following changes since commit e421e95de0ce430cc2c6db9b0712a66ab96288a1:

  gnome-desktop: Now we depend on gnome-common-native, use the correct sysroot (2012-11-02 16:18:32 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/update-perl
  <a class="moz-txt-link-freetext" href="http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/update-perl">http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/update-perl</a>

Kang Kai (2):
  perl: update dependency creating script
  perl: update RPROVIDES and popuate_package script

 .../recipes-devtools/perl/perl-rdepends_5.14.2.inc | 2335 +++++++++++++++++++-
 meta/recipes-devtools/perl/perl_5.14.2.bb          |    8 +-
 2 files changed, 2292 insertions(+), 51 deletions(-)

</pre>
    </blockquote>
    <font size="+1"><br>
      Recall these two patches. Dependencies between same name .pm and
      .so files(A.pm Vs. A.so) need update.</font> <br>
    <br>
    Sorry for inconvenience.<br>
    <br>
    Regards,<br>
    Kai<br>
  </body>
</html>

--------------010407020800050205040909--
