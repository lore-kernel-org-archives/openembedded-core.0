Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2873E6093F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Aug 2018 09:33:20 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w7B9XJhd011120
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 11 Aug 2018 10:33:20 +0100
Message-ID: <457fafc8309867b6199293e8d3369f5e86f1cef0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Dengke Du <dengke.du@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 11 Aug 2018 10:33:19 +0100
In-Reply-To: <1533893883-11594-1-git-send-email-dengke.du@windriver.com>
References: <1533893883-11594-1-git-send-email-dengke.du@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] nfs-utils: add runtime depends for nfs-export-root
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
X-List-Received-Date: Sat, 11 Aug 2018 09:33:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-08-10 at 17:38 +0800, Dengke Du wrote:
> When DISTRO_FEATURE enable "systemd", the nfs-server.service in nfs-
> utils
> depends on /etc/exports, but the file "/etc/exports" installed by
> package
> nfs-export-root. Otherwise the service would failed.
> 
> So we should add the runtime depends for nfs-export-root.
> 
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>  meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.1.bb | 1 +
>  1 file changed, 1 insertion(+)

I suspect that this may in fact be a feature, you enable the nfs server
by adding nfs-export-root to the image. The behaviour may therefore be
intended as not everyone installing nfs-utils wants a server. We should
perhaps better document that.

Also, when using sysvinit does this recipe generate an init script
which starts an nfs-server?

Cheers,

Richard

