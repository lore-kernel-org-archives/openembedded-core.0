Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5A6F66B7CA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 07:27:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8H7RMKv022497
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 00:27:22 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Wed, 17 Sep 2014 00:27:22 -0700
Message-ID: <541937D7.5000105@windriver.com>
Date: Wed, 17 Sep 2014 15:27:19 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1410240620.git.Chong.Lu@windriver.com>
In-Reply-To: <cover.1410240620.git.Chong.Lu@windriver.com>
X-Originating-IP: [128.224.162.204]
Subject: Re: [PATCH 0/1] xinetd: add systemd unit file
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
X-List-Received-Date: Wed, 17 Sep 2014 07:27:22 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

ping

On 09/09/2014 01:32 PM, Chong Lu wrote:
> root@qemux86:~# systemctl status xinetd
> ● xinetd.service - Xinetd A Powerful Replacement For Inetd
>     Loaded: loaded (/lib/systemd/system/xinetd.service; enabled)
>     Active: active (running) since Tue 2014-09-09 05:13:43 UTC; 15s ago
>    Process: 124 ExecStart=/usr/sbin/xinetd -stayalive -pidfile /var/run/xinetd.pid $EXTRAOPTIONS (code=exited, status=0/SUCCESS)
>   Main PID: 126 (xinetd)
>     CGroup: /system.slice/xinetd.service
>             └─126 /usr/sbin/xinetd -stayalive -pidfile /var/run/xinetd.pid
>
> Sep 09 05:13:43 qemux86 xinetd[126]: xinetd Version 2.3.15 started with lib...n.
> Sep 09 05:13:43 qemux86 xinetd[126]: Started working: 0 available services
>
> The following changes since commit 1894522f357fdf0b6adb2dcc14f12817628596bd:
>
>    bitbake: tinfoil: add a means of enabling variable history tracking (2014-09-05 10:14:25 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib chonglu/xinetd
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/xinetd
>
> Chong Lu (1):
>    xinetd: add systemd unit file
>
>   meta/recipes-extended/xinetd/xinetd/xinetd.service | 13 +++++++++++++
>   meta/recipes-extended/xinetd/xinetd_2.3.15.bb      | 12 +++++++++++-
>   2 files changed, 24 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-extended/xinetd/xinetd/xinetd.service
>


