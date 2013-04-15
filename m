Received: from mail-vb0-f53.google.com ([209.85.212.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1URh9U-0005F8-SC
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 13:00:50 +0200
Received: by mail-vb0-f53.google.com with SMTP id i3so3621771vbh.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 03:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=SaeAGtyX1wBnSvjBgl9n2JJcUPzHxv0q7eWGoQNyG8w=;
	b=fJQRjSFmnZxI3nCHdpdDC9MIKtzka6DYBx6+t+a8Rhw/xaYyIPelAxFDGnEB2JHMCM
	ziWKUjq046HrB84fvMtCcjV/QF9S2u7Ion9LZVO7LxNTn+1BoV8EQv0WmoExjiJcdZq6
	0efzkBus709xP4idI7wqOXCQrav26grgj6+ze8q2ZwpeNPedqHyS+6S1Zv8bwVTdXMRF
	21opnzT1M7zDTuX909m5YT4LSVvsMsvIpRJ8NJ0N0pW0KojGvQXTbumzWHK0D92Mj6zX
	QQVP16bORYmK+8V4C6qp2ZDqgP8mxxpyDP3OvFbmcFFqqK7ETN5zSm05mVaQie0fRpoD
	19Dw==
X-Received: by 10.52.158.163 with SMTP id wv3mr13343666vdb.82.1366022599706;
	Mon, 15 Apr 2013 03:43:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Mon, 15 Apr 2013 03:42:59 -0700 (PDT)
In-Reply-To: <CAJTo0Laqc93oxZcHZ+vF99q_UqJ_8TUV4QAxPy6VfBLDBUxOYg@mail.gmail.com>
References: <1365947306-15542-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0LYxbJBVqYTCiz2BaBaoPz=pzpm5w49Ube+SpnX_ZOLh5Q@mail.gmail.com>
	<9D7AC92D-FF69-4A31-B99C-D2008675A27B@dominion.thruhere.net>
	<CAJTo0Laqc93oxZcHZ+vF99q_UqJ_8TUV4QAxPy6VfBLDBUxOYg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Apr 2013 11:42:59 +0100
Message-ID: <CAJTo0LbfDu6bOAPYjd3ohzZJcvPDmYiT4RcUhZC9JXkQB6dmOw@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQl5hWuoSjqARBrRMOsWNrFCC/Ze1owHxO2boGtTSHg52JLSc3+xCFFsbj5BZEM+2vSTA9L1
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [for-dylan][PATCH] systemd: fix bootup with 'ro' by re-adding util-linux-mount to RDEPENDS
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
X-List-Received-Date: Mon, 15 Apr 2013 11:00:59 -0000
Content-Type: text/plain; charset=UTF-8

Hi Koen,

On 15 April 2013 11:16, Burton, Ross <ross.burton@intel.com> wrote:
> On 15 April 2013 11:09, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>> Does busybox produce any useful errors as to why it's not working?
>>
>> No, it pretends everything is OK and the remount succeeded.
>
> Thanks busybox!

There's several fixes upstream that we don't have in our busybox, it
would be much appreciated if you could try this patch which rolls them
all up.

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=ross/mount&id=1fc11cc25938b6a0c1e9b69a30326de8608cb98f

(yes, I'll fix the patch to have a proper comment :)

Cheers,
Ross


