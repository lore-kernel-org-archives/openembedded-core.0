Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 7D24060821
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 09:43:13 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5H9mZR1017733; Mon, 17 Jun 2013 10:48:35 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SpVVrZ6_gELg; Mon, 17 Jun 2013 10:48:35 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5H9m8MD017717
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 17 Jun 2013 10:48:30 +0100
Message-ID: <1371462123.20823.94.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ml@communistcode.co.uk
Date: Mon, 17 Jun 2013 10:42:03 +0100
In-Reply-To: <51BED302.8020107@communistcode.co.uk>
References: <51BED302.8020107@communistcode.co.uk>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: commit 07792e4a83ca breaks oe-init-build-env sourcing
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
X-List-Received-Date: Mon, 17 Jun 2013 09:43:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-06-17 at 10:12 +0100, Jack Mitchell wrote:
> Pulled to the latest oe-core, bitbake and a few 3rd party layers this 
> morning, to find that when I source oe-init-build-env the terminal I was 
> sourcing in either crashes or exits.
> 
> I tested with both gnome-terminal and xterm, both produced the same 
> behaviour.
> 
> Heading into a git bisect the apparent bad commit is: 
> 07792e4a83ca4f1c8152c228813c7f795fa6a545 (scripts/oe-buildenv-internal 
> bitbake: Migrate python version checks)
> 
> If it makes a difference the default python on my system is python3. My 
> workflow is usually source oe-init-build-env, then I add a directory 
> with a symlink to python2 at the beginning of my PATH, so the default 
> python is python2.
> 
> Any help would be appreciated; holler if you need me to run any more tests.

I pushed a fix for this, sorry about that.

Cheers,

Richard


