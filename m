Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1U01ZD-0004Ng-Cl
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 04:08:59 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0T2rGPk018670
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Jan 2013 18:53:19 -0800 (PST)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.328.9;
	Mon, 28 Jan 2013 18:53:15 -0800
Message-ID: <510739ED.4010403@windriver.com>
Date: Tue, 29 Jan 2013 10:54:37 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Kang Kai <kai.kang@windriver.com>
References: <cover.1358910000.git.kai.kang@windriver.com>
In-Reply-To: <cover.1358910000.git.kai.kang@windriver.com>
X-Originating-IP: [128.224.162.205]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	r0T2rGPk018670
Cc: openembedded-core@lists.openembedded.org, Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 0/2] V3: Refactor external-python-tarball.bb
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
X-List-Received-Date: Tue, 29 Jan 2013 03:08:59 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2013=E5=B9=B401=E6=9C=8823=E6=97=A5 11:13, Kang Kai wrote:
> V3:
> Inherit bbclass at then end of bb file that we can still use ?=3D to de=
fine variables.
> Remove DEPENDS that already defined in populate_sdk_base.bbclass.

Hi Saul,

Any more comments for this patch of version 3?

Regards,
Kai

>
> The following changes since commit 37e025f6f9c410005e0f1dee0767e38eaec0=
1cbd:
>
>    bitbake: hob: Hob should display warnings generated during parsing (=
2013-01-21 19:05:31 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib kangkai/external-python
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dkangkai/exte=
rnal-python
>
> Kang Kai (2):
>    createrepo-native: update dependency
>    external-python-tarball: code refactoring
>
>   meta/recipes-core/meta/external-python-tarball.bb  |   67 +----------=
--------
>   .../createrepo/createrepo_0.4.11.bb                |    4 +-
>   2 files changed, 6 insertions(+), 65 deletions(-)
>



