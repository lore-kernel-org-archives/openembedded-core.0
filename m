Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0766BC4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 21:33:56 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.171512.1698701625900642355
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 14:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tgj45eQB;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40790b0a224so36263155e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 14:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698701624; x=1699306424; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PqS6XdjbhqBBYxImfxtnIcWZBULij2x1S7tY5akHjf4=;
        b=Tgj45eQBpUsSiMXQozc/25YDiNtUcXwmR8E0qjvaM8uIom047+IsZ6QBgSdyiUQr5h
         37eCqD1WO3Kp3yRZp+RK8v6tOt1NxIcpjI7JkjciEvmNC9XJ70QacHxVdc3/3B1ydAIc
         PQyGAKjMQWXu9EKBpfC8gi54hHRMLlV7b/fbEfjiiEG7aVkqIR4ADwyxWcz46luSbAbi
         MfH7DbcHsgirfBV87tuaoTcFAcjNr6ZwqNQ/U7kwEM5nyxvIW+qgZiJhyBCDX6K/EnbS
         6AgLgx9KVdw1oYc1AVDl4iG7OLCdArW90tjwJSYv+EQKnwEPATSNi2wbh+IZ7+5TbjIV
         hFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698701624; x=1699306424;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PqS6XdjbhqBBYxImfxtnIcWZBULij2x1S7tY5akHjf4=;
        b=R4tXYamrUglcXZxrx5pwq5ZPDsO9TrxXw/FswMArN/wgKYKyLnN53pMK2LB35UwA9l
         hMGExUEymf4UC/Dnku9GytgiPN2V2mJQ6Sp7K5vmj3x563W6OHBz7Eza5I7/fqRjmCPb
         3Z+XS8Rz7JNw0qRh63UeU6Do5h5oo8lQn7dShnj1GOwHdEJKr/+Me7Y1i5VZhgNJrTt4
         I3XHE3WqNKJ3zMK3dGlpyMv7ryeLSJXTRCla612qDpSqaEu1TxUToG9EKLrQ85CC6JUP
         MrB9qhEyZyUmkVNphsJN2+UCyO6uUHdE3P4YoqskiEMijAbkypUPfQ/NZgVi982XNV3q
         9ybQ==
X-Gm-Message-State: AOJu0YwvCuFAbK7+ZfgFRVN9B2wQmrKm+0mVxRj1/3lQn4jx5/udXwYB
	YUS9+NTFfSaXlUHuwUQhO2Sa/RhGVF0=
X-Google-Smtp-Source: AGHT+IE3XtckSxbqcDW/zY4q5WDi2i/SOBwp5Kil+Hh0etD0hNeCiRGvau15H8Byl7Nceka7lgdiUA==
X-Received: by 2002:a05:600c:4692:b0:409:2c35:7b3e with SMTP id p18-20020a05600c469200b004092c357b3emr8223405wmo.8.1698701624225;
        Mon, 30 Oct 2023 14:33:44 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id f10-20020a05600c154a00b0040641a9d49bsm320457wmg.17.2023.10.30.14.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 14:33:43 -0700 (PDT)
Message-ID: <d41ffb2fc12f8b7401e2c2b04293697331a84842.camel@gmail.com>
Subject: Re: [OE-core][PATCH v6 03/12] devtool: new ide plugin
From: adrian.freihofer@gmail.com
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 30 Oct 2023 22:33:43 +0100
In-Reply-To: <186EDB03-6E99-4675-BDAA-A19FD95EC95F@arm.com>
References: <20230910161850.4032227-1-adrian.freihofer@siemens.com>
	 <20230910161850.4032227-4-adrian.freihofer@siemens.com>
	 <186EDB03-6E99-4675-BDAA-A19FD95EC95F@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 21:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189821

Hi Ross

Thank you for the re-view.

Summary: I hope everything is fixed with v7:
https://lists.openembedded.org/g/openembedded-core/message/189812

