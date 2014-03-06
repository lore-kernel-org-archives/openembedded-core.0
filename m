Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 86A6E6F589
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 18:45:49 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id 10so2055048lbg.35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Mar 2014 10:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=tmjx1MwqQpnC5r+wxQFSWqG2qw9nBlLi3RGcfYJA9S8=;
	b=b0zCSeN5fyBah/XGVILdOnUcNGMqFJpYnj29pdnnsHiMJJw6AptNfD3623Q1U2VKnj
	PRl6x0CmMUjslHyZVUzLJ45M3w99L6vgfczzILeQsitlwPZ38wqEPkkVev6sdBj7lRqW
	z9CWDZ6MUYEhpWGFgVwAlBxyPsnx+EGFL96I7tP0dZRSvFQqsWpg3q8K8Y4X0bkcR4hi
	hYANZHPqd5V62fFT/N7oQr3teeKWtdoQSBop8T7Rz/YU9LzB5xyP46weQhyeEAaq3JUM
	O7hHhJsAoS23gS5hlhUm362cD3kMYPx/+hMhhSerExMMGMBbaS6uCceWr6X5blXfN7Wr
	tJsw==
X-Received: by 10.113.5.167 with SMTP id cn7mr8347471lbd.1.1394131549743; Thu,
	06 Mar 2014 10:45:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.35.200 with HTTP; Thu, 6 Mar 2014 10:45:29 -0800 (PST)
In-Reply-To: <CADkTA4M96iZh48Hieup38Gwf9DB24PgvKw7Uw0WVtaGLBwByFA@mail.gmail.com>
References: <1394129443-1427-1-git-send-email-kergoth@gmail.com>
	<CADkTA4M96iZh48Hieup38Gwf9DB24PgvKw7Uw0WVtaGLBwByFA@mail.gmail.com>
From: Chris Larson <kergoth@gmail.com>
Date: Thu, 6 Mar 2014 11:45:29 -0700
Message-ID: <CABcZANkBMim2vo9+ijWrrEHC6UbO0Ag=noFzD8z30tv+fvT5mQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-yocto: fix diffconfig/kernel_configme breakage
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
X-List-Received-Date: Thu, 06 Mar 2014 18:45:51 -0000
Content-Type: multipart/alternative; boundary=001a11347b7ccaf04104f3f48bf5

--001a11347b7ccaf04104f3f48bf5
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 6, 2014 at 11:40 AM, Bruce Ashfield <bruce.ashfield@gmail.com>wrote:

> On Thu, Mar 6, 2014 at 1:10 PM, Christopher Larson <kergoth@gmail.com>
> wrote:
> > +addtask kernel_configme after do_patch
> > +
>
> linux-yocto.inc already has:
>
> addtask kernel_configme before do_configure after do_patch
>
> So we should be able to avoid adding the task to the class, right ? I
> suppose the task could move into the class, but it was always a per
> recipe include in the past, I just don't want any unintended issues to
> happen from the double task add.
>

It depends on whether there's a need to support the use of the class
without the .inc. If not, there are probably a number of bits in the .inc
that belong in the class :) But it's never harmful to have multiple addtask
lines, it just adds the specified deps to the existing task. I just wanted
to make sure one couldn't get into a state where do_diffconfig depends on a
function which isn't a task, as I would expect (though couldn't say with
100% certainty) that bitbake would yell about that :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11347b7ccaf04104f3f48bf5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Mar 6, 2014 at 11:40 AM, Bruce Ashfield <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gma=
il.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">On Thu, Mar 6, 2014 at 1:10 =
PM, Christopher Larson &lt;<a href=3D"mailto:kergoth@gmail.com">kergoth@gma=
il.com</a>&gt; wrote:<br>


&gt; +addtask kernel_configme after do_patch<br>
&gt; +<br>
<br>
</div>linux-yocto.inc already has:<br>
<br>
addtask kernel_configme before do_configure after do_patch<br>
<br>
So we should be able to avoid adding the task to the class, right ? I<br>
suppose the task could move into the class, but it was always a per<br>
recipe include in the past, I just don&#39;t want any unintended issues to<=
br>
happen from the double task add.<br></blockquote><div><br></div><div>It dep=
ends on whether there&#39;s a need to support the use of the class without =
the .inc. If not, there are probably a number of bits in the .inc that belo=
ng in the class :) But it&#39;s never harmful to have multiple addtask line=
s, it just adds the specified deps to the existing task. I just wanted to m=
ake sure one couldn&#39;t get into a state where do_diffconfig depends on a=
 function which isn&#39;t a task, as I would expect (though couldn&#39;t sa=
y with 100% certainty) that bitbake would yell about that :)<br>

</div></div>-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Foun=
der - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Sof=
tware Engineer, Mentor Graphics
</div></div>

--001a11347b7ccaf04104f3f48bf5--
