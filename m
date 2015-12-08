Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 870FF60116
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 15:38:50 +0000 (UTC)
Received: by iofh3 with SMTP id h3so27909306iof.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 07:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=xKHbd3xE69IMMeTZ6l3SF0x0PMLLW7Ae4NS7yIhq3SQ=;
	b=cMLx1hbqKhGs8LZl2Tmdcdzgmzq9qINceEMvFb4Ji3ymd754MKGSOGtMcpfPcKbvB8
	oILx3gfq2+6FqEhKIE/J1K4ReOyfs+BDVlhYshaSkSQqw0tUfS6Mi3V3MEKbHEhk4ROT
	boZjK9nE67aEpWWKPMwarGTvJmQoKv3zoExdxnCiWAU3Zv6PodT7DJyB7TAhdjjNRHrh
	/h9g/EJ4ofLC1W/7iBAitj7eg0Bnh+MItl7V74k5f/q5KnUaLFZstVkawTqQBp3LOlSY
	Pf7Qu4QSArsSNtSu/elG8/XqsI/oYg5J4LdWfnBXO3NTqBsX7DOLsayk0ovV0UwtVQj5
	wd6A==
X-Received: by 10.107.134.28 with SMTP id i28mr517651iod.74.1449589131331;
	Tue, 08 Dec 2015 07:38:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.69.129 with HTTP; Tue, 8 Dec 2015 07:38:31 -0800 (PST)
In-Reply-To: <564F3ADB.7040000@intel.com>
References: <cover.1447455202.git.chris_larson@mentor.com>
	<0a2bdfd48b566acec7f05734758da7811980a0bb.1447455202.git.chris_larson@mentor.com>
	<CAJTo0LZYFwj9+5XOS6ewLTKwiWoBd7+YY+uXoCe0V4M7YwYRvg@mail.gmail.com>
	<CABcZAN=HG8AJCjWHWTwWGs4vswnEL=SRF81fZz5r+iE+iQZ76g@mail.gmail.com>
	<564F3ADB.7040000@intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 8 Dec 2015 08:38:31 -0700
Message-ID: <CABcZANnjV02+O46SSWTKCh5CL-bfFDDgSpHNPMXjZ3bwJwJ3KQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 6/6] psplash: add systemd support
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
X-List-Received-Date: Tue, 08 Dec 2015 15:38:52 -0000
Content-Type: multipart/alternative; boundary=001a113ecc0a3e4da0052664c501

--001a113ecc0a3e4da0052664c501
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 20, 2015 at 8:23 AM, Ross Burton <ross.burton@intel.com> wrote:

> On 18/11/2015 02:03, Christopher Larson wrote:
>
>> Interesting, is psplash configured in our test environment? Either way,
>> worst case we can drop this commit for now and can revisit it. I'm
>> heading out of town tomorrow until December 1st, so likely will be
>> limited in what I can do to address any issues that crop up during that
>> period. Thanks.
>>
>
> It should be working - at least the sysvinit images work absolutely fine
> and show the splash.  I'll add giving this a go locally to my list of
> things to do.


I'll dig into this shortly and re-submit if appropriate. Getting caught up
on the status of submitted patches now. Thanks.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113ecc0a3e4da0052664c501
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Nov 20, 2015 at 8:23 AM, Ross Burton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On =
18/11/2015 02:03, Christopher Larson wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Interesting, is psplash configured in our test environment? Either way,<br>
worst case we can drop this commit for now and can revisit it. I&#39;m<br>
heading out of town tomorrow until December 1st, so likely will be<br>
limited in what I can do to address any issues that crop up during that<br>
period. Thanks.<br>
</blockquote>
<br></span>
It should be working - at least the sysvinit images work absolutely fine an=
d show the splash.=C2=A0 I&#39;ll add giving this a go locally to my list o=
f things to do.</blockquote></div><br>I&#39;ll dig into this shortly and re=
-submit if appropriate. Getting caught up on the status of submitted patche=
s now. Thanks.<br>-- <br><div class=3D"gmail_signature"><div dir=3D"ltr">Ch=
ristopher Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbe=
dded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor =
Graphics</div></div>
</div></div>

--001a113ecc0a3e4da0052664c501--
