Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id A027460819
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 10:59:49 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5HB5kBt021173; Mon, 17 Jun 2013 12:05:46 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dKp9ZqlOq2Il; Mon, 17 Jun 2013 12:05:46 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5HB5hTF021152
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 17 Jun 2013 12:05:45 +0100
Message-ID: <1371466776.20823.101.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jackie.huang@windriver.com
Date: Mon, 17 Jun 2013 11:59:36 +0100
In-Reply-To: <1371461969-16134-1-git-send-email-jackie.huang@windriver.com>
References: <1371461969-16134-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dbus-wait: fix the help message typo
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
X-List-Received-Date: Mon, 17 Jun 2013 10:59:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-06-17 at 17:39 +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../dbus-wait/dbus-wait/fix-dbus-wait-typo.patch   |   31 ++++++++++++++++++++
>  meta/recipes-core/dbus-wait/dbus-wait_git.bb       |    6 ++-
>  2 files changed, 35 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-core/dbus-wait/dbus-wait/fix-dbus-wait-typo.patch

I took this but since the Yocto Project is the upstream for this, I
merged that, then updated the SRCREV instead.

Cheers,

Richard


