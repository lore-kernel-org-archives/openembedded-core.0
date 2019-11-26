Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id 848497FCB4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 18:17:14 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id y21so8653227pjn.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 10:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:user-agent:mime-version:content-transfer-encoding;
	bh=njD8vCtBz0Tpg1/13sscqxMbMWDQRv9Y71tpNRpxuN0=;
	b=F3hdSP4ns/5p880DtgRGFds9JPLTEbr2WP94c+KCukYHuPrrD4HA9cXRtTPrxnJTKk
	X4zR4nVku9ujCwWxb4mSOulsuqnA7rmoW48QBSoiMV6nTKPYa8FdLXKvKeGCdA0riFiB
	/tvPBULmTFjXYqM8lFmPI0bz2CTFQKAJc0ubyRNWExDZIzWucfxEMlCr3kh8d8I4Avkm
	qZPzxtjIybmVFlcPuwwtQg3pidSYEGyG/e35hbBADoRVxyGOpobblfbXY9+VswreGREK
	LVFZ4bW2Mp357M3hOGPG+4bemB1rbT8InTO9SeYq607qA/98sNCN9bHXWMryFizOjHN2
	xqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=njD8vCtBz0Tpg1/13sscqxMbMWDQRv9Y71tpNRpxuN0=;
	b=TH9dLHMoFrYP+Lm/qxGG9ixdA6+KhVRxY1vxFSoLvAMSaxT7e2eJi0Ip64gn3h4WQe
	Oseo2maWwXPSnHCaCJZQXnNrDhlZdk/NcC12HqUCC+6/6WcJpm0mHyFB1HvCktKlUTXM
	gU7tbz2VKwUz70Ik0qBaRiSHhMxrAHGPfTxTU8FhT7JM2stpLXJJSf9T1U1iX7Ta02zC
	jjz3zX5Q15ba3kK1kcOZkVwviTaooL8zbT3x+PJFy6xifKtPODhVtZdWbOatqYAngIqv
	bBDXlHOWWwqM6rD8ypmXg05j8qBDcUzpH2INiynxUp5u2H/0M5wdko75kPdvHZcZApcI
	fHWg==
X-Gm-Message-State: APjAAAXgmn1NWg7cSJtWwVM0s5c4HseOhQPNbKkAlh3kKmY4dsAIly8n
	pkMi6m3mEWcfvy8JOV4kN6IW5/L+PaI=
X-Google-Smtp-Source: APXvYqz1QU9H+pz4ol7DfnYqkqykpTZpsxefAl7QC6ggn8S8YGzgrR7p/zPOMFVb3BNmE28mlVWXwA==
X-Received: by 2002:a17:902:6802:: with SMTP id
	h2mr34921953plk.135.1574792235120; 
	Tue, 26 Nov 2019 10:17:15 -0800 (PST)
Received: from apollo ([2601:646:8500:1c20::e439])
	by smtp.gmail.com with ESMTPSA id
	p18sm13588608pff.9.2019.11.26.10.17.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 26 Nov 2019 10:17:14 -0800 (PST)
Message-ID: <0c6015a022140c820803a3963ef33af984f19c8c.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Adrian Bunk <bunk@stusta.de>, Ross Burton <ross.burton@intel.com>
Date: Tue, 26 Nov 2019 10:17:09 -0800
In-Reply-To: <20191125211027.GA32080@localhost>
References: <CADySD0HN_q_ffonmJJAmHJvjcRUHrDrhzo6zoWd8vYZUZzd_Tw@mail.gmail.com>
	<e92b8e21-99c6-c2c9-646a-b3a2e76d90aa@intel.com>
	<20191125211027.GA32080@localhost>
Organization: HIMVIS LLC
User-Agent: Evolution 3.34.2 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Very large size of libraries in core-image-minimal rootfs
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
X-List-Received-Date: Tue, 26 Nov 2019 18:17:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-11-25 at 23:10 +0200, Adrian Bunk wrote:
> On Mon, Nov 25, 2019 at 07:26:58PM +0000, Ross Burton wrote:
> > On 25/11/2019 18:37, Ankur Tyagi wrote:
> > > Hi,
> > > 
> > > Based upon "thud" branch, I created core-image-minimal for
> > > am335x-evm
> > > board and resulting image size is very big(71M)
> > 
> > If disk size is important then a good first step is to use musl
> > instead of
> > glibc:
> > 
> > TCLIBC = "musl"
> > ...
> 
> musl is mainly useful for tiny systems, a 40 MB partition is such a
> huge
> amount of space that the size of the C library no longer matters
> much.
> 
> The size benefit of replacing glibc with musl is around 2 MB.

I would refrain from labeling as useful for tiny systems. since
static size is one thing, there is DRAM behaviour which is equally
important, how malloc and other resource oriented algorithms behave is
important as well.

secondly, if I have 40MB partition, one might rather want to use extra
space for implementing features in their product than spend it for
enabling the system if they can.

there are many other design considerations where musl might make more
sense

> 
> A partition with an -Os build of Yocto with glibc+systemd (sic)
> is around 9 MB, together with bootloader and kernel this all
> fits in a 16 MB flash. Use compression for kernel and root
> filesystem and everything fits in a 8 MB flash.
> 

-Os is not as well tested option as -O2 is. So we should always
recommend it with grain of salt, speaking from experience there are
bugs that will show up with Os which you wont see with O2 and leave a
bad taste for user

> > Ross
> 
> cu
> Adrian


