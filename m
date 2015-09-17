Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1AFC576E04
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 08:37:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8H8bgBc022102
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 01:37:42 -0700 (PDT)
Received: from [128.224.162.211] (128.224.162.211) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Thu, 17 Sep 2015 01:37:40 -0700
Message-ID: <55FA7C1C.6060702@windriver.com>
Date: Thu, 17 Sep 2015 16:38:52 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Shan Hai <shan.hai@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <1431667783-27190-1-git-send-email-shan.hai@windriver.com>
In-Reply-To: <1431667783-27190-1-git-send-email-shan.hai@windriver.com>
X-Originating-IP: [128.224.162.211]
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
X-List-Received-Date: Thu, 17 Sep 2015 08:37:44 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Without this patch, we would meet errors like below.
Please consider merging this patch.

root@qemux86-64:~# touch 1 2
root@qemux86-64:~# ls
1  2
root@qemux86-64:~# runuser -l root -c ls
runuser: Failure setting user credentials

Best Regards,
Chen Qi

On 05/15/2015 01:29 PM, Shan Hai wrote:
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


