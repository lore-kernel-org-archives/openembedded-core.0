Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C4D79600EA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 00:12:12 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w1K0CBZs004740
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 20 Feb 2018 00:12:12 GMT
Message-ID: <1519085531.24236.271.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 20 Feb 2018 00:12:11 +0000
In-Reply-To: <CADkTA4MjxCe1gY2zf6iro3DdQYs6_HZ9kH9SymcvhBJ8FJm1WA@mail.gmail.com>
References: <1519054841-4986-1-git-send-email-bruce.ashfield@windriver.com>
	<a2083091-1169-4ab3-1aba-55a1fc4cf2c0@gmail.com>
	<1519058248.24236.259.camel@linuxfoundation.org>
	<CADkTA4MjxCe1gY2zf6iro3DdQYs6_HZ9kH9SymcvhBJ8FJm1WA@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2][rocko] linux-yocto/4.12: update to v4.12.20
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
X-List-Received-Date: Tue, 20 Feb 2018 00:12:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-02-19 at 11:45 -0500, Bruce Ashfield wrote:
> On Mon, Feb 19, 2018 at 11:37 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Mon, 2018-02-19 at 08:16 -0800, akuster808 wrote:
> > > 
> > > Bruce,
> > > 
> > > thanks. I hand applied this as I have another kernel change
> > > sitting
> > > in
> > > stable/rocko-next
> > > 
> > > I will build this once RP is done with master
> > You correctly pointed out I needed to sort master first! :)
> > 
> > Bruce: Is there an update for 4.9 in rocko? If so we should perhaps
> > pull that in too before we rebuild 2.4.2?
> I haven't done a patch for 4.9 in rocko, but can. Give me a few
> minutes and
> will send one out.

Thanks. Master is sorted apart from the scripts sigs issue which should
be simple to fix.

Rocko is looking a bit tricky, the qemuarm64 kernel is failing to boot:

https://autobuilder.yocto.io/builders/nightly-arm64/builds/755/steps/Running%20Sanity%20Tests/logs/stdio

so 4.12 qemuarm64 looks like it may be bust. Armin ran it twice and it
happened twice on different builders.

Cheers,

Richard

