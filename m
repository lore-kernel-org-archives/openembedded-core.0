Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7E36B60B59
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 22:59:16 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id d5so118086pjz.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 14:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:user-agent:mime-version:content-transfer-encoding;
	bh=D0EOqWlmgqK+dsudD2ihb3DszwrH7yrvizNUczpuIDU=;
	b=AKDfoZ2gO7sJ/bHdLK6+hYH1Xdxi8KBELySIo0Bcn4DrhWWFkMDMKEuIqflNd8CCJM
	nhU/6tXuq0lVNzCXzPqV3tmLZ8moJ1A8UBSeaHpndssxsjgHRf0L6bv4NlrUoxMIUFII
	rAK620cjJTcGb7b6ZBp31yN16G1QpYc2X4VgMLJP13RcoDXpjB+suAWJX9ppc4bD9vui
	3pg8+n55KNM7azjAGKYN+rPUUJTzk74/+zj74o7V5/veQ75Hbfu8Eivn+Z5iVHxEizYY
	G6ST8DklGF8RKtB4aDCuIi5vsIgc0TETObwme9g87U0sWAef6gi/opH1xRbWe1AY3VtL
	EZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=D0EOqWlmgqK+dsudD2ihb3DszwrH7yrvizNUczpuIDU=;
	b=QE4PUMEX9j2L+z8bsejKnXeHAGujX0/E2xBbvXthVE03O45/5jb25Rh8r8PRuXIu1D
	z7G0zBmIhNEINrEKXtNROuBThnUeyztmMtsFnTzjbXcH6Qhkz4aXa4sUnHFRmNR9pwN2
	03xtAO5y2G1TulzTv2huXxUW9e/ygD6YjxW4C1RGIYct/DbMSPvFb97MOxnC0XJF8vnI
	GmJSNtUJAT0Dh7AeQgKch18b+lhSqYDD8GcoIpuLKlyacbmwDbA9ip8OVl7nMcw6Igw/
	lQv3te/UrHX1VOfupPEfBk626GLoNSFSN262WOGL8Sv+uoA0vf5y4Eg/5hcF/24THML+
	Lkxg==
X-Gm-Message-State: APjAAAXqjIsVlEZzyFdWN/4YbuSwVTAjNMcaoL7b+UUgyRx2mRIKY0OM
	eecdfdmCk7GCT1paYJssHmc=
X-Google-Smtp-Source: APXvYqyFnZ+aRBubn/Wib/Fu7H1KpB7jf1xdM0h7OZAPoZz79fsIuLq2GLrTSrE6E0VIVO3KmghQ8Q==
X-Received: by 2002:a17:90a:a385:: with SMTP id
	x5mr6371847pjp.102.1582239557135; 
	Thu, 20 Feb 2020 14:59:17 -0800 (PST)
Received: from tyche ([2601:646:9200:4e0::ebc])
	by smtp.gmail.com with ESMTPSA id e7sm618109pfj.114.2020.02.20.14.59.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 14:59:16 -0800 (PST)
Message-ID: <acbdfea541a138a724d823cd991c0c707508557c.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 20 Feb 2020 14:59:15 -0800
In-Reply-To: <CAJdd5GaOhQsES_1w63qoVpRS6Yn9adNMsv01PcxS0T_t1cMwOg@mail.gmail.com>
References: <20200220185150.23422-1-JPEWhacker@gmail.com>
	<e81900d2-4692-ca05-841d-d2fbceac70c2@gmail.com>
	<CAJdd5GYXyaT+YnRTs4nvRucini2QEYMbBNRoBcrVu9SSpTr9Eg@mail.gmail.com>
	<CAJdd5GaOhQsES_1w63qoVpRS6Yn9adNMsv01PcxS0T_t1cMwOg@mail.gmail.com>
