Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BAD5C25B08
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 13:08:28 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.24988.1659964105271383362
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 06:08:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I02dCrxm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id n185so4768927wmn.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 06:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=asdS4/8b1xlFIEp1TeLc+pDs6Bf6pB7wO4dBBgoz8wg=;
        b=I02dCrxmCECUolgYy17jGLH4ZTke4x7bWwUszCedMNQmoOuQ7317rTETtEen2Xqeml
         JzDR3DMPKNm+zHrzxSnbnKZ4aX6tc23GiceW8zWh2TP0X32vSSLqRjhDE95+gSCsW0My
         uMIo6Nr8hsiy+GiQQkjR3fgI2ZBmkwRvecgBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=asdS4/8b1xlFIEp1TeLc+pDs6Bf6pB7wO4dBBgoz8wg=;
        b=H+Uiadx4U3CHUjnAtPFkMbM7uvRciyAuxlCj7a9olVtjYfIWTP+/BOgC5yC+Mbj4GF
         LGS25sy6PQkZFOKqJkYPM1j1szUtf+7gC/HKcGzLuebCGx2weAWGi4o1J1t0mhSNjZaA
         vK5hN61/FuBSkQ83l65muCNloYvLi5Hi8sPq/986mvjjGODxqsaNo1MvF1BcaxtF0hvK
         eCGPPRprRSUjYF1BUOnbaYnr1BLXw8SjvKz9dYeLyLfijbgKjXMqETMaOsM+Zwza2BD8
         F6qqR5qEe1a2EXTZrEdjottiopepG+h3DLB7NvM5ahKGGvv1uIGhsJoq3iGi20u5MJrS
         vqmg==
X-Gm-Message-State: ACgBeo3Z3oJvdP9r74OgIRXvbSlcbx30HbRNr8UIdOhtlybsP4XGVBSR
	K+HTChN3gQAXjObuZh6/qml7mw==
X-Google-Smtp-Source: 
 AA6agR6tkPwqGNw6OtsIGM+hiW2sd3XaiKJiXNXWQ+tAOYI+23bibP4STA7c7u3qG/zLIH3UcZwWhg==
X-Received: by 2002:a05:600c:3b9f:b0:3a5:45d9:8a69 with SMTP id
 n31-20020a05600c3b9f00b003a545d98a69mr1946293wms.186.1659964103480;
        Mon, 08 Aug 2022 06:08:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d3ed:8697:1d83:a16?
 ([2001:8b0:aba:5f3c:d3ed:8697:1d83:a16])
        by smtp.gmail.com with ESMTPSA id
 bh11-20020a05600c3d0b00b003a502c23f2asm17251235wmb.16.2022.08.08.06.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 06:08:22 -0700 (PDT)
Message-ID: 
 <87a68d011dd53f284b7021a8d2a3858140ef2c4d.camel@linuxfoundation.org>
Subject: Re: [PATCH 00/13] kernel-yocto: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Alexander Kanavin
	 <alex@linutronix.de>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 08 Aug 2022 14:08:22 +0100
In-Reply-To: 
 <CADkTA4NvmFOT+gW4z9Lx_2VMQ4aVSPkGcXnfTXDZ8zwD61G0ag@mail.gmail.com>
References: <cover.1659653543.git.bruce.ashfield@gmail.com>
	 <22bce10c2755711b42b7a3bd0ce61705961c2552.camel@linuxfoundation.org>
	 <CADkTA4NvmFOT+gW4z9Lx_2VMQ4aVSPkGcXnfTXDZ8zwD61G0ag@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 13:08:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169083

