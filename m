Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2D10E60068
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2018 11:38:42 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w3IBcf0X018711
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 18 Apr 2018 12:38:42 +0100
Message-ID: <1524051521.18865.55.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 18 Apr 2018 12:38:41 +0100
In-Reply-To: <37a8252f-acb0-d506-e1ea-821f119ecd8c@gmail.com>
References: <1523983449-32655-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CAJ86T=XhMh1+C52TxLR6oPpzyTHe+gt=-VzFZf9A9c-Tt8ST9g@mail.gmail.com>
	<37a8252f-acb0-d506-e1ea-821f119ecd8c@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uninative: Add allow-shlib-undefined to BUILD_LDFLAGS and drop other workarounds
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
X-List-Received-Date: Wed, 18 Apr 2018 11:38:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-04-18 at 00:49 -0700, Khem Raj wrote:
> 
> On 4/17/18 12:15 PM, Andre McCurdy wrote:
> > 
> > On Tue, Apr 17, 2018 at 9:44 AM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > Maybe not an option now, but in theory wouldn't a set of native
> > tools
> > statically linked with musl and downloadable from a public sstate
> > server solve all these kinds of issues?
>
> I think this is an interesting idea, you should open a bugzilla entry
> for it so it can be followed up.

Its a nice idea and I can see the attraction but I can't see how you'd
make it work in practise.

> I am of the opinion that we should explore containers and abstract
> all this distro variability once for all.

I'd like to see this one explored. The trouble is the root privs
problem for containers, I don't know if that is still an issue?

The other thing I think we should explore urgently is an sstate
artefact equivalence mapping server.

That might get us huge amounts of sstate reuse, particularly given our
reproducibility improvements and mean that the bootstrap times become
less of a factor.

That along with a public central sstate mirror for the core of the
system might make a really interesting step forward for the project.

If I had to spend time on anything, I think this would be the next big
win for the project.

Cheers,

Richard






