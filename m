Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <310168015e9bff0673a78606c08c8646511ad1fe.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/4] license/insane: Show warning for obsolete license usage
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Wed, 02 Mar 2022 15:19:45 +0000
In-Reply-To: <fd6a428f453c4675ae5fa17bb71615b7@axis.com>
References: <20220301234214.247172-1-richard.purdie@linuxfoundation.org>
	 <20220301234214.247172-3-richard.purdie@linuxfoundation.org>
	 <fd6a428f453c4675ae5fa17bb71615b7@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>

On Wed, 2022-03-02 at 15:17 +0000, Peter Kjellerstedt wrote:
> > +    main_lic = d.getVar('LICENSE')
> > +
> > +    # Check for obsolete license references in main LICENSE (packages are checked below for any changes)
> > +    main_licenses = oe.license.list_licenses(d.getVar('LICENSE'))
> 
> The documentation for oe.license.list_licenses() says that it returns 
> a list, but I assume that is not true or the code below would not work...
> 
> > +    obsolete = set(oe.license.obsolete_license_list()) & main_licenses
> > +    if obsolete:
> > +        oe.qa.handle_error("obsolete-license", "Recipe LICENSE includes obsolete licenses %s" % ' '.join(obsolete), d)
> > +
> >      bb.build.exec_func("read_subpackage_metadata", d)
> > 
> >      # Check non UTF-8 characters on recipe's metadata

It does return a set, not a list.

Cheers,

Richard


