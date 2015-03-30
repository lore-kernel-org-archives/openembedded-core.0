Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 033E673C0D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 14:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2UEwuYl013753; Mon, 30 Mar 2015 15:58:56 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6RDo98R9tmWE; Mon, 30 Mar 2015 15:58:56 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2UEwhNJ013750
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 30 Mar 2015 15:58:54 +0100
Message-ID: <1427727523.14020.306.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Mon, 30 Mar 2015 15:58:43 +0100
In-Reply-To: <CAP9ODKoPyP-Ynsg4KeL9wCNf+f04xWQJR=FUVt3o0QWjPKNbcg@mail.gmail.com>
References: <1427532627.14020.217.camel@linuxfoundation.org>
	<CAP9ODKoPyP-Ynsg4KeL9wCNf+f04xWQJR=FUVt3o0QWjPKNbcg@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 30 Mar 2015 14:58:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-03-30 at 10:52 -0300, Otavio Salvador wrote:
> On Sat, Mar 28, 2015 at 5:50 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > See the patch header for details. Hardlink count duing do_package_write_deb
> > can change causing dpkg-deb failures. We don't care about this error
> > case so avoid it by checking the tar exit code.
> >
> > [YOCTO #7529]
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> Please don't ask someone to see the patch header for information. This
> should be in the commit log and not necessarily read the diff to find
> this information.
> 
> Please send a v2 adding this information in the commit log.

Just referring someone to the patch header would be incorrect and I
agree a summary of the problem is needed. The commit message in question
does have this. I don't see the point of cut and pasting all the details
from the header into the commit message. The correct place for the
details in a situation like this is the patch header so that someone has
full details of the patch without having to look at the repo history.

Cheers,

Richard



