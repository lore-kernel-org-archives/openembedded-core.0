Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C51697199E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jun 2018 11:30:47 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5UBUjHb023085
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sat, 30 Jun 2018 12:30:46 +0100
Message-ID: <91f3f4855d0f0f4bd70332be3677d504beca2072.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Date: Sat, 30 Jun 2018 12:30:45 +0100
In-Reply-To: <CAJ86T=XP8oMmuxAvz15Y7aUxt9ZrvTjpUy8wUyPotgG8xpzTrQ@mail.gmail.com>
References: <CAJ86T=XP8oMmuxAvz15Y7aUxt9ZrvTjpUy8wUyPotgG8xpzTrQ@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: LICENSE for recipes with empty SRC_URI
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
X-List-Received-Date: Sat, 30 Jun 2018 11:30:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-06-29 at 19:56 -0700, Andre McCurdy wrote:
> There doesn't seem to be much consistency in the way LICENSE is
> handled for recipes which don't need to define anything in SRC_URI.
> 
>  - Packagegroup recipes have a default LICENSE in
> packagegroup.bbclass
> and generally don't define their own value, for reasons explained in:
> 
>   http://git.openembedded.org/openembedded-core/commit/?id=c04ae17f43
> 9ffd5fd70d8564430a94582e2cf688
> 
>  - Image recipes have a default LICENSE in image.bbclass but
> generally
> always explicitly define the value again. A precedent for doing that
> seems to have been set by:
> 
>   http://git.openembedded.org/openembedded-
> core/commit/?id=fb617bed6ebbb17ca9a14ea5985302b03311ccb7

That is from 2010 and the world looked very different so I'm not sure
I'd read much into it.

>  - SDK recipes (anything inheriting populate_sdk) don't have a
> default
> LICENSE and must explicitly define one in each recipe.
> 
> Given that LICENSE is meant to apply to the sources associated with a
> recipe, not the recipe itself, shouldn't all these cases be following
> the approach currently taken by packagegroup recipes (ie a default
> set
> by the appropriate class and no LICENSE in the recipe)? Or is there a
> fundamental difference between these cases which justifies the three
> different approaches?

I think the approach should be standardised and come from the class.
The recipe can always override.

I suspect its simply not happened as nobody has had time or there have
been other higher priorities.

Cheers,

Richard


