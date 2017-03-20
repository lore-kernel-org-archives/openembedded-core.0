Return-Path: <d.schultz@phytec.de>
Received: from root.phytec.de (mail.microcatalog.org.uk [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 7A32777952
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 13:01:46 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 4F1C4A002CD;
	Mon, 20 Mar 2017 14:02:18 +0100 (CET)
Received: from [172.16.25.252] ([172.16.25.252])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2017032014014686-379025 ;
	Mon, 20 Mar 2017 14:01:46 +0100 
To: "Burton, Ross" <ross.burton@intel.com>
References: <1490012333-43021-1-git-send-email-d.schultz@phytec.de>
	<1490012333-43021-3-git-send-email-d.schultz@phytec.de>
	<CAJTo0LbxzD21M8+A=9FuHQNjOH9A65dLh48Exe1sBRNwGrVmqg@mail.gmail.com>
From: Daniel Schultz <d.schultz@phytec.de>
Message-ID: <67fb66ea-1f41-afa0-cc42-fd0b83681829@phytec.de>
Date: Mon, 20 Mar 2017 14:01:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbxzD21M8+A=9FuHQNjOH9A65dLh48Exe1sBRNwGrVmqg@mail.gmail.com>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 20.03.2017 14:01:46,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 20.03.2017 14:01:46
X-TNEFEvaluated: 1
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] meta: images: Add fsck to avoid corrupt EXT file systems
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
X-List-Received-Date: Mon, 20 Mar 2017 13:01:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Am 20.03.2017 um 13:26 schrieb Burton, Ross:
>
> On 20 March 2017 at 12:18, Daniel Schultz <d.schultz@phytec.de
> <mailto:d.schultz@phytec.de>> wrote:
>
>     Since there are no checks if a EXT file system was successfully creat=
ed,
>     this should add to prevent possible system failures.
>
>
> Doesn't mkfs returns an exit code if it wasn't successful?
>
Yes, but it seems like mkfs can't handle everything.

"The htree (hash tree) indexes directory entries by hash to speed up
random directory accesses.  e2fsck can regenerate the indices, but the
rest of e2fsprogs cannot create or maintain them."
[http://www.spinics.net/lists/linux-ext4/msg55702.html]

Currently, our boards have to reboot, because fsck exits with an error=20
code of 1 at the first boot.

> Ross

--=20
Mit freundlichen Gr=C3=BC=C3=9Fen,
With best regards,
   Daniel Schultz

