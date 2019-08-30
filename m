Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id BAA7D7EC92
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 16:45:56 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id v15so8066002wml.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 09:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=tvVD1zOQtLOEJyipCSTztp8IVjPvdjB6ntiUVDcew+A=;
	b=Nh4t4Q9Xz9zUC+RTJmE9x2viwuLgjBwdVintvBL/e4X90at3QU1eJsMi5HD1hWEI8F
	8MzkWgLEtac6cF87d5tLkUB5ADvHz4RI9rmNHwixc0UWA1t3R4sYN+spWl0h/CPA1MnP
	E9IAfYGWbFHj4SoBVchfqmFRwR5jtHb7aiMeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=tvVD1zOQtLOEJyipCSTztp8IVjPvdjB6ntiUVDcew+A=;
	b=YAd4m09u76u18ELxoiuJU48Yp0O3+ohpnSRDKsLqqi493oP99vI5NrwT9+dAE1HfBO
	HbzekfrLF07XrT7Lq7PzsDDscSVwre0mLEjZFZEdg3KkSeIHW5/whhdc28iIvnFdo8hE
	wpnfFwsvxDMUbLHPrk+maP+xX3e1suzRwbMEI05Tw0mXByo9NfCwCsiyWfjU/BAh0g41
	yL4TPQeR7zqDVm6JP7XDk7jend9pTJyk+wYMkXoYwsKNGlRRWflhqUQDwM0/kyE1xutA
	3DBc5EQcW7rtX90fEJhalGJ+raReQW6lks3yPBUCfbW3X6swosxEt16XpuFlNMr0nXja
	d/fQ==
X-Gm-Message-State: APjAAAVWHasFme/lU6B6EdYA+JS4jmbV7Kdx/SFQYZu6rRy+t8W3JR4y
	02KsweME7WOwzrLr/AxD4DaufA==
X-Google-Smtp-Source: APXvYqzho13Qmsz+gcrgVJCuwa26pAtLd/bhSoaC06/HI+W7s8o+8YTn5ZAPd55PW0DBKjnm03TxSA==
X-Received: by 2002:a05:600c:2245:: with SMTP id
	a5mr19698799wmm.121.1567183557373; 
	Fri, 30 Aug 2019 09:45:57 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h32sm4792640wrh.62.2019.08.30.09.45.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 09:45:56 -0700 (PDT)
Message-ID: <c4e3f69a53cbc0a6e93970e3b4699447041e2aff.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Loic Poulain <loic.poulain@linaro.org>, Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 30 Aug 2019 17:45:54 +0100
In-Reply-To: <CAMZdPi_bvV1Lcg_V3U1HpA_tH1AzWtpa0YMRg4MsNEgsOzApiQ@mail.gmail.com>
References: <CAMZdPi_2=mFZFgwzUVis4BE7P3C4boOZmVB6_eYeLCaT0wLJaA@mail.gmail.com>
	<CAJ86T=XwwjSZR6oNdXCr=bvbOKw5trKWJ=na4=_+83vXXJo6Bw@mail.gmail.com>
	<CAMZdPi_bvV1Lcg_V3U1HpA_tH1AzWtpa0YMRg4MsNEgsOzApiQ@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Automatic prebuilt management
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
X-List-Received-Date: Fri, 30 Aug 2019 16:45:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-08-30 at 18:27 +0200, Loic Poulain wrote:
> HI Andre,
> 
> On Fri, 23 Aug 2019 at 20:11, Andre McCurdy <armccurdy@gmail.com>
> wrote:
> > On Mon, Aug 5, 2019 at 9:06 AM Loic Poulain <
> > loic.poulain@linaro.org> wrote:
> > > Say a company works with an OE internal tree, with open-source
> > and closed-source packages. The company wants to release the tree
> > so that its customers can fully customize the images/distro. The
> > closed sources being only available internally, the company has to
> > generate and handle prebuilt binaries for proprietary packages.
> > Ideally, with a unified public/internal OE tree (same recipes for
> > internal/public build).
> > >
> > > This question is actually similar to an older thread:
> > > https://marc.info/?l=openembedded-core&m=146779329804683
> > 
> > That very old thread was also referenced recently in a follow up
> > where
> > I shared a later solution, see:
> > 
> >   
> > http://lists.openembedded.org/pipermail/openembedded-core/2019-July/284896.html
> 
> Thanks, I missed that one.
> 
> > 
> > > I started to work on this and added a 'generate-prebuilt' class
> > which generates a tarball of ${D} in deploy/prebuilts after
> > do_install task. Symmetrically, It's also possible to create an
> > 'install-prebuilt' class which bypasses do_fetch, do_unpack, ...,
> > do_install with noexec flag and instead uncompresses a previously
> > generated prebuilt tarball into ${D} and continue normally. But I
> > would like something smarter, e.g. first trying to check if the
> > SRC_URI is available, if not switching on using the prebuilt
> > package if available (e.g. in a DIR_PREBUILT)...
> > >
> > > Before going further is there already an existing solution for
> > that? do you have any recommendation on the easier/best way to
> > achieve this?
> > 
> > I did initially try the approach of having a single recipe which
> > can
> > automatically support both building from source and extracting a
> > prebuilts tar file, but that (for me anyway) turned out to be a
> > dead
> > end. Building from source requires build dependencies and config
> > options but extracting a prebuilt tar file does not, so the two end
> > up
> > sharing very little... so 90% of the recipe ends up being
> > conditional
> > on which mode it's running in. The solution I ended up with (see
> > link
> > above) was for the class which creates the prebuilt tar file to
> > also
> > create a dedicated mini recipe to extract it. 
> > From my experience however an equally hard part of the problem is
> > the
> > distribution of prebuilts. It starts off easy (you share a tar file
> > via email or an ftp site and the receiver manually copies to their
> > downloads directory...) but that doesn't scale if you need to make
> > regular updates.
> 
> Very good point. maybe having binaries also in a repo could help a
> bit (e.g. using git LFS).
>  
> > My solution is discussed a little more in the thread
> > linked to above.
> 
> Your solution is interesting and I'll probably jump on the thread
> with more questions.
> Having an upstream solution part of oe-core would be nice though.

We'd be happy to have one, it will take someone to propose something
suitably general purpose that others can use along with tests.

Cheers,

Richard


