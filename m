Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id A07C66E614
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 14:49:27 +0000 (UTC)
Received: by lams18 with SMTP id s18so11219533lam.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 06:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=IgHtmcrUk5+YE/bkCiZJc29JSPxsF+78dxn8JzFL0FY=;
	b=G1EGN98FMlCfeAPWqg8Hed5BHcBI5LRnXJbODCZzdCLTyQS9XXVjx12/lhSd5rw4Kg
	UIZojB94mEvyDXjlL1Xh8lU30ffjUaItB0+oOlGQ/MtTVGN1GoLA6TVWbNPPB/ZFEgay
	TVKOFZaYuyzCkMrK1cpzdVQf4sY/K6FxbximXccIAfQJmDiv+GwrqVVNZQWOkWQ7DztI
	Sdlg8UrXZgE7d1XluvxC1e54IOMZdwqnK5fjQPcDt2R1NKf60FBn+8Fh1W0BRu2OYeay
	npxpnMxgR+emCoTR4TNgH9o3R8w2gpSNq5hMUWc8Xs6ZuSdJOKy1sylDmkDi7EqAs+aa
	hDjw==
MIME-Version: 1.0
X-Received: by 10.152.18.133 with SMTP id w5mr2296324lad.51.1424530167417;
	Sat, 21 Feb 2015 06:49:27 -0800 (PST)
Received: by 10.112.40.11 with HTTP; Sat, 21 Feb 2015 06:49:27 -0800 (PST)
In-Reply-To: <alpine.LFD.2.11.1502210237270.4835@localhost>
References: <alpine.LFD.2.11.1502210237270.4835@localhost>
Date: Sat, 21 Feb 2015 09:49:27 -0500
Message-ID: <CADkTA4NntZdNHW=Fk9127RjiqU-zJXhS120q5kiff8AAo2tN5A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: question about kernel .scc and .cfg files
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
X-List-Received-Date: Sat, 21 Feb 2015 14:49:29 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Feb 21, 2015 at 2:43 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   once a SRC_URI refers to an .scc file that further refers to a .cfg
> file, is there any need for the SRC_URI file to *additionally* refer
> explicitly to that same .cfg file? i ask only because i've noticed
> this on occasion and i'm not sure if there's something subtle going on
> that i don't know about.

There's no need. Everything is migrated into the kernel workdir, and the
.scc processing picks up the .cfg. It's that way, since the .scc + .cfgs are
used elsewhere and in that format are fully standalone.

Cheers,

Bruce

>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

