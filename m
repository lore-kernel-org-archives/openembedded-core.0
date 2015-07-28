Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 155CB7626F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 13:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6SDrSl7006050; Tue, 28 Jul 2015 14:53:28 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Isaf1pQezWqc; Tue, 28 Jul 2015 14:53:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6SDrF1K006026
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 28 Jul 2015 14:53:26 +0100
Message-ID: <1438091595.11208.10.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Tue, 28 Jul 2015 14:53:15 +0100
In-Reply-To: <CAP9ODKpsscuNtP+S=zX6uM9sTiFRO8FyN3c9y-Fqr7xUr3B18g@mail.gmail.com>
References: <1438089822.11208.9.camel@linuxfoundation.org>
	<CAP9ODKpsscuNtP+S=zX6uM9sTiFRO8FyN3c9y-Fqr7xUr3B18g@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] toolchain-scripts: Extend to cover nativesdk compiler tools (e.g. nativesdk-gcc)
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
X-List-Received-Date: Tue, 28 Jul 2015 13:53:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-07-28 at 10:28 -0300, Otavio Salvador wrote:
> On Tue, Jul 28, 2015 at 10:23 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > This is needed when we add nativesdk-gcc/binutil to an SDK. Being
> > present doesn't hurt in other cases.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> Maybe it could use the environment-setup subscript to extend this?

Not sure its worth the complexity of that to be honest...

Cheers,

Richard



