Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D0B8678253
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 15:28:59 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7MFSwOw006006
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 22 Aug 2017 16:28:59 +0100
Message-ID: <1503415737.32591.112.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Tue, 22 Aug 2017 16:28:57 +0100
In-Reply-To: <7f1c93bd-0d0d-b4c4-d084-2a75d7362481@windriver.com>
References: <cover.1503283308.git.bruce.ashfield@windriver.com>
	<1503330934.32591.64.camel@linuxfoundation.org>
	<74bfd0a2-59a7-c98b-690d-8749ca7a989a@windriver.com>
	<1503411893.32591.108.camel@linuxfoundation.org>
	<7f1c93bd-0d0d-b4c4-d084-2a75d7362481@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 22 Aug 2017 16:28:59 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/9] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Tue, 22 Aug 2017 15:29:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-08-22 at 10:54 -0400, Bruce Ashfield wrote:
> On 08/22/2017 10:24 AM, Richard Purdie wrote:
> > 
> > Thanks, I think you got that one but the /bin/awk issue remained
> > after
> > your changes. Its easy to reproduce with "bitbake core-image-sato-
> > sdk",
> > or IMAGE_INSTALL_append = " kernel-devsrc". I ended up with this
> > change
> > to fix it:
> Yah, I noticed all of those references as well. Saul had dealt with
> the one that hit us before, but I wasn't able to trigger any installs
> of the other parts in the images I built .. so they were being left
> be for now, just to keep our footprint low.
> 
> > 
> > 
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=
> > a28acfa6c5890df4f5cb09962ef0c53837ac3b37
> > 
> > which I appreciate you won't like but it illustrates the problem.
> > Any
> > preference on what to do with that patch?
> I can merge it directly into linux-yocto, since that is what we did
> with Saul's change before, and at the same time, we can submit it
> upstream and drop it next release.

Ok, Should I merge my patch for now and you and then deal with it in
due course or do you want to do that directly?

I can take care of the mips issue but we have one final problem:

"oe-selftest -r runqemu.RunqemuTests.test_boot_machine_iso"

is failing, it works with 4.10, fails with 4.12. Did some key config
option for booting isos go missing?

Cheers,

Richard

