Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1SlsJ8-00037q-Ua
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 03:53:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q631gZx0025867
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 2 Jul 2012 18:42:35 -0700 (PDT)
Received: from [128.224.162.164] (128.224.162.164) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 2 Jul 2012 18:42:35 -0700
Message-ID: <4FF24E07.7010905@windriver.com>
Date: Tue, 3 Jul 2012 09:42:31 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1340873279.git.kai.kang@windriver.com>
In-Reply-To: <cover.1340873279.git.kai.kang@windriver.com>
X-Originating-IP: [128.224.162.164]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q631gZx0025867
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 0/2] Fix lsbinitscripts link problem
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
X-List-Received-Date: Tue, 03 Jul 2012 01:53:39 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B406=E6=9C=8828=E6=97=A5 17:35, Kang Kai wrote:
> Hi Saul,
>
> I update the initscripts to use update alternative way to install file =
functions.
> That make file functions provided by lsbinitscripts will be used instea=
d of initscripts.

Could anyone give comments of these two patches?
Thanks.

Regards,
Kai

>
> Regards,
> Kai
>
> The following changes since commit 8ce8d25bcda0e2e0b62204d5ca5875dedcaa=
cf7d:
>
>    sanity.bbclass: Increase LAYER_CONF_VERSION to match bblayers change=
 (2012-06-25 17:20:54 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib kangkai/distro
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dkangkai/dist=
ro
>
> Kang Kai (1):
>    initscripts: use update-alternative to handle file functions
>
> Xiaofeng Yan (1):
>    lsbinitscripts: Add a linking for functions.lsbinitscripts
>
>   meta/recipes-core/initscripts/initscripts_1.0.bb |   10 ++++++++--
>   meta/recipes-extended/lsb/lsbinitscripts_9.03.bb |    6 +++---
>   2 files changed, 11 insertions(+), 5 deletions(-)
>



