Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UCii7-0006S1-4Z
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 04:38:41 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r253M91a025381
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Mar 2013 19:22:09 -0800 (PST)
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 4 Mar 2013 19:22:08 -0800
Message-ID: <513564DA.2090103@windriver.com>
Date: Tue, 5 Mar 2013 11:22:02 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <cover.1359687579.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1359687579.git.liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] bitbake-whatchanged: print what is about to happen
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
X-List-Received-Date: Tue, 05 Mar 2013 03:38:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 02/01/2013 04:55 PM, Robert Yang wrote:
> The following changes since commit 9a26b9c69c47c87ce71a06f76682c187767e7897:
>
>    rpm: Ensure native binaries are correctly wrapped (2013-01-30 14:47:30 +0000)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib robert/what

Rebased to the up-to-date master branch and pushed to

git://git.pokylinux.org/poky-contrib robert/what

// Robert

>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/what
>
> Robert Yang (2):
>    bitbake.conf: add STAMPS_DIR for constructing STAMP
>    bitbake-whatchanged: print what is about to happen
>
>   meta/conf/bitbake.conf       |   5 +-
>   scripts/bitbake-whatchanged  | 339 +++++++++++++++++++++++++++++++++++++++++++
>   scripts/oe-buildenv-internal |   6 +-
>   3 files changed, 347 insertions(+), 3 deletions(-)
>   create mode 100755 scripts/bitbake-whatchanged
>


