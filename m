Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9436960DD7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 21:48:09 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id fp1so6089784pdb.29
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 13:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=J2SFfFjWQYPvnmC8pMsYLroD83Kh0TeSjuXABaKYyhM=;
	b=dcOtZEmZ/gDyYzu2AUavAY0hmp38zr59/PRR3rf2vPYWyNRMeWCoDjT+0SXl3sXh9C
	TO2dTJ2/rw+TP63TeqySsWnYFDSsPiSJwi74ObkvSEcTEs/k8eQt+pXfYxybxo0A1A13
	68P+RVzfi9B1RCyvJAh/qDKR+3a01K3ljI+eOvQydIwgu34Yn+l+8am+vQ4Oogj55+ws
	xkyxbprsPXlposXRIiIIjUymUzdPhgqiBegFFBE5tdrRHfz66eDaAyCd9neRYYyLF1UD
	vrVSWI6uDv3Xk5qDekk+3SIDiNc2vLqjULV8pt9dtlwAv5Ika/MKtxBOzSW5PM7Xnk9c
	ZyKA==
X-Received: by 10.70.43.176 with SMTP id x16mr11122869pdl.31.1416606490396;
	Fri, 21 Nov 2014 13:48:10 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:7983:e327:d220:f13e?
	([2601:c:9380:601:7983:e327:d220:f13e])
	by mx.google.com with ESMTPSA id kj9sm5670343pbc.37.2014.11.21.13.48.08
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Nov 2014 13:48:09 -0800 (PST)
Message-ID: <546FB317.6090903@gmail.com>
Date: Fri, 21 Nov 2014 13:48:07 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Tom Zanussi <tom.zanussi@linux.intel.com>, akuster808@gmail.com, 
	openembedded-core@lists.openembedded.org
References: <cover.1416585198.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1416585198.git.tom.zanussi@linux.intel.com>
Subject: Re: [PATCH 0/6][dizzy] some wic bugfixes
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
X-List-Received-Date: Fri, 21 Nov 2014 21:48:14 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Thanks Tom,

I will stage these along with a security fix.

- Armin

On 11/21/2014 08:07 AM, Tom Zanussi wrote:
>  From the original posting:
>
> This patchset fixes a couple serious wic bugs:
>
> [YOCTO #6863] - Wic fails to create a working image for a large file system
> [YOCTO #6290] - Update WIC for gummiboot
>
> I generated core-image-sdk images for each of the wic image types and
> was able to fsck/mount the resulting filesystems.
>
> These should be applied to the next dizzy point release.
>
> The following changes since commit e69653b01dd8ad9fda2355b8112a65c813ce7fd5:
>
>    tzdata: update to 2014j (2014-11-17 08:01:21 -0800)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib.git tzanussi/dizzy-next
>    http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/dizzy-next
>
> Tom Zanussi (6):
>    wic: Don't allow mkfs to fail silently in partition command
>    wic: Use overhead factor when creating partitions from rootfs
>      directories
>    wic: Update the help text to include -D (--debug)
>    Revert "wic: set bootimg_dir when using image-name artifacts"
>    wic: Remove special-case bootimg_dir
>    wic: Update bootimg-partition to use bootimg_dir
>
>   scripts/lib/image/engine.py                        | 42 +++++-----------------
>   scripts/lib/image/help.py                          | 23 ++++++++----
>   scripts/lib/wic/imager/direct.py                   |  5 +--
>   .../lib/wic/kickstart/custom_commands/partition.py | 24 +++++++++----
>   scripts/lib/wic/plugins/imager/direct_plugin.py    | 20 +++++------
>   scripts/lib/wic/plugins/source/bootimg-efi.py      |  5 ++-
>   .../lib/wic/plugins/source/bootimg-partition.py    |  9 +++--
>   scripts/lib/wic/plugins/source/bootimg-pcbios.py   |  3 +-
>   scripts/lib/wic/utils/oe/misc.py                   |  1 +
>   scripts/wic                                        | 13 +++----
>   10 files changed, 68 insertions(+), 77 deletions(-)
>

