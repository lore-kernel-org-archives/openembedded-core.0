Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id E98F36D86B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 11:59:04 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rARBwwWs026536; Wed, 27 Nov 2013 11:58:58 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id FIkF5Ot-e4XT; Wed, 27 Nov 2013 11:58:58 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rARBwpeK026529
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 27 Nov 2013 11:58:53 GMT
Message-ID: <1385553529.11246.22.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yue Tao <Yue.Tao@windriver.com>
Date: Wed, 27 Nov 2013 11:58:49 +0000
In-Reply-To: <1385538944-8585-3-git-send-email-Yue.Tao@windriver.com>
References: <1385538944-8585-1-git-send-email-Yue.Tao@windriver.com>
	<1385538944-8585-3-git-send-email-Yue.Tao@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/5] bind: add init.d/bind status command
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
X-List-Received-Date: Wed, 27 Nov 2013 11:59:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-11-27 at 15:55 +0800, Yue Tao wrote:
> Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
> ---
>  .../bind-add-init-bind-status-command.patch        |   45 ++++++++++++++++++++
>  meta/recipes-connectivity/bind/bind_9.8.1.bb       |    3 +-
>  2 files changed, 47 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/bind-add-init-bind-status-command.patch
> 
> diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/bind-add-init-bind-status-command.patch b/meta/recipes-connectivity/bind/bind-9.8.1/bind-add-init-bind-status-command.patch
> new file mode 100644
> index 0000000..8ed3c56
> --- /dev/null
> +++ b/meta/recipes-connectivity/bind/bind-9.8.1/bind-add-init-bind-status-command.patch
> @@ -0,0 +1,45 @@
> +--- a/init.d
> ++++ b/init.d
> +@@ -2,6 +2,8 @@

No patch header...

Cheers,

Richard


