Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45FF5C25B0D
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 17:11:02 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web12.1151.1659978658428209681
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 10:10:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FtnXAwv6;
 spf=pass (domain: gmail.com, ip: 209.85.210.43,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id
 y10-20020a9d634a000000b006167f7ce0c5so6922917otk.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 10:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=Nk/7ipKxF/XFLMItqV7rqvOVjKzp1kPVriKb7ttftX0=;
        b=FtnXAwv6zKptr1vH6ASLBJsJr0a7m9tcsbB7ppFPOq5wVQLX6BjXYSqisZQxO7iEEc
         NGec4R0YP71eCVsWBEw3VPQZEOE3Pn2mi3PitzoJgS0wxlrYQpftPgaIBpgWGeVfYRgU
         ohj8BKlIiCvWCfKOB7CYvod7/siePwRoljarCuGSr3EFg/qITVHPx/Jjse5RMgN3NM6u
         EyAvmd/swSUGwVG2cfc6Y/Hiq+LnMmusYA91eDH7hn2aeaTqpHxr9rngw/vXeTN/eW7A
         3plwPcGpgIpD6z8kF6CS7x4HsQb7gcn2dlC/YAbBAGgFXzE50shrIhUReRDk5HJ2YAaZ
         dzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=Nk/7ipKxF/XFLMItqV7rqvOVjKzp1kPVriKb7ttftX0=;
        b=WvsiJxaAkLyI2KxHSH2uXai2rqAdtsLQwFU/vc4K0ptvr6mEPEai5dP/UuCn9RrPdu
         jfYmJ+N3i45Cr+G63SZe07VORIME5bpS3ny3af69p6Js5wR1mZk/QTc0FgDeFkbq4BUy
         7ctDX+KtQwJ82J3QHRayLmS18MEibx/6mQU4Bfq3+KMw2WUBTtCY124MxKIB0mScSwaB
         7KuYmABnwJ1LkGEIWjzOcxshoTeNUWZAl1+uSDtcWVh6FYw+Ej8gdAIKaFcKier5UVi2
         YVJBzmORk/+aFbpFilEb1E+WE3Gwo2y0JdT9af3cVfZZsDiLsZzbMnlQ2GQJ3olg6OLm
         zcqA==
X-Gm-Message-State: ACgBeo2zArrv0Yds1YkcsR/1nRlMpnvYOvAwHhOiIgwy+AsfezgycmX8
	Q5e9jtcAvkcdFVaexhMA5NNv/lWxN+TFL2+BVNQ=
X-Google-Smtp-Source: 
 AA6agR7rhiUQ/5/gx2HTBQUvg56XbJoqMbs6LMOovsWpXZY3hPadF0hOukP5xxg8RceRj69fVubjXW9MP1nKTSlDxDY=
X-Received: by 2002:a9d:666:0:b0:636:a9d2:3bec with SMTP id
 93-20020a9d0666000000b00636a9d23becmr6111274otn.190.1659978657548; Mon, 08
 Aug 2022 10:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1659653543.git.bruce.ashfield@gmail.com>
 <22bce10c2755711b42b7a3bd0ce61705961c2552.camel@linuxfoundation.org>
 <CAMKF1so-jgN+m7a4-zuv-W7JkskEj2AYvFwM+jb84CtT0WZe1g@mail.gmail.com>
In-Reply-To: 
 <CAMKF1so-jgN+m7a4-zuv-W7JkskEj2AYvFwM+jb84CtT0WZe1g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 8 Aug 2022 13:10:45 -0400
Message-ID: 
 <CADkTA4NnLUzzvVy5xdi-oNt+=bcvgjXhDbRDOYNvez0_7L0OEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/13] kernel-yocto: consolidated pull request
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 17:11:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169104

On Mon, Aug 8, 2022 at 12:14 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Hi Bruce
>
> 5.19 has issues with zfs see [1], it seem zfs is not yet working well
> with 5.19 I see this message
>

