Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8C5AD605BA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 20:22:42 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id o68so32485901qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2016 13:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kZ2+Au0SyPn6Zwy/YKmpN/dH/P2DUCKc7q5yJDf6SAI=;
	b=VS2t2Pj/9eqrzm6PGFkVrPmLi8OB1uTour60M2Z+zqms1Rrf56s4DZH/RJhW5PJy7k
	TxgBr/R30WuV0kX94SewPPn28Dt9u+FuRs5IQh1tGCr6T7tbp1OkD910x0djwO7Zbi39
	zic5ekMx4eW7QcN/QX8tCgb/pKEtDsFgj909MWVIT7LDGwJI5RdROSlL+/s2ckdtXzqu
	3GmzyqpNhyRFAq8UA7Nk5L4T4FJFT/yU+0FT7sPYPVyyocv8fRb+j3bzy4BZgyFvgGBI
	HzvuvhnsovFHFuYvs71fXwiwIeEZYL5U4/20YbuBLyPa60pHhagNY6eMB5BUAhMM/Tub
	b4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kZ2+Au0SyPn6Zwy/YKmpN/dH/P2DUCKc7q5yJDf6SAI=;
	b=iVweX5L2aYdONdVy2xSEsuqvNYMCyK7clu2oxRQNOi5plg+CoiPHfS9v33fhnWXx01
	Wy9hxcZQt5ZQZv43/KzkizKyWvRk/2LNLhjL2rqdGrNlh4Gc9kzapiXTpuZ7BrTE08rI
	JbOXEJ2JZRJcu10Ofr+j3c5AeiKVYxyMs5+0Op1PFJyTIJTYF3Wcom9z2MHmdP/hgQg0
	mnrJgmZq+v/i9rlGzg0dEiQkRAjO+d3bTZujYZP4ZuWCCuBukfpX43u7kio9hCPvDOlw
	q8d+KgjbEFK/9p9VuNRzIxvC68J+kk8zfo9njHOivfyi7rT41gNvFvig6q2z6O+AqmTj
	XFxA==
X-Gm-Message-State: ABUngvfRsXSzcgnXuYcDkQ11APnVjCFZbj+zmCWJRh5t2MESGmqR0ERWfVLP4j0PtcRhjZlmvOhXkZB5YXB86KPZ
X-Received: by 10.55.207.78 with SMTP id e75mr5423410qkj.36.1478118163566;
	Wed, 02 Nov 2016 13:22:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Wed, 2 Nov 2016 13:22:23 -0700 (PDT)
In-Reply-To: <1478111855.32080.20.camel@toganlabs.com>
References: <1478099232-23987-1-git-send-email-ross.burton@intel.com>
	<1478111855.32080.20.camel@toganlabs.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Nov 2016 20:22:23 +0000
Message-ID: <CAJTo0LZ-LDz2_=g73WRQQCg3Hv32CYONnu-WbzDrOOJKmRa4hQ@mail.gmail.com>
To: pidge@toganlabs.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/license: copy licenses even if there are no checksummed files
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
X-List-Received-Date: Wed, 02 Nov 2016 20:22:43 -0000
Content-Type: multipart/alternative; boundary=001a1145b7b81363c405405734c4

--001a1145b7b81363c405405734c4
Content-Type: text/plain; charset=UTF-8

On 2 November 2016 at 18:37, Beth 'pidge' Flanagan <pidge@toganlabs.com>
wrote:

> It's been a bit since I've looked at license.bbclass, but I guess my
> question here is this seems to take out all notification that a recipe
> doesn't have a LIC_FILES_CHKSUM, correct?
>
> I'd rather we maybe kept the note in and maybe whitelisted recipes that
> did interesting things so that didn't appear than just ignored when a
> recipe was missing it.
>
> Because if we don't at least bb.note it, I can see people just ignoring
> it entirely (which would be bad in a lot of ways)
>

No, this check was belt-and-braces (the other check is a bb.error()).  Also
bb.note() from tasks don't appear in the user-visible log by default,
you've got to dig into the task log to see them which is buried in the work
directories.

Ross

--001a1145b7b81363c405405734c4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 November 2016 at 18:37, Beth &#39;pidge&#39; Flanagan <span dir=3D"ltr=
">&lt;<a href=3D"mailto:pidge@toganlabs.com" target=3D"_blank">pidge@toganl=
abs.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,2=
04,204);border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:1o8" cl=
ass=3D"gmail-a3s gmail-aXjCH gmail-m1582655997bb7aaa">It&#39;s been a bit s=
ince I&#39;ve looked at license.bbclass, but I guess my<br>
question here is this seems to take out all notification that a recipe<br>
doesn&#39;t have a LIC_FILES_CHKSUM, correct?<br>
<br>
I&#39;d rather we maybe kept the note in and maybe whitelisted recipes that=
<br>
did interesting things so that didn&#39;t appear than just ignored when a<b=
r>
recipe was missing it.=C2=A0<br>
<br>
Because if we don&#39;t at least bb.note it, I can see people just ignoring=
<br>
it entirely (which would be bad in a lot of ways)</div></blockquote></div><=
br>No, this check was belt-and-braces (the other check is a bb.error()).=C2=
=A0 Also bb.note() from tasks don&#39;t appear in the user-visible log by d=
efault, you&#39;ve got to dig into the task log to see them which is buried=
 in the work directories.</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div>

--001a1145b7b81363c405405734c4--
