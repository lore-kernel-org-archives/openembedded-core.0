Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 71CFD74535
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Oct 2018 08:41:55 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9K8frs5002270
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 20 Oct 2018 09:41:55 +0100
Message-ID: <da0e5945e89cbee5712ecabf2409abcd7aa2fd8b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 20 Oct 2018 09:41:53 +0100
In-Reply-To: <20181017164326.67111-2-mark.hatle@windriver.com>
References: <20181017164326.67111-1-mark.hatle@windriver.com>
	<20181017164326.67111-2-mark.hatle@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/4] systemd: Remove items that made this machine (qemu) specific
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
X-List-Received-Date: Sat, 20 Oct 2018 08:41:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-10-17 at 12:43 -0400, Mark Hatle wrote:
> Create a new systemd-conf recipe to contain the specific
> system/machine
> configuration items.  This new package is now machine specific.
> 
> Without doing this trying to create a single system with multiple
> BSPs,
> one of which was qemu based, would result in the systemd -and-
> everything that
> dependend upon systemd to have their hash changed.  The hash changing
> means
> lots of rebuilds, but worse if it's a package based system each
> different
> machine ends with a new PR value and a newly generated package.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/recipes-core/systemd/systemd-conf.bb     | 51
> +++++++++++++++++++
>  ...ange-the-default-device-timeout-to-2.patch | 35 -------------
>  meta/recipes-core/systemd/systemd_239.bb      | 28 ++++------
>  3 files changed, 60 insertions(+), 54 deletions(-)
>  create mode 100644 meta/recipes-core/systemd/systemd-conf.bb
>  delete mode 100644 meta/recipes-core/systemd/systemd/0001-core-
> device.c-Change-the-default-device-timeout-to-2.patch

Something in -next is causing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/35/builds/92/steps/7/logs/step7c

which is a systemd boot timeout. 

Note that I fixed up the selftest issue with the patch, I also added a
maintainers entry for systemd-conf to avoid another problem so please
use the patch in -next for any further revisions. We're going to need
more investigation to merge this though...

Cheers,

Richard




