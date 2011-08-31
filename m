Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qyq2g-00046N-PA for openembedded-core@lists.openembedded.org;
	Wed, 31 Aug 2011 21:01:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7VIumr7010807
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2011 19:56:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10593-03 for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2011 19:56:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7VIudtT010801
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2011 19:56:40 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <44d5fd558b4079edf813e96ff0bf6ce06930c0dd.1314758474.git.xiaofeng.yan@windriver.com>
References: <cover.1314758474.git.xiaofeng.yan@windriver.com>
	<44d5fd558b4079edf813e96ff0bf6ce06930c0dd.1314758474.git.xiaofeng.yan@windriver.com>
Date: Wed, 31 Aug 2011 19:56:26 +0100
Message-ID: <1314816986.5939.478.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] dropbear: Change the path to find configuration file and add a configuration file for dropbear
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
X-List-Received-Date: Wed, 31 Aug 2011 19:01:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-31 at 10:48 +0800, Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> dropbear will check "/etc/pam.d/sshd" which comes from package "openssh" \
> When enabling pam supporting. But if we only install dropbear \
> package without package "openssh", then "dropbear" will not \
> find a configuration file.
> The changes are as follow for fixing this bug:
> 
> - Change the path to find configuration file (/etc/pam.d/sshd --> /etc/pam.d/dropbear)
> - Add a configuration file "/etc/pam.d/dropbear"
> 
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
>  meta/recipes-core/dropbear/dropbear.inc |   12 +++++++++++-
>  1 files changed, 11 insertions(+), 1 deletions(-)

Merged to master, thanks.

Richard



