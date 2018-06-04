Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4703071E4C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 18:42:00 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id d73-v6so179932iog.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2018 11:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=dvYoTDZnVCIo73VtYPSIIdpDlLgz7scmvko+Y1+d03c=;
	b=REoHOBGUXAJOJJcZKbtBwl4RGY3ofO4WYxOhWEFQmuBaQfi7jpwqsg5elFrNlE9O6N
	qUDJgH8DUdO0Onlvm5saGEHmMK1mR7STWlcAle1yOyERHbV30a76T9CBgKlB869jhbOB
	0fcp4Y12qmOWlCGF/yo3gV1tnnsJtmPSUj+gOZOPIybohIoyMV0leLZiZhfxKGw3EOcG
	p9LkWnFUJ2UODfL5FBh4QU31AuBbalYMWXJ3gHtrIpGbchIVFECwIsdA7Gqe4UUIhEum
	CwdaAzMn8NmA45hfnobHamtaj7CY+XXTHKFuwcm2++43BmFriJZmD1v+wQykQWrJRgMV
	lqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dvYoTDZnVCIo73VtYPSIIdpDlLgz7scmvko+Y1+d03c=;
	b=ccA0NWfBUsRm8CGHwxUKTXbrJPjn9NSoRGk3rt44lZzPQt9E9LLXN9muKP9PUuzbhv
	JsYHnPzYeQL2lwfb/mKxKuioHQi9XiG4GdorJUOrfHsT/Lk+RtL9dZf0uKeQspqwEMhY
	ZHGwxtZoMNZoUHOzoHfq2p8QGoUyLFMT3WPaIrlmxZwok403XSdHR7V4t2cyGPJa02i7
	QgXPWCRWDfazecbCQs/3ZRU8z5a3TP95AoVGsK2XL3SwUh5y8bMjqu7QnVPSduiXtw/C
	BFfqHgh4ZlULf6njny8me2MKUgcYwjxsgSzmsYMjjLWnFm/DmbOGDRjDAXLkxsZXCvny
	UhBg==
X-Gm-Message-State: APt69E0S78KfgssHs/uIHZK/wemv7fkfTq7oIPaZ6WtXln56ZM3vPvw8
	Bih8eLjOt+x5eA/dd6/w5jo=
X-Google-Smtp-Source: ADUXVKL1uKqUYEiC4m/OCKFOKy6s/CHJUzRwMTmuCuxnKCxcCXyxF6UEbf1UWn+7OAkYAI28urXAHA==
X-Received: by 2002:a6b:a510:: with SMTP id
	o16-v6mr12689362ioe.271.1528137720986; 
	Mon, 04 Jun 2018 11:42:00 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	w13-v6sm4766677iom.63.2018.06.04.11.42.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Jun 2018 11:42:00 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <c1afb473c30f4e3a0f53f3bd746df9d064241a14.camel@gmail.com>
To: Martin Kelly <mkelly@xevo.com>, openembedded-core@lists.openembedded.org
Date: Mon, 04 Jun 2018 13:42:00 -0500
In-Reply-To: <d97bdd25-24ee-e7f9-0d11-a99489979e46@xevo.com>
References: <20180601210240.14969-1-mkelly@xevo.com>
	<20180601210240.14969-6-mkelly@xevo.com>
	<1fa5f19ad4ac398de0dc6da40c46ead935133dbe.camel@gmail.com>
	<5c2bc7c4-6a79-2775-af6a-30fb6d693296@xevo.com>
	<79a9b2f1db65d8cc4233f93b7b5213d025a6d262.camel@gmail.com>
	<0994b61a-1465-e227-81ff-6ef60e055656@xevo.com>
	<e2132fe30522a6ec140f036a244a71d51c476b51.camel@gmail.com>
	<d97bdd25-24ee-e7f9-0d11-a99489979e46@xevo.com>
