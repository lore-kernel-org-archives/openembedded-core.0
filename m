Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D46E360762
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 17:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7UH0jO5008732; Tue, 30 Aug 2016 18:00:45 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WGP5lI6_AYX4; Tue, 30 Aug 2016 18:00:45 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7UH0hYf008728
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 30 Aug 2016 18:00:44 +0100
Message-ID: <1472576443.29583.33.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jack Mitchell <ml@embed.me.uk>, OE-core
	<openembedded-core@lists.openembedded.org>
Date: Tue, 30 Aug 2016 18:00:43 +0100
In-Reply-To: <6564e30c-bf94-8476-ac22-0be131193ebd@embed.me.uk>
References: <6564e30c-bf94-8476-ac22-0be131193ebd@embed.me.uk>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: gcc 6.1+ and isystem
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
X-List-Received-Date: Tue, 30 Aug 2016 17:00:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-08-30 at 16:37 +0100, Jack Mitchell wrote:
> Some of the headers shipped with gcc 6.1 and above now use
> #include_next 
> to try to and do clever things with munging system header files. Our 
> injection of isystem into the build at 'meta/conf/bitbake.conf' seems
> to 
> be causing some programs to fail to compile. A full explanation can
> be 
> found at [1], a bug report from GCC specifying that it should only be
> used in extreme cases at [2].
> 
> Since we seem to be adding -isystem unconditionally to BUILD_CFLAGS
> from 
> bitbake, and that the default behavior has now changed should this be
> revisited? I'll admit that I am no where near experienced enough with
> GCC and friends internals to make a call on this one, I'm just
> looking 
> for some input.

Its been a long time since we've looked at the native build flags and
the world is a different place from when they were first implemented
around a decade ago. I did cull some bits occasionally but more cleanup
remains and it could be we can change it. A build of all the native
recipes trying to replace it with a -I flag would likely be the first
step...

Cheers,

Richard

