Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 21F1D76FF2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 20:15:21 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so57883132igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 13:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=YTnspAd5Yekp4ZwEQsdmSAXbI8MKbfmj8dAbkXHWdmE=;
	b=lMa9LLnj5IKog+d2d77cOPvhoTxSd0SJPmaLDLKSkXBnJuP60a2V4zTRxFq1fU1KP2
	wa5VD3FEbWMHeitAlpFFnTKpDDRZM+bDIIpHU2AQfygqxpoNUbYg+aiSaWjWoW1Bc+4s
	MTV8x5PR13UDZ0Mzc3g8zaeMiq+W48pR6B+SzkMgYAhRrHmoFU/HjEwZG0b4LcB8IFRB
	YP/TINKbzpkmroggw1tYZYTnJ0sHLrMDv7k7RoLn3RnhGuXabhCiNv7esih4cM42+PGV
	VtcvcCAUhW+aAEfuuqSFCiG1QsKwune1N9+Ez1k5NBDJxEeNCBJLT+c0UpeBIUIKYdf7
	T9gg==
X-Received: by 10.50.55.73 with SMTP id q9mr1927697igp.11.1441311321694; Thu,
	03 Sep 2015 13:15:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.202 with HTTP; Thu, 3 Sep 2015 13:14:52 -0700 (PDT)
In-Reply-To: <c8274a56a32fedca57f68f757c27acf0525b98b4.1441293149.git.alexander.kanavin@linux.intel.com>
References: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
	<c8274a56a32fedca57f68f757c27acf0525b98b4.1441293149.git.alexander.kanavin@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Sep 2015 13:14:52 -0700
Message-ID: <CAMKF1spvHGZ_+4fNNZ-qNJJni_Rz2dOFPF0QJydx3K_cxt6kGw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/12] uclibc: update PV to 0.9.33.2 to match latest upstream release
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
X-List-Received-Date: Thu, 03 Sep 2015 20:15:22 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 3, 2015 at 8:34 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> -PV = "0.9.33+git${SRCPV}"
> +PV = "0.9.33.2+git${SRCPV}"

technically its not right since we are not on 0.9.33 branch at all.
We could use 0.9.33+0.9.34+git${SRCPV}

