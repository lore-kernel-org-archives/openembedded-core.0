Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4BA507F3D3
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2019 13:42:17 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a15so70642269wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Aug 2019 06:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=IRkLQemf+HIpAoID34UXi5z3YQpaf1Z0MxiIOIgoHG4=;
	b=B9cz1UGlzfqVE6JAgjH2tQqDzzfy3HInqbP63RNyS3W3YAbm7S1TYHflfSj6rqILjG
	bXkeOHkp8Lxb+UjtZRc+/UHF/ZScqkWXUtKHnVLD63ZnlTAoV83Vd1TXnu0RNp+DbPAF
	i20A7tEkePBehxp5gNpHIcpx3eun0h+8UNXqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=IRkLQemf+HIpAoID34UXi5z3YQpaf1Z0MxiIOIgoHG4=;
	b=DrOQ0Cjy7wbiKAaB2rt32jc5Yi1A79M9pxxtO7vmuL/VMof2EQetZ7KPq0x5G9Qjy7
	lsfIl8ruOAx0ZEQxKFgldpZ1/bJIr0CgqjReDTk86/H5mQkFesubv8o9bpfTd8aOHm0C
	yYhVS2hSipkpCh8Mt3xqAdPP5armDQpdfWmDBhXoFD7/cKe5veueQmvhENcvLYpfamm4
	Nyngd6G65F0csUN1L1om+gGs5gY7MYuwOqkMLS0xYBp5BH/yFSE01roOj+mDB/+taPFg
	SfoWBCxHbTkJqe2cK96O41/Uwda7LEBw+q6KN3C+BYHmuYg48zmMXRxq8wlaE9a8wenU
	aEIQ==
X-Gm-Message-State: APjAAAX29X8CGhmxZObK0KKSIHR2LhktV4ks8iDbIR1hbedhp+HUEH4f
	BPpXGwAe6dsOMBFs5NyOqJj2XQ==
X-Google-Smtp-Source: APXvYqzDULFayvK5QUlzTldEd9dXXbcAEzrh6eBVmpUqdtFNH2elX3qI/cgDWOEtFC/2EUpOb1ID3A==
X-Received: by 2002:a1c:be05:: with SMTP id o5mr9736607wmf.52.1564839738022;
	Sat, 03 Aug 2019 06:42:18 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x16sm58352470wmj.4.2019.08.03.06.42.16
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 03 Aug 2019 06:42:17 -0700 (PDT)
Message-ID: <a8e8972184dcac7be154510d1ac49f38d5979d89.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Khem Raj <raj.khem@gmail.com>
Date: Sat, 03 Aug 2019 14:42:16 +0100
In-Reply-To: <CAMKF1so97t0zFsDB3PRaGaXD=VeTn8159WZojW29ctTEngyzYg@mail.gmail.com>
References: <20190731174820.16459-1-raj.khem@gmail.com>
	<20190731174820.16459-2-raj.khem@gmail.com>
	<232eed90aa6b376d8505d94f0b51e9352101fea7.camel@linuxfoundation.org>
	<CAMKF1so97t0zFsDB3PRaGaXD=VeTn8159WZojW29ctTEngyzYg@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] llvm: Update to 8.0.1
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
X-List-Received-Date: Sat, 03 Aug 2019 13:42:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-08-03 at 05:13 -0700, Khem Raj wrote:
> Thanks for taking care of this I noticed this failure last night as
> well 
> 
> On Sat, Aug 3, 2019 at 3:53 AM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2019-07-31 at 10:48 -0700, Khem Raj wrote:
> > > Add missing dependency on libedit
> > > 
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/recipes-devtools/llvm/llvm_git.bb | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/meta/recipes-devtools/llvm/llvm_git.bb
> > b/meta/recipes-
> > > devtools/llvm/llvm_git.bb
> > > index 0067635c2b..6d3d69b9fb 100644
> > > --- a/meta/recipes-devtools/llvm/llvm_git.bb
> > > +++ b/meta/recipes-devtools/llvm/llvm_git.bb
> > > @@ -8,7 +8,7 @@ SECTION = "devel"
> > >  
> > >  LIC_FILES_CHKSUM =
> > > "file://LICENSE.TXT;md5=c6b766a4e85dd28301eeed54a6684648"
> > >  
> > > -DEPENDS = "libffi libxml2 zlib ninja-native llvm-native"
> > > +DEPENDS = "libffi libxml2 zlib libedit ninja-native llvm-native"
> > >  
> > >  RDEPENDS_${PN}_append_class-target = " ncurses-terminfo"
> > >  
> > > @@ -19,12 +19,12 @@ PROVIDES += "llvm${PV}"
> > >  LLVM_RELEASE = "${PV}"
> > >  LLVM_DIR = "llvm${LLVM_RELEASE}"
> > >  
> > > -SRCREV = "d2298e74235598f15594fe2c99bbac870a507c59"
> > > +SRCREV = "19a71f6bdf2dddb10764939e7f0ec2b98dba76c9"
> > >  
> > >  BRANCH = "release/${MAJOR_VERSION}.x"
> > >  MAJOR_VERSION = "8"
> > >  MINOR_VERSION = "0"
> > > -PATCH_VERSION = "0"
> > > +PATCH_VERSION = "1"
> > 
> > I had to tweak MESA_LLVM_RELEASE in the mesa recipe to match this
> > change...
> > 
> > (squashed into this patch in -next)

Unfortunately there is still something else wrong:

https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/901

Cheers,

Richard


