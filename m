Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T20Q7-0008LT-FX
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 15:47:31 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7GDZWwo002038
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 06:35:32 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 16 Aug 2012 06:35:32 -0700
Message-ID: <502CF723.3090702@windriver.com>
Date: Thu, 16 Aug 2012 21:35:31 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1345105475.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1345105475.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/3 V2] Install external binary packages
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
X-List-Received-Date: Thu, 16 Aug 2012 13:47:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 08/16/2012 04:27 PM, Robert Yang wrote:
> Changes of V2:
> * Add commit message to each commit.
>
> Changes of V1:
> * Initial version
>
> // Robert
>
> The following changes since commit 0c6ac62a9fb81146ace64ae7493dcc56b4bed197:
>
>    documentation: remove references to Pimlico (2012-08-15 15:26:27 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib robert/external_install
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/external_install
>
> Robert Yang (3):
>    rpm: install external binary packages
>    ipk: install external binary packages
>    deb: install external binary packages
>
>   meta/classes/external_package.bbclass | 91 +++++++++++++++++++++++++++++++++++
>   meta/classes/image.bbclass            |  2 +
>   meta/classes/package_deb.bbclass      | 43 ++++++++++-------
>   meta/classes/package_ipk.bbclass      | 21 +++++++-
>   meta/classes/package_rpm.bbclass      | 12 +++--
>   meta/classes/rootfs_deb.bbclass       |  2 +-
>   meta/classes/rootfs_ipk.bbclass       |  2 +-
>   meta/classes/rootfs_rpm.bbclass       |  2 +-

I added the "inherit external_package" to populate_sdk_base.bbclass and
pushed to the repo.

// Robert

>   8 files changed, 151 insertions(+), 24 deletions(-)
>   create mode 100644 meta/classes/external_package.bbclass
>


