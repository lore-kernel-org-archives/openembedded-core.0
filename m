Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 967CE6CD1B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Oct 2013 13:39:32 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9DDdRFT004313; Sun, 13 Oct 2013 14:39:27 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cOKkiMIinplb; Sun, 13 Oct 2013 14:39:27 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9DDdOWL004305
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sun, 13 Oct 2013 14:39:26 +0100
Message-ID: <1381671560.29912.221.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 13 Oct 2013 14:39:20 +0100
In-Reply-To: <8C777AF9-B935-4043-AC97-106EBA7BC89E@dominion.thruhere.net>
References: <1381498665-21514-1-git-send-email-koen@dominion.thruhere.net>
	<1381498665-21514-2-git-send-email-koen@dominion.thruhere.net>
	<1381567052.29912.206.camel@ted>
	<8C777AF9-B935-4043-AC97-106EBA7BC89E@dominion.thruhere.net>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] openssh: allow empty passwords if PAM allows it as well
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
X-List-Received-Date: Sun, 13 Oct 2013 13:39:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2013-10-13 at 12:01 +0200, Koen Kooi wrote:
> Op 12 okt. 2013, om 10:37 heeft Richard Purdie <richard.purdie@linuxfoundation.org> het volgende geschreven:
> 
> > On Fri, 2013-10-11 at 15:37 +0200, Koen Kooi wrote:
> >> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >> ---
> >> meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config | 2 +-
> >> 1 file changed, 1 insertion(+), 1 deletion(-)
> >> 
> >> diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config
> >> index 4f9b626..175e8f3 100644
> >> --- a/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config
> >> +++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/sshd_config
> >> @@ -59,7 +59,7 @@ Protocol 2
> >> 
> >> # To disable tunneled clear text passwords, change to no here!
> >> #PasswordAuthentication yes
> >> -#PermitEmptyPasswords no
> >> +PermitEmptyPasswords yes
> >> 
> >> # Change to no to disable s/key passwords
> >> #ChallengeResponseAuthentication yes
> > 
> > I'm struggling to connect the "if PAM allows it as well" part of the
> > shortlog to this change? How is this conditional on PAM?
> 
> If PAM disallows empty passwords this option doesn't do anything. The
> PAM rules run before the openssh config options get applied.

What if PAM isn't being used?

Cheers,

Richard


