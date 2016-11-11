Return-Path: <ml@embed.me.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id E3EF5602D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 17:30:47 +0000 (UTC)
To: "Burton, Ross" <ross.burton@intel.com>
References: <0e379627-328b-cd37-0310-67a14156d90e@embed.me.uk>
	<CAJTo0LaY5K8gY97hXbLgGkaRNbKGv-DwvLU0H1jt8oSkXg+rug@mail.gmail.com>
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <be2d8fe9-686b-b174-48a3-f609f36f0969@embed.me.uk>
Date: Fri, 11 Nov 2016 17:31:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaY5K8gY97hXbLgGkaRNbKGv-DwvLU0H1jt8oSkXg+rug@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: libtool --with-libtool-sysroot
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
X-List-Received-Date: Fri, 11 Nov 2016 17:30:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/16 15:34, Burton, Ross wrote:
>
> On 11 November 2016 at 14:34, Jack Mitchell <ml@embed.me.uk
> <mailto:ml@embed.me.uk>> wrote:
>
>     However, looking at the libtool recipe in OE it has a patch which
>     changes the libtool flag from --with-sysroot to
>     --with-libtool-sysroot. The question is, how is this version not
>     making it into my SDK, I have sourced the environment script and a
>     which libtoolize points to the right path.
>
>
> Is the package you are trying to build using its own libtool (or the
> host libtool), and not our prefixed libtool?
>
> Ross

This may be happening but it's just a generic autotools project. No 
references to libtool in the project apart from the ones automatically 
generated.

autoreconf -i
./configure ${CONFIGURE_FLAGS}
make

How would one check which libtool was being used, or influence which one 
autotools chooses?

Cheers,

