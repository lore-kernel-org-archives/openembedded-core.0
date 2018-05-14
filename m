Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B3A297853B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 22:23:28 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w4EMNQWV008463
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 14 May 2018 23:23:28 +0100
Message-ID: <1526336606.5720.145.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 14 May 2018 23:23:26 +0100
In-Reply-To: <1526332154-20637-1-git-send-email-armccurdy@gmail.com>
References: <1526332154-20637-1-git-send-email-armccurdy@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] bitbake.conf: drop obsolete comment referring to the fail-fast over-ride
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
X-List-Received-Date: Mon, 14 May 2018 22:23:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2018-05-14 at 14:09 -0700, Andre McCurdy wrote:
> The comment appears to have been accidentally left behind when the
> fail-fast over-ride was removed by:
> 
>   http://git.openembedded.org/openembedded-core/commit/?id=83ce96f445
> 16c8a4a44c8c0140949256f8422014
> 
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/conf/bitbake.conf | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index a21b728..a74d8cf 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -733,8 +733,8 @@ DISTRO_NAME ??= "OpenEmbedded"
>  # '_qemuarm' and then '' will be overriden with that value from '_qemuarm'.
>  # And finally '_forcevariable' overrides any standard variable, with the highest priority.
>  #
> -# This works for  functions as well, they are really just environment variables.
> -# Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
> +# This works for functions as well, they are really just environment variables.

If we're going to fix the comment, could you remove the word
"environment" from there too please? :)

Cheers,

Richard

