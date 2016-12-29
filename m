Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id B004C601F1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2016 18:23:39 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id v84so404297654oie.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2016 10:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=trIsEVdJ1Kn9YpU/vRHOBP/sbe1Ko20ZzFy/+umzwD4=;
	b=BihJNeTjrc1jhcTXckC26cqT7ZMUkk36poTlMgw4BW12Xtc8mweHNB/f+/n4lG4nuT
	1juP+nD0GFYVbl3aXELP9okYpttaN4zbjTzKxlh1L9GcGI0zte/FBW6PKc7gzgdyPr42
	exymsVxFZ93scgZhOfRhf/0G3YTDMcIE5Urr9NNL2biVzEVUvYdhZ7fyhL7mlQy9Jfsx
	g6Aqtizd0bQyu4i5OJEBMwAsTa4EoH7EvLjo9kCknOjjtbiHlUNHdSv+9eGQ3wRfuulj
	eUH/HdsyL615DWpTkodgwXF0J8kID8N7H2mFnAiA40CAx5JN4RhlozX7KXz5kv+Pyhi/
	mIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=trIsEVdJ1Kn9YpU/vRHOBP/sbe1Ko20ZzFy/+umzwD4=;
	b=IWEvMP30vTva8xefag1mYugKU1uhjY44einrmoUIaT58rrh+gikwCc1onDSxE22D+f
	oSr7DnJHD/ykJPqEJsFWBV9scMTEXhL5odHeHMx6AKtiBC4f59i+kiJx09HCsW2e4dcf
	u/7t1bDIoxxV25WjyBlpnQQJP2pLwAIVwo3PuGLiXhDGBAh8hNpo48s14qPKeo0j0Hy2
	yX/qfbZ8t73KVoeZrL9ZIOkbpQOGMkcsIqUym6Ypaf6mjsZVpXoSp6VL8e09Cfpdoq7l
	Ll0AqYzuJdNkgxTUOrtrBvqQzP2b5uBZgY3gDrWGeur/lJ5wdijX1SJe92bxRr1g2lZv
	cQmQ==
X-Gm-Message-State: AIkVDXIOMUnwOZV267Mzb0zvLB+H+o4gsSPxRNvWvNI3VqeWLMdHeEyB+e0YFpvkUBMxL+L06KDXAzSYOq1PXg==
X-Received: by 10.157.60.99 with SMTP id j32mr24416281ote.70.1483035821055;
	Thu, 29 Dec 2016 10:23:41 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.19.10 with HTTP; Thu, 29 Dec 2016 10:23:20 -0800 (PST)
In-Reply-To: <1483034769-15179-1-git-send-email-kergoth@gmail.com>
References: <1483034769-15179-1-git-send-email-kergoth@gmail.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Thu, 29 Dec 2016 11:23:20 -0700
X-Google-Sender-Auth: xFY5aQA9zXjvdZ3anrLGV55bRx8
Message-ID: <CABcZANnM5rGrhwaWMUXfgQZzdL1vU+QCvajCYdbZD_EEmmOgFQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] sysroot-relativelinks: also consider links to dirs on the host
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
X-List-Received-Date: Thu, 29 Dec 2016 18:23:41 -0000
Content-Type: multipart/alternative; boundary=001a11c04a804da5da0544d02ff5

--001a11c04a804da5da0544d02ff5
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 29, 2016 at 11:06 AM, Christopher Larson <kergoth@gmail.com>
wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> Dead symlinks, or symlinks to existing files will show up in 'files' of an
> os.walk, but symlinks to existing directories show up in 'dirs', so we
> need to
> consider both.
>
> As one specific example, the symlink from /usr/lib/ssl/certs was left
> pointing
> to /etc/ssl/certs rather than the relative path when the sdk was built on
> hosts where the latter exists.
>
> JIRA: SB-8374
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>

Erm, sorry about the JIRA:, remnant from our fork.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a11c04a804da5da0544d02ff5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Dec 29, 2016 at 11:06 AM, Christopher Larson <span dir=3D"ltr">&lt;=
<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":pe" class=
=3D"a3s aXjCH m1594bc2d34ab531f">From: Christopher Larson &lt;<a href=3D"ma=
ilto:chris_larson@mentor.com">chris_larson@mentor.com</a>&gt;<br>
<br>
Dead symlinks, or symlinks to existing files will show up in &#39;files&#39=
; of an<br>
os.walk, but symlinks to existing directories show up in &#39;dirs&#39;, so=
 we need to<br>
consider both.<br>
<br>
As one specific example, the symlink from /usr/lib/ssl/certs was left point=
ing<br>
to /etc/ssl/certs rather than the relative path when the sdk was built on<b=
r>
hosts where the latter exists.<br>
<br>
JIRA: SB-8374<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com">chris_larson@mentor.com</a>&gt;</div></blockquote></div><br>Erm, sorr=
y about the JIRA:, remnant from our fork.<br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Christopher Lar=
son<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZau=
rus<br>Senior Software Engineer, Mentor Graphics</div></div>
</div></div>

--001a11c04a804da5da0544d02ff5--
