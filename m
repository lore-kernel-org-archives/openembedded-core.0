Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TfoQy-00074s-BU
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 10:04:59 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB48oX0W013617
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Dec 2012 00:50:33 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 4 Dec 2012 00:50:33 -0800
Message-ID: <50BDB979.3040805@windriver.com>
Date: Tue, 4 Dec 2012 16:51:05 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120410 Thunderbird/11.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1354531187.git.Qi.Chen@windriver.com>
In-Reply-To: <cover.1354531187.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.163.154]
Subject: Re: [PATCH 0/4] [V3] Add pkgconfig support to four packages
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
X-List-Received-Date: Tue, 04 Dec 2012 09:04:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Saul,

The libassuan and libksba patches are rejected by upstream (gnupg.org). 
The reason is in the email below.
So the question is, if they don't want to support pkgconfig for their 
libs, are we going to support it anyway?

Thanks,
Chen Qi

On 12/04/2012 04:46 PM, Qi.Chen@windriver.com wrote:
> From: Chen Qi<Qi.Chen@windriver.com>
>
> Among the 26 recipes / packages that deliver their own bin-config tools, only
> four of them don't deliver pkgconfig (.pc) files.
> This series of patches add pkgconfig support to them.
>
> [V3 updates Upstream-Status for libassuan and libksba patches]
> These two patches are rejected by gnupg project for the reason below:
> "
> pkg-config might be useful in the GNOME or KDE environment where you
> have lots of not so well defined libraries. However, it adds nothing to
> portability of code.
>
> Using a shell script instead of pkg-config is more flexible and solves
> the same purposes.  Right, it is annoying to see several identical -I
> and -L options on the cc line, but that is mostly an aesthetic issue.
>
> Maintaining a shell script and a .pc file will lead to inconsistency and
> weird bug reports.  Thus it is a waste of time.
> "
>
> [YOCTO #2453]
>
> The following changes since commit 247b6a3754c2c50318e2a73d79981ba0e9cb560b:
>
>    gstreamer, gst-plugins*: fix localdata (2012-11-28 15:25:33 +0000)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib ChenQi/pkgconfig2
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/pkgconfig2
>
> Chen Qi (4):
>    libksba: add pkgconfig support
>    ICU: add pkgconfig support
>    pth: add pkgconfig support
>    libassuan: add pkgconfig support
>
>   .../icu/files/icu-add-pkgconfig-support.patch      |   43 ++++++++
>   meta/recipes-support/icu/icu-3.6.inc               |   11 ++
>   meta/recipes-support/icu/icu_3.6.bb                |    2 +-
>   .../files/libassuan-add-pkgconfig-support.patch    |   57 +++++++++++
>   meta/recipes-support/libassuan/libassuan_2.0.3.bb  |    5 +-
>   .../libksba/ksba-add-pkgconfig-support.patch       |   57 +++++++++++
>   meta/recipes-support/libksba/libksba_1.3.0.bb      |    8 +-
>   .../pth/files/pth-add-pkgconfig-support.patch      |  105 ++++++++++++++++++++
>   meta/recipes-support/pth/pth_2.0.7.bb              |    7 +-
>   9 files changed, 286 insertions(+), 9 deletions(-)
>   create mode 100644 meta/recipes-support/icu/files/icu-add-pkgconfig-support.patch
>   create mode 100644 meta/recipes-support/libassuan/files/libassuan-add-pkgconfig-support.patch
>   create mode 100644 meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
>   create mode 100644 meta/recipes-support/pth/files/pth-add-pkgconfig-support.patch
>



