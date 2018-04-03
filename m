Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id E23CD748FD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 12:52:10 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 118812E8936;
	Tue,  3 Apr 2018 07:52:10 -0500 (CDT)
Date: Tue, 3 Apr 2018 07:52:09 -0500
From: Seebs <seebs@seebs.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20180403075209.26c9c487@seebsdell>
In-Reply-To: <1522749088-1400-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1522749088-1400-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pseudo: Upgrade to latest master
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
X-List-Received-Date: Tue, 03 Apr 2018 12:52:11 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  3 Apr 2018 10:51:28 +0100
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> This change includes several bug fixes and improvements, including
> better path handling (the existance of . and .. for files), handling
> of the sticky bit, and syscall renameat2 handling and interception
> through syscall() which was breaking coreutils mv operations on
> fedora27.
> 
> [YOCTO #12594]
> [YOCTO #12379]
> [YOCTO #11643]

Ack. This looks reasonable to me. The only change since then is I
finally went back and changed the default copyright notice for new
auto-generated guts files. :P

Just to be clear, this does *not* handle/support renameat2; it rejects
it with ENOSYS. Actually handling renameat2 correctly requires a change
to the pseudo IPC protocol, because it needs a way to express an atomic
exchange, which requires having two dev/inode pairs in the message.

-s

