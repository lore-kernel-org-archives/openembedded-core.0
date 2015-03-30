Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6715D73C0D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 16:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2UG37gW016933; Mon, 30 Mar 2015 17:03:07 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id T8On5HMvBK9w; Mon, 30 Mar 2015 17:03:07 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2UG2srr016915
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 30 Mar 2015 17:03:05 +0100
Message-ID: <1427731374.14020.307.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Mon, 30 Mar 2015 17:02:54 +0100
In-Reply-To: <CAP9ODKqyu8HrwqoUyaNFKStjdJekpgXpc2A7EBLSqV0JTaVbHw@mail.gmail.com>
References: <1427532627.14020.217.camel@linuxfoundation.org>
	<CAP9ODKoPyP-Ynsg4KeL9wCNf+f04xWQJR=FUVt3o0QWjPKNbcg@mail.gmail.com>
	<1427727523.14020.306.camel@linuxfoundation.org>
	<CAP9ODKqyu8HrwqoUyaNFKStjdJekpgXpc2A7EBLSqV0JTaVbHw@mail.gmail.com>
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
X-List-Received-Date: Mon, 30 Mar 2015 16:03:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-03-30 at 12:02 -0300, Otavio Salvador wrote:
> +When running do_package_write_deb, we have trees of symlinked files
> +such as the dbg source files in ${PN}-dbg. If something makes another
> +copy of one of those files (or deletes one), the number of links a file
> +has changes and tar can notice this, e.g.:
> +
> +| DEBUG: Executing python function do_package_deb
> +| dpkg-deb: building package `sed-ptest' in
> `/media/build1/poky/build/tmp/work/i586-poky-linux/sed/4.2.2-r0/deploy-debs/i586/sed-ptest_4.2.2-r0.3_i386.deb'.
> +| tar: ./usr/lib/sed/ptest/testsuite/tst-regex2: file changed as we read it
> +| dpkg-deb: error: subprocess tar -cf returned error exit status 1
> +
> +Tar returns an error of 1 when files 'change' and other errors codes
> +in other error cases. We tweak dpkg-deb here so that it ignores an exit
> +code of 1 from tar. The files don't really change (and we have locking in
> +place to avoid that kind of issue).
> 
> This is exactly what I would expect for the long commit log. Sorry but
> I strongly disagrese with you as the commit log in the patch does
> connect with the short log so I still believe the commit log could be
> improved.

Well, I strong disagree with that, I don't believe it makes sense to cut
and paste the same information into both places, sorry.

Cheers,

Richard



