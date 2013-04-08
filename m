Received: from mail-la0-f48.google.com ([209.85.215.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1UPL0l-0008W6-U7
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 00:58:06 +0200
Received: by mail-la0-f48.google.com with SMTP id fq13so5822532lab.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2013 15:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=Rf1HmhhxQfloqlGt0RCQcSbpFY1jc8j5u+IhcMoHTWU=;
	b=btjWuN0QaE60RiB9wAsWX0VfTzEOkpZEIxUJICs8fsiiFyYt/o6oSr/CG3W4Ons5K7
	QrdMjYZCbmR+nSB/Fi4zk+z6jIrOu/z0w7dXef1OVEXXAltS7eaEYqKq6eKttmpJOnyU
	VsCrghYVZmFyKCgBidYMc5vOKb+UFN38v88IF7RN5fhiJovdbfOcL8IfdmwhKsKMnKe9
	3B7yhCkJ+sb/OPXfvM+fZMCpL5ugSMP0VGj3v846bfhUpVeq2iQkb43A3JffyuMbtg3L
	A8Zn1ADfO5KgOTTKpRrr1DoXoSQM/Qep/eklPFuWFcCpNcMrGAwTKpbJWuB+S2UXPU0V
	Ve9w==
X-Received: by 10.152.114.164 with SMTP id jh4mr12673794lab.1.1365460844460;
	Mon, 08 Apr 2013 15:40:44 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.125.38 with HTTP; Mon, 8 Apr 2013 15:40:24 -0700 (PDT)
In-Reply-To: <3664366.6RB48HkoAG@helios>
References: <cover.1365179842.git.pkj@axis.com>
	<a20f68229f1499d9020bd9cd8dc593e5f6635967.1365179842.git.pkj@axis.com>
	<CAHUNapRCw6pqVL1MfSkPqDZQL-adp-AHQba8+nGTPoi44BTguQ@mail.gmail.com>
	<3664366.6RB48HkoAG@helios>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 8 Apr 2013 15:40:24 -0700
X-Google-Sender-Auth: k9RerGStDV6nGepqAM9tWwBksHI
Message-ID: <CABcZANk=ttfyLhq-z8Fnj1_mjv5hhPAmauvKXjfWzG-q-B4cxA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: [PATCH 2/3] oe-buildenv-internal: Only add to $PATH if needed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Apr 2013 22:58:06 -0000
Content-Type: multipart/alternative; boundary=f46d0407142d96c3c604d9e120a9

--f46d0407142d96c3c604d9e120a9
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 8, 2013 at 10:48 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Monday 08 April 2013 13:31:50 Trevor Woerner wrote:
> > On Fri, Apr 5, 2013 at 12:59 PM, Peter Kjellerstedt
> > <peter.kjellerstedt@axis.com> wrote:
> > > +[ "${PATH#$NEWPATHS}" != "$PATH" ] || PATH="$NEWPATHS$PATH"
> >
> > This is certainly a welcome addition in functionality, but it relies
> > on the pattern remaining at the start of the PATH (i.e. the user
> > hasn't played with PATH in any way). Could we not use the
> > ${parameter/pattern/string} parameter expansion instead (e.g.
> > "${PATH/$NEWPATHS/}") so it doesn't matter whether the user has
> > further modified the PATH?
>
> Unfortunately I think this is specific to bash, so it may not be portable.
> Maybe the equivalent can be achieved with sed however.


Also, neither version matches the : separator, which means we could in
theory get false positive matches.
-- 
Christopher Larson

--f46d0407142d96c3c604d9e120a9
Content-Type: text/html; charset=UTF-8

<div dir="ltr"><div class="gmail_extra"><br><div class="gmail_quote">On Mon, Apr 8, 2013 at 10:48 AM, Paul Eggleton <span dir="ltr">&lt;<a href="mailto:paul.eggleton@linux.intel.com" target="_blank">paul.eggleton@linux.intel.com</a>&gt;</span> wrote:<br>

<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class="im">On Monday 08 April 2013 13:31:50 Trevor Woerner wrote:<br>
&gt; On Fri, Apr 5, 2013 at 12:59 PM, Peter Kjellerstedt<br>
&gt; &lt;<a href="mailto:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis.com</a>&gt; wrote:<br>
&gt; &gt; +[ &quot;${PATH#$NEWPATHS}&quot; != &quot;$PATH&quot; ] || PATH=&quot;$NEWPATHS$PATH&quot;<br>
&gt;<br>
&gt; This is certainly a welcome addition in functionality, but it relies<br>
&gt; on the pattern remaining at the start of the PATH (i.e. the user<br>
&gt; hasn&#39;t played with PATH in any way). Could we not use the<br>
&gt; ${parameter/pattern/string} parameter expansion instead (e.g.<br>
&gt; &quot;${PATH/$NEWPATHS/}&quot;) so it doesn&#39;t matter whether the user has<br>
&gt; further modified the PATH?<br>
<br>
</div>Unfortunately I think this is specific to bash, so it may not be portable.<br>
Maybe the equivalent can be achieved with sed however.</blockquote></div><br>Also, neither version matches the : separator, which means we could in theory get false positive matches.<br>-- <br>Christopher Larson</div></div>


--f46d0407142d96c3c604d9e120a9--
