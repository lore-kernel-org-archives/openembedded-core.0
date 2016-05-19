Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 09F656E668
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 10:12:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4JACF15012519
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 19 May 2016 03:12:15 -0700 (PDT)
Received: from [128.224.162.214] (128.224.162.214) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 19 May 2016 03:12:14 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Martin Jansa
	<martin.jansa@gmail.com>
References: <573C0726.3040402@windriver.com>
	<CA+chaQdJPWncYizZAKZ8MHOCqYRn+oKGcDuPhKVoepQhKh+LwQ@mail.gmail.com>
	<573C21EE.8040104@windriver.com> <20160518092029.GA2579@jama>
	<573C365D.3070407@windriver.com> <20160518101556.GB2579@jama>
	<573D260D.2020909@windriver.com> <573D2EAF.9010602@windriver.com>
	<1463651156.4578.113.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <573D917C.4090002@windriver.com>
Date: Thu, 19 May 2016 18:12:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <1463651156.4578.113.camel@linuxfoundation.org>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: PRServer's problem
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
X-List-Received-Date: Thu, 19 May 2016 10:12:17 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/19/2016 05:45 PM, Richard Purdie wrote:
>
> The bottom line is that the system is setup to be sensitive to changes.
> Where we've had cases where we haven't reacted to changes, people have
> complained and we've ended up making sure we do react to them. The
> patch you reference was one such case where users complained we didn't
> react enough.
>
> You can't have things both ways, where it reacts to all changes but
> also never reacts to changes which don't have any visible effect on the
> end result (how do you know?).
>
> The binary diff tool is likely going to be the only way to ultimately
> control a binary package feed and is still the only way I can see of
> solving this problem. I'd love some help on making that work. Making
> deterministic binaries is a large part in making that tool effectively
> ultimate and we had some great work on that in the last release.
>
> To be really clear, OE-Core will not have a different signature policy
> on release branches since that differing policy would break user
> expectations and also wouldn't get tested apart from on the branch so
> we'd have less confidence it was working.

Yes, I agree with this, I just used stable release as an example (big
changes won't happen on a stable release).

>
> Users are free to set their own policies, the system was designed to do
> that. If WindRiver wants to have a much more permissive policy, I'm
> more than happy for them to do so.

Thanks, frankly speaking, not only WindRiver wants this. After cloud
computing and virtualization gets hot, more and more users want to
customize their own images (for saving disk space, memory and security
reason), oe/yocto is very good at customizing images, so more and
more people try to use it to build their own distros, where live
upgrades becomes very important.

// Robert

>
> Cheers,
>
> Richard
>

