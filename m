Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7D2B0724A3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Dec 2014 18:30:44 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id 9so557992ykp.36
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Dec 2014 10:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=ui3vQchxzwNSNjbSMUVC3PFr8X+JO9YGxthphZXagIQ=;
	b=Une4CvSoNpkVQl/8/5U9eMxG5QJevOd6tw9VSUOUpG0dbzIM2PsDuZqWqj+xaiLjW6
	lcUy0FaKtsxM56BcT+ZrM/N+ceDg0VIJ359vD/+it/1e2/fS9GaL3r7gZPmAmA8249hT
	8uK8f28SCDkKv9RVWSZjzxA8LBZ+mU5bSoqLG3trklrQHmZo257FJZrRoeNYegeJ9l5c
	1z0ka06qq5n8IdUlyk9pVT8lrCAGOWn/Nd7wdHVFreeq0e6f0TMksk5u54ty+wBrr3Zv
	8cDRMuqUIEtC37evnEpvUtrXRlWaIf+ppSU3ete5i1xAJO/MrUY2vAIvpYHeStgySHAZ
	+dqw==
MIME-Version: 1.0
X-Received: by 10.236.15.9 with SMTP id e9mr21092680yhe.37.1417804244895; Fri,
	05 Dec 2014 10:30:44 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.142.132 with HTTP; Fri, 5 Dec 2014 10:30:44 -0800 (PST)
In-Reply-To: <b16b90e4646b1eb5ae59f98fca123f2f55f7ad3c.1417802944.git.paul.eggleton@linux.intel.com>
References: <cover.1417802944.git.paul.eggleton@linux.intel.com>
	<b16b90e4646b1eb5ae59f98fca123f2f55f7ad3c.1417802944.git.paul.eggleton@linux.intel.com>
Date: Fri, 5 Dec 2014 16:30:44 -0200
X-Google-Sender-Auth: oO-A85EU_UvTnOxW_4WY3GnObpw
Message-ID: <CAP9ODKqGkqK7rMKudFGcjcEyXc+VquhtRPZpioXbXhTOc-kt2Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] buildtools-tarball: restore missing git tools
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
X-List-Received-Date: Fri, 05 Dec 2014 18:30:47 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 5, 2014 at 4:09 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Since the split out of git-perltools, some git tools (such as "git am",
> "git send-email" and "git-submodule") have no longer been part of the
> buildtools. We need these, so add them back in.
>
> However, adding git-perltools to buildtools triggers perl itself being
> brought into buildtools as well, and we don't want that; but we also
> don't want to have to hack the git recipe or indeed anything else that
> starts depending on perl. Thus, add a dummy package which gets installed
> in its place, in a separate package architecture that is only enabled
> for buildtools to ensure it doesn't start appearing in place of
> nativesdk-perl anywhere else.
>
> Fixes [YOCTO #7033].
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

This dummy thing looks like a hack to me :-(

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

