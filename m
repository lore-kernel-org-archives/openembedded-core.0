Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B949C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 13:12:38 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web09.24975.1659964351786743765
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 06:12:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=icxw2sBT;
 spf=pass (domain: gmail.com, ip: 209.85.167.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id l188so10293247oia.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 06:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=X9+DRG4yppnbaywZRaW94Gxef/t0QGWNw826ASIN9Tg=;
        b=icxw2sBTODpWoE3LBuY8lkJ/MGUgkdACV7JnTmjI9RZfYYyz7pMK6pdyS6Tn9fGztn
         NUcqEu3iULyjzpYeK3vtslXOCRzMH3LTpu9gOUFj9swh8sdeMEb1f1PGHCFLlhwieUiO
         e3SF98A1SjqCfGUXZo/q36cmioDjjFRjoaRfDfoyt5drDzZfdgj1qRW1eqA1w70lyUER
         lKSmrVSZerCguFxr2i6HXuMqXI5U80XEj+DF6FT1StvuVyABFpCBDM7bs1GvxUbYgrJU
         jnth1P+tb4fQNHB66mrzayQDFilDJC4bmQT62rt0xmNKFyT9XAREZZD1wi2rlFIftXpx
         u8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=X9+DRG4yppnbaywZRaW94Gxef/t0QGWNw826ASIN9Tg=;
        b=z5Vy165UMros/T4QOXSgVgOFrUI7ppoSzASzFXyJoOF1MrvSkPu8nBnMep4Z7QI1W2
         GEkay4WMuWOj4xA1RA2talZ8nGqmzZfizRnKxdfwrRKt4+okQzwb1duigBMPrFYodEAk
         3eAU8BPrcCi6JWw75cH0U2qEA0JD8s7bt3ArRmUVGrYyNx2PZAzq0vqws7OgJJ7+3sQl
         EyD6RcAdgDhMpXa79X7EINauSNY7dVMUk7A506dAYzThn0yBGZnWKLOasxjVkyAKbywJ
         J/IYZ1QhtU5t1yVGgHbJmVqVKkk+T5uVjvcsYmgpnbTFtNEXH2yh0wIG60NruoYoHHFj
         +hBw==
X-Gm-Message-State: ACgBeo0iaeuDwJScbyoT2eKRiqjmeCuZEsoz0MOBxmpzgd0+kxj0+h6r
	2UaTaPDJ8AoCZGTeMBzMAiQT4qC6hw+A8kCIi04=
X-Google-Smtp-Source: 
 AA6agR6pIKlAHzdnGC0ExZHED8WIaoHMBxj3e1z4Nl9rLtJPUbmzHvnX3XFPO4ISfdEskTOYHps/uglJr05YOP+1S/M=
X-Received: by 2002:a05:6808:1312:b0:341:cbcd:5387 with SMTP id
 y18-20020a056808131200b00341cbcd5387mr10419685oiv.175.1659964350891; Mon, 08
 Aug 2022 06:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1659653543.git.bruce.ashfield@gmail.com>
 <22bce10c2755711b42b7a3bd0ce61705961c2552.camel@linuxfoundation.org>
 <CADkTA4NvmFOT+gW4z9Lx_2VMQ4aVSPkGcXnfTXDZ8zwD61G0ag@mail.gmail.com>
 <87a68d011dd53f284b7021a8d2a3858140ef2c4d.camel@linuxfoundation.org>
In-Reply-To: 
 <87a68d011dd53f284b7021a8d2a3858140ef2c4d.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 8 Aug 2022 09:12:19 -0400
Message-ID: 
 <CADkTA4MhH1bmu1zMu1SjXfOuA7o8PnhQA-COOUzAhrY6q-d4Vw@mail.gmail.com>
Subject: Re: [PATCH 00/13] kernel-yocto: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex@linutronix.de>,
 openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 13:12:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169084

On Mon, Aug 8, 2022 at 9:08 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2022-08-08 at 09:01 -0400, Bruce Ashfield wrote:
> > On Mon, Aug 8, 2022 at 3:38 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > Hi Bruce,
> > >
> > > On Thu, 2022-08-04 at 18:57 -0400, bruce.ashfield@gmail.com wrote:
> > > > As I mentioned earlier today, I've built and booted the 5.19 kernel
> > > > on all architectures, have run core-iamge-kernel-dev, core-image-sa=
to
> > > > and validated musl.
> > > >
> > > > At this point, we need wider coverage to scare out the remaining
> > > > gremlins.
> > > >
> > > > I'm also sending update to 5.10 and 5.15 in the pull request, since
> > > > these are the retbleed stable updates, and I didn't want to sit on
> > > > them any longer. These are of course independenct of the 5.19 work.
> > > >
> > > > I found one issue with vboxguestdrivers in meta-oe agains the new
> > > > kernel/headers, and I've sent a patch to that mailing list. I also
> > > > had to fix lttng-modules (as usual) and have sent a patch to that
> > > > mailing list as well.
> > > >
> > > > devsrc needed a few tweaks as well, and they are included in the
> > > > series.
> > > >
> > > > Note: I've mixed in the poky / meta-yocto patches as part of this
> > > > pull request, just for ease of sending it for wider testing and to
> > > > see if I missed any references to 5.10 or have left any else
> > > > dangling.
> > >
> > > We've had a few autobuilder issues but I did run this through with
> > > other changes. The logs were a mess but I think I see three issues
> > > which are likely kernel related. The first kernel module issue happen=
ed
> > > a lot, the other two were more isolated to oe-selftest or a single
> > > failure.
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/499=
9/steps/16/logs/stdio
> > >
> > > RESULTS - kernelmodule.KernelModuleTest.test_kernel_module: FAILED (1=
9.47s)
> > >
> > > Traceback (most recent call last):
> > >   File "/home/pokybuild/yocto-worker/qemuarm64-armhost/build/meta/lib=
/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
> > >     return func(*args, **kwargs)
> > >   File "/home/pokybuild/yocto-worker/qemuarm64-armhost/build/meta/lib=
/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
> > >     return func(*args, **kwargs)
> > >   File "/home/pokybuild/yocto-worker/qemuarm64-armhost/build/meta/lib=
/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
> > >     return func(*args, **kwargs)
> > >   [Previous line repeated 2 more times]
> > >   File "/home/pokybuild/yocto-worker/qemuarm64-armhost/build/meta/lib=
/oeqa/runtime/cases/kernelmodule.py", line 46, in test_kernel_module
> > >     self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
> > > AssertionError: 2 !=3D 0 : cd /tmp && make
> > > make -C /usr/src/kernel M=3D/tmp modules
> > > make[1]: Entering directory '/lib/modules/5.19.0-yocto-standard/build=
'
> > > /bin/sh: -c: line 1: syntax error near unexpected token `('
> > > /bin/sh: -c: line 1: `if [ "gcc (GCC) 12.1.0" !=3D ""aarch64-poky-lin=
ux-gcc (GCC) 12.1.0"" ]; then \'
> > > make[1]: Leaving directory '/lib/modules/5.19.0-yocto-standard/build'
> > > make[1]: *** [Makefile:1728: prepare] Error 2
> > > make: *** [Makefile:5: all] Error 2
> >
> > We recognize this one. :)
> >
> > So either we put bash in as a shell RDPENDS for devsrc, or we wait for
> > the reproducibility fix to land. I'm ok with either route, do you have
> > a preference ?
>
> I don't think bash as an RDEPENDS will help as that doesn't replace
> /bin/sh with bash? :/