On Mon, 2022-08-08 at 09:01 -0400, Bruce Ashfield wrote:
> On Mon, Aug 8, 2022 at 3:38 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > Hi Bruce,
> >=20
> > On Thu, 2022-08-04 at 18:57 -0400, bruce.ashfield@gmail.com wrote:
> > > As I mentioned earlier today, I've built and booted the 5.19 kernel
> > > on all architectures, have run core-iamge-kernel-dev, core-image-sato
> > > and validated musl.
> > >=20
> > > At this point, we need wider coverage to scare out the remaining
> > > gremlins.
> > >=20
> > > I'm also sending update to 5.10 and 5.15 in the pull request, since
> > > these are the retbleed stable updates, and I didn't want to sit on
> > > them any longer. These are of course independenct of the 5.19 work.
> > >=20
> > > I found one issue with vboxguestdrivers in meta-oe agains the new
> > > kernel/headers, and I've sent a patch to that mailing list. I also
> > > had to fix lttng-modules (as usual) and have sent a patch to that
> > > mailing list as well.
> > >=20
> > > devsrc needed a few tweaks as well, and they are included in the
> > > series.
> > >=20
> > > Note: I've mixed in the poky / meta-yocto patches as part of this
> > > pull request, just for ease of sending it for wider testing and to
> > > see if I missed any references to 5.10 or have left any else
> > > dangling.
> >=20
> > We've had a few autobuilder issues but I did run this through with
> > other changes. The logs were a mess but I think I see three issues
> > which are likely kernel related. The first kernel module issue happened
> > a lot, the other two were more isolated to oe-selftest or a single
> > failure.
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/4999/=
steps/16/logs/stdio
> >=20
> > RESULTS - kernelmodule.KernelModuleTest.test_kernel_module: FAILED (19.=
47s)
> >=20
> > Traceback (most recent call last):
> >   File "/home/pokybuild/yocto-worker/qemuarm64-armhost/build/meta/lib/o=
eqa/core/decorator/__init__.py", line 35, in wrapped_f
> >     return func(*args, **kwargs)
> >   File "/home/pokybuild/yocto-worker/qemuarm64-armhost/build/meta/lib/o=
eqa/core/decorator/__init__.py", line 35, in wrapped_f
> >     return func(*args, **kwargs)
> >   File "/home/pokybuild/yocto-worker/qemuarm64-armhost/build/meta/lib/o=
eqa/core/decorator/__init__.py", line 35, in wrapped_f
> >     return func(*args, **kwargs)
> >   [Previous line repeated 2 more times]
> >   File "/home/pokybuild/yocto-worker/qemuarm64-armhost/build/meta/lib/o=
eqa/runtime/cases/kernelmodule.py", line 46, in test_kernel_module
> >     self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
> > AssertionError: 2 !=3D 0 : cd /tmp && make
> > make -C /usr/src/kernel M=3D/tmp modules
> > make[1]: Entering directory '/lib/modules/5.19.0-yocto-standard/build'
> > /bin/sh: -c: line 1: syntax error near unexpected token `('
> > /bin/sh: -c: line 1: `if [ "gcc (GCC) 12.1.0" !=3D ""aarch64-poky-linux=
-gcc (GCC) 12.1.0"" ]; then \'
> > make[1]: Leaving directory '/lib/modules/5.19.0-yocto-standard/build'
> > make[1]: *** [Makefile:1728: prepare] Error 2
> > make: *** [Makefile:5: all] Error 2
>=20
> We recognize this one. :)
>=20
> So either we put bash in as a shell RDPENDS for devsrc, or we wait for
> the reproducibility fix to land. I'm ok with either route, do you have
> a preference ?

I don't think bash as an RDEPENDS will help as that doesn't replace
/bin/sh with bash? :/

Can we get the reproducibility fix in? :)


> > OpenGL ES 2.x information:
> >   version: "OpenGL ES 3.2 Mesa 22.1.3"
> >   shading language version: "OpenGL ES GLSL ES 3.20"
> >   vendor: "Mesa/X.org"
> >   renderer: "virgl"
> >   extensions: "GL_EXT_blend_minmax GL_EXT_multi_draw_arrays GL_EXT_text=
ure_compression_s3tc GL_EXT_texture_compression_dxt1 GL_EXT_texture_compres=
sion_rgtc GL_EXT_texture_format_BGRA8888 GL_OES_compressed_ETC1_RGB8_textur=
e GL_OES_depth24 GL_OES_element_index_uint GL_OES_fbo_render_mipmap GL_OES_=
mapbuffer GL_OES_rgb8_rgba8 GL_OES_standard_derivatives GL_OES_stencil8 GL_=
OES_texture_3D GL_OES_texture_float GL_OES_texture_float_linear GL_OES_text=
ure_half_float GL_OES_texture_half_float_linear GL_OES_texture_npot GL_OES_=
vertex_half_float GL_EXT_draw_instanced GL_EXT_texture_sRGB_decode GL_OES_E=
GL_image GL_OES_depth_texture GL_OES_packed_depth_stencil GL_EXT_texture_ty=
pe_2_10_10_10_REV GL_NV_conditional_render GL_OES_get_program_binary GL_APP=
LE_texture_max_level GL_EXT_discard_framebuffer GL_EXT_read_format_bgra GL_=
NV_pack_subimage GL_EXT_frag_depth GL_NV_fbo_color_attachments GL_OES_EGL_i=
mage_external GL_OES_EGL_sync GL_OES_vertex_array_object GL_OES_viewport_ar=
ray GL_ANGLE_pack_reverse_row_order GL_ANGLE_texture_compression_dxt3 GL_AN=
GLE_texture_compression_dxt5 GL_EXT_occlusion_query_boolean GL_EXT_robustne=
ss GL_EXT_texture_rg GL_EXT_unpack_subimage GL_NV_draw_buffers GL_NV_read_b=
uffer GL_NV_read_depth GL_NV_read_depth_stencil GL_NV_read_stencil GL_EXT_d=
raw_buffers GL_EXT_map_buffer_range GL_KHR_debug GL_KHR_robustness GL_KHR_t=
exture_compression_astc_ldr GL_NV_pixel_buffer_object GL_OES_depth_texture_=
cube_map GL_OES_required_internalformat GL_OES_surfaceless_context GL_EXT_c=
olor_buffer_float GL_EXT_sRGB_write_control GL_EXT_separate_shader_objects =
GL_EXT_shader_implicit_conversions GL_EXT_shader_integer_mix GL_EXT_tessell=
ation_point_size GL_EXT_tessellation_shader GL_ANDROID_extension_pack_es31a=
 GL_EXT_base_instance GL_EXT_compressed_ETC1_RGB8_sub_texture GL_EXT_copy_i=
