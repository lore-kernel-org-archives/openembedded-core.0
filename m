Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5BBF16E85D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 15:28:51 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id w7so2781931lbi.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 07:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=08Cg+88xIABexY6Gu1yvF7hByk0jmXBEc7w+lTQlEI4=;
	b=LQcAc46uQPqgEgbWEdPxSPZ0up7ZkcrTGvk6YIIMD3Ge4wxHErAfnwDjtqH5fQOVBL
	DCWZ4IfCBLZYbC05lMKS6z2vBte7HCRiBqtbPNlajJi/XsHnkpf8GROBxQKzVRD8ZqCI
	VFi4XyKz0vVeiUTFh18BskQhKre3pEulA8OgDHf3WLsrYarap8QSB5rd+ZjsBeE2u1hv
	f/FltaWP66CkSzmU9C8qLoVBRlxTKvcNYHxr8aUxLCL+rb14rPovGmPo8+wEfogJq8Pp
	xyhqodzsTHSj4OAdvKYNh6ZuNc8PdanZttSiOlZuKErAoVWKUFRaCqcNUsiHXE23krmy
	+r1A==
X-Received: by 10.153.11.129 with SMTP id ei1mr241794lad.78.1393601331937;
	Fri, 28 Feb 2014 07:28:51 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.35.200 with HTTP; Fri, 28 Feb 2014 07:28:31 -0800 (PST)
In-Reply-To: <1393599649-10573-1-git-send-email-olof.johansson@axis.com>
References: <1393599649-10573-1-git-send-email-olof.johansson@axis.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 28 Feb 2014 08:28:31 -0700
X-Google-Sender-Auth: Xjg-FInCvf2RE2mdbCSliDlGHCw
Message-ID: <CABcZAN=xGp6Kua1uPhZJGUwyG2JE5RWhJzA9T=XVxtpqypXiow@mail.gmail.com>
To: Olof Johansson <olof.johansson@axis.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] sanity.bbclass: support wildcards in SANITY_TESTED_DISTROS
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
X-List-Received-Date: Fri, 28 Feb 2014 15:28:54 -0000
Content-Type: multipart/alternative; boundary=001a113470a659471504f379188f

--001a113470a659471504f379188f
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 28, 2014 at 8:00 AM, Olof Johansson <olof.johansson@axis.com>wrote:

> With this change, you can use wildcards for entries in
> SANITY_TESTED_DISTROS. This makes it possible to say that, e.g. "all
> Debian 7 Wheezy releases are supported" with the entry "Debian-7.*".
>
> [YOCTO #5265]
>
> Signed-off-by: Olof Johansson <olof.johansson@axis.com>
>

Out of curiosity, why not just use fnmatch for this implementation?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113470a659471504f379188f
Content-Type: text/html; charset=UTF-8

<div dir="ltr"><div class="gmail_extra"><br><div class="gmail_quote">On Fri, Feb 28, 2014 at 8:00 AM, Olof Johansson <span dir="ltr">&lt;<a href="mailto:olof.johansson@axis.com" target="_blank">olof.johansson@axis.com</a>&gt;</span> wrote:<br>

<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=":15h" class="a3s" style="overflow:hidden">With this change, you can use wildcards for entries in<br>
SANITY_TESTED_DISTROS. This makes it possible to say that, e.g. &quot;all<br>
Debian 7 Wheezy releases are supported&quot; with the entry &quot;Debian-7.*&quot;.<br>
<br>
[YOCTO #5265]<br>
<br>
Signed-off-by: Olof Johansson &lt;<a href="mailto:olof.johansson@axis.com">olof.johansson@axis.com</a>&gt;</div></blockquote></div><br></div><div class="gmail_extra">Out of curiosity, why not just use fnmatch for this implementation?<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics
</div></div>

--001a113470a659471504f379188f--