Oh maybe not, but I've always had bash as the shell in all my test
images, no busybox.

>
> Can we get the reproducibility fix in? :)

That would depend on someone sending it to the linux-yocto list, or it
making -stable. I wasn't copied on the upstream submission, so I don't
have a reference to it. but I'll search lkml and see if I can locate
it.

>
>
> > > OpenGL ES 2.x information:
> > >   version: "OpenGL ES 3.2 Mesa 22.1.3"
> > >   shading language version: "OpenGL ES GLSL ES 3.20"
> > >   vendor: "Mesa/X.org"
> > >   renderer: "virgl"
> > >   extensions: "GL_EXT_blend_minmax GL_EXT_multi_draw_arrays GL_EXT_te=
xture_compression_s3tc GL_EXT_texture_compression_dxt1 GL_EXT_texture_compr=
ession_rgtc GL_EXT_texture_format_BGRA8888 GL_OES_compressed_ETC1_RGB8_text=
ure GL_OES_depth24 GL_OES_element_index_uint GL_OES_fbo_render_mipmap GL_OE=
S_mapbuffer GL_OES_rgb8_rgba8 GL_OES_standard_derivatives GL_OES_stencil8 G=
L_OES_texture_3D GL_OES_texture_float GL_OES_texture_float_linear GL_OES_te=
xture_half_float GL_OES_texture_half_float_linear GL_OES_texture_npot GL_OE=
S_vertex_half_float GL_EXT_draw_instanced GL_EXT_texture_sRGB_decode GL_OES=
_EGL_image GL_OES_depth_texture GL_OES_packed_depth_stencil GL_EXT_texture_=
type_2_10_10_10_REV GL_NV_conditional_render GL_OES_get_program_binary GL_A=
PPLE_texture_max_level GL_EXT_discard_framebuffer GL_EXT_read_format_bgra G=
L_NV_pack_subimage GL_EXT_frag_depth GL_NV_fbo_color_attachments GL_OES_EGL=
_image_external GL_OES_EGL_sync GL_OES_vertex_array_object GL_OES_viewport_=
array GL_ANGLE_pack_reverse_row_order GL_ANGLE_texture_compression_dxt3 GL_=
ANGLE_texture_compression_dxt5 GL_EXT_occlusion_query_boolean GL_EXT_robust=
ness GL_EXT_texture_rg GL_EXT_unpack_subimage GL_NV_draw_buffers GL_NV_read=
_buffer GL_NV_read_depth GL_NV_read_depth_stencil GL_NV_read_stencil GL_EXT=
_draw_buffers GL_EXT_map_buffer_range GL_KHR_debug GL_KHR_robustness GL_KHR=
_texture_compression_astc_ldr GL_NV_pixel_buffer_object GL_OES_depth_textur=
e_cube_map GL_OES_required_internalformat GL_OES_surfaceless_context GL_EXT=
_color_buffer_float GL_EXT_sRGB_write_control GL_EXT_separate_shader_object=
s GL_EXT_shader_implicit_conversions GL_EXT_shader_integer_mix GL_EXT_tesse=
llation_point_size GL_EXT_tessellation_shader GL_ANDROID_extension_pack_es3=
1a GL_EXT_base_instance GL_EXT_compressed_ETC1_RGB8_sub_texture GL_EXT_copy=
_image GL_EXT_draw_buffers_indexed GL_EXT_draw_elements_base_vertex GL_EXT_=
gpu_shader5 GL_EXT_polygon_offset_clamp GL_EXT_primitive_bounding_box GL_EX=
T_render_snorm GL_EXT_shader_io_blocks GL_EXT_texture_border_clamp GL_EXT_t=
exture_buffer GL_EXT_texture_cube_map_array GL_EXT_texture_norm16 GL_EXT_te=
xture_view GL_KHR_blend_equation_advanced GL_KHR_context_flush_control GL_K=
HR_robust_buffer_access_behavior GL_NV_image_formats GL_OES_copy_image GL_O=
ES_draw_buffers_indexed GL_OES_draw_elements_base_vertex GL_OES_gpu_shader5=
 GL_OES_primitive_bounding_box GL_OES_sample_shading GL_OES_sample_variable=
