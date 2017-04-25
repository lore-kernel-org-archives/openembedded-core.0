Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 16CA577AE1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 22:17:32 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id m123so108966271wma.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 15:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EeB46gh9HTYdM0TBKMUGM11Ry3nS9yiLzJX0C/t27CA=;
	b=MdjAmdfn5/XQYwEleWAoMIYPjUD2wAKA+i3NwGP5JBm0bWn1kqOluxAyyi/r+AXWrX
	xMkfDhfVaf88DT9BSI8TzXd+fatLjzTBSME+cOFC7vK7KomAQCy+bkkzIiYZqwwUlLhk
	JJ2lkRR3c5g1sOIQP9F4FKvHNGQa88ikXzrSdosvzyluSB54HXl79QkfYGTnFaotTQhl
	FhU9/ITwowhk5mANJZ/+6Np8rQNSeNIl2OhzoYoaqld9yFjidCOQSngezH0MpP4Raa56
	YhSz6cXrF8i3+G46aixxBP3HkNdR7LD2OF2qFQ3/A945Y6P5GymhDgKShcAeaYEfbT8u
	ymBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EeB46gh9HTYdM0TBKMUGM11Ry3nS9yiLzJX0C/t27CA=;
	b=UdZjVQ1cbLjqkiRbF9z4BpYXMZHBeR2awC5fTt5MFu83sG8BhbYymg0y9he15qHSQy
	SVo9duoMlljeolUV/24KqYDE7mX7RKBulTKZBJIPdJoJFkSsRuWsQwybfikKe9Nud2X7
	gn4lBCm/rQ94qI8mnccS8DIxc8X+8FKl2aPSzbSKLfsdZj/5tmwtzhkz/WGn2HIRQhcW
	UN633iGlfHUV1X2Styufneu4WUcXl+S53HZLXN4ubvVAvcl4oxIZbVKsAhftADpL8CLq
	nDool/j1U0ye2Tf5jH2ReHErn11o9C4MkJZFWQy2OzMY0VnMxgF8XHjRegxu43sgoXot
	jFoQ==
X-Gm-Message-State: AN3rC/75Gdz60MadiQyZE9IpQX719TpCQ6wqwJf7teodnjGVVeMmwnpc
	lm1o2q8WEfSrsrxxrMkIg2cqviOftQ==
X-Received: by 10.28.222.70 with SMTP id v67mr3189165wmg.65.1493158653675;
	Tue, 25 Apr 2017 15:17:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.172.100 with HTTP; Tue, 25 Apr 2017 15:17:33 -0700 (PDT)
In-Reply-To: <CAMKF1srYE2zaO3WGxqRExpx10zkyC8Gb+OnQ76TD8zt0Uam7yw@mail.gmail.com>
References: <20170421210948.2656-1-raj.khem@gmail.com>
	<CAJTo0LYL1QxkdLi6y=DKe7mMoHF8U34ZDzNbUKY1+or1xxrWyw@mail.gmail.com>
	<CAMKF1srYE2zaO3WGxqRExpx10zkyC8Gb+OnQ76TD8zt0Uam7yw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 25 Apr 2017 15:17:33 -0700
Message-ID: <CAJ86T=WFN3wnnpjhw4qdvqT_hn6A1Jaq_U0uk5bVUXR9omy93Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] grub: Fix build with gcc7
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
X-List-Received-Date: Tue, 25 Apr 2017 22:17:33 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 24, 2017 at 6:38 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Apr 24, 2017 at 3:34 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> Clearly there's some build difference between our configurations. Are you
>> building grub-git instead of grub_2.00?  Should we delete grub_2.00 if its
>> that old?  I'd say that it looks good for a new upstream 2.02 release as
>> there is a 2.02-rc2 tagged just six weeks ago, but 2.02-beta1 was tagged
>> three years ago...
>
> yes saw that, fedora is already using 2.02-rc2, we will simplify
> things if we are ready to take the plunge and be ready to release with
> rc2 itself if final
> release takes another 3 years.

The 2.02 release seems to be almost ready:

  http://git.savannah.gnu.org/cgit/grub.git/commit/?id=e54c99aaff5e5f6f5d3b06028506c57e66d8ef77

> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

