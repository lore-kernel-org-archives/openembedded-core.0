Received: from mail-pa0-f50.google.com ([209.85.220.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UXKC9-0004no-NK
	for openembedded-core@lists.openembedded.org;
	Wed, 01 May 2013 01:43:06 +0200
Received: by mail-pa0-f50.google.com with SMTP id bg2so609297pad.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2013 16:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=ZyYVJKB5bKFLNXXJTvIVmjJ2WCAQHYg795trf7jZVmA=;
	b=fAmU7mduLTZs3N6Lp7T6TOiwP1U1Ud1GOIa3uKPdTZo78qGGMwgSu6hG6stREtYgxi
	IOrYfXV2E5y7I2/HrE74u1pvcHQkZmbHvW9RIrQSbLSxlOkV5HD/2ANfyDGWNjJWgcyt
	8YNDgUHCMMgPAIabGeCO9wZKfcUzspyD3OSe1OXxNpESco+xEufU05vIjseReJtWreX4
	l81A/uJeNSrzJiYnNkyWvOzUyl4Km+/w2nVvWUJQU89aawW/XD6z0WntKWkWOzn65d06
	K1Vp2hcDAbN5CGaUpuswyELfhDx0dGMgldngXzxg1584tMNL6p6S8FPP1s952r740Qh0
	SwpA==
X-Received: by 10.68.196.65 with SMTP id ik1mr574779pbc.194.1367364294652;
	Tue, 30 Apr 2013 16:24:54 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id hp1sm1007140pac.3.2013.04.30.16.24.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 30 Apr 2013 16:24:53 -0700 (PDT)
Message-ID: <518051AE.8000000@gmail.com>
Date: Wed, 01 May 2013 09:20:14 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1367358411-6449-1-git-send-email-net147@gmail.com>
In-Reply-To: <1367358411-6449-1-git-send-email-net147@gmail.com>
Subject: Re: [PATCH v2] syslinux: Update to 4.06
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Apr 2013 23:43:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 1/05/2013 7:46 AM, Jonathan Liu wrote:
> Patches are now part of upstream or no longer needed.
> Added new util-linux-native dependency for isohybrid.
> Paths updated to reflect directory structure changes.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>   meta/classes/boot-directdisk.bbclass               |   2 +-
>   .../syslinux/files/cross-build.patch               |  71 --
>   .../libinstaller-Avoid-using-linux-ext2_fs.h.patch | 975 ---------------------
>   .../recipes-devtools/syslinux/files/no-strip.patch |  31 -
>   .../{syslinux_4.03.bb => syslinux_4.06.bb}         |  25 +-
>   5 files changed, 12 insertions(+), 1092 deletions(-)
>   delete mode 100644 meta/recipes-devtools/syslinux/files/cross-build.patch
>   delete mode 100644 meta/recipes-devtools/syslinux/files/libinstaller-Avoid-using-linux-ext2_fs.h.patch
>   delete mode 100644 meta/recipes-devtools/syslinux/files/no-strip.patch
>   rename meta/recipes-devtools/syslinux/{syslinux_4.03.bb => syslinux_4.06.bb} (70%)
I am getting an issue doing a clean build of syslinux 4.06.
| isohybrid.c:39:23: fatal error: uuid/uuid.h: No such file or directory

Any ideas what I need to do to resolve it?

Regards,
Jonathan



