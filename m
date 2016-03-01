Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A903C6E668
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 22:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u21M7Jf5015458; Tue, 1 Mar 2016 22:07:19 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id efxcQdFB9kAJ; Tue,  1 Mar 2016 22:07:19 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u21M7F3c015453
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 1 Mar 2016 22:07:16 GMT
Message-ID: <1456870035.25131.20.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Johannes Pointner <h4nn35.work@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 01 Mar 2016 22:07:15 +0000
In-Reply-To: <1456868358-9326-1-git-send-email-johannes.pointner@gmail.com>
References: <1456868358-9326-1-git-send-email-johannes.pointner@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [Patch][jethro][master] xcursor-transparent-theme: insert several cursors
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
X-List-Received-Date: Tue, 01 Mar 2016 22:07:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-03-01 at 22:39 +0100, Johannes Pointner wrote:
> This patch inserts several cursors which are used by Qt for example.
> 
> Signed-off-by: Johannes Pointner <johannes.pointner@gmail.com>
> ---
>  .../insert_several_cursors.patch                   | 79
> ++++++++++++++++++++++
>  .../xcursor-transparent-theme_0.1.1.bb             |  3 +-
>  2 files changed, 81 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-graphics/xcursor-transparent
> -theme/xcursor-transparent-theme-0.1.1/insert_several_cursors.patch
> 
> diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor
> -transparent-theme-0.1.1/insert_several_cursors.patch b/meta/recipes
> -graphics/xcursor-transparent-theme/xcursor-transparent-theme
> -0.1.1/insert_several_cursors.patch
> new file mode 100644
> index 0000000..861899e
> --- /dev/null
> +++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor
> -transparent-theme-0.1.1/insert_several_cursors.patch
> @@ -0,0 +1,79 @@

There is no description of the patch here, what it does, who wrote it,
what the upstream status is etc. Please read the patch submission
guidelines.

How have we survived so long without needing this if its so important?

Cheers,

Richard



