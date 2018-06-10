Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E5EA0771BA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jun 2018 19:28:44 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5AJSfNi002537
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 10 Jun 2018 20:28:43 +0100
Message-ID: <4e955e55fee0f60333e6ed7bf8f87433c2d99c17.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ming Liu <liu.ming50@gmail.com>, OE-core
	<openembedded-core@lists.openembedded.org>
Date: Sun, 10 Jun 2018 20:28:39 +0100
In-Reply-To: <CALatG=4e_7nvpG6spimG5a=5e8iX8J4JTB73uJ9zFQOPosL0Eg@mail.gmail.com>
References: <1528557877-22037-1-git-send-email-liu.ming50@gmail.com>
	<CALatG=4e_7nvpG6spimG5a=5e8iX8J4JTB73uJ9zFQOPosL0Eg@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] bitbake.conf: add BB_CURRENT_MC to OVERRIDES
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
X-List-Received-Date: Sun, 10 Jun 2018 19:28:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2018-06-10 at 20:45 +0200, Ming Liu wrote:
> I saw your comment as follows:
> 
> > This adds "" in OVERRIDES in the default case. Whilst I think (but
> am not 100% sure) we fixed bitbake not to break on such a value, I'm
> not convinced adding empty elements to it is a good idea and this did
> used to break things.
> 
> No, it will add "default" to OVERRIDES in the default case.

That is even worse, we do not want to add "default" to overrides since
any variable containing that word would then be at risk of weird
breakage.

Cheers,

Richard

