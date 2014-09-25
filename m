Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C7BEE60144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 09:11:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8P9BHMv003271
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 02:11:17 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 25 Sep 2014 02:11:16 -0700
Message-ID: <5423DC60.6050902@windriver.com>
Date: Thu, 25 Sep 2014 17:12:00 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1411114143.git.Qi.Chen@windriver.com>
In-Reply-To: <cover.1411114143.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.187]
Subject: Re: [PATCH 0/4] Fixes for syslog services in systemd
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
X-List-Received-Date: Thu, 25 Sep 2014 09:11:16 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Please drop this one.

V2 has been sent to fix a problem in the patch for sysklogd.

//Chen Qi

On 09/19/2014 04:11 PM, Chen Qi wrote:
> The following changes since commit f6a39cc957bf85ff43513f0b76afc3b2c9c906b6:
>
>    sstatesig: fix overrides behaviour to remove SIGGEN_LOCKEDSIGS_i586 (2014-09-17 22:00:05 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib ChenQi/systemd-syslog-service
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/systemd-syslog-service
>
> Chen Qi (4):
>    systemd: enable syslog.socket by default
>    busybox: fix for syslog service in systemd
>    sysklogd: add systemd support
>    sysklog: comment out configuration regarding xconsole
>
>   meta/recipes-core/busybox/busybox.inc              |   9 +-
>   .../busybox/files/busybox-klogd.service.in         |   4 +-
>   .../busybox/files/busybox-syslog.service.in        |   7 +-
>   meta/recipes-core/systemd/systemd_216.bb           |   2 +
>   .../files/0001-syslogd.c-add-systemd-support.patch | 207 +++++++++++++++++++++
>   meta/recipes-extended/sysklogd/files/klogd.service |   9 +
>   .../sysklogd/files/sysklogd.service                |  14 ++
>   meta/recipes-extended/sysklogd/files/syslog.conf   |   8 +-
>   meta/recipes-extended/sysklogd/sysklogd.inc        |  38 +++-
>   9 files changed, 278 insertions(+), 20 deletions(-)
>   create mode 100644 meta/recipes-extended/sysklogd/files/0001-syslogd.c-add-systemd-support.patch
>   create mode 100644 meta/recipes-extended/sysklogd/files/klogd.service
>   create mode 100644 meta/recipes-extended/sysklogd/files/sysklogd.service
>


