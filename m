Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 74C09763F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 18:49:26 +0000 (UTC)
Received: by obre1 with SMTP id e1so14161156obr.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 11:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=SZNSemDU8Hl4bVH7h5JhkKIeWvzD+mtFxd87XuRw7C0=;
	b=ViF1ZDJMVSGgG3cHtENDd+an5R4TQwBEuPOG93kDXHturDG2vhzdQg+jroi8iSibps
	hX+YDMa2NdRlNq/uHqpOZmaot3BQBNqjgdXH1kDfEkJc73EtKypHfNzgoan8qAvKftpD
	DfaLJz+XDegSDF9U1uy7uvJZ3KyrP6TUzcPmmlsMGBN1dXmIYhNCtmhvsnwhNLgd6tbo
	8Zav1TzXF8qjc+s54LrFZpfX6xHvLmIyG9n+RCI4MmM6Br4evkHbcu4sxZP9hkopYNGJ
	OKK4K8PMVR1ovOCcrbgkh0okg0IHk2CbIwCLPTvaRkED96MkN3bpK+Kdj2aW2R1PnL63
	VJjQ==
MIME-Version: 1.0
X-Received: by 10.182.246.202 with SMTP id xy10mr41900006obc.64.1438195766308; 
	Wed, 29 Jul 2015 11:49:26 -0700 (PDT)
Received: by 10.202.102.147 with HTTP; Wed, 29 Jul 2015 11:49:26 -0700 (PDT)
In-Reply-To: <CAP9ODKqSeym02zoqOn5Mim3mXq1RWzpzMkq9Oqr_e525cyxTiA@mail.gmail.com>
References: <1438125665-14966-1-git-send-email-armccurdy@gmail.com>
	<1438125665-14966-9-git-send-email-armccurdy@gmail.com>
	<CAP9ODKqSeym02zoqOn5Mim3mXq1RWzpzMkq9Oqr_e525cyxTiA@mail.gmail.com>
Date: Wed, 29 Jul 2015 11:49:26 -0700
Message-ID: <CAJ86T=Ugozr1qJ6cHpCBwzHef3QNEUKcK4QRR5TScPx9LqFipQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/8] busybox: disable volumeid support for exFAT, F2FS and NILFS
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
X-List-Received-Date: Wed, 29 Jul 2015 18:49:26 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 29, 2015 at 9:33 AM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Tue, Jul 28, 2015 at 8:21 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> These are less common filesystem formats, so disable volumeid support
>> for them by default.
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>
> F2FS could be of use. It is being more adopted now that Android is
> starting to be deployed to some devices with it.

The current list of filesystems with volume ID support is below.

If support for F2FS should be enabled, how about enabling support for
btrfs, luks and squashfs too?

#
# Filesystem/Volume identification
#
# CONFIG_FEATURE_VOLUMEID_BTRFS is not set
# CONFIG_FEATURE_VOLUMEID_CRAMFS is not set
CONFIG_FEATURE_VOLUMEID_EXFAT=y
CONFIG_FEATURE_VOLUMEID_EXT=y
CONFIG_FEATURE_VOLUMEID_F2FS=y
CONFIG_FEATURE_VOLUMEID_FAT=y
# CONFIG_FEATURE_VOLUMEID_HFS is not set
# CONFIG_FEATURE_VOLUMEID_ISO9660 is not set
# CONFIG_FEATURE_VOLUMEID_JFS is not set
# CONFIG_FEATURE_VOLUMEID_LINUXRAID is not set
# CONFIG_FEATURE_VOLUMEID_LINUXSWAP is not set
# CONFIG_FEATURE_VOLUMEID_LUKS is not set
CONFIG_FEATURE_VOLUMEID_NILFS=y
# CONFIG_FEATURE_VOLUMEID_NTFS is not set
# CONFIG_FEATURE_VOLUMEID_OCFS2 is not set
# CONFIG_FEATURE_VOLUMEID_REISERFS is not set
# CONFIG_FEATURE_VOLUMEID_ROMFS is not set
# CONFIG_FEATURE_VOLUMEID_SQUASHFS is not set
# CONFIG_FEATURE_VOLUMEID_SYSV is not set
# CONFIG_FEATURE_VOLUMEID_UDF is not set
# CONFIG_FEATURE_VOLUMEID_XFS is not set


> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

