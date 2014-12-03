Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6E18B65C9F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 16:28:13 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kq14so15950481pab.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Dec 2014 08:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=BOxGLBBzomGFohrtvHpwsw8GZqY4d8MSzo5khAO9v8M=;
	b=UGP0KmVuYZkU9mzpD1fBYso3EiPMiBTTsUJMdNTjVGW+VH1MdKbEGSBmvaWSNKNx+E
	tPSTEHt+Jz+1Bgtuj/rfTWIEgsjdrlv6cGaB00ViTxKk1h112r5O89/F5Uogd2JcEtHp
	IGdA37AEfOJ0oy0slc++xMKhg5EE86UHI6xuA12mLTJbI66A1+HD+H4/1FCiv9RwXOQH
	bGqy0X7MzjTK5SP/Rf38PnU1J6lDda5ce0Ioep9pO2zAyIK+w8hpers7MZGakJF0AXew
	jpGhcBeueLP99nRVtIJJ4kyRDHH9CkWXS5Yw6qW+RcNzfIlRsX7td2rtxzKQvCdQVNzv
	anpQ==
X-Received: by 10.70.102.17 with SMTP id fk17mr10143398pdb.61.1417624094321;
	Wed, 03 Dec 2014 08:28:14 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:7817:c089:b413:c9c4?
	([2601:c:9380:601:7817:c089:b413:c9c4])
	by mx.google.com with ESMTPSA id
	bx13sm4958426pdb.19.2014.12.03.08.28.11 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Dec 2014 08:28:12 -0800 (PST)
Message-ID: <547F3A19.8030103@gmail.com>
Date: Wed, 03 Dec 2014 08:28:09 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Philip Balister <philip@balister.org>, 
	Tom Zanussi <tom.zanussi@linux.intel.com>,
	akuster808@gmail.com, openembedded-core@lists.openembedded.org
References: <cover.1416585198.git.tom.zanussi@linux.intel.com>
	<547F12C2.5070700@balister.org>
In-Reply-To: <547F12C2.5070700@balister.org>
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
X-List-Received-Date: Wed, 03 Dec 2014 16:28:14 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

staged missing commit.

regards,
Armin

On 12/03/2014 05:40 AM, Philip Balister wrote:
> On 11/21/2014 11:07 AM, Tom Zanussi wrote:
>> >From the original posting:
>>
>> This patchset fixes a couple serious wic bugs:
>>
>> [YOCTO #6863] - Wic fails to create a working image for a large file system
>> [YOCTO #6290] - Update WIC for gummiboot
>>
>> I generated core-image-sdk images for each of the wic image types and
>> was able to fsck/mount the resulting filesystems.
>>
>> These should be applied to the next dizzy point release.
>>
>> The following changes since commit e69653b01dd8ad9fda2355b8112a65c813ce7fd5:
>>
>>    tzdata: update to 2014j (2014-11-17 08:01:21 -0800)
>>
>> are available in the git repository at:
>>
>>    git://git.yoctoproject.org/poky-contrib.git tzanussi/dizzy-next
>>    http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/dizzy-next
>>
>> Tom Zanussi (6):
>>    wic: Don't allow mkfs to fail silently in partition command
>>    wic: Use overhead factor when creating partitions from rootfs
>>      directories
>
> It looks like all the patches in this request made it into dizzy, except
> the overhead factor one. Is there a reason for this? Can we get the
> overhead one into dizzy also?
>
> Philip
>
>
>
>
>>    wic: Update the help text to include -D (--debug)
>>    Revert "wic: set bootimg_dir when using image-name artifacts"
>>    wic: Remove special-case bootimg_dir
>>    wic: Update bootimg-partition to use bootimg_dir
>>
>>   scripts/lib/image/engine.py                        | 42 +++++-----------------
>>   scripts/lib/image/help.py                          | 23 ++++++++----
>>   scripts/lib/wic/imager/direct.py                   |  5 +--
>>   .../lib/wic/kickstart/custom_commands/partition.py | 24 +++++++++----
>>   scripts/lib/wic/plugins/imager/direct_plugin.py    | 20 +++++------
>>   scripts/lib/wic/plugins/source/bootimg-efi.py      |  5 ++-
>>   .../lib/wic/plugins/source/bootimg-partition.py    |  9 +++--
>>   scripts/lib/wic/plugins/source/bootimg-pcbios.py   |  3 +-
>>   scripts/lib/wic/utils/oe/misc.py                   |  1 +
>>   scripts/wic                                        | 13 +++----
>>   10 files changed, 68 insertions(+), 77 deletions(-)
>>