Organization: HIMVIS LLC
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/meson.bbclass: Explicitly mark functions as missing in MinGW
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
X-List-Received-Date: Thu, 20 Feb 2020 22:59:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-02-20 at 16:50 -0600, Joshua Watt wrote:
> On Thu, Feb 20, 2020 at 2:44 PM Joshua Watt <jpewhacker@gmail.com>
> wrote:
> > 
> > 
> > On Thu, Feb 20, 2020, 1:30 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > 
> > > 
> > > On 2/20/20 10:51 AM, Joshua Watt wrote:
> > > > meson (with some help from GCC) misdetects certain builtin
> > > > functions as
> > > > being present on MinGW, when in fact they are not. Fix it by
> > > > explicitly
> > > > marking the functions as missing. This requires rearranging the
> > > > meson.cross file to put the [properties] section at the end so
> > > > the
> > > > append works properly (meson can't handle duplicate sections).
> > > > 
> > > 
> > > patch is fine workaround, but I think meson should look for
> > > strndup in
> > > string.h
> > 
> > Agreed. I think the upstream fix would be better, and I will look
> > at that also.
> 
> Fixed in 
> http://lists.openembedded.org/pipermail/openembedded-core/2020-February/293233.html
> if that is preferable.


sounds good. Thanks for taking time to fix it

> 
> > > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > > ---
> > > >   meta/classes/meson.bbclass | 25 +++++++++++++++++--------
> > > >   1 file changed, 17 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/meta/classes/meson.bbclass
> > > > b/meta/classes/meson.bbclass
> > > > index 06034e8b47..5c74658d01 100644
> > > > --- a/meta/classes/meson.bbclass
> > > > +++ b/meta/classes/meson.bbclass
> > > > @@ -96,14 +96,6 @@ readelf = ${@meson_array('READELF', d)}
> > > >   pkgconfig = 'pkg-config'
> > > >   llvm-config = 'llvm-config${LLVMVERSION}'
> > > > 
> > > > -[properties]
> > > > -needs_exe_wrapper = true
> > > > -c_args = ${@meson_array('CFLAGS', d)}
> > > > -c_link_args = ${@meson_array('LDFLAGS', d)}
> > > > -cpp_args = ${@meson_array('CXXFLAGS', d)}
> > > > -cpp_link_args = ${@meson_array('LDFLAGS', d)}
> > > > -gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
> > > > -
> > > >   [host_machine]
> > > >   system = '${@meson_operating_system('HOST_OS', d)}'
> > > >   cpu_family = '${@meson_cpu_family('HOST_ARCH', d)}'
> > > > @@ -115,6 +107,23 @@ system = '${@meson_operating_system('TARGE
> > > > T_OS', d)}'
> > > >   cpu_family = '${@meson_cpu_family('TARGET_ARCH', d)}'
> > > >   cpu = '${TARGET_ARCH}'
> > > >   endian = '${@meson_endian('TARGET', d)}'
> > > > +
> > > > +[properties]
> > > > +needs_exe_wrapper = true
> > > > +c_args = ${@meson_array('CFLAGS', d)}
> > > > +c_link_args = ${@meson_array('LDFLAGS', d)}
> > > > +cpp_args = ${@meson_array('CXXFLAGS', d)}
> > > > +cpp_link_args = ${@meson_array('LDFLAGS', d)}
> > > > +gtkdoc_exe_wrapper = '${B}/gtkdoc-qemuwrapper'
> > > > +EOF
> > > > +}
> > > > +
> > > > +do_write_config_append_mingw32() {
> > > > +    # meson mis-detects the presence of several builtin
> > > > functions in MinGW
> > > > +    # (see https://github.com/mesonbuild/meson/issues/3672).
> > > > +    # Explicitly mark these functions as missing in the cross
> > > > file
> > > > +    cat >>${WORKDIR}/meson.cross <<EOF
> > > > +has_function_strndup = false
> > > >   EOF
> > > >   }
> > > > 
> > > > 
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core


