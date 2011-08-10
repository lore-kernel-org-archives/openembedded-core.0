Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qr7vy-0007sp-Fz for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 14:30:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7ACQOXc021471
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 13:26:24 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20864-04 for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 13:26:20 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7ACQIZ2021465
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 13:26:19 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1312903901.git.kergoth@gmail.com>
References: <cover.1312903901.git.kergoth@gmail.com>
Date: Wed, 10 Aug 2011 13:25:44 +0100
Message-ID: <1312979144.14274.361.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH(v3) 0/2] Rework the devshell
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
X-List-Received-Date: Wed, 10 Aug 2011 12:30:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-09 at 11:05 -0700, Christopher Larson wrote:
> This version addresses the issue brought up by Richard regarding unconditional
> export of variables resulting in checksum changes. This exports the required
> variables specifically within the subprocess for the terminal.
> 
> A future patch will alter things like the patch resolver to use this.
> 
> The following changes since commit ced947e989dfbca8055fe57e14207cb6f1357430:
> 
>   qemu: Poke more paths for presence of libgl (2011-08-09 15:21:06 +0100)
> 
> are available in the git repository at:
>   git://github.com/kergoth/oe-core devshell
> 
> go here for github's branch comparison interface:
>   https://github.com/kergoth/oe-core/compare/master...devshell
> 
> Chris Larson (2):
>       Rework how the devshell functions
>       oe.terminal: improve how we spawn screen

Merged to master, thanks.

Richard



