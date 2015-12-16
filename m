Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id A8C5C6FFD8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 20:57:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id E7ADB261149
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1449754339.git.Martin.Jansa@gmail.com>
From: Joshua Lock <joshua.lock@collabora.co.uk>
Message-ID: <5671D029.9040005@collabora.co.uk>
Date: Wed, 16 Dec 2015 20:57:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <cover.1449754339.git.Martin.Jansa@gmail.com>
Subject: Re: [PATCH][fido][RESEND 0/5] Backports for fido
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
X-List-Received-Date: Wed, 16 Dec 2015 20:57:17 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/15 13:48, Martin Jansa wrote:
> The following changes since commit 9f339f516ab03d598fae0e536b3a420ea4d8ee1a:
>
>    bash: Disable custom memory allocator (2015-11-20 15:46:27 +0000)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib jansa/fido-backports
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/fido-backports
>
> Martin Jansa (2):
>    texinfo: don't create dependency on INHERIT variable
>    linux-dtb.inc: drop unused DTB_NAME variable from do_install
>
> Mike Crowe (1):
>    allarch: Force TARGET_*FLAGS variable values
>
> Richard Purdie (2):
>    layer.conf: Add several allarch dependency exclusions
>    layer.conf: Add missing dependency for allarch package
>      initramfs-framework

Thanks, I've merged these 5 and the 6th that followed to my fido-next 
branch, I hope to test it on the autobuilder tomorrow.

http://cgit.openembedded.org/openembedded-core-contrib/log/?h=joshuagl/fido-next

Regards,

Joshua

>
>   meta/classes/allarch.bbclass                 |  4 ++++
>   meta/conf/layer.conf                         | 11 +++++++++++
>   meta/recipes-extended/texinfo/texinfo_5.2.bb |  2 +-
>   meta/recipes-kernel/linux/linux-dtb.inc      |  1 -
>   4 files changed, 16 insertions(+), 2 deletions(-)
>


