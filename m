Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
	[209.85.166.47])
	by mail.openembedded.org (Postfix) with ESMTP id E71B27CF9C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 13:54:02 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id x3so12576452iol.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 06:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=12H7/Y3HQlPKypbg3Sl+EMVYlvla7kx3jHAXgombq7U=;
	b=2AePBPwUsnS/XX31bB0K1An5NKuHyTcXvSTjaNRTkFltZ5qiC/QdoUJeA+T2/e3EH6
	h767VPBxg5qyiBAqE0GhPL55QAIrfPIv6B6i5qUxHV05ycVZ/gl5A4LdQOjUVPGoz/m8
	KMdjMRUMMomPa5WtgxmrEffsMmqBieowr1VrLXBlIlrppyBXziXbSGDK56hUEq15vnfs
	m2iQSzQ0xmNl1I3perXEVYzoTC/J2zy1PKtU43/rd1v4c6AMNJU9g/msVmDUTnOMkvgC
	7l81S0dn14eMDdWGKPyjOBnaciu4FTILPyyYLSj77EFNqUkoWtzJIXVYD+sw+eKXC2wI
	18Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=12H7/Y3HQlPKypbg3Sl+EMVYlvla7kx3jHAXgombq7U=;
	b=AmVUjl3Yffgur5+sLT4jWLGKhgXtW58NRGKu9Epvuf+J0CXqCAa58x5rLA+Lnhjonu
	1D1eIH89EcgjiM4ccTnnCli2MsF4baYB1s8T3jyS7JsFsp1I3sNB4tCed/BzRKsZev4S
	c4sGIMbSgE2i8uSbU6VtAZho6JU8x2ZKSXIR+IaPqc23Sn+hgdRqN7Q9RQIW9KY2yGWs
	FM2bxDmeYWb1aSVrjR3PaC+1RVxQuiMJlHjSpqenY8TfJ05Y5NisEqOcUZBK9+GODv0L
	Jp4x6JZ8FJ7HvgmKhYGAZ5s40z2XaJwAgljqiMLBW1siUKI0oeiTRRgVzFLbHX/8bK9v
	owKw==
X-Gm-Message-State: APjAAAXsUj+gQ7YRcn0GUUr/1tdLGL05znCnNtVo1Ow97XcTfpQmeSTM
	vxJQ1Jl9FOoD03a4I+/8MO4ivrjOYUIMFFmJBTB2GQ==
X-Google-Smtp-Source: APXvYqwGDGuY8O3Uez2pTPzG+8y2F4gxrOnvHS+Eu2D7jnvITC59br/AqHqQi34BCbawiQui5a/LSJbSfWyOQ19cBsw=
X-Received: by 2002:a6b:8e05:: with SMTP id q5mr8015528iod.270.1556027643873; 
	Tue, 23 Apr 2019 06:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190422223648.30507-1-open.source@oleksandr-kravchuk.com>
	<CAJTo0LYefGWi6Y8qo68oi=7RnLLVyYFYewdvrxUNnb0HZ6Y7jg@mail.gmail.com>
	<b2f825a1-b567-8f15-752c-347e6d83b2c5@oleksandr-kravchuk.com>
In-Reply-To: <b2f825a1-b567-8f15-752c-347e6d83b2c5@oleksandr-kravchuk.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Apr 2019 14:53:52 +0100
Message-ID: <CAJTo0LZ6B3cRwnxskoLap6gRmyPKCcjhf9HxiLKKYU9KxiJFSw@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] libnotify: update to 0.7.8
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
X-List-Received-Date: Tue, 23 Apr 2019 13:54:03 -0000
Content-Type: text/plain; charset="UTF-8"

CCing Alex who has been working on the gtk-doc/meson stuff a lot.

Ross

On Tue, 23 Apr 2019 at 14:50, Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> On 23/04/2019 13:59, Burton, Ross wrote:
> > Fancy following this up with a Meson port?
> >
> > Ross
> >
> > On Mon, 22 Apr 2019 at 23:37, Oleksandr Kravchuk
> > <open.source@oleksandr-kravchuk.com> wrote:
> >> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> >> ---
> >>  .../libnotify/{libnotify_0.7.7.bb => libnotify_0.7.8.bb}      | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>  rename meta/recipes-gnome/libnotify/{libnotify_0.7.7.bb => libnotify_0.7.8.bb} (80%)
> >>
> >> diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.7.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
> >> similarity index 80%
> >> rename from meta/recipes-gnome/libnotify/libnotify_0.7.7.bb
> >> rename to meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
> >> index 6c299bc175..82c137ca33 100644
> >> --- a/meta/recipes-gnome/libnotify/libnotify_0.7.7.bb
> >> +++ b/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
> >> @@ -10,8 +10,8 @@ inherit gnomebase gtk-doc distro_features_check gobject-introspection
> >>  # depends on gtk+3
> >>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> >>
> >> -SRC_URI[archive.md5sum] = "e9d911f6a22435e0b922f2fe71212b59"
> >> -SRC_URI[archive.sha256sum] = "9cb4ce315b2655860c524d46b56010874214ec27e854086c1a1d0260137efc04"
> >> +SRC_URI[archive.md5sum] = "babb4b07b5f21bef42a386d3d7019599"
> >> +SRC_URI[archive.sha256sum] = "69209e0b663776a00c7b6c0e560302a8dbf66b2551d55616304f240bba66e18c"
> >>
> >>  # there were times, we had two versions of libnotify (oe-core libnotify:0.6.x /
> >>  # meta-gnome libnotify3: 0.7.x)
> >> --
> >> 2.17.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> 2019-04-23 13:41:30,546:scangobj.py:execute_command:1200:WARNING:Running
> scanner failed: [Errno 2] No such file or directory:
> '/home/sashko/projects/yocto/open-embedded/build/tmp/work/i586-poky-linux/libnotify/0.7.8-r0/build/gtkdoc-qemuwrapper':
> '/home/sashko/projects/yocto/open-embedded/build/tmp/work/i586-poky-linux/libnotify/0.7.8-r0/build/gtkdoc-qemuwrapper',
> command:
> /home/sashko/projects/yocto/open-embedded/build/tmp/work/i586-poky-linux/libnotify/0.7.8-r0/build/gtkdoc-qemuwrapper
> ./libnotify-scan
>
> Is it worth fixing?
>

