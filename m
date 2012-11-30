Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TeOBx-0004GV-NW
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 11:51:34 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAUAbG8Q009737
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 02:37:16 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Fri, 30 Nov 2012 02:37:15 -0800
Message-ID: <50B88C74.5040001@windriver.com>
Date: Fri, 30 Nov 2012 18:37:40 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120410 Thunderbird/11.0.1
MIME-Version: 1.0
To: <Qi.Chen@windriver.com>
References: <cover.1354084523.git.Qi.Chen@windriver.com>
In-Reply-To: <cover.1354084523.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.163.154]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] [V2] Make poky work correctly with long TMPDIR
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
X-List-Received-Date: Fri, 30 Nov 2012 10:51:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/30/2012 06:33 PM, Qi.Chen@windriver.com wrote:
> From: Chen Qi<Qi.Chen@windriver.com>
>
> Poky had a problem with long TMPDIR.
> If the TMPDIR had a length of 410 chars, for example, the world building
> would fail for three reasons.
> 1) autotools.bbclass: With long TMPDIR, aclocal would have a very long argument
>     list whick makes building some packages (coretuils for example) fail.
> 2) qt4-native: It hardcodes some static char arrays to be 256.
> 3) ghostscript: It configures its MAX_TOKEN to be 256.
>
> This series of patches are aimed at making poky building system working correctly with long TMPDIR.
> The three patches solve the three above problems respectively.
>
> [Version 2 fixes the indentation problem in my last patch]
>
> The following changes since commit 0d7d413d64bab8d3c758414c6c8c653ccc325653:
>
>    build-appliance-image: Update to dee77eca39f406f90e60d9c5ef7a66fcc8f57dbf commit (2012-11-21 20:40:43 +0000)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib ChenQi/autotools
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/autotools
>
> Chen Qi (3):
>    autotools.bbclass: use relative path for acpaths whenever possible
>    qt4-native: make qt4-native work with long building path
>    ghostscript: make ghostscript work with long building path
>
>   meta/classes/autotools.bbclass                     |   14 ++--
>   ...tscript-work-with-long-building-directory.patch |   19 +++++
>   .../ghostscript/ghostscript_9.05.bb                |   10 +--
>   ...e-qt4-native-work-with-long-building-path.patch |   82 ++++++++++++++++++++
>   meta/recipes-qt/qt4/qt4-native.inc                 |    3 +-
>   5 files changed, 116 insertions(+), 12 deletions(-)
>   create mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-make-ghostscript-work-with-long-building-directory.patch
>   create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3/0001-make-qt4-native-work-with-long-building-path.patch
>
Sorry for my carelessness. Please ignore this version.
The upstream status is incorrect.


