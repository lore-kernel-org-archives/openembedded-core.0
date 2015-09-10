Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0F39F6E26B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 15:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8AFmsTN024200; Thu, 10 Sep 2015 16:48:54 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lBXKva4Bf-oo; Thu, 10 Sep 2015 16:48:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8AFmfUW024192
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 10 Sep 2015 16:48:52 +0100
Message-ID: <1441900121.24871.366.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Sep 2015 16:48:41 +0100
In-Reply-To: <CAMKF1srrc_mumugSUWW5mhdip5mqK8J_OQkvuzwMY8O1Rjvzmg@mail.gmail.com>
References: <d16024c043abcd21b162f7f93a5bdf29d91c8317.1441552859.git.raj.khem@gmail.com>
	<a234814e2ad213dc69b90a3450d79b778c0e4c7c.1441552859.git.raj.khem@gmail.com>
	<1441654609.1680.79.camel@pbcl.net>
	<EC219B31-F312-41D6-81C9-D13213CB2759@gmail.com>
	<1441662490.1680.82.camel@pbcl.net>
	<434A343A-193D-4D65-BDE0-FC1BD2D79F28@gmail.com>
	<CAMKF1srrc_mumugSUWW5mhdip5mqK8J_OQkvuzwMY8O1Rjvzmg@mail.gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] rootfs: Do not uninstall update-rc.d
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
X-List-Received-Date: Thu, 10 Sep 2015 15:48:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-09-08 at 12:38 -0700, Khem Raj wrote:
> On Tue, Sep 8, 2015 at 12:03 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >> On Sep 7, 2015, at 2:48 PM, Phil Blundell <pb@pbcl.net> wrote:
> >>
> >> On Mon, 2015-09-07 at 14:15 -0700, Khem Raj wrote:
> >>>> On Sep 7, 2015, at 12:36 PM, Phil Blundell <pb@pbcl.net> wrote:
> >>>>
> >>>> On Sun, 2015-09-06 at 15:25 +0000, Khem Raj wrote:
> >>>>> update-rc.d is now needed by systemd to interact with sysv
> >>>>> scripts, so if we have a mixed system, then we can not uninstall
> >>>>> update-rc.d as it is going to break systemd functionality
> >>>>
> >>>> The description above implies that you will only uninstall update-rc.d
> >>>> if systemd is present, but that doesn't seem to be what the patch does.
> >>>
> >>> I meant to not say its only for systemd. but that systemd now needs it.
> >>> so update-rc.d is no longer forcefully removed from image depchain.
> >>
> >> Well, right.  But wouldn't it be better only to leave it in there if
> >> it's actually necessary, i.e. if you have systemd and you also have sysv
> >> scripts and the rootfs isn't read-only?  As it stands, your patch will
> >> cause update-rc.d to be left around for people who aren't using systemd,
> >> which seems like a retrograde step.
> >>
> >
> > makes sense. I can improvise on it and check for all constraints in a follow up.
> 
> 
> I have updates this patch in pull branch
> https://github.com/kraj/openembedded-core/commit/c4c574dff9ef689c7694a6055907083e7a018d48

Very good, how am I meant to deal with this though? You never published
a pull url in your original pull request and I can't figure out how to
get a patch file out the github web UI. I guess I can fetch the branch
somewhere, then extract it, but if everyone does this its going to be
rather annoying for me :(.

I really wish people would just post the v2 on the list.

Incidentally, the wrong version of this has gotten merged, I'll likely
revert it then apply this.

Cheers,

Richard


