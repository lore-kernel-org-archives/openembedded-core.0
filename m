Return-Path: <twoerner@gmail.com>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3C5B7745B1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2018 18:42:07 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id q5-v6so16703717lff.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2018 11:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=E8wsFP7jjy4X9QbUoYKL/uyu9CUNqP+ug8xQ4FC1f5c=;
	b=J1CHPki6RTDZal2V/Tr92BRDFGmKsacm5dRW17hLRVMAgoMBGdAU7kxELlo0Fl1lLg
	sfyoBAkGBu59dn4+6J2l1lXY4vD/xVYXvwNuhwb+kwE4RDjPuP82fGP6eYOI9/DJ737d
	/9NpaBnVXentOeZ7phwtrGIMHA+GwKnxLogcPmFlCNBJXVOwDypqpg0YRK0qXgNrwNef
	zkLwofcHIWJXcU1onuBLGRYFbnTIWftbkfS5FkDAKUBQ/TndLmR+0iB6c5ERXVBBMy3h
	bG7VU2RLvqZFGfbYGaH+3YFWF6RyqR3mqNFsMji1HpTbwmqHOS7xPjeS1c1azJ7stlle
	9Pdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=E8wsFP7jjy4X9QbUoYKL/uyu9CUNqP+ug8xQ4FC1f5c=;
	b=AKClbS4sbmGri19ysTVE18WBBwRcx1IIcynZPJ7pDa+cv3fhAA9hwSbbzRS1gwHTVR
	2wLai5Ff/doE6CErtw0VCodPqVyE5m08cPAVrGYU2YrSrrowfK8oD2C/eUTuRnxpSb/q
	Rt/j4ijELKEXYmFImewwbfa/tph5BT2xrvWUKFg/itYRxpgy9kOmPyeW7YIcepZgiwJ5
	khPnyUyES9HSEk9tkZSZ7BdNVmEyWL8RAMr+a19Dn7nfBFjN17WwB0167vHWC5EO2cKg
	9XhwUBHWgeEXp3IGi0rkExfK47zweajf6n34eCzsqdUxzO8bVufx0ieSm5rnbiuIZtsr
	65cg==
X-Gm-Message-State: ALQs6tDESTt7B+E1RfuAw5AytT2UZAB+SlWmpm7NsSGIOv2I1teyjPHO
	M2yBhvJ3mZxrsOoc06SFPwE7636dyQ1CuF8pm7Eh8A==
X-Google-Smtp-Source: AIpwx4+NYJBbLPupcrRlQGFJe2Ix5eQZ0QoI6Oy1Uv0T3tKBTUXyQR0E+3GhUv7GP12f7Lvy8GGT7Yq7WwgYN/dViuQ=
X-Received: by 2002:a19:2181:: with SMTP id
	h123-v6mr2608623lfh.81.1523731327858; 
	Sat, 14 Apr 2018 11:42:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:2984:0:0:0:0:0 with HTTP; Sat, 14 Apr 2018 11:42:06
	-0700 (PDT)
In-Reply-To: <CALbNGRSAMPf02-vWKrcX6j_K-My=e+Bw4RTwHRDHF9qcxz2JhA@mail.gmail.com>
References: <CALbNGRTAbsa9CzzXqtq7mpiknFzUB_=9eHcFHnD5W--HEM8bPw@mail.gmail.com>
	<20180402215705.GA25121@linux-uys3>
	<CALbNGRThT8S5bfJH=zXMkQzCMMasQ=yUoEXTjsfPXtncig3yFA@mail.gmail.com>
	<ada194d6-5653-fde7-a70a-64646b08b281@intel.com>
	<CALbNGRTthOp+_T-6c_Vc3qmgMHTt-2ztyDiGbNEHY4+6UuW2ig@mail.gmail.com>
	<CALbNGRQT94ptEPAygj+Rm9vBm27yo=inbz+O6nR2gL_etkGd7g@mail.gmail.com>
	<20180414101014.4bcbbc31@host0.betafive.co.uk>
	<CALbNGRSAMPf02-vWKrcX6j_K-My=e+Bw4RTwHRDHF9qcxz2JhA@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Sat, 14 Apr 2018 14:42:06 -0400
Message-ID: <CAHUNapTBgJgaaY4egm3rCFZHLpHKFbfSXK-PZ=Cn-Antxe1_XA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: kernel menuconfig broken?
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
X-List-Received-Date: Sat, 14 Apr 2018 18:42:08 -0000
Content-Type: multipart/alternative; boundary="00000000000087c4fb0569d35874"

--00000000000087c4fb0569d35874
Content-Type: text/plain; charset="UTF-8"

If everyone else is seeing issues, it makes me wonder why it's working
perfectly fine for me!

--00000000000087c4fb0569d35874
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><span class=""></span>If everyone else is seeing issues, it makes me wonder why it&#39;s working perfectly fine for me!<br></div>

--00000000000087c4fb0569d35874--
