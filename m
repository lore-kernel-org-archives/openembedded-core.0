Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SOsr6-0000mn-J9 for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 17:49:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3UFdxZG004828
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 16:39:59 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04394-04 for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 16:39:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3UFdql9004822
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 16:39:53 +0100
Message-ID: <1335800393.7415.26.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 30 Apr 2012 16:39:53 +0100
In-Reply-To: <CAMKF1sofwSqoCOeaLAb9fPZ7HMQH49OsCZ37wYLJkGz_doCkEw@mail.gmail.com>
References: <CAMKF1sq94g5aaYPQZ=UZtBT6iBxCMJ7ZrKer=gaCVoEjV=eWKA@mail.gmail.com>
	<1335451639.20130.18.camel@ted> <1335468645.20130.27.camel@ted>
	<1335474399.20130.35.camel@ted>
	<CAMKF1so6gABH-H9uZ2R4ppr6F-zT9GtPg7j5fThzQQjWXKkG4g@mail.gmail.com>
	<1335796919.7415.20.camel@ted>
	<CAMKF1sriyONx1y3q7RMmi+oEztr_rx0VmLnLk3fLYE4NEq0vcg@mail.gmail.com>
	<1335797635.7415.22.camel@ted>
	<CAMKF1sofwSqoCOeaLAb9fPZ7HMQH49OsCZ37wYLJkGz_doCkEw@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: gcc 4.7 + mips64 architecture support
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
X-List-Received-Date: Mon, 30 Apr 2012 15:49:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-04-30 at 07:59 -0700, Khem Raj wrote:
> On Mon, Apr 30, 2012 at 7:53 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >> hmmm. Whats the error ?
> >
> > http://autobuilder.yoctoproject.org:8010/builders/nightly-tiny/builds/42/steps/shell_24/logs/stdio
> 
> that should not happen. Its seems to be issue in eglibc option group
> handling somehow its asking for regexp which should be isolated in
> option groups
> 
> Did this work fine with 4.6 ?

Yes, it worked fine with 4.7 too. Only when we changed eglibc 2.13 ->
2.15 did it show up.

Cheers,

Richard