mage GL_EXT_draw_buffers_indexed GL_EXT_draw_elements_base_vertex GL_EXT_gp=
u_shader5 GL_EXT_polygon_offset_clamp GL_EXT_primitive_bounding_box GL_EXT_=
render_snorm GL_EXT_shader_io_blocks GL_EXT_texture_border_clamp GL_EXT_tex=
ture_buffer GL_EXT_texture_cube_map_array GL_EXT_texture_norm16 GL_EXT_text=
ure_view GL_KHR_blend_equation_advanced GL_KHR_context_flush_control GL_KHR=
_robust_buffer_access_behavior GL_NV_image_formats GL_OES_copy_image GL_OES=
_draw_buffers_indexed GL_OES_draw_elements_base_vertex GL_OES_gpu_shader5 G=
L_OES_primitive_bounding_box GL_OES_sample_shading GL_OES_sample_variables =
GL_OES_shader_io_blocks GL_OES_shader_multisample_interpolation GL_OES_tess=
ellation_point_size GL_OES_tessellation_shader GL_OES_texture_border_clamp =
GL_OES_texture_buffer GL_OES_texture_cube_map_array GL_OES_texture_stencil8=
 GL_OES_texture_storage_multisample_2d_array GL_OES_texture_view GL_EXT_ble=
nd_func_extended GL_EXT_float_blend GL_EXT_geometry_point_size GL_EXT_geome=
try_shader GL_EXT_texture_sRGB_R8 GL_KHR_no_error GL_KHR_texture_compressio=
n_astc_sliced_3d GL_OES_EGL_image_external_essl3 GL_OES_geometry_point_size=
 GL_OES_geometry_shader GL_OES_shader_image_atomic GL_EXT_clear_texture GL_=
EXT_clip_cull_distance GL_EXT_disjoint_timer_query GL_EXT_texture_compressi=
on_s3tc_srgb GL_MESA_shader_integer_functions GL_EXT_clip_control GL_EXT_co=
lor_buffer_half_float GL_EXT_texture_compression_bptc GL_EXT_texture_mirror=
_clamp_to_edge GL_KHR_parallel_shader_compile GL_EXT_EGL_image_storage GL_M=
ESA_framebuffer_flip_y GL_EXT_depth_clamp GL_EXT_texture_query_lod GL_MESA_=
bgra "
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > Using modifier ffffffffffffff
> > failed to set mode: Invalid argument
> >=20
>=20
> I did do graphical tests on x86-64, and didn't see any issues. I'll
> have another look.

This is virgl GL passthrough in qemu so not a commonly tested thing,
you'd need to run the selftest. I'm hoping AlexK has some ideas on this
one.

> > https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/5569/=
steps/12/logs/stdio
> >=20
> > x32 init issue:
>=20
> As for this, I really have no idea.  Perhaps we can get someone from
> Intel to have a closer look, or we push x32 completely off the cliff
> :)

The kernel didn't remove x32 did it? That would make this easy!

Cheers,

Richard


