Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9A59F741CF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 06:53:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6D6ralQ003980
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 12 Jul 2015 23:53:36 -0700 (PDT)
Received: from [128.224.162.211] (128.224.162.211) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Sun, 12 Jul 2015 23:53:32 -0700
Message-ID: <55A3609A.4010606@windriver.com>
Date: Mon, 13 Jul 2015 14:54:18 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, "rongqing.li@windriver.com"
	<rongqing.li@windriver.com>
References: <1435641416-2577-1-git-send-email-rongqing.li@windriver.com>
	<CAMKF1sqH-54HT9t7VoRX_0AkRw6CQN2CHG-pHCfnqY0YXQYhbw@mail.gmail.com>
In-Reply-To: <CAMKF1sqH-54HT9t7VoRX_0AkRw6CQN2CHG-pHCfnqY0YXQYhbw@mail.gmail.com>
X-Originating-IP: [128.224.162.211]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: fix systemd-udev-hwdb-update service
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
X-List-Received-Date: Mon, 13 Jul 2015 06:53:36 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/13/2015 01:00 PM, Khem Raj wrote:
> On Mon, Jun 29, 2015 at 10:16 PM,  <rongqing.li@windriver.com> wrote:
>> This patch achieves the above goal by setting CondistonNeedsUpdate to
>> "/etc/udev" in the service file, and creating /etc/udev/.updated file if the
>> postinst succeeds.
> will  /etc/udev/.updated get packaged automatically in case of r/o rootfs ?

No. It will not get packaged because it's created at rootfs time in 
pkg_postinst of udev-hwdb.

Best Regards,
Chen Qi

