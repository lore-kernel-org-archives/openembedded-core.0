Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 70B6D6FFD3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 08:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0B8MTAO002757; Wed, 11 Jan 2017 08:22:29 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gFVaAjQxYnX5; Wed, 11 Jan 2017 08:22:29 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0B8MQvZ002754
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 11 Jan 2017 08:22:28 GMT
Message-ID: <1484122946.4367.170.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anders Oleson <anders@openpuma.org>,
	openembedded-core@lists.openembedded.org
Date: Wed, 11 Jan 2017 08:22:26 +0000
In-Reply-To: <CAKTo2Em1Lcs19L0M=WpGOJv3aQkQLJuetFsgm6nq_0sVix1X3A@mail.gmail.com>
References: <CAKTo2Em1Lcs19L0M=WpGOJv3aQkQLJuetFsgm6nq_0sVix1X3A@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Re: bug with dpkg-native and sstate-cache mirrors
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
X-List-Received-Date: Wed, 11 Jan 2017 08:22:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-12-16 at 11:31 -0800, Anders Oleson wrote:
> Does this sound like I'm on the right track or like something that
> could be included? I'd like to fix this so that it doesn't sneak up
> on someone else.
> 
> I'm willing to take a hack at it and test it in the scenario where
> this bit us. It would involve steps:
> 1. develop a patch to dpkg to add the option
> 2. develop a patch for OE to change the configure for dpkg-native
> 3. a patch for OE to pass --configdir to dpkg in all the right
> places.
> I could use help to insure I find them all.

This does sound like a genuine bug and something we need to fix. You do
sound like you're on the right track with it. Adding a workaround patch
to dpkg-native only would be one way to move forward but fixing it
properly as you describe is much more desirable if upstream will take
such a patch. I appreciate you taking the time to do that!

The lack of response isn't lack of interest but partly the holidays and
partly that you're on the right check so replies would mainly be "yes,
sounds good" which people tend not to post against everything they
agree with.

Cheers,

Richard

