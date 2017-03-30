Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 98AF477BD5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 11:21:29 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id p22so36400970qka.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 04:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=74c5aDq1hmJYiNS1D1ve4Es5t7L/y8w1Ez6E4yxYvK8=;
	b=M0zjANlHuU841wQv5Sv5UTR6drY52jlnFuenjpX1WKoDcagwmIx3izwF5KuxS7O8RX
	hAe/ZjHpEsdSSx+eDVgqJGErYvnqXr18Kpg0d1EkYQLjL18ABIIXuTwW8g3ZXZaP+oSC
	LA2ylLki4mo0eo8HJuiPbbXM3Tx+zsLwYe0jQCKfE49h7+MNStSCqzz2+pCzxP1Fb0ax
	CHuXe76VAdWWQJBmD2b4Mek1Yu85knRiPv5gObBTIAhJjyRZw9ajMFUBbsjVy2jWHkcR
	K3WHFOEtksVsu0NPhGx98TQyVmKOfJttkM3d1jFbeYu6JCF8IuvtX2bFtICI2Pmz6YMC
	G8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=74c5aDq1hmJYiNS1D1ve4Es5t7L/y8w1Ez6E4yxYvK8=;
	b=YQ3ccm5Ag9TDwhTcWpf0Q/Et5yqWNH7e/cMfBERVEkoY+Xf/zdUWfzXfEWzCKkV55+
	E72163euv5NY6wtRTB4fnFH6IZUGZo27qrYASZlmdT+OYbKr9m0tAQuAbmPn/RwC0Xl9
	gtvBV5ZunHSBeWkkDNXgekkK/ALwItJ/Z+6GhXaSBk2Udi+uY33zpzAVEO3Tptcj8Cc9
	0otCzfbArvMa7JGAYhIb2+bqLRPBeyWd+SQ1qhagqdySu+oYHF0GHevpGKRpmovHWmWJ
	mJlz98/nApE4c6fyX1DWpAAN1qkQdUo+a/XfmodlkfUo1o1QN6qO6SB/gPEjw2yw291J
	oziw==
X-Gm-Message-State: AFeK/H1rDbOvHqpI4qo3SDmJwW+sXue1Wk3dFTGBIuMA8BXoDyiq6RD/O5Nwa3uJ/LeWvsccNvhhs+kohWiK20sc
X-Received: by 10.55.162.203 with SMTP id l194mr5000251qke.221.1490872890210; 
	Thu, 30 Mar 2017 04:21:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Thu, 30 Mar 2017 04:21:09 -0700 (PDT)
In-Reply-To: <20170330080955.GA403@mbabyjoh-desk.ger.corp.intel.com>
References: <1490789493.18519.18.camel@codethink.co.uk>
	<CAJ86T=VYpCkzddgtVkT++N+gxj5oi8iuzb29Cm9N_0=7RrG_1A@mail.gmail.com>
	<20170330080955.GA403@mbabyjoh-desk.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Mar 2017 12:21:09 +0100
Message-ID: <CAJTo0Lar4023Z0kWdcgBPgc4aD+E6oEvh6jkfhCKdr0gtpYJkQ@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libjpeg-turbo: fix build on aarch64 or non-intel build hosts
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
X-List-Received-Date: Thu, 30 Mar 2017 11:21:29 -0000
Content-Type: multipart/alternative; boundary=001a114d7fb006d7b6054bf0e5a8

--001a114d7fb006d7b6054bf0e5a8
Content-Type: text/plain; charset=UTF-8

On 30 March 2017 at 09:09, Maxin B. John <maxin.john@intel.com> wrote:
>
> Agree with Andre here. I would suggest to update nasm recipe to support
> build for other archs as well (tested on arm and it works as expected. Will
> require more testing on other archs).
>

Yes.  Simply deleting the COMPATIBLE_HOST in nasm.bb should be sufficient,
Debian builds nasm for every architecture so that demonstrates that it
builds just fine.

Ross

--001a114d7fb006d7b6054bf0e5a8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 March 2017 at 09:09, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;<=
/span> wrote:<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">Agree with Andre here. I would =
suggest to update nasm recipe to support<br>
build for other archs as well (tested on arm and it works as expected. Will=
<br>
require more testing on other archs).<br></blockquote></div><br>Yes.=C2=A0 =
Simply deleting the COMPATIBLE_HOST in <a href=3D"http://nasm.bb">nasm.bb</=
a> should be sufficient, Debian builds nasm for every architecture so that =
demonstrates that it builds just fine.</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Ross</div></div>

--001a114d7fb006d7b6054bf0e5a8--
