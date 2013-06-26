Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f172.google.com (mail-vc0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id D6FA76A4E3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 10:19:46 +0000 (UTC)
Received: by mail-vc0-f172.google.com with SMTP id ib11so1083135vcb.31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 03:19:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=j4QLBGcbn2F6gTLTG/WjDLPPriJAwFgXBIeS22ZUNFE=;
	b=Xp6Q7HMek8CHxxflAsrT9xWrXPfs2/xvSrphhqIZJ+bJ6+5899Ko1QlR+80Ll3tIqo
	f+Aaj7/5+Xm051iXLqjGDzqpkFO+hTaX4oJNgHfwAjTylgwNHQD5Hu4LyDbQl6od6b+b
	pnUS0ogkZYJJR6yUonJ/guaYlUJPKwJazzw5YpNQp7OMHP/VuXtyPUaOaMpUOTuYG1UG
	Ac5cvgzRp7ia6vI4VK7BTVtrwlAuxZlma1sZsth4/JNIkNA8lNJpKIOXfqYkTkrM1TpQ
	gT51Fs+b8ZUobsdGsDEX3Grje/sehbgJJnNBrwG1Cyq5sMbh8aFZJkEsbJDW+lKABvZx
	2J3A==
X-Received: by 10.220.42.147 with SMTP id s19mr1430503vce.46.1372241986882;
	Wed, 26 Jun 2013 03:19:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Wed, 26 Jun 2013 03:19:26 -0700 (PDT)
In-Reply-To: <CAJTo0Lauq-sL5=JQzqE=Nf2dvOZe+o8x1Kqb3B+dkPn0V5fA6Q@mail.gmail.com>
References: <1371693296-6834-1-git-send-email-net147@gmail.com>
	<1371710061.8611.26.camel@pb-ThinkPad-R50e>
	<CAJTo0Lauq-sL5=JQzqE=Nf2dvOZe+o8x1Kqb3B+dkPn0V5fA6Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 26 Jun 2013 11:19:26 +0100
Message-ID: <CAJTo0LaCYSO43u6nE8Jsq6q=HUwvD3Drb8CG-fCXeBRkC5qGcw@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
X-Gm-Message-State: ALoCoQknFTMoOqGjbb4VN6EL3JB2xL9Hdqd5nY01uqq+rXIamNqCb9w4/ebOa5cU1KielzG2sUl3
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libx11: enable Xcms by default
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
X-List-Received-Date: Wed, 26 Jun 2013 10:19:47 -0000
Content-Type: text/plain; charset=UTF-8

On 20 June 2013 10:54, Burton, Ross <ross.burton@intel.com> wrote:
>> Since there's already a PACKAGECONFIG option for this, can't you just
>> enable that in your distro configuration rather than changing the
>> default?  I don't think it's ever been the expectation that the default
>> settings will represent "maximum functionality".
>
> That comment is from me, but I'm actually coming around to enabling
> Xcms by default and letting people who care about the size increase
> turn it off.  As Jonathan discovered, it's entirely possible to use
> Xcms without knowing it - whilst the colour management bit is likely
> never used, the colour parsing code is.

I did some build testing.  Enabling Xcms comes at a cost of ~88K
(x86-64 target, as I'm currently building for the NUC), which is a 7%
increase.  Considering that it's possible to use Xcms without knowing
it (as Jonathan discovered, by using fancy colour names), the size
increase isn't massive, the existence of both a PACKAGECONFIG to turn
it off again *and* and libx11-diet that's even smaller than libx11, I
think we should enable it by default.

People who know they don't use Xcms and care about the ~80K can set
this in a distro config or switch to libx11-diet if space really is
that important.

So, Signed-off-by: Ross Burton <ross.burton@intel.com>

Ross