On Thu, 2023-10-12 at 12:53 +0000, Ross Burton wrote:
> Finally looking at the code=E2=80=A6
>=20
> On 10 Sep 2023, at 16:52, Adrian Freihofer via lists.openembedded.org
> <adrian.freihofer=3Dgmail.com@lists.openembedded.org> wrote:
> >=20
> > The new devtool ide plugin configures an IDE to work with the eSDK.
> >=20
> > With this initial implementation VSCode is the default IDE.
> > The plugin works for recipes inheriting the cmake or the meson
> > bbclass.
> > Support for more programming languages and build tools may be added
> > in
> > the future.
>=20
> Can the vscode pieces be split out to a separate file, to separate
> out the high level logic and the vscode specifics.=C2=A0 I=E2=80=99m pret=
ty sure
> there would be interest in adding qtcreator, for example.=C2=A0 By doing
> this sooner rather than later we avoid adding cheeky =E2=80=9Clets just
> handle vscode specially=E2=80=9D blocks.=C2=A0 Also, splitting out the
> cmake/meson/none logic where it isn=E2=80=99t IDE-specific.
>=20
> Also one thing I=E2=80=99d like to encourage more is decent code
> documentation, to make the code easier to both review and work on in
> the future.=C2=A0 Could you add at least basic documentation to the
> classes and major functions, with a summary of how the plugin works?
>=20
> > +=C2=A0=C2=A0=C2=A0 def __gdbserver_start_cmd(self, binary, port):
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if self.gdbserver_multi:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gdb=
server_cmd =3D "/usr/bin/gdbserver --multi :%s" % (
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 port)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gdb=
server_cmd =3D "/usr/bin/gdbserver --once :%s %s" % (
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 port, binary)
>=20
> If I=E2=80=99m being pedantic, that should be ${bindir}.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if 'debuginfod' in
> > image_d.getVar('DISTRO_FEATURES').split():
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # i=
mage_config.debuginfod =3D True
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log=
ger.warning("Support for debuginfod is not
> > implemented yet.")
>=20
> What doesn=E2=80=99t work, and why is this warning needed?

I removed the warnings related to debuginfod. Currently the rootfs-dbg
is used, but debuginfod should not harm and no warning is needed.

>=20
> > +=C2=A0=C2=A0=C2=A0 def solib_search_path_rootfs(self):
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """Search for folders with =
shared libraries in the rootfs
> > and rootfs-dbg
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This is based on the assump=
tion that the
> > PACKAGE_DEBUG_SPLIT_STYLE variable from the image
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 is the global setting which=
 is used by most packages. Even
> > if this variable does not seem
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to make sense in the image =
context.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rootfs_solib_search_path =
=3D []
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rootfs_dbg_solib_search_pat=
h =3D []
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if self.package_debug_split=
_style in ['debug-with-srcpkg',
> > '.debug']:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
self.combine_dbg_image:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 rootfs_dbg_solib_search_path =3D [
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "/lib", "/lib/.debug", "/usr/=
lib",
> > "/usr/lib/.debug"]
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 els=
e:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 logger.warn(
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'Adding IMAGE_CLASSES +=3D "i=
mage-combined-dbg"
> > offers better remote debugging experience.')
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 rootfs_solib_search_path =3D [
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "/lib", "/usr/lib"]
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 rootfs_dbg_solib_search_path =3D [
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "/lib/.debug", "/usr/lib/.deb=
ug"]
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif self.package_debug_spl=
it_style =3D=3D 'debug-file-
> > directory':
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 roo=
tfs_dbg_solib_search_path =3D ["/usr/lib/debug"]
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log=
ger.warning(
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "Cannot find solib search path for a rootfs built
> > with PACKAGE_DEBUG_SPLIT_STYLE=3D%s." %
> > self.package_debug_split_style)
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sym_dirs =3D []
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for dbgdir in rootfs_solib_=
search_path:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sym=
_dirs.append(os.path.join(
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 self.rootfs, dbgdir.lstrip('/')))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for dbgdir in rootfs_dbg_so=
lib_search_path:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sym=
_dirs.append(os.path.join(
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 self.rootfs_dbg, dbgdir.lstrip('/')))
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return sym_dirs
>=20
> Feels like there should be a much better way to do this.=C2=A0 Does the
> choice of debug split style actually matter?=C2=A0 Just search all of the
> candidates and avoid trying to special-case everything?

It's probably still not as simple as you would expect. But it's much
simpler because I dropped the combined-debug-dbg cases. I prefer to
handle the different cases separately and provide a reasonable error
message to the user. There are so many reasons why the debugger cannot
find the symbols and sources.

>=20
> I=E2=80=99d not noticed image-combined-dbg existed and do wonder if that
> shoud be the behaviour of the debug rootfs.=C2=A0 Is there actually a use=
-
> case for a tarball which is _just_ the symbols?
>=20
Yes, it seems best to remove the image-combined-dbg.bbclass and make it
the default. There is now a patch that does this. This solves many
problems when tools need debug symbols and sources.

> > +class RecipeMetaIdeSupport:
> > +=C2=A0=C2=A0=C2=A0 """Handle some meta-ide-support recipe related prop=
erties"""
>=20
> I=E2=80=99m obviously missing something: what=E2=80=99s the use-case for =
using meta-
> ide-support instead of the recipe=E2=80=99s depends?
>=20
devtool ide has two modes:
1. Generate an IDE configuration for a recipe in the workspace
generated by devtool modify. For this mode we do not need meta-ide-
support. Correct.
2. Generate an eSDK like behavior where the generic environment file
can be sourced into a shell without any dependency on a recipe. devtool
ide basically does what bitbake meta-ide-support build-sysroots does.
In case the IDE is VSCode, it adds a cmake-kit to the users global
VSCode configuration. This allows then to use the tool-chain provided
by Yocto instead of the tool-chain from the host distro. This is also
covered by the docs update. See *Shared sysroots mode*.

Adrian

> > +=C2=A0=C2=A0=C2=A0 def solib_search_path_sysroot(self):
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return [os.path.join(self.r=
ecipe_sysroot, p) for p in
> > ['lib', 'usr/lib=E2=80=99]]
>=20
> ${base_libdir}, ${libdir}.=C2=A0 Some systems use /usr/lib64 or /usr/lib3=
2
> and this assumption will fail.
>=20
> Ross


