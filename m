Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id BBF116012A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 10:44:35 +0000 (UTC)
Received: by iofh3 with SMTP id h3so85350471iof.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 02:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=mei24egZjKUeo02bsco4lbeBhW4RmzJB71IliAhW/y4=;
	b=FY1UUh1hL8GBmesx1z4bnHaLHYrNZ63OCcULLMu+hnVQl6mxEC5NZmA6Jv39J/q7fv
	fNXnOZL/rZ79vhnf94khLOm81LvXSYHIz14KIxCY4NtfCthbKw2iwR/FJsQ4fzXqrEPB
	2MdePJ3Xwv4W65gtG/xwYlJYqRZa/9yM67atYJ5UbOlRgFUY2vJJKH/eekKUnGRlgE34
	By+fIUD9j9W820z9qWLUTwrL5rnZqqiXiL4n7D0DH60b5ycvEytQ9CV9QBHV1Z1dffyo
	6yFTFdjt7a5flme4p5EoxV+zJSgBiVRStn0bEBC6BUgRPpsXmNrGW1x49jRfflL3pZ1N
	I+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mei24egZjKUeo02bsco4lbeBhW4RmzJB71IliAhW/y4=;
	b=UCqYo4jmDdh56hHhKsMpFCdjSVolP9Eb36wEGGfMmUUZokD7sSZTdxfqhJmDLHesNN
	kU7E21Mpq5t0PgUFJQRp+VawOu/sTJvgqd4IjutDA+BiqCr8bw1I9203DnWU574BS1l7
	eSTYKYjYMvcBsxH8t07WAXcV9QoQb9KtbTpEuRoVf7X3qdjWOQh7lhp1XbH+qS/l5FeE
	VDax2hwBUYCiYv6vpsRlavguFeYK8XLcywCrK7ANgieSVzFpidXmVYTv1ryRiPwAH8rR
	nIWfXf+5FOUBR6cvmXNImaoEk4CmbU9DQNKnbPIsgLgFx/UFYEAZL+havJpdtwIGMJ9G
	sYLg==
X-Gm-Message-State: ALoCoQlzv0LJkqJuDk162nAoa3bwmWsl4cUt8obeqth6M4LBWnZy9pQ2WBgxRURc1I1MzWpZKZNR
X-Received: by 10.107.3.144 with SMTP id e16mr37350307ioi.99.1448534675814;
	Thu, 26 Nov 2015 02:44:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Thu, 26 Nov 2015 02:44:16 -0800 (PST)
In-Reply-To: <CAD3vsf6bb9kFYaaLoDFpxv9ucGLhU3DwXxTSeei2AwHVtm=r_A@mail.gmail.com>
References: <1448434479-29558-1-git-send-email-jkrishnanjanappa@mvista.com>
	<56557491.4010809@windriver.com> <20151125103453.GM17303@jama>
	<CAD3vsf5rOZXj6oxQ4eaEdCW9bMcFJ-He4VyZy4dJ6KScW1S7dQ@mail.gmail.com>
	<20151125124151.GO17303@jama>
	<CAD3vsf7T2rOeO5n+XdwzFrT_pEecHPQMOPGxH6CJEMD5FvLn2A@mail.gmail.com>
	<CAJTo0LY5XsdV0ZuR-sK=rFM3GXJf4bRC59tnPno_a8LQJ-srrg@mail.gmail.com>
	<CAD3vsf6bb9kFYaaLoDFpxv9ucGLhU3DwXxTSeei2AwHVtm=r_A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Nov 2015 10:44:16 +0000
Message-ID: <CAJTo0LatUtWdcbcJ0Bi0U5XBFGBgTsY-GYDDJaP36NST1Oshyw@mail.gmail.com>
To: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [jethro][PATCH] license.bbclass: fix host contamination warnings for license files
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
X-List-Received-Date: Thu, 26 Nov 2015 10:44:37 -0000
Content-Type: multipart/alternative; boundary=001a113ecf40cc114905256f4254

--001a113ecf40cc114905256f4254
Content-Type: text/plain; charset=UTF-8

On 26 November 2015 at 03:17, Jagadeesh Krishnanjanappa <
jkrishnanjanappa@mvista.com> wrote:

> The intention of using os.getuid() is to avoid writing hardcoded value
>  "0", since os.getuid() return "0" under fakeroot env; if root user is
> having UID as 0.That's the advantage I can think of.
>

root is *always* UID 0, and packaging always runs as root.  Can you send a
tested v2 with explicit 0 instead of assuming that you're running under
pseudo?

Ross

--001a113ecf40cc114905256f4254
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 November 2015 at 03:17, Jagadeesh Krishnanjanappa <span dir=3D"ltr">&=
lt;<a href=3D"mailto:jkrishnanjanappa@mvista.com" target=3D"_blank">jkrishn=
anjanappa@mvista.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div>The intention of using os.getuid() is to avoid writing hardcoded val=
ue =C2=A0&quot;0&quot;, since os.getuid() return &quot;0&quot; under fakero=
ot env; if root user is having UID as 0.That&#39;s the advantage I can thin=
k of.</div><div></div></blockquote></div><br>root is *always* UID 0, and pa=
ckaging always runs as root.=C2=A0 Can you send a tested v2 with explicit 0=
 instead of assuming that you&#39;re running under pseudo?</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ecf40cc114905256f4254--
