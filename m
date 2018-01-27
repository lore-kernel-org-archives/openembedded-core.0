Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 321886FFD3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jan 2018 19:23:30 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y26so2012970pfi.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jan 2018 11:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=nmiWA3wHrqJ1MU9+0LsSHJENA8wdVWTuhHQbqOdqrWw=;
	b=VIn6RkYwp+CceeAufFLzM1dyNy6PPbnp9TlIKsdaHyTEsldgr+bQLq13Qa1cOPyF63
	tnspbcJ5Gfs5VnjYz/66xiDVCgn/u7ADjgwq/tSHhs52rWy27rZbT2MRMydN/0OCMwWQ
	bLbM9bhcOWT/957ErjvCOh+8p6cR70csgkS/AR6JMGeV9Z+zbPRY1U9v8fOOUixxDoXx
	ovBBwihzm21V0xJAPKO4gbFy1ouodrmrF6xhXLNMlJI4avwQmWbLSwk+fvTB3gdmL5hd
	TzXYp4I1S0/DxjVlhZc+5iIxvIha1WBvut+UTXDsBOvbLyyNUmxaPq+2D09o4wgVhIwU
	UxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=nmiWA3wHrqJ1MU9+0LsSHJENA8wdVWTuhHQbqOdqrWw=;
	b=D4yZ01b37E80EwE5suA9qYVj22hJ3u8ix0xthnhsGJc1DUCqX+2qQZ5Ydcl+PttLV2
	eyvxmwql1FWriQ/sSV6WqXvYBG+eILnnsKu+DlM5g8nQ7UhMk+/E2awgrZPsLrk20EGQ
	0Q7VlWt9dXdoMjzMyOR07TJSfzLDSMG9nK47rHcJlamN9W5gFKAHkB0gRAdWMrLlRiG0
	sRZLNtJFypT8Aq7U6eZ6P+zdUfQcelfpS2Qej4XIPmc10EO/ixAmX3jiGgwko2kDKK5C
	iC5p4dCuDzh8Fnl+MlRhKFyObvRbErR4vLLBfOmWcSKhbVDiiXGhsaVtjULLmdoGvBGz
	FBkA==
X-Gm-Message-State: AKwxytdHwe/JVkREs0KZ302NElit1EYHTQIssrbaaYIqC0Jq3kTf5rr/
	4BurYAmzSFITVtr2UrZEVKT4A8kh
X-Google-Smtp-Source: AH8x224JMTjuGmgio7i1+FSzNqAq869KPNzKm4Y1AKTWC+kmDO7s3McQbGHxJqLUk4bC5Nuj39ilJQ==
X-Received: by 10.98.226.24 with SMTP id a24mr22721969pfi.192.1517081011850;
	Sat, 27 Jan 2018 11:23:31 -0800 (PST)
Received: from hermes.local ([2601:646:8880:466c:8cc2:eed3:a043:ef2a])
	by smtp.gmail.com with ESMTPSA id
	s14sm12644898pgc.36.2018.01.27.11.23.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 27 Jan 2018 11:23:31 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1516762897-11869-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<1516762897-11869-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<CAJTo0LbyRMCC5sP5vOGBGsfja9vAw7BnaAU3fKnDuNtZuCyw4A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <e83c413b-1198-33c4-937a-846e690a792b@gmail.com>
Date: Sat, 27 Jan 2018 11:23:29 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbyRMCC5sP5vOGBGsfja9vAw7BnaAU3fKnDuNtZuCyw4A@mail.gmail.com>
Subject: Re: [PATCH] e2fsprogs: 1.43.7 -> 1.43.8
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
X-List-Received-Date: Sat, 27 Jan 2018 19:23:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 1/24/18 9:23 AM, Burton, Ross wrote:
> This is failing on the autobuilder:
> 
> ../../../git/lib/ext2fs/swapfs.c: In function 'ext2fs_swap_inode_full':
> ../../../git/lib/ext2fs/swapfs.c:361:29: error: 'ext2_inode_large' 
> undeclared (first use in this function)
>    EXT2FS_BUILD_BUG_ON(sizeof(ext2_inode_large) != 160);
>                               ^~~~~~~~~~~~~~~~
> 
> http://errors.yoctoproject.org/Errors/Details/165696/
> 

this is seen with big-endian targets, however with glibc master its seen 
on all systems. I have fixed this patch by adding another backported 
patch which should fix it. The patch is here

http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/glibc-2.27&id=646487a55def99cf12cf461f07d1fbb3dafc2c17

if you want to cherry-pick as v2, I will post it along with glibc 2.27 
set if not done by then

> Ross
> 
> On 24 January 2018 at 03:01, Huang Qiyu <huangqy.fnst@cn.fujitsu.com 
> <mailto:huangqy.fnst@cn.fujitsu.com>> wrote:
>  >
>  > Upgrade e2fsprogs from 1.43.7 to 1.43.8.
>  >
>  > Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com 
> <mailto:huangqy.fnst@cn.fujitsu.com>>
>  > ---
>  >  .../e2fsprogs/{e2fsprogs_1.43.7.bb <http://e2fsprogs_1.43.7.bb> => 
> e2fsprogs_1.43.8.bb <http://e2fsprogs_1.43.8.bb>}              | 2 +-
>  >  1 file changed, 1 insertion(+), 1 deletion(-)
>  >  rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.43.7.bb 
> <http://e2fsprogs_1.43.7.bb> => e2fsprogs_1.43.8.bb 
> <http://e2fsprogs_1.43.8.bb>} (98%)
>  >
>  > diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.7.bb 
> <http://e2fsprogs_1.43.7.bb> 
> b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb 
> <http://e2fsprogs_1.43.8.bb>
>  > similarity index 98%
>  > rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.7.bb 
> <http://e2fsprogs_1.43.7.bb>
>  > rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb 
> <http://e2fsprogs_1.43.8.bb>
>  > index 168eecf..c42260c 100644
>  > --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.7.bb 
> <http://e2fsprogs_1.43.7.bb>
>  > +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb 
> <http://e2fsprogs_1.43.8.bb>
>  > @@ -11,7 +11,7 @@ SRC_URI += "file://remove.ldconfig.call.patch \
>  >
>  >  SRC_URI_append_class-native = " 
> file://e2fsprogs-fix-missing-check-for-permission-denied.patch"
>  >
>  > -SRCREV = "4c5e6cd6defb83f1b35a5ef6fccd68c86874ee06"
>  > +SRCREV = "af2eac481cf426c05ae12b946396980e16c8ab19"
>  >  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
>  >
>  >  EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
>  > --
>  > 2.7.4
>  >
>  >
>  >
>  > --
>  > _______________________________________________
>  > Openembedded-core mailing list
>  > Openembedded-core@lists.openembedded.org 
> <mailto:Openembedded-core@lists.openembedded.org>
>  > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

