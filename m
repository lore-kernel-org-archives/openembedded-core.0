Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CE1586C3E1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 22:40:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0FMdOZT011732
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Jan 2019 14:39:35 -0800
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 15 Jan 2019 14:39:13 -0800
To: Stefan Agner <stefan@agner.ch>, <openembedded-core@lists.openembedded.org>
References: <20190115222730.54560-1-stefan@agner.ch>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <34f14ff1-44d4-8aac-5fd2-acb81c95830d@windriver.com>
Date: Tue, 15 Jan 2019 17:39:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190115222730.54560-1-stefan@agner.ch>
X-Originating-IP: [172.25.44.4]
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH 0/5] Add polkit distro feature
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
X-List-Received-Date: Tue, 15 Jan 2019 22:40:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 1/15/19 5:27 PM, Stefan Agner wrote:
> From: Stefan Agner <stefan.agner@toradex.com>
> 
> This patchset adds Polkit (formerly known as PolicyKit) as a distro feature.
> Polkit is used to centrally manage system policies and allows non-privileged
> processes access privileged operations.
> 
> Since various packages such as systemd, ConnMan or NetworkManager allow building
> with/without Polkit support it is sensible to have a global policy by using a
> distro feature to descide whether to use Polkit.
> 
> Currently there is NetworkManager and xfce4 which enable polkit if systemd is
> enabled. Using Polkit as a distro feature allows to easily prevent any Polkit
> use while still using systemd.
> 
> I plan to send another patch to wire this up in various packages in
> meta-openembedded as well as documentation update.

Thanks.

The patches are pretty straight-forward.
LGTM.

../Randy

> 
> --
> Stefan
> 
> Stefan Agner (5):
>    systemd: only enable polkit if DISTRO_FEATURES asks for polkit
>    gconf: rename policykit to polkit
>    gconf: enable polkit if polkit distro feature is set
>    consolekit: rename policykit to polkit
>    consolekit: enable polkit if polkit distro feature is set
> 
>   meta/recipes-core/systemd/systemd_239.bb            | 3 +--
>   meta/recipes-gnome/gnome/gconf_3.2.6.bb             | 7 +++----
>   meta/recipes-support/consolekit/consolekit_0.4.6.bb | 4 ++--
>   3 files changed, 6 insertions(+), 8 deletions(-)
> 


-- 
# Randy MacLeod
# Wind River Linux

