Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>) id 1RY1lW-0002So-0t
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 21:37:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB6KIYAl006868
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Dec 2011 20:18:34 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06330-06 for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2011 20:18:30 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB6KIOBW006862
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Dec 2011 20:18:25 GMT
Message-ID: <1323202715.19363.35.camel@ted>
From: Richard Purdie <rpurdie@rpsys.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 06 Dec 2011 20:18:35 +0000
In-Reply-To: <CAMvUbCxsL0hLMcThgR6=1-Vu3tfkOh6Jwr3FP95T_ssPFOMd9g@mail.gmail.com>
References: <CAMvUbCxsL0hLMcThgR6=1-Vu3tfkOh6Jwr3FP95T_ssPFOMd9g@mail.gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] Move package-split of kexec-tools (kdump/kexec) into oe-core?
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
X-List-Received-Date: Tue, 06 Dec 2011 20:37:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-12-06 at 17:46 +0100, Leon Woestenberg wrote:
> Hello all,
> 
> 
> meta-openembedded uses .bbappend to change the package-split-up of
> "kexec-tools" (as in openembedded-core) into "kexec" and "kdump"
> packages (this was classic OE behaviour).
> 
> http://cgit.openembedded.org/meta-openembedded/commit/meta-oe/recipes-kernel/kexec/kexec-tools_2.0.2.bbappend?id=0c6d03335c117d24096598a3415ba22f74ec4f6e
> 
> However, in openembedded-core we have a dependency on kexec-tools,
> thus this error results:
> 
> |  * satisfy_dependencies_for: Cannot satisfy the following
> dependencies for task-core-tools-testapps:
> |  *     kexec-tools *
> |  * opkg_install_cmd: Cannot install package
> task-core-tools-testapps.
> 
> 
> So the use of meta-openembedded as a layer breaks openembedded-core.
> 
> As a solution, can we move this package-split into openembedded-core?

I see no reason this shouldn't be in oecore (quite the opposite), we
just need someone to send the suitably tested patch.

Cheers,

Richard



