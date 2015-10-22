Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 0CB7777106
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:01:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 1565A600F52
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1445334356.git.joshua.lock@collabora.co.uk>
	<f8642636a68071a0e33fa74d61fcb9cea566e5d7.1445334356.git.joshua.lock@collabora.co.uk>
	<CAJTo0LZLoorMg6Jro+7GN0--hB8e4dFcxNNFLMcS6qTc5T9qrQ@mail.gmail.com>
From: Joshua Lock <joshua.lock@collabora.co.uk>
Message-ID: <5628FA55.8030507@collabora.co.uk>
Date: Thu, 22 Oct 2015 16:01:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZLoorMg6Jro+7GN0--hB8e4dFcxNNFLMcS6qTc5T9qrQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 4/7] systemd: make dbus an optional build time dependency
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
X-List-Received-Date: Thu, 22 Oct 2015 15:01:48 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 21/10/15 17:09, Burton, Ross wrote:
>
> On 20 October 2015 at 10:47, Joshua Lock <joshua.lock@collabora.co.uk
> <mailto:joshua.lock@collabora.co.uk>> wrote:
>
>     +PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
>
>
> This also disables the code by default which is a change from the
> previous behaviour, which needs to be documented at least.  Also as
> they're for the test suite, should we enable dbus by default if ptest is
> enabled?

Indeed, I'll submit a v3 which mentions this in the commit message.

Selfishly I'd rather we didn't enable it by default where ptest is enabled.

We'd like to push changes to build d-bus with systemd support by default 
and to have dbus in the default DEPENDS would cause a dependency loop.

Of course if the feeling is that systemd with dbus tests in ptest is a 
more useful default than dbus with systemd support, I can submit that 
change.

Cheers,

Joshua

