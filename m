Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CAE1D606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 03:10:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t373AE78019686
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Apr 2015 20:10:14 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Mon, 6 Apr 2015 20:10:14 -0700
Message-ID: <55234A9E.5090006@windriver.com>
Date: Tue, 7 Apr 2015 11:10:22 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1427186518.git.Qi.Chen@windriver.com>
In-Reply-To: <cover.1427186518.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.236]
Subject: Re: [PATCH 0/4] Support persistent /var/log
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Apr 2015 03:10:14 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ping

Any comment on this one?

//Chen Qi

On 03/24/2015 04:42 PM, Chen Qi wrote:
> The following changes since commit d3fcfe346b3472170641d9194243c4bbe06b8585:
>
>    systemd: fix firmware path to match linux-firmware (2015-03-23 11:27:13 +0000)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib ChenQi/persistent-var-log
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/persistent-var-log
>
> Chen Qi (4):
>    bitbake.conf: add VOLATILE_LOG_DIR variable
>    base-files: respect VOLATILE_LOG_DIR
>    initscripts: support persistent /var/log
>    package.bbclass: support persistent /var/log
>
>   meta/classes/package.bbclass                       |  2 +-
>   meta/conf/bitbake.conf                             |  4 ++
>   meta/files/fs-perms-persistent-log.txt             | 66 ++++++++++++++++++++++
>   meta/recipes-core/base-files/base-files_3.0.14.bb  |  4 +-
>   .../initscripts/initscripts-1.0/volatiles          |  1 -
>   meta/recipes-core/initscripts/initscripts_1.0.bb   |  3 +
>   6 files changed, 76 insertions(+), 4 deletions(-)
>   create mode 100644 meta/files/fs-perms-persistent-log.txt
>


