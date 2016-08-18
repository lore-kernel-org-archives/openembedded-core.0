Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 23C7273257
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 11:36:59 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id x131so23906549ite.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 04:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tcfGkswt92fZj3EOHU3yf+C2pNObU3FJX0BMbDgl+A4=;
	b=Pb/v767hDQURXr4cWauzgZPY1CIQ2puG/g3dZrw4h9FqxLUA8HUkF65Pq+sDZHktzU
	GT/dXznGUPdzS6M/prPfBnQQntQIE96+PvOsr+s5mZuOoARFgT0PIfmV+EbAdJHSamaX
	W6t/FzWd+KUefaKZ7P0hawa8m1kpE5Jw3GOKbWyvSxc2+mrTsjlH0Ytye0GiP7RXYz3s
	x3dbOi2Sw7KtALM+OLOIL/XRWqQu+ZHohcHprK/ShZlGwttVODjYG6j8rs5385RBvA8J
	/3B+YOyC3bDcjbhfaS4eLZpwJXf0Tq3HNEhtBey6/aBiscF32KDLdiT8LFDB08sJYUx1
	C/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tcfGkswt92fZj3EOHU3yf+C2pNObU3FJX0BMbDgl+A4=;
	b=M0Zopxmhg+K1QJDDpnNoZgzmvHlXFaCAUaYBXKGmdJMjHCALhEHmEByh0zQghNkO6R
	1ODdGhH3kv0qFb/aZ7B7l02z1pCfRVfzliWSXYbIgivs8B2B+Z4B8urPW5u08ZngUJ/t
	G4QKJtpxbbqIoYyIU+TUiZSyjEPXuqiF6ujAR+d79U3AwA7rshEbNpELmPDeLZAre0ms
	AiQFyPwoe64aojSWdXGTFcJg4DTyr70jKvnt/kwnkOcqg2M9Xzga53SzMCIGUiKaUWLL
	88TNMtrVgj7kvnaVrHoo/4d9Op30Bp8DHQrSGuRscfMAtShtV7PXokSqQ5pNZKoNdOUG
	uhjw==
X-Gm-Message-State: AEkoouuvXFSDOT8Gb192EyOoBdmaom3E3HmbL28cOQ/Gz8ZRsiQWYwZndPfVC4O7HGIfAv/6PXLE3j1/WCkML7FT
X-Received: by 10.36.129.213 with SMTP id q204mr35262793itd.38.1471520220473; 
	Thu, 18 Aug 2016 04:37:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 18 Aug 2016 04:36:40 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1608170956050.12816@ca624034.mitel.com>
References: <alpine.LFD.2.20.1608170956050.12816@ca624034.mitel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Aug 2016 12:36:40 +0100
Message-ID: <CAJTo0LbY7x-e_iGa3qNOAKMwB+wudoDkORQgB3t-6WB4pVhNHg@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what means IMAGE_ROOTFS_EXTRA_SPACE_append += "+ 3000000"?
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
X-List-Received-Date: Thu, 18 Aug 2016 11:37:00 -0000
Content-Type: multipart/alternative; boundary=94eb2c08b1fc058156053a57008d

--94eb2c08b1fc058156053a57008d
Content-Type: text/plain; charset=UTF-8

On 17 August 2016 at 15:01, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

> recipes-extended/images/core-image-kernel-dev.bb:IMAGE_ROOTFS_EXTRA_SPACE_append
> += "+ 3000000"
>

I'm guessing that's a mistake, it doesn't need a +.

Ross

--94eb2c08b1fc058156053a57008d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 August 2016 at 15:01, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4ta" cla=
ss=3D"a3s aXjCH m15698cfdea19e7d4">recipes-extended/images/core-<wbr>image-=
kernel-dev.bb:IMAGE_<wbr>ROOTFS_EXTRA_SPACE_append +=3D &quot;+ 3000000&quo=
t;<br></div></blockquote></div><br>I&#39;m guessing that&#39;s a mistake, i=
t doesn&#39;t need a +.</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--94eb2c08b1fc058156053a57008d--
