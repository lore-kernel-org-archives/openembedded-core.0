Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 443CA6FFDD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Dec 2015 00:10:11 +0000 (UTC)
Received: by pfbo64 with SMTP id o64so7168117pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Dec 2015 16:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=2qqti+qWB2Q/GeKUtSlqIXcJJV10HmvXrM6tUXzlsPI=;
	b=Pw5lLmkKv0xrGPPrTgWsGAa4KZdKGYXxmGm2oAELPZyeLLp+nRxXwa6tX46cUP+bkS
	wTXPHtaHSo6WEAEKnQqz6A02fGzBEcw2qG0yOBr23DdilQAnPzkX0CfQg01w9vKb/Tt5
	s4xH8P9KrwzL2u/hSP0uIJlr91Td0gU8OkwMYgkQ2FzLzY0vtzxR6D3XUJVqfgmrOZz1
	+3+q5K9HknPAZhDSc+4FiYjahrDRZ7Djs0qCbe0ReAsFIWrWNGqWXtX/nbJEz3oalbvd
	emCRu2hnRc8DQ7KoTSCL7kKQgQpTcH5V2PxzpirSuZK3pyPxctKflNxSFt+jrk8didk4
	Nu1Q==
X-Received: by 10.98.89.196 with SMTP id k65mr25815759pfj.12.1449965412305;
	Sat, 12 Dec 2015 16:10:12 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:b850:fd27:ad42:7471?
	([2601:202:4000:1239:b850:fd27:ad42:7471])
	by smtp.googlemail.com with ESMTPSA id
	ah10sm33811469pad.23.2015.12.12.16.10.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Dec 2015 16:10:11 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1449754336.git.Martin.Jansa@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <566CB761.2060109@gmail.com>
Date: Sat, 12 Dec 2015 16:10:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <cover.1449754336.git.Martin.Jansa@gmail.com>
Subject: Re: [PATCH][dizzy][RESEND 0/7] Backports for dizzy
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
X-List-Received-Date: Sun, 13 Dec 2015 00:10:12 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit


merged to staging.

thanks
Armin

On 12/10/2015 05:47 AM, Martin Jansa wrote:
> The following changes since commit 7bb182bdd130266100fc541fd09b82d09c51cd80:
> 
>   build-appliance-image: Update to dizzy head revision (2015-09-29 14:56:04 +0100)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib jansa/dizzy-backports
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/dizzy-backports
> 
> Chen Qi (1):
>   image.bbclass: don't let do_rootfs depend on BUILDNAME
> 
> Martin Jansa (3):
>   fontcache: allow to pass extra parameters and environment to fc-cache
>   texinfo: don't create dependency on INHERIT variable
>   linux-dtb.inc: drop unused DTB_NAME variable from do_install
> 
> Mike Crowe (1):
>   allarch: Force TARGET_*FLAGS variable values
> 
> Richard Purdie (2):
>   layer.conf: Add several allarch dependency exclusions
>   layer.conf: Add missing dependency for allarch package
>     initramfs-framework
> 
>  meta/classes/allarch.bbclass                  |  4 ++++
>  meta/classes/fontcache.bbclass                | 19 +++++++++++++++----
>  meta/classes/image.bbclass                    |  2 +-
>  meta/conf/layer.conf                          | 11 +++++++++++
>  meta/recipes-extended/texinfo/texinfo_5.2.bb  |  2 +-
>  meta/recipes-kernel/linux/linux-dtb.inc       |  1 -
>  scripts/postinst-intercepts/update_font_cache |  4 ++--
>  7 files changed, 34 insertions(+), 9 deletions(-)
> 

