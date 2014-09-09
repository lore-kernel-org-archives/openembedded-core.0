Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 774DB65FEC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 15:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s89F26V2006295; Tue, 9 Sep 2014 16:02:06 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Zsc1uVVxehzi; Tue,  9 Sep 2014 16:02:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s89F23Oq006270
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 9 Sep 2014 16:02:04 +0100
Message-ID: <1410274925.19272.44.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, "Ashfield, Bruce"
	<Bruce.Ashfield@windriver.com>
Date: Tue, 09 Sep 2014 16:02:05 +0100
In-Reply-To: <540E8A1F.2010800@gmail.com>
References: <1410227590-14190-1-git-send-email-akuster808@gmail.com>
	<540E8A1F.2010800@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Adding new qemuppc64 machine config
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
X-List-Received-Date: Tue, 09 Sep 2014 15:02:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-09-08 at 22:03 -0700, akuster808 wrote:
> I forgot to mention. I will update linux-yocto_3.1x.bb too.

You need to talk to Bruce about that. I'm also worried about this coming
in this late, after feature freeze.

Cheers,

Richard

> - Armin
> 
> On 09/08/2014 06:53 PM, Armin Kuster wrote:
> > apply after "linux-yocto/3.14: configuration updates and feature merges."
> >
> >
> > Armin Kuster (1):
> >    qemuppc64: add machine
> >
> >   meta/conf/machine/qemuppc64.conf | 16 ++++++++++++++++
> >   1 file changed, 16 insertions(+)
> >   create mode 100644 meta/conf/machine/qemuppc64.conf
> >



