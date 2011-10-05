Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RBRZC-0006Fy-2N for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 15:31:22 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p95DWEh2022331 for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Oct 2011 14:32:14 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Zluu-bwi8DcP
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2011 14:32:14 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p95DW9hT022322
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Oct 2011 14:32:10 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 05 Oct 2011 14:25:38 +0100
In-Reply-To: <1317765787-19127-4-git-send-email-msm@freescale.com>
References: <1317765787-19127-1-git-send-email-msm@freescale.com>
	<1317765787-19127-4-git-send-email-msm@freescale.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317821146.14671.152.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 4/6] scripts/oe-buildenv-internal: Add SOCKS5_{USER, PASSWD} to BB_ENV_EXTRAWHITE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Oct 2011 13:31:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-10-04 at 17:03 -0500, Matthew McClintock wrote:
> From: Kumar Gala <galak@kernel.crashing.org>
> 
> If a SOCKS5 gateway is needed for a proxy access like git it might also
> require authentication to the proxy via a password and username.  Adding
> SOCKS5_USER & SOCKS5_PASSWD to BB_ENV_EXTRAWHITE allow for automation
> of the authentication request to occur when something like a git fetch
> is going through the proxy.
> 
> This patch requires the bitbake patch to add extra exportvars so
> these variables get passed from Env -> bitbake -> fetcher
> 
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
> This requires a bitbake patch that was just sent:
> 
> http://lists.linuxtogo.org/pipermail/bitbake-devel/2011-October/001453.html

Merged to master, thanks.

Richard



