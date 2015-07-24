Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 949B560962
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 08:32:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6O8W1P6027510
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 01:32:01 -0700 (PDT)
Received: from [128.224.162.176] (128.224.162.176) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 24 Jul 2015 01:32:01 -0700
Message-ID: <55B1F7FF.2090106@windriver.com>
Date: Fri, 24 Jul 2015 16:31:59 +0800
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
X-List-Received-Date: Fri, 24 Jul 2015 08:32:03 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Ping again ...

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

