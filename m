Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 775A17503E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 09:27:32 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7F9RTWp006706
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 15 Aug 2018 10:27:31 +0100
Message-ID: <3e94bc10f20abef1db6b1d89d8d2359f20c920d0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
	openembedded-core@lists.openembedded.org
Date: Wed, 15 Aug 2018 10:27:29 +0100
In-Reply-To: <518a17b5-60af-42dc-4b3b-b0dc76589fb1@prevas.dk>
References: <20180711143019.30896-1-rasmus.villemoes@prevas.dk>
	<518a17b5-60af-42dc-4b3b-b0dc76589fb1@prevas.dk>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [pseudo] [RFC 1/2] pseudo_ipc.c: Use MSG_NOSIGNAL if available
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
X-List-Received-Date: Wed, 15 Aug 2018 09:27:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-08-15 at 08:59 +0200, Rasmus Villemoes wrote:
> On 2018-07-11 16:30, Rasmus Villemoes wrote:
> > MSG_NOSIGNAL has been in Linux since 2.2, and has been standardized
> > in
> > POSIX 2008. Using that when available avoids the overhead of the
> > two
> > syscalls to set and restore the SIGPIPE handler. Moreover, we can
> > eliminate one write() call by making use of sendmsg() to do
> > scatter-gather I/O.
> 
> Ping. The README in the pseudo repo says to use the openembedded-core
> list for pseudo patches, so I assume this is the right place. I have
> other ideas for improving pseudo's performance on both client and
> server
> side, but there's no point sending patches to /dev/null.

Pseudo maintenance is a little tricky right now and I'd guess Peter is
unavailable. Would you be able to format these as additional patches to
the pseudo recipe? That way we could test and include them in builds
and then Peter will review them when he has time.

Cheers,

Richard

