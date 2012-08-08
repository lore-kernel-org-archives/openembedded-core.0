Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Sz6dA-0003LF-Jz
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 15:49:00 +0200
Received: by lagv3 with SMTP id v3so343416lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2012 06:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=BruCVhGhf5o1KmOxl1ScqqWenAl1oWI0JT6xiZhYRpw=;
	b=tDrle8V774FwoPTiDAIKnmmbZMzgeYZifSIMiHGqgJDcjAagl8TwHuTtxqfY+WGOrR
	/9O6Yq7BHHFplhyMo+oYiMxGrHZ1amZ31bQyeLGidMxN7BeoWEBW1tHvyJ6DytlJVq67
	Fp+ScYoysy6yW4hAbO32PsV067WeboPgYV//+Z1uWHa3lqL/schR2e/UhqRoAK6TC61Q
	a4JcKsw179Nz0CcjQylJRDxWdWLLOkTjDKRWIi7oKdpU/loDu6IADZKursBdwUVaMVye
	quPUjg6rcoueedPAvdZJoYEAhKlLlUQig9XENbFief9lo8i/aTO//q8gO3FEeKywzKjD
	lUvA==
Received: by 10.112.102.136 with SMTP id fo8mr8018075lbb.106.1344433033324;
	Wed, 08 Aug 2012 06:37:13 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.64.209 with HTTP; Wed, 8 Aug 2012 06:36:53 -0700 (PDT)
In-Reply-To: <CAJTo0La+0sDd00LS2n=3qJ7xgmaa0csFv-jaTz5jvevHrtceVA@mail.gmail.com>
References: <CAJTo0Lb2jyRgUxqKE_ggZDwGr9FQuHig8rnQsYZTghdMXUpKhw@mail.gmail.com>
	<1344418236.23275.219.camel@phil-desktop>
	<CAJTo0La+0sDd00LS2n=3qJ7xgmaa0csFv-jaTz5jvevHrtceVA@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 8 Aug 2012 06:36:53 -0700
X-Google-Sender-Auth: x3Isi8FAu3hA64xKZoID-QN-wKI
Message-ID: <CABcZANkzqU=nqddBsQtFM=Hw4Bkzi07iKQiWKwJAEiAvJYou5Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Configurable host name
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Aug 2012 13:49:00 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 8, 2012 at 5:09 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 8 August 2012 10:30, Phil Blundell <philb@gnu.org> wrote:
>> hostname_pn-base-files = "my-distro-rocks"
>
> Aha.  I was looking at the hostname variable in there and wondering if
> it could be overridden.  That satisfies my itch for now, considering
> the drawback of causing everything to rebuild if a global variable
> were changed.

To clarify, changing a global variable doesn't cause everything to
rebuild. As was pointed out, it ends up in all the metadata for all
the recipes, but that doesn't mean it ends up in the task checksums.
The metadata checksumming tracks variable dependencies, and will only
rebuild the tasks which use the variable, directly or indirectly. Now,
*exported* variables are a rather different beast, but that's not what
we're talking about here.

Note that I'm not arguing in favor of adding another global variable,
but I did want to make sure you understand the actual behavior of the
system in this regard.
-- 
Christopher Larson


