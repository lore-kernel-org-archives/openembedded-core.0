Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 782E960030
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 13:40:19 +0000 (UTC)
Received: (qmail 25859 invoked by uid 1003); 3 Dec 2014 13:40:19 -0000
Received: from unknown (HELO ?192.168.1.109?) (philip@opensdr.com@71.171.45.99)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	3 Dec 2014 13:40:19 -0000
Message-ID: <547F12C2.5070700@balister.org>
Date: Wed, 03 Dec 2014 08:40:18 -0500
From: Philip Balister <philip@balister.org>
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
X-List-Received-Date: Wed, 03 Dec 2014 13:40:25 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 11/21/2014 11:07 AM, Tom Zanussi wrote:
>>From the original posting:
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
>   tzdata: update to 2014j (2014-11-17 08:01:21 -0800)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib.git tzanussi/dizzy-next
>   http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/dizzy-next
> 
> Tom Zanussi (6):
>   wic: Don't allow mkfs to fail silently in partition command
>   wic: Use overhead factor when creating partitions from rootfs
>     directories

It looks like all the patches in this request made it into dizzy, except
the overhead factor one. Is there a reason for this? Can we get the
overhead one into dizzy also?

Philip




>   wic: Update the help text to include -D (--debug)
>   Revert "wic: set bootimg_dir when using image-name artifacts"
>   wic: Remove special-case bootimg_dir
>   wic: Update bootimg-partition to use bootimg_dir
> 
>  scripts/lib/image/engine.py                        | 42 +++++-----------------
>  scripts/lib/image/help.py                          | 23 ++++++++----
>  scripts/lib/wic/imager/direct.py                   |  5 +--
>  .../lib/wic/kickstart/custom_commands/partition.py | 24 +++++++++----
>  scripts/lib/wic/plugins/imager/direct_plugin.py    | 20 +++++------
>  scripts/lib/wic/plugins/source/bootimg-efi.py      |  5 ++-
>  .../lib/wic/plugins/source/bootimg-partition.py    |  9 +++--
>  scripts/lib/wic/plugins/source/bootimg-pcbios.py   |  3 +-
>  scripts/lib/wic/utils/oe/misc.py                   |  1 +
>  scripts/wic                                        | 13 +++----
>  10 files changed, 68 insertions(+), 77 deletions(-)
> 

