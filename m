Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 033D67317D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 23:37:02 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id q21so103940555iod.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 15:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=E7k9cVoV3LnbHM3Ba1KsNsGkatUlVWS4XTN+Gnl1ruo=;
	b=CO4OArVwWlPQxD4L/wIvVtrR9OlabUC3dwQlpYWFkyBUw8LUynzKIYAvnlZB8zfaTZ
	g9d0g3/nWjAEu5qTwv3UEYbrEAcy+CfQ2QOqjaEklkwlMsBgLElBdbwNW1mTiRqf0jd7
	lqzmixspem7MelYAOxtMF8hBGWrJ83aJn+UyclxciJjQBmE0nb6RQ9pVxMEGNV38leAr
	7IwwlPhse/caeusjyucmwpz8qIGEiRFNYYCCX6iv6VJOUsKgAnHfdzJHtsjCOK9zOhic
	bBrBdFS58000ANORinH5OcixpWmBNw5aGTCt9eXJnrl/+sOoEChotGgmT5CF04VfUMSY
	9M5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=E7k9cVoV3LnbHM3Ba1KsNsGkatUlVWS4XTN+Gnl1ruo=;
	b=fqyYAcHJHSf0/yKUw42SN/o0SdqF2l++fhVz+hU31ab5wfnYeRqzkVX5SBTXCbPNq8
	n0hzXgRr3RI24rpO9IQx/fytDdszn+VOp92Mh7xy0ZcLT+OnAEB48lL8dOUuftARcUJV
	B+SYpkn71mQjZhog7wlOELkr9BUixEjOo/5dvfmEMboS6qaqtPjdtHlPCDcSu7taMyah
	cP8TgfF11Qu98oVEBbQ1RD7E0yHInlkfqRc5LLGXEufwpNImsMXCitTtFOJ5Ys/LPqgZ
	YiQOdAHVZ6QopADfzyA9scOE7Kb7NBTJQoUi+y1mGcwNFsplFeYKkYX79X2f/jOzKYwf
	CtdA==
X-Gm-Message-State: AG10YORdBP6IlGHdJWZGeqlbie0JIwQqmLP8y/s30HFmNLKq6KVvYci+uEN2YP9CSADnqDZHgnBBGemunxo+fDZ3
X-Received: by 10.107.3.154 with SMTP id e26mr5672898ioi.99.1453505823664;
	Fri, 22 Jan 2016 15:37:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 22 Jan 2016 15:36:44 -0800 (PST)
In-Reply-To: <20160122232539.GA28611@zardoz.amer.corp.natinst.com>
References: <1453486432-24073-1-git-send-email-brad.mouring@ni.com>
	<CAJTo0La_+cYqBCVy384W4cXTGk322TRj7c+zJGHw9kBH+msPoQ@mail.gmail.com>
	<20160122232539.GA28611@zardoz.amer.corp.natinst.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 Jan 2016 23:36:44 +0000
Message-ID: <CAJTo0LYZ8qx_f8n2MfFprP6YKSSY8D=bAbdoAuShWkXtE4kVdQ@mail.gmail.com>
To: bmouring@ni.com
Cc: Brad Mouring <brad.mouring@ni.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] avahi: Add patch to fix Win10 mDNS issues
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
X-List-Received-Date: Fri, 22 Jan 2016 23:37:05 -0000
Content-Type: multipart/alternative; boundary=001a113ec10a4c8a280529f4b2b2

--001a113ec10a4c8a280529f4b2b2
Content-Type: text/plain; charset=UTF-8

On 22 January 2016 at 23:25, <bmouring@ni.com> wrote:

> > Can you add this to the SRC_URI assignment in avahi.inc please.
>
> I did this initially, but considering that the next version of avahi will
> include this change, I didn't think that was the best approach. I'm fine
> with including it there, but it didn't seem right to me. Convince me
> that it's the correct place to put the change.


Mainly for consistency: all the other patches are listed in the SRC_URI in
avahi.inc.

Another good reason is that it ensures that both avahi and avahi-ui get
built with the same source.

Ross

--001a113ec10a4c8a280529f4b2b2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 January 2016 at 23:25,  <span dir=3D"ltr">&lt;<a href=3D"mailto:bmour=
ing@ni.com" target=3D"_blank">bmouring@ni.com</a>&gt;</span> wrote:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><span class=3D"">&gt; Can you add this to the SR=
C_URI assignment in avahi.inc please.<br>
<br>
</span>I did this initially, but considering that the next version of avahi=
 will<br>
include this change, I didn&#39;t think that was the best approach. I&#39;m=
 fine<br>
with including it there, but it didn&#39;t seem right to me. Convince me<br=
>
that it&#39;s the correct place to put the change.</blockquote></div><br>Ma=
inly for consistency: all the other patches are listed in the SRC_URI in av=
ahi.inc.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Another good reason is that it ensures that both avahi and avahi-ui get =
built with the same source.</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">Ross</div></div>

--001a113ec10a4c8a280529f4b2b2--
