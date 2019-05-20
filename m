Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 78DC07DF42
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:58:38 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b18so14935057wrq.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=FtYu7r+iG5GR1a0jgSXZ7f1RMsBVtr7Enph21BNvNgw=;
	b=ZxebEpx2k9jFa1L3HQvlVSF6pT4qMPBcb+ectW97lzI2mb4y3aVQG1VngMY+CeBClD
	I11+Qftgg25T9Q2vV/+2ckO1Mfiqp1TUzJS3bv1C+tqcGAZJYK5RHgQDYp85h0B2gQnA
	IFDZe8emVem0238IA99mTiYtGmTGzkz4Yx1us=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=FtYu7r+iG5GR1a0jgSXZ7f1RMsBVtr7Enph21BNvNgw=;
	b=G9ag+DfanY5L15YkH4yUaeMzKITZh09glR7atqksUAgJA6z+bqXINWYp4SxPZROl+c
	wi1PFl0GhmeBj7NF7VrjwgFk2mGltfZRi/R9dZb+2QkT/di8UfyyamoKNUkn1ZXSRS8+
	vuD34KS1nTao8SDtS+cxftLSBG65ybb2PBb41e5MJgqhDCuK6UCFScLTEj7rEDYnpWg/
	B10PhYdRuLAD7vSGPL+MFEs+i5Z0nm5w3dPde3GBIEEb26NaUV7voqZT1rjTNhONCJIa
	15xyEq+wAJAKj8h48Ptj6vFgauBNXGh13+5jfvPMeUAn7K6VbxTiq9HgegyDTFGX2w9l
	0HTA==
X-Gm-Message-State: APjAAAXSVi33pBHMBgSfxQlm25ahjy4UZB3axFjK6IXli2MN02Zgb7vO
	PKULrtuwDYoIi/HcokIp6k4T1Q==
X-Google-Smtp-Source: APXvYqw1/D3xnAJINcnI08Og/EjSENGKKFLMGwxxcXaBMGMKGq19mLj7TSrw5BCSchd/XrW5js9pQw==
X-Received: by 2002:a5d:4206:: with SMTP id n6mr1105466wrq.58.1558364319148;
	Mon, 20 May 2019 07:58:39 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id x2sm5485507wrs.39.2019.05.20.07.58.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 20 May 2019 07:58:38 -0700 (PDT)
Message-ID: <f30563b2fc509da84367d21c936b83afc7a84c25.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Date: Mon, 20 May 2019 15:58:31 +0100
In-Reply-To: <CAMKF1sqHGoGBJC24_Btcfk3pyV1O_QOmpqy7SzndGZNyJToD=w@mail.gmail.com>
References: <1558136952-13094-1-git-send-email-alejandr@xilinx.com>
	<d77e4aca-3f48-5acf-058e-8dc3ffba5cf2@gmail.com>
	<fc518454-2565-ec27-8f0b-8c1c5832c2df@xilinx.com>
	<CAMKF1sqHGoGBJC24_Btcfk3pyV1O_QOmpqy7SzndGZNyJToD=w@mail.gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python-numpy: Avoid installing copy of f2py script
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
X-List-Received-Date: Mon, 20 May 2019 14:58:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2019-05-20 at 07:52 -0700, Khem Raj wrote:
> On Sun, May 19, 2019 at 11:56 PM Alejandro Enedino Hernandez
> Samaniego <alejandro.enedino.hernandez-samaniego@xilinx.com> wrote:
> > Hey Khem,
> > 
> > 
> > On 5/18/19 10:09 PM, Khem Raj wrote:
> > >
> > >
> > > On 5/17/19 4:49 PM, Alejandro Enedino Hernandez Samaniego wrote:
> > >> Both python-numpy and python3-numpy try to install the file:
> > >>
> > >> ${D}/${bindir}/f2py
> > >>
> > >> which causes an error during do_rootfs since the package
> > manager 
> > >> complains about that.
> > >>
> > >> The numpy packages create basically copies of f2py script with
> > the 
> > >> following names:
> > >> f2py (on both)
> > >> f2py2 (on python 2)
> > >> f2py2.7 (on python 2)
> > >> f2py3 (on python 3)
> > >> f2py3.7 (on python 3)
> > >>
> > >> Remove the copy of f2py from python-numpy in favor of using the
> > one 
> > >> from python3
> > >> to avoid installation issues at do_rootfs().
> > >>
> > >
> > > what if one does not install py3 ?
> > 
> > 
> > If you only install py2, you could still execute f2py2 or f2py2.7,
> > I'm 
> > simply
> > 
> > favoring the py3 installation by default but it should be mostly
> > harmless
> > 
> > since there's still two other copies of the script with different
> > names.
> 
> I think it should be such that it’s used from py2 if py3 is not
> installed since otherwise it might break scripts 

Given we're strongly favouring py3 now, I'd hope there aren't many such
users and if there are, this might encourage them to move to py3? I'm
not too worried about the lack of a py2 case for this as do we really
want to add the complexity?

If there are a load of py2 users and this will break things for them,
fine but are there such users?

Cheers,

Richard


