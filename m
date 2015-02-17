Return-Path: <kergoth@gmail.com>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3959871F05
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 16:57:37 +0000 (UTC)
Received: by mail-yk0-f169.google.com with SMTP id 79so17191977ykr.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 08:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=7gzrMaqoZiAXDl67xlnSCViJyOBBbXUROjgtg0D7kvM=;
	b=uF1RgsVEoln8W1qjh/LYHz9BWIDr+IuKOVSUIDPTjlBRRIOvx+OQL9R8NBC0gPkK4t
	tkdqcE9JoW/zWJQfhY5PAXfU4MCop6qN4uuayfZZ+kTfC7v251E8bkVq2+OAS21lq28n
	XUlv6FRSVkp5hv78F3Jhybj5L9/v9Yp0O2q/EJQOtssXvdpxqw7Lx+gTbgbzr4qJmw1v
	Zr/ZxgVlfNVqltR73uMTRgVF5sbUzjAuBUlf+/NftTIi6/FbEEHRvzUU8pyOx3HhyKRM
	fZNLNRuEeL5dufXz/rymSAwrThWanUf/LwMbSVdOLZ4Tm5gM11OaI/omk3aAO0dBRAMz
	Zf0A==
X-Received: by 10.236.198.179 with SMTP id v39mr23141yhn.70.1424192258864;
	Tue, 17 Feb 2015 08:57:38 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.170.120.4 with HTTP; Tue, 17 Feb 2015 08:57:18 -0800 (PST)
In-Reply-To: <54E3723B.9050606@windriver.com>
References: <1424180525-4138-1-git-send-email-patrick.ohly@intel.com>
	<54E3723B.9050606@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 17 Feb 2015 09:57:18 -0700
X-Google-Sender-Auth: nkESMGMwLvb4mQyavscn5u8RCYk
Message-ID: <CABcZAN=4puvBHBwH72ioVdGHpfSO5kngJGCWrJgED8xO_4xQkw@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_rpm.bbclass: support packaging of symlinks to directories
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
X-List-Received-Date: Tue, 17 Feb 2015 16:57:42 -0000
Content-Type: multipart/alternative; boundary=089e0160b098ae7ce7050f4b9929

--089e0160b098ae7ce7050f4b9929
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 17, 2015 at 9:54 AM, Mark Hatle <mark.hatle@windriver.com>
wrote:

> On 2/17/15 7:42 AM, Patrick Ohly wrote:
> > os.walk() returns symlinks to directories in the "dirs" lists,
> > but then never enters them by default. As a result, the old
> > code applied neither the directory handling (because that
> > is active once a directory gets entered) nor the file handling,
> > and thus never packaged such symlinks.
> >
> > The fix is simple: find such special directory entries and move
> > them to the "files" list.
>
> I'm curious, what is the problem that is being fixed with this.
>
> Normally you don't want to walk into symlinks to directories, as either
> you want
> to capture the symlink itself -- or the symlink is pointing to something
> you
> don't have access to when packaging (i.e. /proc).


This patch doesn't make it walk into the directory symlinks, it moves them
into the files list rather than the dirs list so they'll be captured
themselves, as far as I can tell from reading it.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e0160b098ae7ce7050f4b9929
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Feb 17, 2015 at 9:54 AM, Mark Hatle <span dir=3D"ltr">&lt;<a href=
=3D"mailto:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,=
204);border-left-style:solid;padding-left:1ex"><span class=3D"">On 2/17/15 =
7:42 AM, Patrick Ohly wrote:<br>
&gt; os.walk() returns symlinks to directories in the &quot;dirs&quot; list=
s,<br>
&gt; but then never enters them by default. As a result, the old<br>
&gt; code applied neither the directory handling (because that<br>
&gt; is active once a directory gets entered) nor the file handling,<br>
&gt; and thus never packaged such symlinks.<br>
&gt;<br>
&gt; The fix is simple: find such special directory entries and move<br>
&gt; them to the &quot;files&quot; list.<br>
<br>
</span>I&#39;m curious, what is the problem that is being fixed with this.<=
br>
<br>
Normally you don&#39;t want to walk into symlinks to directories, as either=
 you want<br>
to capture the symlink itself -- or the symlink is pointing to something yo=
u<br>
don&#39;t have access to when packaging (i.e. /proc).</blockquote></div><br=
>This patch doesn&#39;t make it walk into the directory symlinks, it moves =
them into the files list rather than the dirs list so they&#39;ll be captur=
ed themselves, as far as I can tell from reading it.<br>-- <br><div class=
=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot com<br>Fo=
under - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior S=
oftware Engineer, Mentor Graphics</div>
</div></div>

--089e0160b098ae7ce7050f4b9929--
