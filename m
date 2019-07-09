Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 442526B513
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2019 10:18:25 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id g67so2611800wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2019 03:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=ENMUwZHwVfNHlErc97act0t/jGRStmrLqHY15brWBZc=;
	b=gzzNwbNGJLcoPL8l1aZYb8wDSEkGS+2Z0rNL14XEokbsAcs5HTLI1IcQT0UFqCv7nb
	9wUwID0/1bMG0SA4fLR7iWfMnCBcmsH8MPX9rL0t1B9Um7M5xtXqox2m6J9SxoOKL5Ln
	eAgEq+CvuYSWSs0/alDlTK0QoMgANTHA2Wzzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ENMUwZHwVfNHlErc97act0t/jGRStmrLqHY15brWBZc=;
	b=r32to8bfkR6/Li+NVSzeNXOtRJXo6KdVJC18FAQsZseWfex9yiJgKVLUdpY1VENKN/
	76MdVAA/5fRm3Lw/e7B3fycQ/HyFN85nJX7uXoi7Unhp3D/Ev0ONw0q0pBYopmCNGE0I
	wnOzDtEyfgp0baG9sZKQgaRlfphNuEazau6l/GMkN72UhMzwJYPU92a+TzAVCFxv0Z6M
	GUdJRvh8ExpcNcj0IXVKFFWvceHinzZXMl51O8656y2eATh/ODpC91NwU+XvcbtsjvgY
	FYlFSnFDn27OM9JCldtcTQ25bBhvPA4PHoy1h5hUYLlNpkFMhtcj3/1pCzY0oOC3SucP
	WaJg==
X-Gm-Message-State: APjAAAXpC5ioo0l78Du9bDpiZCj9jzTFL22d2hYFBDmBw0JSYjh95iZs
	hB1rtZvsnJKzBdzVC/jLkBpFVf/SWHU=
X-Google-Smtp-Source: APXvYqxMbifIRHNS8QydGUfFdRnmP9ewz28lKFyzK0Hf2wTSXA48LcnsiuISiHPl27zCpjxwS65Jig==
X-Received: by 2002:a1c:6c08:: with SMTP id h8mr22576649wmc.62.1562667505940; 
	Tue, 09 Jul 2019 03:18:25 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c78sm2159593wmd.16.2019.07.09.03.18.24
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 09 Jul 2019 03:18:25 -0700 (PDT)
Message-ID: <bcfe62810b7e56c82606a759e50821547da6086d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ChenQi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Tue, 09 Jul 2019 11:18:24 +0100
In-Reply-To: <6a7b868b-348a-b747-4115-9e4089ad0232@windriver.com>
References: <cover.1562570956.git.Qi.Chen@windriver.com>
	<0dee845494880f0c201e79d6ee0f50390f183465.1562570957.git.Qi.Chen@windriver.com>
	<bffaaf84031568a924656bf092d9d17405fbef2f.camel@linuxfoundation.org>
	<62f74fe5-abe0-9d13-50ce-7660291180ce@windriver.com>
	<6a7b868b-348a-b747-4115-9e4089ad0232@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] buildtools-tarball: add nativesdk-libxml2-utils
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
X-List-Received-Date: Tue, 09 Jul 2019 10:18:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-07-09 at 17:36 +0800, ChenQi wrote:
> On 07/09/2019 09:38 AM, ChenQi wrote:
> > On 07/09/2019 12:47 AM, Richard Purdie wrote:
> > > On Mon, 2019-07-08 at 15:37 +0800, Chen Qi wrote:
> > > > For build-sysroots.bb, the xmlcatalog would not be in its
> > > > staging directory. Causing the following error for eSDK.
> > > > 
> > > > ERROR: build-sysroots-1.0-r0 do_build_native_sysroot: Command
> > > > '/PATH/TO/IMAGE/testsdkext/tmp/sysroots/x86_64/usr/bin/postinst
> > > > -
> > > > docbook-xml-dtd4-native-xmlcatalog' returned non-zero exit
> > > > status
> > > > 127.
> > > > ERROR: build-sysroots-1.0-r0 do_build_native_sysroot: Function
> > > > failed: do_build_native_sysroot
> > > > 
> > > > The problem could be reproduced by the following steps.
> > > > 1. Add in local.conf:
> > > >     IMAGE_INSTALL_append = " btrfs-tools"
> > > >     DISTRO_FEATURES_append = " api-documentation"
> > > >     INHERIT += "testsdk"
> > > > 2. bitbake core-image-minimal -c populate_sdk_ext
> > > > 3. bitbake core-image-minimal -c testsdkext
> > > > 
> > > > So we add nativesdk-libxml2-utils to buildtools-tarball
> > > > to ensure the existence of xmlcatalog. Also add it
> > > > to HOSTTOOLS_NONFATAL so it could be seen by bitbake.
> > > > 
> > > > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > > > ---
> > > >   meta/conf/bitbake.conf                       | 3 +++
> > > >   meta/recipes-core/meta/buildtools-tarball.bb | 1 +
> > > >   2 files changed, 4 insertions(+)
> > > > 
> > > > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > > > index 5e93f5c..2f64eae 100644
> > > > --- a/meta/conf/bitbake.conf
> > > > +++ b/meta/conf/bitbake.conf
> > > > @@ -517,6 +517,9 @@ HOSTTOOLS_NONFATAL += "scp"
> > > >   # Link to git-lfs if present
> > > >   HOSTTOOLS_NONFATAL += "git-lfs"
> > > >   +# build-sysroot needs xmlcatalog in order for eSDK
> > > > installation
> > > > +HOSTTOOLS_NONFATAL += "xmlcatalog"
> > > I don't mind the buildtools-tarball change but HOSTTOOLS is
> > > starting to
> > > grow to contain far too much random stuff which could impact
> > > reproduciblity.
> > > 
> > > Is there some other way we could fix this? It still feels like a
> > > dependency problem which we chould fix by adding a missing
> > > dependency
> > > although I appreciate its far from being that simple.
> > > 
> > > I wonder if there is a way we could teach build-sysroots to be
> > > cleverer
> > > about dependencies?
> > 
> > I'll try to implement it and send out a new patch.
> 
> Unfortunately I cannot figure out a good way to implement this.
> Could you please help giving me some hints?

What happens if we add:

${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'nativesdk-libxml2', '', d)} \

to
`
meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb 

?

Cheers,

Richard


