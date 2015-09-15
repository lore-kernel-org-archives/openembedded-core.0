Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 99F9A73D27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 16:05:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 9F3893C88761
Message-ID: <1442333103.3357.42.camel@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Sep 2015 17:05:03 +0100
In-Reply-To: <1441886051-18676-3-git-send-email-Martin.Jansa@gmail.com>
References: <1441886051-18676-1-git-send-email-Martin.Jansa@gmail.com>
	<1441886051-18676-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.16.5 (3.16.5-1.fc22) 
Mime-Version: 1.0
Subject: Re: [fido][PATCH 3/3] postinst_intercept: allow to pass variables with spaces
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
X-List-Received-Date: Tue, 15 Sep 2015 16:05:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-09-10 at 13:54 +0200, Martin Jansa wrote:
> * trying to pass foo="a b" through postinst_intercept ends
>   with the actual script header to containing:
>   b
>   foo=a
>   which fails because "b" command doesn't exist.
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Patch queued in my joshuagl/fido-next tree - thanks!

Joshua

http://cgit.openembedded.org/openembedded-core-contrib/log/?h=joshuagl/
fido-next

> ---
>  scripts/postinst-intercepts/postinst_intercept | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/postinst-intercepts/postinst_intercept
> b/scripts/postinst-intercepts/postinst_intercept
> index a257198..b18e806 100755
> --- a/scripts/postinst-intercepts/postinst_intercept
> +++ b/scripts/postinst-intercepts/postinst_intercept
> @@ -48,7 +48,7 @@ if [ -n "$pkgs_line" ]; then
>  		sed -i -e "s/##PKGS:.*/\0${package_name} /"
> $intercept_script
>  	fi
>  else
> -	for var in $@; do
> +	for var in "$@"; do
>  		sed -i -e "\%^#\!/bin/.*sh%a $var" $intercept_script
>  	done
>  	echo "##PKGS: ${package_name} " >> $intercept_script

