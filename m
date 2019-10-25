Return-Path: <stefan@herbrechtsmeier.net>
Received: from dd41138.kasserver.com (dd41138.kasserver.com [85.13.157.12])
	by mail.openembedded.org (Postfix) with ESMTP id 54C7F7FA5D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:10:22 +0000 (UTC)
Received: from [192.168.178.37] (i59F77ED2.versanet.de [89.247.126.210])
	by dd41138.kasserver.com (Postfix) with ESMTPSA id D4ACA11A0046;
	Fri, 25 Oct 2019 11:10:22 +0200 (CEST)
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>,
	openembedded-core@lists.openembedded.org
References: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
	<84dcb01f8a015b1717be0b2430c220b6d23ef0d8.camel@andred.net>
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Message-ID: <27de9afc-27f0-29a2-6c7d-14e25e925594@herbrechtsmeier.net>
Date: Fri, 25 Oct 2019 11:10:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <84dcb01f8a015b1717be0b2430c220b6d23ef0d8.camel@andred.net>
Subject: Re: [RFC][PATCH 0/6] NPM refactoring
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
X-List-Received-Date: Fri, 25 Oct 2019 09:10:22 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Andre,

Am 25.10.19 um 10:01 schrieb André Draszik:
> Hi,
> 
> This has been an interesting discussion so far.
> 
> I'd like to throw in something else...
> 
> A couple years back I wrote a little python script to automatically
> generate all the required dependency recipes given an npm project's
> package.json

This is similar to my prototype but I try to reuse the recipetool and 
this makes the recipe creation very slow.

Do you reuse code from OE to generate the license information?

> The generated recipes worked very well, including cross-compilation using
> node-gyp.

Do you use any bbclass? I have create multiple bbclasses to minimize the 
code inside the recipes.

> At least at the time this was all reasonably straight forward, avoided *any* use
> of npm, gave me all the benefits of reproducibility, yocto caching, license
> management, correct cross-compilation for native code, etc. Also, the
> generated yocto packages contained none of the test- or other items that
> npm packages usually contain and don't need to be copied onto the target
> for image builds. All this by simply inspecting the package.json

This is the reason I go this way too.

> This approach also minimised maintenance cost, as all recipes were auto-generated.
> 
> The only downside was that bitbake became a bit slow, as the number of
> tasks went to about 15000.

Do you create a recipe per package version?

> I can dig this out and share on Monday. This script could live in the
> scripts/ subdirectory, allowing people to create recipes on demand for
> projects they care about.

Would be nice to see your code.

Regards
   Stefan

