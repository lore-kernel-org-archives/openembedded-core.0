Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f171.google.com (unknown [209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id A94C865EA8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 16:58:39 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id x13so6169924qcv.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 09:58:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zHuMYcxXwJvgLzeVMTn22heBOzc7FyvugyQ7B4mVx5g=;
	b=HA1Hhup4VXRR2rIR/MxAoymrkc4mHHI5cqUEyPVaBdA9qp6dICkFg5Z1P6EjO+O1hh
	W8PGQjuezvSapguhga1c46gNdvCdAIfH5w1yyDrVcXqfhrB4CqMiJ8CU+oXC2eaX+ES0
	giVmdLTbRJIByVH5V431T9jYWseunPwdo7uCqD5jRVlPtx+xDQgZ30wh00RuvFUdfcvx
	Ajrl9ostkIQjBYZhuk0sLmn4LPo52UT1CzVfWQRleRGDVInw0he+FZu3f4F8ti++Y1E6
	QiRVEFWOMQ+ECBLR6wRjECbxPQ2bxuvKKdlBUXSZgzSxSpwj8qstjh1gDXeZpPTlH4Fw
	hG4g==
X-Gm-Message-State: ALoCoQmpYWK5QBmUOC/2u1X07dk6vSVz9Hl1H+tBJOC6Px7+Ul71W2b0q6AqHbZ/1kifbHqFBV5G
X-Received: by 10.224.166.73 with SMTP id l9mr18755640qay.34.1400777920022;
	Thu, 22 May 2014 09:58:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Thu, 22 May 2014 09:58:19 -0700 (PDT)
In-Reply-To: <537E25A9.9080106@intel.com>
References: <cover.1400690725.git.valentin.popa@intel.com>
	<537E25A9.9080106@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 May 2014 17:58:19 +0100
Message-ID: <CAJTo0Lb6Wa8tdyjB7yPK7w_PLuaKq9OKZAU8W+cXds+nt4PbeA@mail.gmail.com>
To: Valentin Popa <valentin.popa@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] [V3]mesa: upgrade to 10.1.3
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
X-List-Received-Date: Thu, 22 May 2014 16:58:40 -0000
Content-Type: text/plain; charset=UTF-8

For these three patches:

On 22 May 2014 17:28, Valentin Popa <valentin.popa@intel.com> wrote:
>>    dri3proto: add it to oe-core
>>    libxshmfence: add it to oe-core
>>    eglinfo: patched to compile with mesa10+

Signed-off-by: Ross Burton <ross.burton@intel.com>

Mesa needs more testing, but these pieces are good to merge.

Ross