s GL_OES_shader_io_blocks GL_OES_shader_multisample_interpolation GL_OES_te=
ssellation_point_size GL_OES_tessellation_shader GL_OES_texture_border_clam=
p GL_OES_texture_buffer GL_OES_texture_cube_map_array GL_OES_texture_stenci=
l8 GL_OES_texture_storage_multisample_2d_array GL_OES_texture_view GL_EXT_b=
lend_func_extended GL_EXT_float_blend GL_EXT_geometry_point_size GL_EXT_geo=
metry_shader GL_EXT_texture_sRGB_R8 GL_KHR_no_error GL_KHR_texture_compress=
ion_astc_sliced_3d GL_OES_EGL_image_external_essl3 GL_OES_geometry_point_si=
ze GL_OES_geometry_shader GL_OES_shader_image_atomic GL_EXT_clear_texture G=
L_EXT_clip_cull_distance GL_EXT_disjoint_timer_query GL_EXT_texture_compres=
sion_s3tc_srgb GL_MESA_shader_integer_functions GL_EXT_clip_control GL_EXT_=
color_buffer_half_float GL_EXT_texture_compression_bptc GL_EXT_texture_mirr=
or_clamp_to_edge GL_KHR_parallel_shader_compile GL_EXT_EGL_image_storage GL=
_MESA_framebuffer_flip_y GL_EXT_depth_clamp GL_EXT_texture_query_lod GL_MES=
A_bgra "
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > Using modifier ffffffffffffff
> > > failed to set mode: Invalid argument
> > >
> >
> > I did do graphical tests on x86-64, and didn't see any issues. I'll
> > have another look.
>
> This is virgl GL passthrough in qemu so not a commonly tested thing,
> you'd need to run the selftest. I'm hoping AlexK has some ideas on this
> one.
>
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/556=
9/steps/12/logs/stdio
> > >
> > > x32 init issue:
> >
> > As for this, I really have no idea.  Perhaps we can get someone from
> > Intel to have a closer look, or we push x32 completely off the cliff
> > :)
>
> The kernel didn't remove x32 did it? That would make this easy!


I can hope and check!

Bruce

>
> Cheers,
>
> Richard
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

