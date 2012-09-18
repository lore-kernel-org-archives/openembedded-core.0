Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TDvMQ-0006vh-0D for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 12:48:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8IAaHIE026632;
	Tue, 18 Sep 2012 11:36:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25988-06; Tue, 18 Sep 2012 11:36:12 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8IAa6MB026626
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 18 Sep 2012 11:36:07 +0100
Message-ID: <1347964566.13596.113.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, Michael Halstead
	<michael@yoctoproject.org>
Date: Tue, 18 Sep 2012 11:36:06 +0100
In-Reply-To: <50583F16.9070102@linaro.org>
References: <505837BA.2040305@linaro.org> <1347959319.13596.90.camel@ted>
	<50583F16.9070102@linaro.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Best way to update gnu-config?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2012 10:48:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-09-18 at 11:29 +0200, Marcin Juszkiewicz wrote:
> W dniu 18.09.2012 11:08, Richard Purdie pisze:
> 
> > The trouble was that upstream was in cvs. It was the only reason we
> > still had a dependency on cvs and we decided we wanted to kill it which
> > isn't something I regret.
> 
> There is git mirror hosted on gnu.org servers which can be used instead
> of cvs. OE-Core already has git-native.

I remember the problem now, this was a circular dependency nightmare
(git-native depends on gnu-config-native and vice versa). 

> > Can you share a tarball of the updated (unpatched) upstream version and
> > we'll put it into place alongside the other tarball on the server.
> 
> http://people.linaro.org/~hrw/aarch64/gnu-config-20120814.tar.bz2
> 
> 11:29 hrw@puchatek$ sha256sum gnu-config-20120814.tar.bz2
> 44f99a8e76f3e8e4fec0bb5ad4762f8e44366168554ce66cb85afbe2ed3efd8b
> gnu-config-20120814.tar.bz2
>
> > Michael (cc'd) should be able to do this. Once that is done you should
> > be able to send a patch as usual to update to the new version.
> 
> Ok.

Thanks, Michael should be able to take care of this later today (he's US
based).

Cheers,

Richard



