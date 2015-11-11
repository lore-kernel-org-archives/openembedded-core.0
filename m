Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4204D77086
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 13:35:17 +0000 (UTC)
Received: by qgeb1 with SMTP id b1so23164431qge.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 05:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=gi3bTi603Bc+1Fh89FKjNA29ABiQEnVYiUISRFXvcM0=;
	b=1IFPDOdzVX75AnomLVBDmRbDp+/fdkiSqydMqQJWgQJCQyUzGhEwerTlpQ7IWVdJXq
	G56o25bxpa9wfGiKJUMhf5cAPRa3GepBH0qUzhsXA7rYGeVsxgCsiCNo9+ybweKR5slT
	HcEK9Wo6gs96baG9vPEOfBH5bmTsMTH9xLLqOYYVjewyN6hVptPRUZwitACV2Ek5DmZ4
	ejbeEGEvCksgZVMtVkCxgvO3R6FHcCXbuEpKqUbJwDA/L5C+mCtEoZXpNtawcvB4o3QE
	exRWs+MHgpA+IIx7LagSKUMqOB4AaD0OBryyZ8EAB41ggP0qNVJk/On63wTE3IHSdtRf
	TIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=gi3bTi603Bc+1Fh89FKjNA29ABiQEnVYiUISRFXvcM0=;
	b=GMgcrQZICBQ2K1koEtME+cBYr8rq1Ng6X2YfXl9F64wraV6Q9i5cC74QOMCoYDlg8b
	LpXw1qrQ69CzOhUFtxubtmhlErHILgc/lnOmLn0V/EBhOPh8gvqSclZM6t4nwLx97Qqa
	rRTX0HOtqoe/DvxYvxN7uiwytGYceLU5a9yRoI/snJgXZ4Vqy2dDVEKFVICW078lAwIe
	Im2jJv9CYwHSsHltuzUpwzzQaRTqk0HnWu9V6NbqeulwEzX2FDoCo8Oq6+H54ueJNh1G
	Zz0MglY9aup9zZgBNgk0wZBzXz3ZxpUBef7ayeHfsH6c1Ai7hDAoUXbF/A/PwMotOeag
	E1Ag==
X-Gm-Message-State: ALoCoQmzKDrKIZ11jVOXW/1jgBXRSyuKVhnSgSsQ0EWlBuvqK1w9GxPMte1LwP4BTG3Gf4d8bHij
X-Received: by 10.140.171.197 with SMTP id r188mr11384766qhr.93.1447248917273; 
	Wed, 11 Nov 2015 05:35:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.110 with HTTP; Wed, 11 Nov 2015 05:34:57 -0800 (PST)
In-Reply-To: <4611513.VyrzVSX4hN@peggleto-mobl.ger.corp.intel.com>
References: <1447240308-2849-1-git-send-email-ross.burton@intel.com>
	<1447240308-2849-2-git-send-email-ross.burton@intel.com>
	<4611513.VyrzVSX4hN@peggleto-mobl.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Nov 2015 13:34:57 +0000
Message-ID: <CAJTo0LZmTD3s3u8KrWJz7ka1zjR=HAACjQHyOTwWUTFSbpvLdw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] systemd: fix Upstream-Status tag
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
X-List-Received-Date: Wed, 11 Nov 2015 13:35:20 -0000
Content-Type: multipart/alternative; boundary=001a113a7dfa9dcd9b052443e5dc

--001a113a7dfa9dcd9b052443e5dc
Content-Type: text/plain; charset=UTF-8

On 11 November 2015 at 13:27, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> FWIW, I'd always thought "Rejected" would have been a more accurate label
> to
> use... on the other hand perhaps it's a bit late to be changing that now
> though.
>

Agreed.  We could change the guidelines to allow both but prefer Rejected?
Or is that too much effort when there's more important things to fix - this
could bikeshed easily. :)

Ross

--001a113a7dfa9dcd9b052443e5dc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 November 2015 at 13:27, Paul Eggleton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@l=
inux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 id=3D":53p" class=3D"a3s" style=3D"overflow:hidden">FWIW, I&#39;d always t=
hought &quot;Rejected&quot; would have been a more accurate label to<br>
use... on the other hand perhaps it&#39;s a bit late to be changing that no=
w<br>
though.<br></div></blockquote></div><br>Agreed.=C2=A0 We could change the g=
uidelines to allow both but prefer Rejected?=C2=A0 Or is that too much effo=
rt when there&#39;s more important things to fix - this could bikeshed easi=
ly. :)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Ross</div></div>

--001a113a7dfa9dcd9b052443e5dc--
