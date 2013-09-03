Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B47716060B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 02:14:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r832E8Ro018273
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Sep 2013 19:14:08 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Mon, 2 Sep 2013 19:14:08 -0700
Message-ID: <5225460D.3030203@windriver.com>
Date: Tue, 3 Sep 2013 10:14:37 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1378174301.git.Qi.Chen@windriver.com>
In-Reply-To: <cover.1378174301.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.233]
Subject: Re: [PATCH 0/2] busybox & sysklogd: weigh busybox's syslogd/klogd utilities over those from sysklogd in case of systemd
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
X-List-Received-Date: Tue, 03 Sep 2013 02:14:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Sorry. I forgot to put 'V2' here.
Another patchset has been sent out.

//Chen Qi

On 09/03/2013 10:12 AM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> The following changes since commit c7994f83baa678a4670472e1f037bfc16cb1e3be:
>
>    bitbake: runqueue: Fix scenequeue to pass file descriptors, not a float (2013-09-02 09:16:24 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib ChenQi/systemd-syslog
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd-syslog
>
> Chen Qi (2):
>    busybox-syslog: add configuration file /etc/syslog.conf
>    sysklogd: lower the ALTERNATIVE_PRIORITY in case of systemd
>
>   meta/recipes-core/busybox/busybox.inc       |    6 +++++-
>   meta/recipes-core/busybox/busybox_1.21.1.bb |    1 +
>   meta/recipes-core/busybox/files/syslog.conf |    1 +
>   meta/recipes-extended/sysklogd/sysklogd.inc |    4 +++-
>   4 files changed, 10 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-core/busybox/files/syslog.conf
>


