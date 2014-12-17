Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 196847263B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 07:22:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBH7MJrZ025932
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Dec 2014 23:22:20 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 16 Dec 2014 23:22:19 -0800
Message-ID: <54912F2A.4080502@windriver.com>
Date: Wed, 17 Dec 2014 15:22:18 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1418785337.git.Qi.Chen@windriver.com>
In-Reply-To: <cover.1418785337.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.226]
Subject: Re: [PATCH 0/1] dhcp: add dhclient.service
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
X-List-Received-Date: Wed, 17 Dec 2014 07:22:26 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Please ignore this one.
This one doesn't take nfs boot into consideration.

V2 will be sent.

Regards,
Chen Qi

On 12/17/2014 11:03 AM, Chen Qi wrote:
> The following changes since commit 68ddb28a68ceb59cd1ed322c16143827ce1ac712:
>
>    distrodata_class: checkpkg make usage of latest_versionstring methods in bitbake fetcher (2014-11-28 13:59:52 +0000)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib ChenQi/systemd-dhclient
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd-dhclient
>
> Chen Qi (1):
>    dhcp: add dhclient.service
>
>   meta/recipes-connectivity/dhcp/dhcp.inc               | 11 ++++++++---
>   meta/recipes-connectivity/dhcp/files/dhclient.service | 15 +++++++++++++++
>   2 files changed, 23 insertions(+), 3 deletions(-)
>   create mode 100644 meta/recipes-connectivity/dhcp/files/dhclient.service
>


