Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A92C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 16:14:52 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.297.1659975282729308601
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 09:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EWOYFNsD;
 spf=pass (domain: gmail.com, ip: 209.85.219.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id g5so14365754ybg.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 09:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=7uWcyotERlMscx0BmAzDkXodiLGLsQ0xLO+h+E8mqlQ=;
        b=EWOYFNsDMmdJ4aIqiurm5TaFKf92hsWh+dVB8dcTlq+pmIyGkEEPXjiup9HI+BOFy2
         YIOE7Fqn8kAkj1zLCkWrpRMwtuyissBkFGc8ig+9JVHgBqhXsiCPL739KXxrRJAYj8/7
         KrM7wiLdqmXFfDgzlq9oBS2/VYsgnsbQsCH+t6hXWd6TXfnLbYZ+x4oaLfw1P27m4VES
         keM0AbsgsHxHUV7dI/EbaLCBlwWznCjGmFMBe4d5Hb2wmteUJlekDYxq6nffThIgpdoY
         Uc4Lz8yVkrnCgkoaD1oQzAQF3bTHxYy30KNIV7PTqaRe3HDDMRR1flUTP+HN61kW0G6A
         n0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=7uWcyotERlMscx0BmAzDkXodiLGLsQ0xLO+h+E8mqlQ=;
        b=YBbmDKtL39Cj/gxMuuDcrnS3pzz9Uk8mwQM79EdmBzIufKLzJlfmsNLJvT+nE8xIFz
         oUcQpMJc5xOF0zUQogA2HU2eXH8XSlZSdN09FsfSofOWJq2qmdDWN2qgt6zxYqoZChk5
         emhwROUV2S7iEwpzEvoFfVkw379JZOE6WM8ZQ/oGoUuODyz8rAjrT3QpJzaRAaPXpF63
         j6F23Mq/WaIz2iapL17s6YvIAS4rpQz2mvrR6oX3h62Xh01PGnBrvC6NAUdKsShD2zHl
         /ARt73jL3+VeAbAyXLlVTyg9P5uweLshwrodjVXna6sv39eyHgfZwqaZt4zxHrM79DQf
         stsQ==
X-Gm-Message-State: ACgBeo32eBX3yvF/JAoOyKTVgQ709sOXpmk6aKPD5+FLMNw659t42h7x
	k4PNDVgaEDUy46ASkxlKlz1w7UiviOnvKQQ75do=
X-Google-Smtp-Source: 
 AA6agR5L8AXesGNAKW5mQAO8/3liXFDPI30UDzpfGC+ocsJcrWLh1hMkhPpk+3Fc/gYk8qruIkIDqHF6DLD5m/JklZk=
X-Received: by 2002:a25:e713:0:b0:67b:d3f3:3072 with SMTP id
 e19-20020a25e713000000b0067bd3f33072mr6573199ybh.428.1659975281690; Mon, 08
 Aug 2022 09:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1659653543.git.bruce.ashfield@gmail.com>
 <22bce10c2755711b42b7a3bd0ce61705961c2552.camel@linuxfoundation.org>
In-Reply-To: 
 <22bce10c2755711b42b7a3bd0ce61705961c2552.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Aug 2022 09:14:13 -0700
Message-ID: 
 <CAMKF1so-jgN+m7a4-zuv-W7JkskEj2AYvFwM+jb84CtT0WZe1g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/13] kernel-yocto: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: bruce.ashfield@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 16:14:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169097

Hi Bruce

5.19 has issues with zfs see [1], it seem zfs is not yet working well
with 5.19 I see this message

| checking whether blk_queue_discard() is available... configure: error:
|       *** None of the expected "blk_queue_discard" interfaces were detect=
ed.
|       *** This may be because your kernel version is newer than what is
|       *** supported, or you are using a patched custom kernel with
|       *** incompatible modifications.
|       ***
|       *** ZFS Version: zfs-2.1.4-1
|       *** Compatible Kernels: 3.10 - 5.17
|

There is another failure in audit, but its not clear yet if its due to
kernel 5.19 or something else

