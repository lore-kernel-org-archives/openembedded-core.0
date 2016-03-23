Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6705F6AC37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 18:00:11 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id c63so57304398iof.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 11:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oh8bzy107ftRc3SD3XK7HMjG6WtLQAP0xRbEJ5uKmEk=;
	b=vl8Npdu/NSBj/beluMIrtCd3+XSXgNScypaOHY76HbfiWPXkxA80euuJDH1a3X8Gtr
	56Slum6bijrxvoBLxXk05dZIfGTsiyM3SvLUQtKohc7t/5TgkAhJbttL3sVkCtsRD+au
	jnkQqEsB+/qUasDlybX5MHahcBVZC1lzc2ZGNqP4dUsUi8CaZV8XXQItcb1We7n4tZLf
	FeX4fjVulRBWYJAZgi9WbaUvuIN0tpUszDdC2jsg8AU9BMfyTIDGWNl5ShVByr6rJ7UH
	zFglOS3/BnOZXhn6is91622239lNJiqmcpmcWvPMTz/kMi4RkQKfEAfRS9xKPQbwI3hI
	2VMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oh8bzy107ftRc3SD3XK7HMjG6WtLQAP0xRbEJ5uKmEk=;
	b=mohFPc1O49ZvB1PslTc7kD0zNm69DF/OfoTQMF/oS7uB6b92iAVEaKZNdcCswq7Zv/
	XANOqnWaOA2hdGDE8qKBrvjoYWFZlzZsBW0EpkDW4iI/NRVjfLqgo5ld41oVwHyCK15Z
	8aVLjEIrp7PFJ9ZOTHi8o/gcwZjsvwmwtEZrZRdpRnnrm270hKUX4HW9lZaTiRKvJIHN
	yGWQBoiwS6PypKZ7+fg813VXVvn/4ONc3NS/StRNpu4dQWjn7Cvely+A8rL1Z2Wh3vjI
	mHP90SEQRNRsjDTiUJMbeOIGAae8bZuW3bVypaSyKMh8qYdcjdMtz2fCBOKEP+XK6CF4
	GTfw==
X-Gm-Message-State: AD7BkJLOFCl0/B0m0MhTQi+DBpP7p9d6rZLGawruxfj/s6B08Z97JVB/Jf9zj5XePHMotxrvaLt2b5pu3yKVX/IZ
X-Received: by 10.107.137.38 with SMTP id l38mr5107110iod.133.1458756011559;
	Wed, 23 Mar 2016 11:00:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 23 Mar 2016 10:59:52 -0700 (PDT)
In-Reply-To: <1458755798.3476.186.camel@pbcl.net>
References: <1458748461-4643-1-git-send-email-william.c.randle@intel.com>
	<1458755798.3476.186.camel@pbcl.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Mar 2016 17:59:52 +0000
Message-ID: <CAJTo0LbicCM6LJbxEK8m-QES49-WjPJsDUgduV0-dOg1FSEdZw@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] insane.bbclass: tighten lib_re and exec_re patterns to avoid false positive
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
X-List-Received-Date: Wed, 23 Mar 2016 18:00:12 -0000
Content-Type: multipart/alternative; boundary=001a113ec522e26449052ebb19dd

--001a113ec522e26449052ebb19dd
Content-Type: text/plain; charset=UTF-8

On 23 March 2016 at 17:56, Phil Blundell <pb@pbcl.net> wrote:

> > lib_re would match files like "/libsoletta.so.0.0.1-gdb.py" which are
> > not valid library filenames.
>
> What are the consequences of it matching things that are not libraries?


See #9215, the libdir sanity test fires when it shouldn't.

WARNING: QA Issue: soletta-dbg: found library in wrong location:
/usr/share/gdb/auto-load/libsoletta.so.0.0.1-gdb.py [libdir]

That's no library...

Ross

--001a113ec522e26449052ebb19dd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 March 2016 at 17:56, Phil Blundell <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:pb@pbcl.net" target=3D"_blank">pb@pbcl.net</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;pa=
dding-left:1ex"><span class=3D"">&gt; lib_re would match files like &quot;/=
<a href=3D"http://libsoletta.so.0.0.1-gdb.py" rel=3D"noreferrer" target=3D"=
_blank">libsoletta.so.0.0.1-gdb.py</a>&quot; which are<br>
&gt; not valid library filenames.<br>
<br>
</span>What are the consequences of it matching things that are not librari=
es?</blockquote></div><br>See #9215, the libdir sanity test fires when it s=
houldn&#39;t.</div><br>WARNING: QA Issue: soletta-dbg: found library in wro=
ng location: /usr/share/gdb/auto-load/<a href=3D"http://libsoletta.so.0.0.1=
-gdb.py">libsoletta.so.0.0.1-gdb.py</a> [libdir]<br><br><div>That&#39;s no =
library...</div><div><br></div><div>Ross</div></div>

--001a113ec522e26449052ebb19dd--