Indeed! It is pretty clear about that.

I can try and uprev of the package, or did you have one already started ?

Bruce

> | checking whether blk_queue_discard() is available... configure: error:
> |       *** None of the expected "blk_queue_discard" interfaces were dete=
cted.
> |       *** This may be because your kernel version is newer than what is
> |       *** supported, or you are using a patched custom kernel with
> |       *** incompatible modifications.
> |       ***
> |       *** ZFS Version: zfs-2.1.4-1
> |       *** Compatible Kernels: 3.10 - 5.17
> |
>
> There is another failure in audit, but its not clear yet if its due to
> kernel 5.19 or something else
>
> | audit_wrap.c: In function '_wrap_audit_rule_data_buf_set':
> | audit_wrap.c:4701:17: error: cast specifies array type
> |  4701 |     arg1->buf =3D (char [])(char
> *)memcpy(malloc((size)*sizeof(char)), (const char *)(arg2),
> sizeof(char)*(size));
> |       |                 ^
> | audit_wrap.c:4701:15: error: invalid use of flexible array member
> |  4701 |     arg1->buf =3D (char [])(char
> *)memcpy(malloc((size)*sizeof(char)), (const char *)(arg2),
> sizeof(char)*(size));
> |       |               ^
> | audit_wrap.c:4703:15: error: invalid use of flexible array member
> |  4703 |     arg1->buf =3D 0;
> |       |               ^
>
>
> [1] https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/188=
8
>
> On Mon, Aug 8, 2022 at 12:38 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > Hi Bruce,
> >
> > On Thu, 2022-08-04 at 18:57 -0400, bruce.ashfield@gmail.com wrote:
> > > As I mentioned earlier today, I've built and booted the 5.19 kernel
> > > on all architectures, have run core-iamge-kernel-dev, core-image-sato
> > > and validated musl.
> > >
> > > At this point, we need wider coverage to scare out the remaining
> > > gremlins.
> > >
> > > I'm also sending update to 5.10 and 5.15 in the pull request, since
> > > these are the retbleed stable updates, and I didn't want to sit on
> > > them any longer. These are of course independenct of the 5.19 work.
> > >
> > > I found one issue with vboxguestdrivers in meta-oe agains the new
> > > kernel/headers, and I've sent a patch to that mailing list. I also
> > > had to fix lttng-modules (as usual) and have sent a patch to that
> > > mailing list as well.
> > >
> > > devsrc needed a few tweaks as well, and they are included in the
> > > series.
> > >
> > > Note: I've mixed in the poky / meta-yocto patches as part of this
> > > pull request, just for ease of sending it for wider testing and to
> > > see if I missed any references to 5.10 or have left any else
> > > dangling.
> >
> > We've had a few autobuilder issues but I did run this through with
> > other changes. The logs were a mess but I think I see three issues
> > which are likely kernel related. The first kernel module issue happened
> > a lot, the other two were more isolated to oe-selftest or a single
> > failure.
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/4999/=
steps/16/logs/stdio
> >
> > RESULTS - kernelmodule.KernelModuleTest.test_kernel_module: FAILED (19.=
47s)
> >
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
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3948/=
steps/15/logs/stdio
> >
> >  runtime_test.TestImage.test_testimage_virgl_gtk_sdl (subunit.RemotedTe=
stCase)
> > 2022-08-08 02:08:41,717 - oe-selftest - INFO -  ... FAIL
> >
> > Traceback (most recent call last):
> >   File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/=
oeqa/core/decorator/__init__.py", line 35, in wrapped_f
> >     return func(*args, **kwargs)
> >   File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-=
645516/meta-selftest/lib/oeqa/runtime/cases/virgl.py", line 17, in test_kms=
cube
> >     self.assertEqual(status, 0, "kmscube exited with non-zero status %d=
 and output:\n%s" %(status, output))
> > AssertionError: 234 !=3D 0 : kmscube exited with non-zero status 234 an=
d output:
> > Using display 0x55f5ecf4d920 with EGL version 1.4
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > EGL information:
> >   version: "1.4"
> >   vendor: "Mesa Project"
> >   client extensions: "EGL_EXT_client_extensions EGL_EXT_device_base EGL=
_EXT_device_enumeration EGL_EXT_device_query EGL_EXT_platform_base EGL_KHR_=
client_get_all_proc_addresses EGL_KHR_debug EGL_EXT_platform_device EGL_EXT=
_platform_wayland EGL_KHR_platform_wayland EGL_EXT_platform_x11 EGL_KHR_pla=
tform_x11 EGL_MESA_platform_xcb EGL_MESA_platform_gbm EGL_KHR_platform_gbm =
EGL_MESA_platform_surfaceless"
> >   display extensions: "EGL_ANDROID_blob_cache EGL_ANDROID_native_fence_=
sync EGL_EXT_buffer_age EGL_EXT_image_dma_buf_import EGL_EXT_image_dma_buf_=
import_modifiers EGL_KHR_cl_event2 EGL_KHR_config_attribs EGL_KHR_create_co=
ntext EGL_KHR_create_context_no_error EGL_KHR_fence_sync EGL_KHR_get_all_pr=
oc_addresses EGL_KHR_gl_colorspace EGL_KHR_gl_renderbuffer_image EGL_KHR_gl=
_texture_2D_image EGL_KHR_gl_texture_3D_image EGL_KHR_gl_texture_cubemap_im=
age EGL_KHR_image EGL_KHR_image_base EGL_KHR_image_pixmap EGL_KHR_no_config=
_context EGL_KHR_reusable_sync EGL_KHR_surfaceless_context EGL_EXT_pixel_fo=
rmat_float EGL_KHR_wait_sync EGL_MESA_configless_context EGL_MESA_drm_image=
 EGL_MESA_image_dma_buf_export EGL_MESA_query_driver EGL_WL_bind_wayland_di=
splay "
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
> >
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/5569/=
steps/12/logs/stdio
> >
> > x32 init issue:
> >
> > [    6.250566] Run /etc/init as init process
> > [    6.251951] Run /bin/init as init process
> > [    6.253182] Run /bin/sh as init process
> > [    6.258191] request_module: kmod_concurrent_max (0) close to 0
> > (max_modprobes: 50), for module binfmt-464c, throttling...
> > [   11.363516] request_module: modprobe binfmt-464c cannot be
> > processed, kmod busy with 50 threads for more than 5 seconds now
> > [   11.366573] Starting init: /bin/sh exists but couldn't execute it
> > (error -8)
> > [   11.369043] Kernel panic - not syncing: No working init found.  Try
> > passing init=3D option to kernel. See Linux Documentation/admin-
> > guide/init.rst for guidance.
> > [   11.371040] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.19.0-yocto-
> > standard #1
> > [   11.372059] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
> > rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
> > [   11.373541] Call Trace:
> > [   11.373905]  <TASK>
> > [   11.374221]  dump_stack_lvl+0x3a/0x50
> > [   11.374754]  dump_stack+0x10/0x16
> > [   11.375223]  panic+0x113/0x283
> > [   11.375684]  ? rest_init+0xc0/0xc0
> > [   11.376154]  kernel_init+0x127/0x130
> > [   11.376630]  ret_from_fork+0x22/0x30
> > [   11.377120]  </TASK>
> > [   11.377532] Kernel Offset: 0xf600000 from 0xffffffff81000000
> > (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
> > [   11.378972] ---[ end Kernel panic - not syncing: No working init
> > found.  Try passing init=3D option to kernel. See Linux
> > Documentation/admin-guide/init.rst for guidance. ]---
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#169070): https://lists.openembedded.org/g/openembed=
ded-core/message/169070
> > Mute This Topic: https://lists.openembedded.org/mt/92824833/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

