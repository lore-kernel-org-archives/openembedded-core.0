Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R9LPY-0002cJ-2u for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 20:32:44 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8TIXZlS011691; Thu, 29 Sep 2011 19:33:35 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XktCQmRhkeRr; Thu, 29 Sep 2011 19:33:35 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8TIXRP1011686
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Thu, 29 Sep 2011 19:33:29 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 29 Sep 2011 19:27:01 +0100
In-Reply-To: <CAEsOVNdPjWvgaCL0EYUqh1XOriYMstGz3iLMG3Mamwd4sW9QQA@mail.gmail.com>
References: <1317270070-14250-1-git-send-email-msm@freescale.com>
	<1317270070-14250-2-git-send-email-msm@freescale.com>
	<1317284813.12332.76.camel@ted>
	<CAEsOVNdPjWvgaCL0EYUqh1XOriYMstGz3iLMG3Mamwd4sW9QQA@mail.gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317320829.12332.107.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 02/16] bitbake pseudo wrapper: Don't base success on bitbake return code
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
X-List-Received-Date: Thu, 29 Sep 2011 18:32:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-29 at 18:04 +0000, McClintock Matthew-B29882 wrote:
> On Thu, Sep 29, 2011 at 3:26 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2011-09-28 at 23:20 -0500, Matthew McClintock wrote:
> >> bitbake does not return 0 when a build succeeds.
> >
> > Er, yes it does. If you're seeing something other than 0 its likely
> > because you're seeing ERROR messages?
> 
> First off, this appears to have been fixed along the way. But I know I
> was getting a message like:
> 
> [snip]
> NOTE: Tasks Summary: Attempted 133 tasks of which 0 didn't need to be
> rerun and 0 failed.

Can you file an enhancement bug to list the number of errors and
warnings shown in the summary please? :)

We need to make it more obvious how many warnings/errors are occurring
since errors change the exit code.

> Then it would stop after building pseudo-native. Maybe we should add a
> message to scripts/bitbake so we get an actual failure message when
> this occurs? Also, are these errors relevant if we built psuedo-native
> properly?

Hard to say without seeing what they were...

Cheers,

Richard



