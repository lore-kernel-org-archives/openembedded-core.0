Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5A635610E1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 19:01:14 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so1995297eek.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 12:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=j6Tz98tthtX0XZ2zT3SNBOaGEDuS0NwvdUhJSTS4nyU=;
	b=UDYD84SIW5XJw8bv9mLI66xIi30dHFXjLtWXAMv8gBod00WudvGI6aSrX1uXSvIKW4
	aUaAXu4hNl+UddenPFHE7DiimuQbuILueg18u+uLFeV3eoo2UpadDdIexTagfDKrFN8P
	mnI8wim1JID1WtYOO4BTDVhIZiHXDNpHgVQvqW2CvvYXDrOE0xyeUacnkibq1UET3FuS
	4rMWBh4sUw5Oun6WiXlFe6bnZDduAw0HOM4VzFAfcZmE8fWwZcg9ghB2sOGyDdgNR4DK
	yWTnBIQsjiFNfcAu/ejFVoZLScI3OixgVshaoYWB/2vflvxI4a2eaQe0k4ZsDlH6V+ug
	ugfA==
MIME-Version: 1.0
X-Received: by 10.15.74.197 with SMTP id j45mr15393322eey.40.1379962875365;
	Mon, 23 Sep 2013 12:01:15 -0700 (PDT)
Received: by 10.14.118.15 with HTTP; Mon, 23 Sep 2013 12:01:15 -0700 (PDT)
Received: by 10.14.118.15 with HTTP; Mon, 23 Sep 2013 12:01:15 -0700 (PDT)
In-Reply-To: <5240820E.5020407@windriver.com>
References: <1379954041-5575-1-git-send-email-david.nystrom@enea.com>
	<1379954041-5575-2-git-send-email-david.nystrom@enea.com>
	<5240820E.5020407@windriver.com>
Date: Mon, 23 Sep 2013 21:01:15 +0200
Message-ID: <CAAKB1h2tRBDowRYZ9vOXduTCy0Fg4aoD+fJmVkN7vZ=XqzWpEg@mail.gmail.com>
From: David Nystrom <david.c.nystrom@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] shadow: Create recipe nativesdk-shadow
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
X-List-Received-Date: Mon, 23 Sep 2013 19:01:14 -0000
Content-Type: multipart/alternative; boundary=001a11c39808fd8aed04e711a409

--001a11c39808fd8aed04e711a409
Content-Type: text/plain; charset=ISO-8859-1

On Sep 23, 2013 8:01 PM, "Mark Hatle" <mark.hatle@windriver.com> wrote:
>
> This looks to be the same as the 'native' package, but I don't think you
can just add a BBCLASSEXTEND = "nativesdk"

It mostly is and I cant, your right.

> Perhaps (in 1.6) someone should look at merging the three back together.

Agree, the merged recipe will also get a bit messy, but probably easier to
maintain than in its current state.

> If this is the same as the native version, I'd suggest adding a comment
stating as much so we can hopefully keep them in sync.

Will do, will return with v2

--001a11c39808fd8aed04e711a409
Content-Type: text/html; charset=ISO-8859-1

<p dir="ltr"><br>
On Sep 23, 2013 8:01 PM, &quot;Mark Hatle&quot; &lt;<a href="mailto:mark.hatle@windriver.com">mark.hatle@windriver.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This looks to be the same as the &#39;native&#39; package, but I don&#39;t think you can just add a BBCLASSEXTEND = &quot;nativesdk&quot;</p>
<p dir="ltr">It mostly is and I cant, your right.</p>
<p dir="ltr">&gt; Perhaps (in 1.6) someone should look at merging the three back together.</p>
<p dir="ltr">Agree, the merged recipe will also get a bit messy, but probably easier to maintain than in its current state.</p>
<p dir="ltr">&gt; If this is the same as the native version, I&#39;d suggest adding a comment stating as much so we can hopefully keep them in sync.</p>
<p dir="ltr">Will do, will return with v2<br>
</p>

--001a11c39808fd8aed04e711a409--
