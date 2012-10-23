Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <daniel@fooishbar.org>) id 1TQana-0001V0-1o
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 11:29:22 +0200
Received: by mail-vc0-f175.google.com with SMTP id p1so3896405vcq.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 02:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type:x-gm-message-state;
	bh=aBRcEg77H4IlsrqQ0OAo2EZOWN3Q3JZxFsSmqf2qdCk=;
	b=TrU4W5f7MSbLJ9/uXfG3YiCHEF/P23NnYoYRvkzIoWECXEGQe7w7MceUFslgygfS5m
	lO5BNsomx+3NhoXnB442LpZ2DdtrrkG/iOeFGjn+ZPvxsOyKe8RM8JND3PzqH3ZBvDeY
	tbnNiFnAm91/YbsU0nObZRkF9pHCWZpT6pl/xEINj+MC7rO/dgwwmOHLEmqgdDEUuQa9
	TOYHWRWH7JAcHnrHv/WvtS4ms7a5KyoFGDVtcf/qVuSBm9LidtFf5oRwu9/LhUpfvqaU
	mgeBhNgqCWq2/qKkMKNfPjbrE4t4tvEaxUJGGtY3hAPirG7yd/iMwVOjdZSMFbiQ+rlZ
	Muig==
MIME-Version: 1.0
Received: by 10.52.74.135 with SMTP id t7mr15720458vdv.18.1350983755660; Tue,
	23 Oct 2012 02:15:55 -0700 (PDT)
Received: by 10.58.170.104 with HTTP; Tue, 23 Oct 2012 02:15:55 -0700 (PDT)
X-Originating-IP: [115.64.155.100]
In-Reply-To: <50865F91.5060002@r-finger.com>
References: <cover.1350898066.git.ross.burton@intel.com>
	<dc59bf999e1f8a6d5953c02d21c6e45c53c204a9.1350898066.git.ross.burton@intel.com>
	<50865F91.5060002@r-finger.com>
Date: Tue, 23 Oct 2012 20:15:55 +1100
Message-ID: <CAPj87rP+FHP8QeBvqVHVDX0dUHh-fFL1W_BQbV-1HErG5dE4FA@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
X-Gm-Message-State: ALoCoQleK62/E4+bwaPMHrXDfyLtn2zYPTq6FZs+z+qleGvSzpbLcQ2wU/nF+/vVL9odkQFWbLC/
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] libxkbcommon: New window system-independent xkb library
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
X-List-Received-Date: Tue, 23 Oct 2012 09:29:22 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On 23 October 2012 20:12, Tomas Frydrych <tf+lists.yocto@r-finger.com> wrote:
> I think this needs a -native tools as well, like,
> https://github.com/Guacamayo/meta-guacamayo/blob/master/meta-guacamayo/recipes-graphics/xorg-lib/libxkbcommon_git.bb

Not anymore, we use Python for makekeys nowadays.  (And, in an
unpushed tree, don't use Python at all if we can avoid it.)

I'm about to push something after dinner which breaks ABI (as well as
a tiny bit of API that thankfully seems thus far unused), so if you
could please either hold off until I do or bump SRCREV shortly after,
that'd be great, thanks. :)

Cheers,
Daniel