X-Mailer: Evolution 3.28.2 (3.28.2-1.fc28) 
Mime-Version: 1.0
Subject: Re: [PATCH v2 5/7] toolchain-shar-extract: pass env to post-relocate
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
X-List-Received-Date: Mon, 04 Jun 2018 18:42:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-06-04 at 11:24 -0700, Martin Kelly wrote:
> On 06/04/2018 11:20 AM, Joshua Watt wrote:
> > On Mon, 2018-06-04 at 11:10 -0700, Martin Kelly wrote:
> > > On 06/04/2018 10:20 AM, Joshua Watt wrote:
> > > > On Fri, 2018-06-01 at 15:24 -0700, Martin Kelly wrote:
> > > > > On 06/01/2018 03:08 PM, Joshua Watt wrote:
> > > > > > On Fri, 2018-06-01 at 14:02 -0700, Martin Kelly wrote:
> > > > > > > It's useful for the post-relocate scripts to be able to
> > > > > > > see
> > > > > > > the
> > > > > > > SDK
> > > > > > > environment, for example to see the values of CC, CXX
> > > > > > > etc. in
> > > > > > > order
> > > > > > > to
> > > > > > > dynamically generate toolchain files.
> > > > > > > 
> > > > > > > To enable this, source the SDK environment script prior
> > > > > > > to
> > > > > > > calling
> > > > > > > the
> > > > > > > relocate scripts.
> > > > > > > 
> > > > > > > Signed-off-by: Martin Kelly <mkelly@xevo.com>
> > > > > > > ---
> > > > > > >     meta/classes/toolchain-scripts.bbclass     | 17
> > > > > > > +++++++++++++
> > > > > > > ----
> > > > > > >     meta/recipes-core/meta/meta-environment.bb |  5 +++--
> > > > > > >     2 files changed, 16 insertions(+), 6 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/meta/classes/toolchain-scripts.bbclass
> > > > > > > b/meta/classes/toolchain-scripts.bbclass
> > > > > > > index ae7bbef034..5f99fd8c03 100644
> > > > > > > --- a/meta/classes/toolchain-scripts.bbclass
> > > > > > > +++ b/meta/classes/toolchain-scripts.bbclass
> > > > > > > @@ -118,11 +118,20 @@ EOF
> > > > > > >     }
> > > > > > >     
> > > > > > >     toolchain_create_post_relocate_script() {
> > > > > > > -	script=$1
> > > > > > > -	rm -f $script
> > > > > > > -	touch $script
> > > > > > > +	relocate_script=$1
> > > > > > > +	sdk_script=$2
> > > > > > > +	rm -f $relocate_script
> > > > > > > +	touch $relocate_script
> > > > > > > +
> > > > > > > +    cat >> $relocate_script <<EOF
> > > > > > > +# Source the SDK env script in case it is needed for the
> > > > > > > relocate
> > > > > > > scripts.
> > > > > > > +. $sdk_script
> > > > > > 
> > > > > > I had originally done something similar to this when I
> > > > > > added
> > > > > > support
> > > > > > for the post-relocate scripts with icecream. However, it is
> > > > > > insufficent
> > > > > > because there can be multiple SDK environment scripts that
> > > > > > need
> > > > > > to
> > > > > > be
> > > > > > sourced. In order to get a fully correct environment, I had
> > > > > > to
> > > > > > do:
> > > > > > 
> > > > > >     # Setup environment
> > > > > >     for env_setup_script in `ls $1/environment-setup-*`; do
> > > > > >     	. $env_setup_script
> > > > > >     done
> > > > > > 
> > > > > > see meta/recipes-devtools/icecc-toolchain/icecc-
> > > > > > toolchain/icecc-
> > > > > > setup.sh
> > > > > > 
> > > > > > 
> > > > > 
> > > > > There's one overall "SDK environment" script (the one you
> > > > > source
> > > > > as
> > > > > a
> > > > > user to enter the SDK environment), and also customizable
> > > > > ones
> > > > > installed
> > > > > by nativesdk-* packages (e.g. one that cmake uses). In this
> > > > > patch, I
> > > > > had
> > > > > not intended that post-relocate scripts should be able to see
> > > > > the
> > > > > environment scripts for every project but instead just for
> > > > > the
> > > > > global
> > > > > SDK enivorment (to get at variables like
> > > > > OECORE_NATIVE_SYSROOT).
> > > > 
> > > > (Almost) All of the code I can find that deals with the SDK
> > > > environment
> > > > supports multiple top level environment-setup-* files. If you
> > > > happen to
> > > > have more than one, the relocation script will relocate all of
> > > > them
> > > > (meta/files/toolchain-shar-relocate.sh), and the extraction
> > > > script
> > > > will
> > > > give you instructions to source them all (meta/files/toolchain-
> > > > shar-
> > > > extract.sh).
> > > > 
> > > > It's possible this is some left over anachronism and it has no
> > > > actual
> > > > use, but we should either fix it everywhere else or be
> > > > consistent
> > > > here.
> > > > 
> > > 
> > > OK, that's good to know.
> > > 
> > > > > 
> > > > > Let me know if I have missed something and not including the
> > > > > other
> > > > > environments could cause breakage.
> > > > > 
> > > > > Here's what I mean from an example extracted SDK:
> > > > > 
> > > > > martin@columbia:~$ ls /opt/xos/nanopi-neo-plus2/*environment*
> > > > > /opt/xos/nanopi-neo-plus2/environment-setup-aarch64-poky-
> > > > > linux
> > > > > 
> > > > > martin@columbia:~$ ls
> > > > > /opt/xos/nanopi-neo-plus2/sysroots/x86_64-xevo-
> > > > > linux/environment-
> > > > > setup.d/
> > > > > cmake.sh
> > > > > 
> > > > > In the above example, we are currently sourcing only
> > > > > /opt/xos/nanopi-neo-plus2/environment-setup-aarch64-poky-
> > > > > linux
> > > > > and
> > > > > not
> > > > > cmake.sh.
> > > > 
> > > > Sort of.... environment-setup-aarch64-poky-linux is going to
> > > > implicitly
> > > > source the cmake.sh script (see the for loop at the end of the
> > > > script)
> > > > 
> > > 
> > > Yes, I see that now. Given that the top-level environment-setup
> > > script
> > > implicitly sources the individual project sh scripts, isn't it
> > > correct
> > > to source only the top-level one? In that way, if the path to the
> > > individual sh scripts changes, this code won't break, and it
> > > leaves
> > > the
> > > top-level script to the single source of truth with regard to
> > > environment setup scripts.
> > 
> > Yes I agree. I think there was some miscommunication, I wasn't
> > suggesting that we should be sourcing those manually. I just wanted
> > to
> > handle the top level environment-setup-* scripts in a consistent
> > manner
> > to the rest of the code (i.e. make sure we source all of them).
> > 
> 
> OK, before I move to the next revision, let me make sure I
> understand 
> you correctly:
> 
> - There may be multiple top-level environment setup scripts.
> 
> - The environment setup script that is always created 
> (environment-setup-aarch64-poky-linux in our example) sources all
> the 
> project-specific files.
> 
> - Thus, we should source all top-level environment scripts, but not
> any 
> project-specific ones, as they will be pulled in implicitly.
> 
> Is that correct?

That sounds correct

