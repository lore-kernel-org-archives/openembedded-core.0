Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SIKie-0007Bu-PI
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 16:09:53 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3CE0VuS016923
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 07:00:31 -0700 (PDT)
Received: from [128.224.162.196] (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 12 Apr 2012 07:00:31 -0700
Message-ID: <4F86DFFE.3010206@windriver.com>
Date: Thu, 12 Apr 2012 22:00:30 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1333085308.git.liezhi.yang@windriver.com>
	<ac05d9a1b72099761bbc1a8312cd0d4ad8600b4a.1333085308.git.liezhi.yang@windriver.com>
In-Reply-To: <ac05d9a1b72099761bbc1a8312cd0d4ad8600b4a.1333085308.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/1] qt4-x11-free: enable -accessibility and -sm
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
X-List-Received-Date: Thu, 12 Apr 2012 14:09:53 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Is there any suggestions for this one please?

// Robert

On 03/30/2012 01:29 PM, Robert Yang wrote:
> Is it possible to enable the "-sm -accessibility" in oe-core, please?
> There is a meta-kde layer which requires the "-sm -accessibility", but
> they are disabled in meta/recipes-qt/qt4/qt4.inc:
>
> QT_DISTRO_FLAGS ?= "-no-accessibility -no-sm"
>
> I checked the log of the qt4, can't find the related log for
> "-no-accessibility -no-sm".
>
> Another way is use the bbappend, but it would be great if it can be
> enabled in oe-core.
>
> This only enables for qt4-x11, doesn't enable for qt4-embedded, and
> have done testing on: qemux86, qemuarm, qemumips, qemuppc.
>
> Signed-off-by: Robert Yang<liezhi.yang@windriver.com>
> ---
>   meta/recipes-qt/qt4/qt4-x11-free.inc |    3 +++
>   1 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
> index 072c522..a59198d 100644
> --- a/meta/recipes-qt/qt4/qt4-x11-free.inc
> +++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
> @@ -13,6 +13,9 @@ QT_GLFLAGS_qemuppc = "-opengl"
>   QT_CONFIG_FLAGS += "-no-xinerama -no-xkb"
>   QT_BASE_LIB  ?= "libqt"
>
> +# required by kdelibs4
> +QT_DISTRO_FLAGS = "-accessibility -sm"
> +
>   inherit qt4x11
>
>   do_install_append() {


