Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id A39C676DD8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 14:24:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 67681608F88
To: Christopher Larson <clarson@kergoth.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <19f46bb2f6951eca80f159b612b407e3df0b6ea1.1440454290.git.chris_larson@mentor.com>
	<3843d76235f7517207f9aa178d70c731f2b2d51e.1440454290.git.chris_larson@mentor.com>
	<55DD7C88.4080305@collabora.co.uk>
	<CAJTo0LaO2RSxb_RC-aDUo46dQAoQPwArNJNDCOkkTdEKVUwZhw@mail.gmail.com>
	<CABcZANk_tgWL0VSvRCsA=_X7Yz25OQcgfAgek98WOWmZ7J5tug@mail.gmail.com>
	<CABcZAN=zY7JoSk+btg7=GLxnqaX_ZXwvj1Nv5Dz10RnqGNPDGg@mail.gmail.com>
From: Joshua Lock <joshua.lock@collabora.co.uk>
Message-ID: <55DDCC00.8090909@collabora.co.uk>
Date: Wed, 26 Aug 2015 15:24:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CABcZAN=zY7JoSk+btg7=GLxnqaX_ZXwvj1Nv5Dz10RnqGNPDGg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] insane.bbclass: add host-user-contaminated test
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
X-List-Received-Date: Wed, 26 Aug 2015 14:24:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/08/15 15:20, Christopher Larson wrote:
>
> On Wed, Aug 26, 2015 at 7:19 AM, Christopher Larson <clarson@kergoth.com
> <mailto:clarson@kergoth.com>> wrote:
>
>     On Wed, Aug 26, 2015 at 4:01 AM, Burton, Ross <ross.burton@intel.com
>     <mailto:ross.burton@intel.com>> wrote:
>
>         On 26 August 2015 at 09:44, Joshua Lock
>         <joshua.lock@collabora.co.uk
>         <mailto:joshua.lock@collabora.co.uk>> wrote:
>
>             I do all of my builds on a separate partition in a directory
>             hierarchy which is owned by my user - if I'm understanding
>             this correctly I'll get QA WARNINGS for all of my builds
>             with this change?
>
>
>         The paths are prefixed with ${D} so pretend the commit log says
>         "in packages".
>
>
>     Heh, indeed, it's a package QA test. do_install runs under pseudo,
>     so any newly created files there, or files chown'd to root, will be
>     fine. If, however, a recipe does a cp -a or so to install without
>     doing a chown, you'll end up with files in your rootfs owned by the
>     user that did the build -- not good.

Indeed. Thanks for taking the time to clarify.

>
> I can re-submit with that commit message clarification, if needed? I
> rather thought the fact that it was in insane.bbclass, not
> sanity.bbclass, carried the necessary implication.

Personally I don't feel that's necessary - I should review with more 
care (and coffee).

Thanks for the offer though.

Regards,

Joshua


