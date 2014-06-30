Return-Path: <scerveau@connected-labs.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id C2A8160889
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 14:20:31 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id n3so6092536wiv.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 07:20:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=hKvL+0GIoF+oU4+IZdNaQAAkFvSIImcUudKuJmV+c0w=;
	b=BiQ9sAPbhkMyJVJgkEYLWnjfXrhYsox7RBWXX1nxoSrZyhUNWPqspgSr12mkSFLSsw
	6duYai7HX2MMAp7ZaHxHR1HBNY3wjKoJ6yn08cUNJlVvWgWpADSh0/t3oAwxz/QW7WGp
	KYbLdz4Qjls8GZNmHuso0OiCPjuMN4XLp2Cm06mKeM1jfuxZX4Lhckd0UY9EgSzzSui9
	Xk6iBECqKW3ZAt/wjPLfa/roLmV7BsSnCohebQj2nqCl5dkNq9xbieVfSgzskpBs5/4O
	HOQuos/UhnXp105LH7kuH+RvjK2cmlw6rRGrogI987KyEFLy2PvmtiDtBZSf+uHLXq1R
	wyGg==
X-Gm-Message-State: ALoCoQkH4jkTlI9vgwjW3OXHxrfYn5TxpqbxHwZ4XZCbSq0Po/qmiUf4I3xh6CgNEsJP985FxjQO
X-Received: by 10.194.200.37 with SMTP id jp5mr3265742wjc.120.1404138031773;
	Mon, 30 Jun 2014 07:20:31 -0700 (PDT)
Received: from [172.24.63.14]
	(connected-labs-gw1.ter2.neodc.mpl.cust.as8218.eu. [94.103.137.126])
	by mx.google.com with ESMTPSA id
	fb8sm31897098wib.15.2014.06.30.07.20.30 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 30 Jun 2014 07:20:31 -0700 (PDT)
Message-ID: <53B17224.4050602@connected-labs.com>
Date: Mon, 30 Jun 2014 16:20:20 +0200
From: Stephane Cerveau <scerveau@connected-labs.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: =?UTF-8?B?U3TDqXBoYW5lIENlcnZlYXU=?= <scerveau@connected-labs.com>, 
	openembedded-core@lists.openembedded.org
References: <1404137924-14085-1-git-send-email-scerveau@connected-labs.com>
In-Reply-To: <1404137924-14085-1-git-send-email-scerveau@connected-labs.com>
Subject: Re: [dora][PATCH] e2fsprogs: Fix populate-extfs.sh
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
X-List-Received-Date: Mon, 30 Jun 2014 14:20:34 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

This patch applies to master and daisy branches too.

On 06/30/2014 04:18 PM, Stéphane Cerveau wrote:
> Fix the use of command dirname on ubuntu 12.04.
> dirname does not accept space in file name.
>
> Signed-off-by: Stéphane Cerveau <scerveau@connected-labs.com>
> ---
>   .../e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh   |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh
> index 26a8d89..47f5b5b 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh
> @@ -28,7 +28,7 @@ DEBUGFS="debugfs"
>   		[ ! -z "$DIR" ] || continue
>   		[ ! -z "$TGT" ] || continue
>   
> -                DIR="$(dirname $DIR)"
> +                DIR="$(dirname "$DIR")"
>   
>   		if [ "$DIR" != "$CWD" ]; then
>   			echo "cd $DIR"


