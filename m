Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 1CDFF7271C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 22:08:06 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 056A2F811E1; Wed, 17 Dec 2014 15:08:06 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 564DCF811E0;
	Wed, 17 Dec 2014 15:08:06 -0700 (MST)
Message-ID: <5491FECA.3020707@mlbassoc.com>
Date: Wed, 17 Dec 2014 15:08:10 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1417688866-8329-1-git-send-email-mike.looijmans@topic.nl>	<1417773539-19172-1-git-send-email-mike.looijmans@topic.nl>
	<CAJTo0Las47QCiUb-sjfgUOd9ZQK0=bOVWd5fHr618+0DLGsDjg@mail.gmail.com>
In-Reply-To: <CAJTo0Las47QCiUb-sjfgUOd9ZQK0=bOVWd5fHr618+0DLGsDjg@mail.gmail.com>
Subject: Re: [PATCH 1/2] busybox-mdev: Support automatic mounting of block devices
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
X-List-Received-Date: Wed, 17 Dec 2014 22:08:10 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-12-17 15:03, Burton, Ross wrote:
> Hi Mike,
>
> On 5 December 2014 at 09:58, Mike Looijmans <mike.looijmans@topic.nl <mailto:mike.looijmans@topic.nl>> wrote:
>
>     Upon inserting a USB stick or similar device, mdev will run
>     an automounter script that mounts valid partitions on
>     /media/<device>. The script first checks /etc/fstab entries
>     so that mounting on UUID or LABEL or using custom mount options
>     is still possible. If /etc/fstab does not contain particular
>     mount options, the script will create (and remove) the mountpoint
>     automatically.
>     The script also supports full disk partitions (devices without
>     partition table).
>
>
> Thanks for this, but can this script be put into a separate recipe to make it even easier for people who don't want it, or want their own version?  The prior art here is the udev
> automounting script which is in udev-extraconf.

Also it would be nice if the path matched the most recent
use in udev which is /run/media/<device>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

