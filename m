Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 46A087003A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jun 2014 10:15:57 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5IAFrxp007099; Wed, 18 Jun 2014 11:15:53 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jC5uBm1tZro3; Wed, 18 Jun 2014 11:15:52 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5IAFmnE007096
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 18 Jun 2014 11:15:49 +0100
Message-ID: <1403086542.2104.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Wed, 18 Jun 2014 11:15:42 +0100
In-Reply-To: <CAP9ODKo_tNpKNkOpr9mwFGosmuXiKfXQuNnTURaZzptsamSyzA@mail.gmail.com>
References: <1403011013-29977-1-git-send-email-meier.dennis@siemens.com>
	<CAP9ODKo_tNpKNkOpr9mwFGosmuXiKfXQuNnTURaZzptsamSyzA@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] populate_sdk_base: add auto-completion in setup
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
X-List-Received-Date: Wed, 18 Jun 2014 10:16:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-06-17 at 11:39 -0300, Otavio Salvador wrote:
> On Tue, Jun 17, 2014 at 10:16 AM, Dennis Meier <meier.dennis@siemens.com> wrote:
> > Signed-off-by: Dennis Meier <meier.dennis@siemens.com>
> 
> I do like the idea but how portable is it?
> 
> For example in my envinronment it does not work as I use zsh.

The script in question has "/bin/bash" at the top so this shouldn't be
an issue?

Cheers,

Richard