| audit_wrap.c: In function '_wrap_audit_rule_data_buf_set':
| audit_wrap.c:4701:17: error: cast specifies array type
|  4701 |     arg1->buf =3D (char [])(char
*)memcpy(malloc((size)*sizeof(char)), (const char *)(arg2),
sizeof(char)*(size));
|       |                 ^
| audit_wrap.c:4701:15: error: invalid use of flexible array member
|  4701 |     arg1->buf =3D (char [])(char
*)memcpy(malloc((size)*sizeof(char)), (const char *)(arg2),
sizeof(char)*(size));
|       |               ^
| audit_wrap.c:4703:15: error: invalid use of flexible array member
|  4703 |     arg1->buf =3D 0;
|       |               ^


[1] https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1888

On Mon, Aug 8, 2022 at 12:38 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Hi Bruce,
>
> On Thu, 2022-08-04 at 18:57 -0400, bruce.ashfield@gmail.com wrote:
> > As I mentioned earlier today, I've built and booted the 5.19 kernel
> > on all architectures, have run core-iamge-kernel-dev, core-image-sato
> > and validated musl.
> >
> > At this point, we need wider coverage to scare out the remaining
> > gremlins.
> >
> > I'm also sending update to 5.10 and 5.15 in the pull request, since
> > these are the retbleed stable updates, and I didn't want to sit on
> > them any longer. These are of course independenct of the 5.19 work.
> >
> > I found one issue with vboxguestdrivers in meta-oe agains the new
> > kernel/headers, and I've sent a patch to that mailing list. I also
> > had to fix lttng-modules (as usual) and have sent a patch to that
> > mailing list as well.
> >
> > devsrc needed a few tweaks as well, and they are included in the
> > series.
> >
> > Note: I've mixed in the poky / meta-yocto patches as part of this
> > pull request, just for ease of sending it for wider testing and to
> > see if I missed any references to 5.10 or have left any else
> > dangling.
>
> We've had a few autobuilder issues but I did run this through with
> other changes. The logs were a mess but I think I see three issues
> which are likely kernel related. The first kernel module issue happened
> a lot, the other two were more isolated to oe-selftest or a single
> failure.
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/4999/st=
eps/16/logs/stdio
>
> RESULTS - kernelmodule.KernelModuleTest.test_kernel_module: FAILED (19.47=
s)
>
> Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/qemuarm64-armhost/build/meta/lib/oeq=
a/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File "/home/pokybuild/yocto-worker/qemuarm64-armhost/build/meta/lib/oeq=
a/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File "/home/pokybuild/yocto-worker/qemuarm64-armhost/build/meta/lib/oeq=
a/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>   [Previous line repeated 2 more times]
>   File "/home/pokybuild/yocto-worker/qemuarm64-armhost/build/meta/lib/oeq=
a/runtime/cases/kernelmodule.py", line 46, in test_kernel_module
>     self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
> AssertionError: 2 !=3D 0 : cd /tmp && make
> make -C /usr/src/kernel M=3D/tmp modules
> make[1]: Entering directory '/lib/modules/5.19.0-yocto-standard/build'
> /bin/sh: -c: line 1: syntax error near unexpected token `('
> /bin/sh: -c: line 1: `if [ "gcc (GCC) 12.1.0" !=3D ""aarch64-poky-linux-g=
cc (GCC) 12.1.0"" ]; then \'
> make[1]: Leaving directory '/lib/modules/5.19.0-yocto-standard/build'
> make[1]: *** [Makefile:1728: prepare] Error 2
> make: *** [Makefile:5: all] Error 2
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3948/st=
eps/15/logs/stdio
>
>  runtime_test.TestImage.test_testimage_virgl_gtk_sdl (subunit.RemotedTest=
Case)
> 2022-08-08 02:08:41,717 - oe-selftest - INFO -  ... FAIL
>
> Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oe=
qa/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-64=
5516/meta-selftest/lib/oeqa/runtime/cases/virgl.py", line 17, in test_kmscu=
be
>     self.assertEqual(status, 0, "kmscube exited with non-zero status %d a=
nd output:\n%s" %(status, output))
> AssertionError: 234 !=3D 0 : kmscube exited with non-zero status 234 and =
output:
> Using display 0x55f5ecf4d920 with EGL version 1.4
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> EGL information:
>   version: "1.4"
>   vendor: "Mesa Project"
>   client extensions: "EGL_EXT_client_extensions EGL_EXT_device_base EGL_E=
XT_device_enumeration EGL_EXT_device_query EGL_EXT_platform_base EGL_KHR_cl=
ient_get_all_proc_addresses EGL_KHR_debug EGL_EXT_platform_device EGL_EXT_p=
latform_wayland EGL_KHR_platform_wayland EGL_EXT_platform_x11 EGL_KHR_platf=
orm_x11 EGL_MESA_platform_xcb EGL_MESA_platform_gbm EGL_KHR_platform_gbm EG=
L_MESA_platform_surfaceless"
>   display extensions: "EGL_ANDROID_blob_cache EGL_ANDROID_native_fence_sy=
nc EGL_EXT_buffer_age EGL_EXT_image_dma_buf_import EGL_EXT_image_dma_buf_im=
port_modifiers EGL_KHR_cl_event2 EGL_KHR_config_attribs EGL_KHR_create_cont=
ext EGL_KHR_create_context_no_error EGL_KHR_fence_sync EGL_KHR_get_all_proc=
_addresses EGL_KHR_gl_colorspace EGL_KHR_gl_renderbuffer_image EGL_KHR_gl_t=
exture_2D_image EGL_KHR_gl_texture_3D_image EGL_KHR_gl_texture_cubemap_imag=
e EGL_KHR_image EGL_KHR_image_base EGL_KHR_image_pixmap EGL_KHR_no_config_c=
ontext EGL_KHR_reusable_sync EGL_KHR_surfaceless_context EGL_EXT_pixel_form=
at_float EGL_KHR_wait_sync EGL_MESA_configless_context EGL_MESA_drm_image E=
GL_MESA_image_dma_buf_export EGL_MESA_query_driver EGL_WL_bind_wayland_disp=
lay "
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> OpenGL ES 2.x information:
>   version: "OpenGL ES 3.2 Mesa 22.1.3"
>   shading language version: "OpenGL ES GLSL ES 3.20"
>   vendor: "Mesa/X.org"
>   renderer: "virgl"
>   extensions: "GL_EXT_blend_minmax GL_EXT_multi_draw_arrays GL_EXT_textur=
e_compression_s3tc GL_EXT_texture_compression_dxt1 GL_EXT_texture_compressi=
on_rgtc GL_EXT_texture_format_BGRA8888 GL_OES_compressed_ETC1_RGB8_texture =
GL_OES_depth24 GL_OES_element_index_uint GL_OES_fbo_render_mipmap GL_OES_ma=
pbuffer GL_OES_rgb8_rgba8 GL_OES_standard_derivatives GL_OES_stencil8 GL_OE=
S_texture_3D GL_OES_texture_float GL_OES_texture_float_linear GL_OES_textur=
e_half_float GL_OES_texture_half_float_linear GL_OES_texture_npot GL_OES_ve=
rtex_half_float GL_EXT_draw_instanced GL_EXT_texture_sRGB_decode GL_OES_EGL=
_image GL_OES_depth_texture GL_OES_packed_depth_stencil GL_EXT_texture_type=
_2_10_10_10_REV GL_NV_conditional_render GL_OES_get_program_binary GL_APPLE=
_texture_max_level GL_EXT_discard_framebuffer GL_EXT_read_format_bgra GL_NV=
_pack_subimage GL_EXT_frag_depth GL_NV_fbo_color_attachments GL_OES_EGL_ima=
ge_external GL_OES_EGL_sync GL_OES_vertex_array_object GL_OES_viewport_arra=
y GL_ANGLE_pack_reverse_row_order GL_ANGLE_texture_compression_dxt3 GL_ANGL=
E_texture_compression_dxt5 GL_EXT_occlusion_query_boolean GL_EXT_robustness=
 GL_EXT_texture_rg GL_EXT_unpack_subimage GL_NV_draw_buffers GL_NV_read_buf=
fer GL_NV_read_depth GL_NV_read_depth_stencil GL_NV_read_stencil GL_EXT_dra=
w_buffers GL_EXT_map_buffer_range GL_KHR_debug GL_KHR_robustness GL_KHR_tex=
ture_compression_astc_ldr GL_NV_pixel_buffer_object GL_OES_depth_texture_cu=
be_map GL_OES_required_internalformat GL_OES_surfaceless_context GL_EXT_col=
or_buffer_float GL_EXT_sRGB_write_control GL_EXT_separate_shader_objects GL=
_EXT_shader_implicit_conversions GL_EXT_shader_integer_mix GL_EXT_tessellat=
ion_point_size GL_EXT_tessellation_shader GL_ANDROID_extension_pack_es31a G=
L_EXT_base_instance GL_EXT_compressed_ETC1_RGB8_sub_texture GL_EXT_copy_ima=
ge GL_EXT_draw_buffers_indexed GL_EXT_draw_elements_base_vertex GL_EXT_gpu_=
shader5 GL_EXT_polygon_offset_clamp GL_EXT_primitive_bounding_box GL_EXT_re=
nder_snorm GL_EXT_shader_io_blocks GL_EXT_texture_border_clamp GL_EXT_textu=
re_buffer GL_EXT_texture_cube_map_array GL_EXT_texture_norm16 GL_EXT_textur=
e_view GL_KHR_blend_equation_advanced GL_KHR_context_flush_control GL_KHR_r=
obust_buffer_access_behavior GL_NV_image_formats GL_OES_copy_image GL_OES_d=
raw_buffers_indexed GL_OES_draw_elements_base_vertex GL_OES_gpu_shader5 GL_=
OES_primitive_bounding_box GL_OES_sample_shading GL_OES_sample_variables GL=
_OES_shader_io_blocks GL_OES_shader_multisample_interpolation GL_OES_tessel=
lation_point_size GL_OES_tessellation_shader GL_OES_texture_border_clamp GL=
_OES_texture_buffer GL_OES_texture_cube_map_array GL_OES_texture_stencil8 G=
L_OES_texture_storage_multisample_2d_array GL_OES_texture_view GL_EXT_blend=
_func_extended GL_EXT_float_blend GL_EXT_geometry_point_size GL_EXT_geometr=
y_shader GL_EXT_texture_sRGB_R8 GL_KHR_no_error GL_KHR_texture_compression_=
astc_sliced_3d GL_OES_EGL_image_external_essl3 GL_OES_geometry_point_size G=
L_OES_geometry_shader GL_OES_shader_image_atomic GL_EXT_clear_texture GL_EX=
T_clip_cull_distance GL_EXT_disjoint_timer_query GL_EXT_texture_compression=
_s3tc_srgb GL_MESA_shader_integer_functions GL_EXT_clip_control GL_EXT_colo=
r_buffer_half_float GL_EXT_texture_compression_bptc GL_EXT_texture_mirror_c=
lamp_to_edge GL_KHR_parallel_shader_compile GL_EXT_EGL_image_storage GL_MES=
A_framebuffer_flip_y GL_EXT_depth_clamp GL_EXT_texture_query_lod GL_MESA_bg=
ra "
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Using modifier ffffffffffffff
> failed to set mode: Invalid argument
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/5569/st=
eps/12/logs/stdio
>
> x32 init issue:
>
> [    6.250566] Run /etc/init as init process
> [    6.251951] Run /bin/init as init process
> [    6.253182] Run /bin/sh as init process
> [    6.258191] request_module: kmod_concurrent_max (0) close to 0
> (max_modprobes: 50), for module binfmt-464c, throttling...
> [   11.363516] request_module: modprobe binfmt-464c cannot be
> processed, kmod busy with 50 threads for more than 5 seconds now
> [   11.366573] Starting init: /bin/sh exists but couldn't execute it
> (error -8)
> [   11.369043] Kernel panic - not syncing: No working init found.  Try
> passing init=3D option to kernel. See Linux Documentation/admin-
> guide/init.rst for guidance.
> [   11.371040] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.19.0-yocto-
> standard #1
> [   11.372059] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
> rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
> [   11.373541] Call Trace:
> [   11.373905]  <TASK>
> [   11.374221]  dump_stack_lvl+0x3a/0x50
> [   11.374754]  dump_stack+0x10/0x16
> [   11.375223]  panic+0x113/0x283
> [   11.375684]  ? rest_init+0xc0/0xc0
> [   11.376154]  kernel_init+0x127/0x130
> [   11.376630]  ret_from_fork+0x22/0x30
> [   11.377120]  </TASK>
> [   11.377532] Kernel Offset: 0xf600000 from 0xffffffff81000000
> (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
> [   11.378972] ---[ end Kernel panic - not syncing: No working init
> found.  Try passing init=3D option to kernel. See Linux
> Documentation/admin-guide/init.rst for guidance. ]---
>
> Cheers,
>
> Richard
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169070): https://lists.openembedded.org/g/openembedde=
d-core/message/169070
> Mute This Topic: https://lists.openembedded.org/mt/92824833/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

