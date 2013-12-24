Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 3DDDB6A56F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Dec 2013 01:09:31 +0000 (UTC)
Received: (qmail 246 invoked by uid 1003); 24 Dec 2013 01:09:31 -0000
Received: from unknown (HELO ?192.168.1.113?)
	(philip@opensdr.com@108.44.82.190)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	24 Dec 2013 01:09:31 -0000
Message-ID: <52B8DECA.6060704@balister.org>
Date: Mon, 23 Dec 2013 20:09:30 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <CAJTo0LZsBfxGm=OJPa++egDjL6L0ZABMebTtTr_Bmw_TdQrohg@mail.gmail.com>
In-Reply-To: <CAJTo0LZsBfxGm=OJPa++egDjL6L0ZABMebTtTr_Bmw_TdQrohg@mail.gmail.com>
X-Enigmail-Version: 1.6
Cc: Poky Project <poky@yoctoproject.org>,
	OE-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Piglit in Poky
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
X-List-Received-Date: Tue, 24 Dec 2013 01:09:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12/23/2013 01:01 PM, Burton, Ross wrote:
> Hi,
> 
> We'd like to integrate Piglit (an OpenGL test suite) into Poky so that
> we can run automated QA on the GL stack.  Piglit is currently residing
> in meta-oe, but as Poky is a self-contained project we can't just add
> meta-oe to it:  apart from the size of meta-oe, we can't ensure
> stability if meta-oe makes incompatible changes that affect Poky.
> 
> Piglit isn't a stand-alone package, there are the dependencies of
> waffle, python-mako and python-numpy to consider too.  There are two
> possibilities I can see:
> 
> 1) Move piglit and deps to oe-core.  Piglit is for QA purposes only
> and pushes the boundaries of "core platform".  In a sense this is a
> repeat of the discussion we had with Midori...  does oe-core contain
> everything needed to sufficiently exercise the core components it
> ships or not?

I expect Richard will push back on this, and I would support him here.

> 
> 2) Add piglit and deps to meta-yocto.  Probably a new layer called
> meta-yocto-qa (or similar) because the Yocto Compatible guidelines
> forbid mixing distribution policy and recipes.  We'd need to sync
> meta-yocto-qa with the pieces of meta-oe that we want somehow, but
> that's our problem.

So meta-yocto is right out. I'm a user of numpy, and I certainly do not
want to include something called meta-yocto-qa just to pick up numpy.

So this presents a quandry. Moving numpy to a special layer to support a
specific recipe is just not the right thing to do. Conceivably, we could
create a layer for the bits of meta-oe that are python related, but I am
not sure that solves your entire problem.

I certainly do not want to see one recipe appear in two layers. That is
a recipe for trouble.

Long term, we need to make the layer model work for the entire project
and get over the reluctance to use other peoples layers.

Philip

> 
> Thoughts and opinions welcome over Christmas, otherwise I'll toss a coin. :)
> 
> Ross
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

