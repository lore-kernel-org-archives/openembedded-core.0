Return-Path: <openembedded-core@emagii.com>
Received: from smtp-out21.han.skanova.net (smtp-out21.han.skanova.net
	[195.67.226.208])
	by mail.openembedded.org (Postfix) with ESMTP id 3F30060424
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jul 2014 20:36:42 +0000 (UTC)
Received: from [10.175.196.23] (213.66.90.56) by smtp-out21.han.skanova.net
	(8.5.133) (authenticated as u82406562)
	id 53804BED00FBE2AB; Thu, 3 Jul 2014 22:36:39 +0200
Message-ID: <53B5BED7.4080806@emagii.com>
Date: Thu, 03 Jul 2014 22:36:39 +0200
From: Ulf Samuelsson <openembedded-core@emagii.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1403177022-19086-1-git-send-email-Martin.Jansa@gmail.com>
	<3503275.YjDqJfgFMA@peggleto-mobl5.ger.corp.intel.com>
	<CAJTo0LbmBrwHOdYKdeaiKzHxpCdJ5XtxTUO5CnK7yi+Rm3nUyQ@mail.gmail.com>
	<20140623123922.GF2437@jama> <20140623124437.GG2437@jama>
	<1404405934.6362.89.camel@ted> <53B59084.1090608@emagii.com>
	<CAJTo0LbexU5YCtswU8hhG1R0hNWhz85MhPpEPvaomcz+vWpPaA@mail.gmail.com>
In-Reply-To: <CAJTo0LbexU5YCtswU8hhG1R0hNWhz85MhPpEPvaomcz+vWpPaA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Avoiding getting the login prompt on the LCD at boot
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
X-List-Received-Date: Thu, 03 Jul 2014 20:36:44 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

2014-07-03 22:31, Burton, Ross skrev:
> On 3 July 2014 18:19, Ulf Samuelsson <openembedded-core@emagii.com> wrote:
>> Between 2 and 3, I get an ugly login prompt.
> So something is chvt'ing away from psplash too early.  Is the Qt
> application running on framebuffer, or Wayland, or X11, or what?
>
> Ross
Running eglfs using the PowerVR omaplfb and da8xx-fb drivers.

The ugly login prompt disappears, if I don't have a console on the 
framebuffer.
But why don't I get a logo if I disable it???

BR
Ulf


