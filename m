Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>)
	id 1TQM5f-0004qh-I8; Mon, 22 Oct 2012 19:47:03 +0200
Received: by mail-pa0-f47.google.com with SMTP id fa11so1826956pad.6
	for <multiple recipients>; Mon, 22 Oct 2012 10:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=QDHm4rKOciN+x6yv7HTPEv43AzUbg+ISJ6B7SH9IkUs=;
	b=0s5Tn3srWHMtB0DqvurBQe6t1r7daKYmN2KKn+jjeNb37vwuT9Pb91N8AmOoN2hCBE
	qEOQju7dyTi7NXHP4DF/JiQ1VIjYEB8beBNpTo8yMKiSlTUAaj/w1kvothsdIoXaVQPl
	hQjvsHv3uNdAN5E9sz/axU4YPY1oVMDd1T8yxULJRj1roWtu/i0C5V07adx+P+sD36Mo
	HV+Bfs1MAar573miNXHNFQHvpF5lg+tf2fHrnZpv7IN5JUta+KDYutkIsCzk8J6Qy2d/
	dJbxTtEU3snmZ4iGFnDyKGN8m64DvqI/YhzCuc11g3MJSnz2e7QMMjH7kTnmNK5BNe+m
	QA7w==
MIME-Version: 1.0
Received: by 10.68.228.130 with SMTP id si2mr12853652pbc.126.1350927217713;
	Mon, 22 Oct 2012 10:33:37 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Mon, 22 Oct 2012 10:33:37 -0700 (PDT)
In-Reply-To: <CAJTo0LboPRF7Oxnwh8QS6b6ReS-1-P+=r04L54QRptPnHfV5oQ@mail.gmail.com>
References: <CAJTo0LboPRF7Oxnwh8QS6b6ReS-1-P+=r04L54QRptPnHfV5oQ@mail.gmail.com>
Date: Mon, 22 Oct 2012 15:33:37 -0200
X-Google-Sender-Auth: JdGFKrMYqcmSKp67dhmjTY4y6eA
Message-ID: <CAP9ODKrMoEJMXWNa0rx0KyQjx3hJhFzPOJCH+eDYqiDm3saMxg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] OpenGL packaging/staging policy
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Oct 2012 17:47:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Oct 22, 2012 at 2:35 PM, Burton, Ross <ross.burton@intel.com> wrote:
...
> Rule 1.  Unambiguous package naming
>
> Debian-style renaming and multiple providers of the same API doesn't
> work as you'll end up with multiple packages in the same feed called
> libgl1, so all GL packages should be named in the style of libgl-foo,
> where foo is the source of the package.  I've got a branch where this
> is implemented for Mesa as a proof of concept[1], and the Python
> fragment could easily be moved into a class and re-used easily.

It would be nice to also have a common SoC arch so the binaries are
clear not allarch but not rebuild for every board.

For example in iMX53 and iMX51 case they share same GL package set and
we could have a armv7-imx5 or so common to all them so we'd not
rebuild it for every board.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


