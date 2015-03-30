Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 20751736B6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 20:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2UKP9cD031069; Mon, 30 Mar 2015 21:25:09 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZWS4Qn-h6Jqt; Mon, 30 Mar 2015 21:25:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2UKOvjr031054
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 30 Mar 2015 21:25:08 +0100
Message-ID: <1427747097.14020.323.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas Oberritter <obi@opendreambox.org>
Date: Mon, 30 Mar 2015 21:24:57 +0100
In-Reply-To: <551990D2.10904@opendreambox.org>
References: <1427532627.14020.217.camel@linuxfoundation.org>
	<CAP9ODKoPyP-Ynsg4KeL9wCNf+f04xWQJR=FUVt3o0QWjPKNbcg@mail.gmail.com>
	<1427727523.14020.306.camel@linuxfoundation.org>
	<CAP9ODKqyu8HrwqoUyaNFKStjdJekpgXpc2A7EBLSqV0JTaVbHw@mail.gmail.com>
	<1427731374.14020.307.camel@linuxfoundation.org>
	<CAP9ODKrPtAMqpsWE2t65tiWhLNhZ52bKSJxWG0qN-ae1ZTHNYA@mail.gmail.com>
	<551990D2.10904@opendreambox.org>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dpkg-native: Avoid 'file changed' errors from tar
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
X-List-Received-Date: Mon, 30 Mar 2015 20:25:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-03-30 at 20:07 +0200, Andreas Oberritter wrote:
> On 30.03.2015 18:21, Otavio Salvador wrote:
> > On Mon, Mar 30, 2015 at 1:02 PM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >> On Mon, 2015-03-30 at 12:02 -0300, Otavio Salvador wrote:
> >>> +When running do_package_write_deb, we have trees of symlinked files
> 
> Richard, did you intend to write "hardlinked" here?

I did, yes. I'll correct that, thanks.

> It's my impression that if Richard had omitted the first sentence of his
> commit message, the message would still have been descriptive enough,
> and nobody would ever have complained.

That is the impression I got too. Its odd that a comment intended to
help the user find more information should generate this discussion,
particularly as the details in the patch header are more implementation
oriented and make sense when you're looking at the dpkg code (which you
can in the patch).

So I may simply remove the comment that is causing contention.

Cheers,

Richard






