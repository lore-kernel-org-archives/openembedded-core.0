Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5FB37799CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 16:05:36 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id k12-v6so13288122oiw.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 09:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rDjEdnbROQLX3my01xPM2VwfEN9aBBPBfK9oiFuib6A=;
	b=rDdNyBrIH47vNFeN+uZW3GaP7ZKLkyUxoDEsOqQD0lAOlzS9QfutFeNYVkyiIWqFDw
	DdLlE97uXspMTquMMx1fAUZ3L1jCOVXkbtC9OquzVf3PYAX/M8gR1Qnv8L+djKiQ2m1o
	Z9hmOLbb8afL8H4wWyranyv4GHT7fm3WYc+1aGSpJAhxcKyXa8CUhSnRiEutydjhXsUF
	NwuPy7NSrgR+Tm45IUTz+5KqZ4+iFuu0QKP2AbFKHiNhRneA3Ngqsq92gvJx2WyErvjP
	XZrowJr93KKUPOenXiaGlSVDm7aFdNuHoMEhPpsA6PD9VvTvzkHBKekwOcHGTnPBC5AU
	2j3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rDjEdnbROQLX3my01xPM2VwfEN9aBBPBfK9oiFuib6A=;
	b=SltPMfosyBtSi5csqinUUpeBTW3NMNxtfhGqcHndtqqF8WAkMyrGzwcQgv5Ei9tshM
	y2nhcZlD9dHbgbfnG0mcL69tqD7OHUGANk+I1Ur94LDH5FITSr2VLFBCB6gbarzHi/bR
	yCmHZUmZuDR5y1Q3T+D3okj5eTfM2IeuOsWAkBvzUbjNrLUGzPHtG8tj27gJYq4NA1s3
	Yx+Y9jFAgiVzA14N3l/xDQlxeKgfZhND97Cm6II4HTEp/jLG3xmJZ4j3E28/HwrIdKKX
	o8V8SbGGPHeqSpAc3Gdrf1uFRKeJHMr5HA6BIHP4v5kqV9vffB1VPrGqbwMhmhbbxUJD
	I/7Q==
X-Gm-Message-State: APzg51D0Hz1+SFgXPIUsqQnBMd+rQS0+dub1fBcW3mHhRw3JyLeFy6VP
	B5bMbozmPJQzMcHfKdPm8l1+eEA8cGnnQvOcEGizSQ==
X-Google-Smtp-Source: ANB0VdbK9jkkAU9pX22SdjD1kVQF7lYQ1cNRLkJxqkhMPFY49qGGdFzL4BWzXDTin1xBk1rnqJW5W2Gwq0iary9xIbc=
X-Received: by 2002:aca:6cd5:: with SMTP id
	h204-v6mr9637084oic.140.1536941137491; 
	Fri, 14 Sep 2018 09:05:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:7ac:0:0:0:0:0 with HTTP;
	Fri, 14 Sep 2018 09:05:16 -0700 (PDT)
In-Reply-To: <CALLMt=pHOQHswPeLF-rWpA2QXmtkL8Hc9RKav_j6tF1MuozVoA@mail.gmail.com>
References: <1536868179-5111-1-git-send-email-geissonator@gmail.com>
	<CAJTo0Lb8EDKyH16i5JcpyTQuLG1vPZaxes=B3hUM3=zn0_chsw@mail.gmail.com>
	<CAJTo0LZoPhfR4Ahd_CqXeouPfHoH8+zth_3qr6__rd2xCg2Y9A@mail.gmail.com>
	<CAJTo0LYBrnBuL-jTw6cDXf6qztp8H5YpphBgsrrUyUuaQ-KoyA@mail.gmail.com>
	<CALLMt=pHOQHswPeLF-rWpA2QXmtkL8Hc9RKav_j6tF1MuozVoA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Sep 2018 17:05:16 +0100
Message-ID: <CAJTo0LZqrgAeRbsJtW=G1f58CNSRYS8r_9Nm-4K2G1KstvA4Kg@mail.gmail.com>
To: Andrew Geissler <geissonator@gmail.com>
Cc: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python/python3: Move test files to test package
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
X-List-Received-Date: Fri, 14 Sep 2018 16:05:36 -0000
Content-Type: text/plain; charset="UTF-8"

On 14 September 2018 at 16:13, Andrew Geissler <geissonator@gmail.com> wrote:
> Nice, thanks Ross!  Looks good to me. Will you be back-porting to
> python2 as well?

Struggling to be motivated for Py2 to be honest.  Do you fancy
duplicating the changes for Py2?  Alternatively I'll get around to
doing it next week.

Ross

