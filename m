Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QIdH4-0008K6-Fq for openembedded-core@lists.openembedded.org;
	Sat, 07 May 2011 10:54:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p478pMla002695;
	Sat, 7 May 2011 09:51:22 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02633-01; Sat,  7 May 2011 09:51:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p478pDFg002689
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 7 May 2011 09:51:17 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <BANLkTikVXbDNTE_Nt-ptxGjeQN5_RYcp-A@mail.gmail.com>
References: <1304755709.30391.187.camel@rex>
	<BANLkTi=x2xuJaGGNSq4eT5Cp2wVW0NnhBA@mail.gmail.com>
	<BANLkTi=J5nGBSUVMLSfbJo+RpsMk-OCU9g@mail.gmail.com>
	<1304756644.30391.189.camel@rex>
	<BANLkTikVXbDNTE_Nt-ptxGjeQN5_RYcp-A@mail.gmail.com>
Date: Sat, 07 May 2011 09:51:07 +0100
Message-ID: <1304758267.30391.190.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Unable to push to the repository?
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
X-List-Received-Date: Sat, 07 May 2011 08:54:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-05-07 at 01:37 -0700, Khem Raj wrote:
> On Sat, May 7, 2011 at 1:24 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Sat, 2011-05-07 at 01:21 -0700, Khem Raj wrote:
> >> On Sat, May 7, 2011 at 1:13 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >> > On Sat, May 7, 2011 at 1:08 AM, Richard Purdie
> >> > <richard.purdie@linuxfoundation.org> wrote:
> >> >> Hi,
> >> >>
> >> >> It seems something on the server was broken and I'm unable to push to the repository:
> >> >>
> >> >> $ git push origin master:master
> >> >> Counting objects: 9, done.
> >> >> Delta compression using up to 2 threads.
> >> >> Compressing objects: 100% (5/5), done.
> >> >> Writing objects: 100% (5/5), 490 bytes, done.
> >> >> Total 5 (delta 4), reused 0 (delta 0)
> >> >> remote: sed: can't read ./description: No such file or directory
> >> >> remote: *** Project description file hasn't been set
> >> >> remote: error: hook declined to update refs/heads/master
> >> >> To ssh://git@git.openembedded.org/openembedded-core
> >> >>  ! [remote rejected] master -> master (hook declined)
> >> >> error: failed to push some refs to 'ssh://git@git.openembedded.org/openembedded-core'
> >> >>
> >> >> Any ideas what's wrong?
> >> >
> >> > hmmm I added ml hooks but they are same as classic oe so it should
> >> > have worked but let me see.
> >>
> >> OK I think I used wrong repo name probably that was it. Please retry
> >> and see if it works
> >
> > No, still the same error :(
> 
> one more time. Now I have added description files.

It worked this time, thanks.

Cheers,

Richard



