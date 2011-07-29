Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1Qmuum-0004Zn-JS
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 23:48:30 +0200
Received: by pzk1 with SMTP id 1so7078636pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2011 14:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ebNsmq/9fmSS1eLa/fN0qu+UceeDXFds+MJ6NqT1u6w=;
	b=U+YQkBe7nhvN5jDg+wtnwdCRL1arYSC6Gd1NAOVXzJJDACwhXfyqQw6WUKXfTLsAxU
	yiynzCtZeKjseLLRzNtqS7BzJolXefvOh8BgSn684KK9MjcsFU0uiv9yLzb7IhT4nuR5
	C8U+n39Zew7rwqpCoaHj0y0dESV38VSSS8le0=
MIME-Version: 1.0
Received: by 10.68.35.201 with SMTP id k9mr3120713pbj.15.1311975677169; Fri,
	29 Jul 2011 14:41:17 -0700 (PDT)
Received: by 10.68.71.137 with HTTP; Fri, 29 Jul 2011 14:41:17 -0700 (PDT)
In-Reply-To: <CAPhnLPB9AggLQ52m=p3Vi6Vod19b+wFsMf000YX4aHc9990xtw@mail.gmail.com>
References: <CAPhnLPBkbaj6MzfnLKfkwKpDO4UwejH+cWa2V=4CCpv55CReaw@mail.gmail.com>
	<1311692251.2344.262.camel@rex>
	<CAPhnLPBO+_t-FXdCd5heU7mwz1aQVi45LKhZ3+cBZehgV42QHg@mail.gmail.com>
	<1311721253.2344.320.camel@rex>
	<CAPhnLPB9AggLQ52m=p3Vi6Vod19b+wFsMf000YX4aHc9990xtw@mail.gmail.com>
Date: Fri, 29 Jul 2011 17:41:17 -0400
Message-ID: <CAOd_LFzkiKNAM=6nnfmE-X4F-CDOZm5_UPFt4aEei6pt4W94CQ@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] license.bbclass: Splitting out licenses
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Jul 2011 21:48:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 27, 2011 at 2:04 PM, Flanagan, Elizabeth
<elizabeth.flanagan@intel.com> wrote:

> I would still pull it. It does give us a basis to work on and splits
> things out a bit.
> When I get back from the conference this week, I'll fix it so that
> it's a more reliable
> in returning results. My guess is that I'll have to rip this all out
> from being event driven
> and do it, as you suggest, a postprocess right after do_rootfs

Khem took a pass at this (using the approach Richard suggested), so
you might want to consider building on what he did.  The testlab stuff
in OE is incredibly useful, and might be considered for OE core.

Thanks,
Cliff

http://patches.openembedded.org/patch/7587/
http://patches.openembedded.org/patch/7589/

to oe-core (these patches have been applied)

and

http://patches.openembedded.org/patch/7591/ (still being discussed)

to meta-openembedded

Then INHERIT += "testlab" in local.conf if you are using angstrom them
testlab is already inherited

bitbake console-image

and you should see a new file called installed-package-licenses.txt in
testlab directory along with other testlab results.



-- 
=================
http://bec-systems.com


