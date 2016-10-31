Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 8D89771A55
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 06:31:24 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20161031063054266_0684;
	Mon, 31 Oct 2016 06:30:54 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.118.92.171] (port=55538 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c167I-0008Rn-7C; Mon, 31 Oct 2016 02:30:45 -0400
Date: Mon, 31 Oct 2016 02:29:43 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <F99EA06D-E6DA-4FD4-BBED-D10D157F200C@gmail.com>
Message-ID: <alpine.LFD.2.20.1610310223510.6909@localhost.localdomain>
References: <alpine.LFD.2.20.1610300813220.27025@localhost.localdomain>
	<CABcZANnPcmg+iBWgB7HHbEEaTaDOfwtdXr8vfrG7OPzruRdTTQ@mail.gmail.com>
	<alpine.LFD.2.20.1610301333390.3944@localhost.localdomain>
	<CAJTo0LZcHSgs+Qw1Zkrj4bUWnU-p6Ja-vg3+J8H22vxoscTrRg@mail.gmail.com>
	<F99EA06D-E6DA-4FD4-BBED-D10D157F200C@gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: Christopher Larson <clarson@kergoth.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: should a "*git.bb" recipe lock that recipe to a fixed version?
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
X-List-Received-Date: Mon, 31 Oct 2016 06:31:27 -0000
Content-Type: multipart/mixed; BOUNDARY="8323328-997512901-1477895386=:6909"

--8323328-997512901-1477895386=:6909
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Sun, 30 Oct 2016, Khem Raj wrote:

>       On Oct 30, 2016, at 4:36 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 30 October 2016 at 17:35, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>         fair enough ... i'm embarrassed to admit i didn't really understand
>       the versioning selection so i'm going to examine it way more carefully
>       now. i wonder how many recipes in oe-core are "_git" recipes that, in
>       the end, just lock down to a specific version. as you say, i was a bit
>       surprised.
>
> Personally I've been endorsing the practise where _git.bb is only
> used for recipes that are actually tracking git development
> branches, and if it's just a release that it simply fetched over git
> via a SHA of a release tag then the recipe should be _1.2.3.bb for
> clarity.
>
> with a system integrators hat on I agree. With developer hat on I do not.

khem:

  could you expand on that? now that i understand how the versioning
works, i'll be more careful in the future, but it's still misleading
for a "_git"-named recipe file to be locked to a particular version.

  AFAICT, there are plenty of OE recipes that download via git, but
are still named as being version locked. eg, here's
meta/recipes-devtools/file/file_5.28.bb:

  SRC_URI = "git://github.com/file/file.git \
        file://debian-742262.patch \
        file://0001-Add-P-prompt-into-Usage-info.patch \
        "

  SRCREV = "3c521817322a6bf5160cfeb09b9145ccde587b2a"

i'm assuming that that particular SRCREV corresponds to release
version 5,28, so that makes perfect sense.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-997512901-1477895386=:6909--
