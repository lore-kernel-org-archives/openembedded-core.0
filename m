Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <1e1bc174431d443b20d0c81f71b46cc62d447948.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] convert-variables: Script for Inclusive Language variable renames
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Fri, 18 Feb 2022 14:51:09 +0000
In-Reply-To: <lyv8xc8d2o.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <20220217003248.581903-1-saul.wold@windriver.com>
	 <ly35kg9tsz.fsf@ensc-virt.intern.sigma-chemnitz.de>
	 <caf357e342ad33e0117af76244ba13fcd804f4fc.camel@linuxfoundation.org>
	 <lyv8xc8d2o.fsf@ensc-virt.intern.sigma-chemnitz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Saul Wold <Saul.Wold@windriver.com>, openembedded-core@lists.openembedded.org

On Fri, 2022-02-18 at 15:27 +0100, Enrico Scholz wrote:
> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
> 
> > > > This script searches for a list of variable that have been renamed
> > > > and converts them to their more descriptive names.
> 
> s/descriptive/politically correct/

We did try and make some of the names better describe what the variables do and
make the variables more consistent.

For example, a reference to HASHBASE was changed to BASEHASH which better
matches every other reference to that thing in the code.

The BB_ENV variables were also traditionally very confusing. Once you know, you
know but for new users they weren't great.

Also see the discussion about the license variable issues. I'm very consciously
blocking the "simple" change as I want to see things improve.

> Variable names were perfectly readable.  A change should make things
> better, not worse.

See above, there are at least some changes which do. I'm sad you don't agree.

> > Unfortunately there likely isn't a perfect rename and these were the
> > best we were able to come up with.
> 
> Why is the rename done at all?  It makes the product just worse due to a
> less usable api and because it causes a lot of work for the users of the
> api (I shudder when I think about updating my CI to work with new and
> old branches).

For better or worse some of the terminology we have is offensive to some people.
Obviously (and sadly) there will probably always be some element of something
which someone could be offended by but these issues have come under a particular
spotlight. People with far more experience of this than us have produced
guidelines on the key issues, the priority of dealing with certain language and
so on.

We do have people wanting to try and improve things. Projects do need to be open
to and able to change. If we don't try and take this input and help those people
make such changes where appropriate, we'll just alienate and frustrate more
users even if those users were not personally offended by the language, a kind
of "rot" can set in to our community. I do not want to see that.

I have advised caution all the way through this. Should the project get this
wrong, the potential for negative social media feedback against the project is
huge. For me personally, there is also a huge risk should I "misstep" in
handling this. The potential to break things for users is also really high, I
realise that. I have done a lot of work to try and make sure issues are at least
clearly reported to users with some idea of how to resolve them so the
transition is less painful. I do have some experience of making changes to the
project and am trying my best to use that to our benefit.

At this stage, rightly or wrongly (I make no judgement) the project cannot
afford not to make these changes. The best thing we can do is to try and reduce
the impact on users as best we can.

In doing so, we also make the project's values very clear. We do not mean any
offence by the language we've had, we just didn't realise the issues. Now we are
aware, we're doing our best to correct it.

Cheers,

Richard

