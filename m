Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 41F14601A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 16:06:40 +0000 (UTC)
Received: by igvg19 with SMTP id g19so120618397igv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 08:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=sphT987oNWVcrk5sTopQcuDF0QsRsU3AD4kfHefr138=;
	b=a1JNYKZG19JdqUE+KE68Oz3kUk/6FM9S8JLb+WFfSp1ThlNqGKXKcYhc7v1F4EO2Ci
	mU/5RAtTow1oMEQ+nbz3AVHfvE+NeoSkRZ/7nNCiLsDIbYAAr+WtcrOtjWk0/udgIv/p
	ACVop+8zoLffdalvY1Dldh8roESZC7N09YOPk6jMXyBsEN8uRXv7szulqqAE8XoSK92p
	dwUPoiJTubt8hBe6HBHU9WBav3KYCCXK48JUm6EPE3iUlm8qzBY5dvNQPR0qnLifTDUM
	DIwxxdhE9GGsbFNbkVr+mL/ptpMNyvvIzJRPmCzaf/4FSmlT18xVn5gFcV0OPtORKeLW
	l24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=sphT987oNWVcrk5sTopQcuDF0QsRsU3AD4kfHefr138=;
	b=jI8Hl6IuZypMDSiayrymW+UePepou1cNfyuQis0cYg+HG/Kpi/HPngoue7ckpRoHqY
	0lWRXSsuDXK0TXC5azMaOIYO9jgtAoKEhJ13dQc7nzQj4AqmspdOsNFNOXPX9uqDhCBt
	9ZY8Q96fKyKuc+6RMFYjX7bKrXUOdHXJdyT0ac+k+mexbo1Eu/mPfOGCHFFxxLPidtVN
	lPFNUk5dMHTm5FSpJvJgHBSF4qhSyTZZ3UD0Q9J+OGsJnM3u75O+8osYOQwZAsh6c5T7
	y1IeObK27aYgPSoD9Qylgea4wOlyrATssF2/ZkLa78J+VjMF3L62h5znnP1xi5ZTsySN
	ZvOQ==
X-Gm-Message-State: ALoCoQmIglfmWzofXzVtqcfY4NEVKTRbKrL+EDLAFqI0RBH1pWKQgkMjLtEpPC3ybTrFDnk0hNOW
X-Received: by 10.50.30.69 with SMTP id q5mr3938239igh.78.1447862800980; Wed,
	18 Nov 2015 08:06:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Wed, 18 Nov 2015 08:06:21 -0800 (PST)
In-Reply-To: <564C9DE1.5090900@linux.intel.com>
References: <cover.1447840091.git.alexander.kanavin@linux.intel.com>
	<1447861138.12500.83.camel@linuxfoundation.org>
	<564C9DE1.5090900@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 18 Nov 2015 16:06:21 +0000
Message-ID: <CAJTo0LZWe_YvJ4cwz1t6eziowKfD-q8eAN9hW+pmxJ_vOsx4vg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/8] Deprecate package_regex.inc and split it into recipes
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
X-List-Received-Date: Wed, 18 Nov 2015 16:06:41 -0000
Content-Type: multipart/alternative; boundary=047d7bdc1c0cefce330524d2d3f1

--047d7bdc1c0cefce330524d2d3f1
Content-Type: text/plain; charset=UTF-8

On 18 November 2015 at 15:48, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> This may break upstream versions checks for a while though, because there
> may be code accessing these variables that is not in oe-core tree.
>

We can coordinate the merge with fixing the RRS and so on, and the bulk of
the logic *should* be in oe-core itself now anyway as part of
distrodata.bbclass (and the code it calls in bitbake).

Ross

--047d7bdc1c0cefce330524d2d3f1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 November 2015 at 15:48, Alexander Kanavin <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander=
.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div id=3D":l1" class=3D"a3s" style=3D"overflow:hidden">This may brea=
k upstream versions checks for a while though, because there may be code ac=
cessing these variables that is not in oe-core tree.<br></div></blockquote>=
</div><br>We can coordinate the merge with fixing the RRS and so on, and th=
e bulk of the logic *should* be in oe-core itself now anyway as part of dis=
trodata.bbclass (and the code it calls in bitbake).</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7bdc1c0cefce330524d2d3f1--
