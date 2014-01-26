Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 8FF8F6CBB4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2014 12:31:55 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0QCVg3f005176; Sun, 26 Jan 2014 12:31:43 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nI7Rr3OZYC_Y; Sun, 26 Jan 2014 12:31:42 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0QCVaJ1005173
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Sun, 26 Jan 2014 12:31:38 GMT
Message-ID: <1390739491.17424.223.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrew Blackburn <andyblac@icloud.com>
Date: Sun, 26 Jan 2014 12:31:31 +0000
In-Reply-To: <5DF1C6C6-FAB2-4BAE-ACE6-9F1DFDA43BDD@icloud.com>
References: <5DF1C6C6-FAB2-4BAE-ACE6-9F1DFDA43BDD@icloud.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: how do i auto increase a package PR on every build.
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
X-List-Received-Date: Sun, 26 Jan 2014 12:31:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2014-01-26 at 11:40 +0000, Andrew Blackburn wrote:
> hi guys,
> 
> i hoping someone can help me on this, i am wanting to have a build
> number for my project, atm i am manually increase the PR from the main
> bb, but this mean i have update the GIT on each build, and is this
> flooded with unnecessary commits. this they away i can get it to auto
> increase the PR on each and every build ?, i would also need to tell
> it a start point from what to increase.
> 
> 
> hope someone can help.

Have a look at the PR server code. That currently increases the PR
number when the hash of the task changes.

You could therefore either:

a) hack the PR server to always increase the PR of your recipe

b) add a dependency on the DATETIME variable in your recipe's do_package
task so the hash always changes.

Cheers,

Richard


