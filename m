Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E19660088
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 02:48:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t612m8s4027097
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 19:48:09 -0700 (PDT)
Received: from [128.224.162.176] (128.224.162.176) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 30 Jun 2015 19:48:09 -0700
Message-ID: <559354E7.8080409@windriver.com>
Date: Wed, 1 Jul 2015 10:48:07 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1431667783-27190-1-git-send-email-shan.hai@windriver.com>
In-Reply-To: <1431667783-27190-1-git-send-email-shan.hai@windriver.com>
Subject: Re: [PATCH 0/1] util-linux: add runuser PAM config files
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
X-List-Received-Date: Wed, 01 Jul 2015 02:48:09 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Ping ...

On 05/15/2015 01:29 PM, Shan Hai wrote:
>
> Add PAM config files for util-linux to fix a runtime failure of the
> runuser command.
>
> meta/recipes-core/util-linux/util-linux.inc            | 8 ++++++++
>   meta/recipes-core/util-linux/util-linux/runuser-l.pamd | 4 ++++
>   meta/recipes-core/util-linux/util-linux/runuser.pamd   | 5 +++++
>   meta/recipes-core/util-linux/util-linux_2.24.2.bb      | 2 ++
>   4 files changed, 19 insertions(+)
>   create mode 100644 meta/recipes-core/util-linux/util-linux/runuser-l.pamd
>   create mode 100644 meta/recipes-core/util-linux/util-linux/runuser.pamd
>
> Thanks
> Shan Hai
>

