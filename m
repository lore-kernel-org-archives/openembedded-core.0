Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3B85D7FB1F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 11:14:33 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id u2so1637635wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 03:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=e9b323iohis3aQBZF1+YAnSH4UVD6MBwT8HI7vWhdco=;
	b=K7vJFcLK6/AF6y5W0An3n8Wm4gJW0e0B78qbJ2N/MgvXX06MGE6FuRlJ+m+9tQbWQY
	4RGV9dwN36oYbAjS1CT9a/K7z0KjLyrygfnKi7E6XUJACvLqq8i7d+5QUec9NTRowOwF
	T7THhJVAjrvLVU1OUv+wbZDcPV3Ld26OehmPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=e9b323iohis3aQBZF1+YAnSH4UVD6MBwT8HI7vWhdco=;
	b=Cx2BxeU7kAerP8I3cAfbcBVXakIF+BPKIWgY16upQJwz6kVmRpyZLX8eZJ4SNQasMz
	muDs7DTcrSYk00+XQgyGsBYxKWJbQgZfVpBL4tUUzZwPoLRNDx4E7AWCMMBolUMz4bHg
	qnWFAVx4xxD/SQ3aIn1nrmg6b1STx55wTTuxQ4lDl60ZMHac1nhXqYqWI/j/fRdh3T32
	vDtVCGgO5MBTE9aZsatufwDT5aKNBDtWAclaKdxeCiQfFFm55D/InrpKf4iKC1D0VSIg
	BPMREMM7FuEUY2QNy4/6LtArAamsb5alN3ppJ9fEZhHvDAfo0ihI99P/6RuwmufEMtHf
	7i+w==
X-Gm-Message-State: APjAAAVdNJ61Nc+A+VTGtDRn30hzUVMEhNweO+cDQ5CcDcRUkFmicAnn
	nXQMBEIGs1EkYAcHP9i6W3tC3w==
X-Google-Smtp-Source: APXvYqwICXf7SEypeofT8Qzl24uhUNADkvzekv2rt0kl2XWRSx4Vxi3ckG0yiXumdGZ4dopCnE7eqw==
X-Received: by 2002:a7b:cb91:: with SMTP id m17mr3826526wmi.146.1577790874758; 
	Tue, 31 Dec 2019 03:14:34 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id p18sm2272064wmb.8.2019.12.31.03.14.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 31 Dec 2019 03:14:34 -0800 (PST)
Message-ID: <9e6b11194ab1d59e6a1eac574471cbf2a041aa31.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alistair Francis <alistair23@gmail.com>, Alistair Francis
	<alistair@alistair23.me>
Date: Tue, 31 Dec 2019 11:14:32 +0000
In-Reply-To: <CAKmqyKN=9HZ78bGpsOumv9vDiWOsz59eUiNgBfH2ns+bhY1qUA@mail.gmail.com>
References: <20191221063648.24227-1-alistair@alistair23.me>
	<20191221063648.24227-2-alistair@alistair23.me>
	<CAKmqyKN=9HZ78bGpsOumv9vDiWOsz59eUiNgBfH2ns+bhY1qUA@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 2/2] mesa: Upgrade to 19.3.1
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
X-List-Received-Date: Tue, 31 Dec 2019 11:14:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-12-30 at 17:05 -0800, Alistair Francis wrote:
> On Fri, Dec 20, 2019 at 10:36 PM Alistair Francis
> <alistair@alistair23.me> wrote:
> > Upgrade mesa to 19.3 and refresh the patches.
> > 
> > As MESA_EGL_NO_X11_HEADERS was renamed to EGL_NO_X11 in [1] we are
> > going
> > to change the do_install and add a patch to libepoxy to use the new
> > define.
> > 
> > 1: 
> > https://gitlab.freedesktop.org/mesa/mesa/commit/6202a13b71e18dc31ba7e2f4ea915b67eacc1ddb
> > 
> > Signed-off-by: Alistair Francis <alistair@alistair23.me>
> 
> Ping!

Sorry, the delay is that the patch is non-trivial and doesn't apply
cleanly. I think I have it ready to test in -next now.

Cheers,

Richard


