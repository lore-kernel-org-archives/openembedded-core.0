Return-Path: <paul.betafive@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8113160557
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 19:49:25 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id i50so3647128qgf.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 12:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=+mouzs04pmEwqmZ55u57J9OBDE5eaLrWExaadp501fo=;
	b=jpuFvizcq9SGN1qK/gebCSTeRLkkZpgLg5SipoeyPW3QgHA/mX06A6psFFQCkDEiDB
	ursBotAbt37EFxoK4cW8TR3hzJGLORv6FGekPanTpas2qJclTofO9cNbgFUr1JGj4Wyg
	fKw9TIbrdDXgQlbAb17TsE6QQE2DC37sJPN1s8hXZHAmBye6c1BPLAhkEA7mJzJK4aiC
	qV4/ug/hd8j0uLcMLIXfZJmISXAAWJ08gyozW0CXqXi9MGSwx4jhXNFh9/qCFhptbyKZ
	I/BWs6pEey77+UKsUK0rn/pBje/wJpAWDrEuY75nrUApKKC70HwjO29P2TxgpN23+vgn
	IKzQ==
X-Received: by 10.229.106.68 with SMTP id w4mr29786834qco.18.1414698565699;
	Thu, 30 Oct 2014 12:49:25 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.142.78 with HTTP; Thu, 30 Oct 2014 12:48:42 -0700 (PDT)
In-Reply-To: <CALXw4G7x6Xbf3Wr=mKUCk6G5e4k=8sz_pph9VUMegLn1txA9WQ@mail.gmail.com>
References: <CALXw4G7x6Xbf3Wr=mKUCk6G5e4k=8sz_pph9VUMegLn1txA9WQ@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Thu, 30 Oct 2014 19:48:42 +0000
X-Google-Sender-Auth: PzQu_h8g7O-HZbqIQy7mqA32Nd4
Message-ID: <CANyK_8cv3go0ghbLD73WwEdEyPiB5bLzaN_w8Wa4KxDQo92quQ@mail.gmail.com>
To: Michael Gloff <mgloff@emacinc.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: Opkg 0.2.3
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
X-List-Received-Date: Thu, 30 Oct 2014 19:49:32 -0000
Content-Type: text/plain; charset=UTF-8

On 30 October 2014 19:15, Michael Gloff <mgloff@emacinc.com> wrote:
> As Paul mentioned yesterday opkg 0.2.4 is on it's way and 0.2.3 has been
> available for 2 months. If there are not any objections, I have an updated
> recipe and re-created previous patches that I could send. This should also
> modify opkg-colateral to use the new syntax for lists_dir.

I'm also sat on tested patches, I was planning to send them tomorrow.
I've held the patches back as the deadline for such changes for OE 1.7
had passed.

> I would also at this time like to propose changing the default list
> directory from /var/lib to something else (/usr/lib ?). On a read only
> rootfs, everything in /var/lib/ gets mounted on the tmpfs, therefore
> packages installed get lost.

Changes in v0.3.0 will make this much easier to configure. You'll be
able to set cache_dir, lists_dir, info_dir, lock_file and status_file
in opkg.conf. I'd rather we left the defaults as-is and use those
settings once v0.3.0 is released. v0.3.0 will also create any
directories needed if they don't exist. So it may make sense to set
cache_dir to something under /tmp, lock_file to something under /var
or /run and everything else under /usr if that's what's desired.

> I've tested changing the lists_dir and everything is working as expected.
>
> Michael Gloff
>

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

