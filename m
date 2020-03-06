Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 068326101C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2020 22:31:12 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id s5so240482wrg.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Mar 2020 14:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=z8+/b9ZmSOF3OVfSQFPYjuszWLGvN7TF2uV2UIZqZL8=;
	b=eKQE+prBbNWGhaaUaDnqwpFjixJPzL8ymrHMRwvc/A6kQflgMF0nx+2pfwFDowkNE0
	ZZ369ByhdarIjO9Iz5E9KglAJ4X+cyRfCEI7mliEmAgsgHNu20yDrIRL/fU5ecyOM3B2
	bxelji/ow1bPaDxJZFvSUhERTwXvQiRcWzonk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=z8+/b9ZmSOF3OVfSQFPYjuszWLGvN7TF2uV2UIZqZL8=;
	b=DxEsqod7B9PGqU0NQJjNDDlFfW8TSe0jCcZ7GXu7/GoWngfsYsJHD8eSIdn52cy4WE
	/5+BqosloMn7e35SfJiXn1bGedqNRgZv9CbhUma30kcbfBhebHWvzwmwZb4Eu8K3DZAa
	lrSt1j/ITbYkbP8FfJld8SBqv+vq9t2d7MYsN3d3YBtgeldqqnXZ8VpwxLM+6X0UbloI
	6T3rqnQqkgEmKOwFSPaIVUNq+2JVYQUnDMTaxbsFWaFjjIPyD15Y5StBNJNgCspoFQlN
	aInzro3UtUS9y/6+QKwiUmabEy+dOFepzRG4kxmalfDG/ZbkzuIohdC+HDOKerBFUyr8
	i57A==
X-Gm-Message-State: ANhLgQ2teT8eyetuFm9D0DV2RlCoK1lSRZdIc1dQOQ2/zm5YLfKFgVnu
	Lq8lebCuv1AIoAe6Vkvc+V/cCD5lGvE=
X-Google-Smtp-Source: ADFU+vvm8dXt5/6R2+R6VdnLkYIIugikWgOfNQ6JN4GoHvR4eF5XpFy49aGJvIVXaRKyZ+j7mHjzTw==
X-Received: by 2002:a5d:6a04:: with SMTP id m4mr5895205wru.127.1583533873394; 
	Fri, 06 Mar 2020 14:31:13 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a5sm15805375wmb.37.2020.03.06.14.31.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Mar 2020 14:31:12 -0800 (PST)
Message-ID: <b0b698793024c38039a2e1b71adad84518077d72.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Jeremy A. Puhlman" <jpuhlman@mvista.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 06 Mar 2020 22:31:11 +0000
In-Reply-To: <f7e28eac-848e-1eb7-2ae7-345d737482d2@mvista.com>
References: <62ba6d2a-098e-acbd-db0e-b2283a3b476a@mvista.com>
	<446c96a2d520e581eee85d519233fdb961c9d1c2.camel@linuxfoundation.org>
	<f7e28eac-848e-1eb7-2ae7-345d737482d2@mvista.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Subject: Re: Multilib conflicts in man pages.
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
X-List-Received-Date: Fri, 06 Mar 2020 22:31:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-03-06 at 14:14 -0800, Jeremy A. Puhlman wrote:
> 
> On 3/6/2020 2:00 PM, Richard Purdie wrote:
> > On Tue, 2020-03-03 at 15:22 -0800, Jeremy Puhlman wrote:
> > > Is there a preferred method in oe-core for dealing with man pages
> > > that conflict due to differences in multilib pathing.
> > > 
> > > For example an application lives in /usr/lib/foo/bar for one abi
> > > but
> > > /usr/lib64/foo/bar in another, and
> > > that kind of information is encoded in to the man pages.
> > > 
> > > Some things i have seen done in the past, is move the man pages
> > > under
> > > /user/share/man/${PN} or
> > > use something like mutlilib script to deal with it.
> > > 
> > > I am just curious if there is a canned, preferred way the project
> > > handles those or wants to handle them?
> > > 
> > > xinit, xserver-org, and groff each exhibit  these issues.
> > Could we just put a placeholder into the man page so they'd be
> > identical? Multiple copies seems like overkill for something as
> > trivial...
> 
> A placeholder like:
> /usr/<system libdir>/sys.startxrc
> from
> /usr/lib64/sys.startxrc

Yes, not sure about the exact form. You could just do:

/usr/lib*/sys.startxrc
or
/usr/<libdir>/sys.startxrc

?

Cheers,

Richard



