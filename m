Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SrpI9-00030d-6a for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 13:53:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6JBfqfO001820
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 12:41:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32466-07 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 12:41:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6JBfjSK001814
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 12:41:46 +0100
Message-ID: <1342698109.7940.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jul 2012 12:41:49 +0100
In-Reply-To: <5007F0C7.90605@cisco.com>
References: <1342696517-28149-1-git-send-email-mertsas@cisco.com>
	<20120719113512.GK3331@jama.jama.net> <5007F0C7.90605@cisco.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q6JBfqfO001820
Subject: Re: [PATCH] Changed SRC_URI for eglibc repo.
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
X-List-Received-Date: Thu, 19 Jul 2012 11:53:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-07-19 at 13:34 +0200, Martin Erts=C3=A5s wrote:
> On 07/19/12 13:35, Martin Jansa wrote:
> > On Thu, Jul 19, 2012 at 01:15:17PM +0200, Martin Ertsaas wrote:
> >> The branches repo for eglibc is /branches, not /svn/branches.
> > Are you sure? wasn't this tested on broken bitbake where protocol par=
am
> > was ignored and default svn:// protocol was used instead http://?
> >
> > Cheers,
> when was bitbake fixed for this? I have commit number
> a93a58b7cea2ddb9596cb4d718c0801db5d1a295 from two days ago now. Was it =
a
> broken bitbake?

The commit immediately after that,
http://git.openembedded.org/bitbake/commit/?id=3Db2017f493ab730d804ae44ec=
5a168d464626d046
is the fix referred to.

Cheers,

Richard



