Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5CDCD61105
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 10:00:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8QA0TGu028173
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 03:00:30 -0700 (PDT)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Thu, 26 Sep 2013 03:00:28 -0700
Message-ID: <524405C0.9030504@windriver.com>
Date: Thu, 26 Sep 2013 18:00:32 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1380183254.git.Qi.Chen@windriver.com>
In-Reply-To: <cover.1380183254.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.213]
Subject: Re: [PATCH 0/1] sysvinit: fix missing of boot log
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
X-List-Received-Date: Thu, 26 Sep 2013 10:00:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Please ignore this one.
It has a potential problem. That is, if tmpfs is not mounted (currently 
done in the udev init script, but udev may not be installed), the log 
will still be missing.

I'll send out a V2.

//Chen Qi

On 09/26/2013 04:14 PM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> The following changes since commit 4d8ab87d25ea6e59dc88375813ef88ee0ac813d0:
>
>    build-appliance: Update SRCREV (2013-09-24 18:09:12 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib ChenQi/bootlogd
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/bootlogd
>
> Chen Qi (1):
>    sysvinit: fix missing of boot log
>
>   meta/recipes-core/sysvinit/sysvinit/bootlogd.init |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>


