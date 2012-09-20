Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TEgNm-00013V-E1 for openembedded-core@lists.openembedded.org;
	Thu, 20 Sep 2012 15:01:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8KCmknB011992;
	Thu, 20 Sep 2012 13:48:46 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11894-01; Thu, 20 Sep 2012 13:48:41 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8KCmaT1011986
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 20 Sep 2012 13:48:37 +0100
Message-ID: <1348145315.10108.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrei Gherzan <andrei@gherzan.ro>
Date: Thu, 20 Sep 2012 13:48:35 +0100
In-Reply-To: <1348135019-19878-1-git-send-email-andrei@gherzan.ro>
References: <1348135019-19878-1-git-send-email-andrei@gherzan.ro>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] Replace "echo -e" with "printf" to have the same behavior in dash or bash
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
X-List-Received-Date: Thu, 20 Sep 2012 13:01:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-09-20 at 12:56 +0300, Andrei Gherzan wrote:
> oe-core removed the prerequisite to have sh as bash. POSIX doesn't define
> any options and furthermore allows 'echo -e' to be the default behavior.
> This means that in dash 'echo -e' will actually print '-e' and interpret
> backslashes by default. We use instead 'printf' builtin command with or
> without '\n' to simulate 'echo -e' or 'echo -n'.
> 'printf' needs format while 'echo' can be used without any arguments. So
> 'echo >' was replaced by 'printf "" >'.
> 'echo' without '-n' flag adds a new line by default so to keep the same
> behavior of two new lines while using 'echo "\n"', 'printf "\n\n"' is
> used.
> 
> [YOCTO #3138]
> 
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>

Merged to master, thanks.

Richard



