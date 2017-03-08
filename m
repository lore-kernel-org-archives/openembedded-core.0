Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DD01677507
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 18:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v28I0ZqV006974; Wed, 8 Mar 2017 18:00:35 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id a7OZZJSN5bUd; Wed,  8 Mar 2017 18:00:35 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v28I0UwX006971
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 8 Mar 2017 18:00:31 GMT
Message-ID: <1488996030.22968.78.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, Peter Kjellerstedt
	<peter.kjellerstedt@axis.com>
Date: Wed, 08 Mar 2017 18:00:30 +0000
In-Reply-To: <CAJTo0Laa_WrQOjCyNBBmpWbKkza9Pg=dAiQEQJBrQoiEWab0Bw@mail.gmail.com>
References: <cover.1488539819.git.pkj@axis.com>
	<CAEHkU3XyKbGzTCX9XaG7jYXjde+ZRtA9z_MSecxpgOcu6wLMiQ@mail.gmail.com>
	<aca83849e80a444595764b812d5e3394@XBOX02.axis.com>
	<af3c0da4bce549a5b303d828c9728524@XBOX02.axis.com>
	<CAJTo0Laa_WrQOjCyNBBmpWbKkza9Pg=dAiQEQJBrQoiEWab0Bw@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 0/5] Add dummy tools to help identify needed dependencies
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
X-List-Received-Date: Wed, 08 Mar 2017 18:00:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-03-08 at 17:21 +0000, Burton, Ross wrote:
> 
> On 8 March 2017 at 09:43, Peter Kjellerstedt <peter.kjellerstedt@axis
> .com> wrote:
> > since I see that you have integrated/staged the two patches that
> > add
> > inherits of pkgconfig, but not the patches that add the dummy
> > commands,
> > I assume you have some reservations to these patches. What are your
> > take on the subject of blacklisting vs whitelisting the commands
> > from
> > the build host? I know that having these dummy commands in place
> > helped
> > me a great deal when updating our recipes to build correctly with
> > RSS.
> > 
> FWIW I wasn't entirely keen on how the blacklisting had to be very
> careful about how PATH was manipulated, which is why I merged to my
> staging branch the fixes but not the dummy commands.
> 
> If the majority of people agree that this should be merged I don't
> have a strong opinion either way.

Ultimately I think there is a better solution than this but I haven't
had time to look at that as yet.

I do worry that it makes assumptions about PATH that may or may not be
valid everywhere, equally I do see it could be useful.

So I also have mixed feelings...

Cheers,

Richard

