Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22FE8C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 07:38:37 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.22567.1659944309107428134
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 00:38:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N8e7ZJvT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id bv3so9864151wrb.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 00:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=z0Pshs9xiQj7WYnmKLYBcrmttFopmyv7nVfjUHTZSNU=;
        b=N8e7ZJvT2HrPInPQXfwDII1sUhY+QEob3/WcCKp15V3PZoRgR/xnzsvzg1jVGm2wCQ
         1WAZKraxkykaAHVgRKzPOJ/52uOHOcKwmJJxWdN7ZmnO/Lr257NXYlJCLs5/cG+u/3t6
         kLlX5fp4eCVopLAy4jHtUNLMIkJLcuFP6YQ/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=z0Pshs9xiQj7WYnmKLYBcrmttFopmyv7nVfjUHTZSNU=;
        b=RTqlyItf7jgmrmEJi5ZoXonHwmLdwkWoNp0X/PBQoX5aHx84/uCOHWe2bosR1lIDXm
         CjIxEn+FXnVY/odMvLMLx+jjlU8BX6QH8XgWdtoNHO1Rmbnp1QnA0IsOqCjQcwHEpkxE
         HiAHRKnUJGtFKsf7HCEwk1JMXh9bAgu9ePoqn2gW+9Qsbg2LwSAEU4js1yNTwmC8dEnO
         d1rEJlnQACLnTYOZv0eVki53Q5RHUmZkNOdx8oSKN2AYQGk0GhsTRfA8RfqbzvnOd03l
         VoNp6hCKBGdtoY4mfI/onP40ArjCvlPcm5bkRLAPS/5v/DOvkD1gd2hGiqtwVTRjacin
         zghA==
X-Gm-Message-State: ACgBeo22IjezoBGxwBGNXgwyQH2gUgiB9+dE/+Wmt/TLCfoZOSr4UTEp
	CycnZoKwlRgrmrERzhDCy1oBxA==
X-Google-Smtp-Source: 
 AA6agR7q9ouJOSCRhySP0a78vGzfxOjnoV/NK09L7mF0qJKs2yp6Cp2de9W8oXXBN1OpZWRXTpf4mw==
X-Received: by 2002:a5d:4e4d:0:b0:220:8006:bfe7 with SMTP id
 r13-20020a5d4e4d000000b002208006bfe7mr10634022wrt.230.1659944307375;
        Mon, 08 Aug 2022 00:38:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d3ed:8697:1d83:a16?
 ([2001:8b0:aba:5f3c:d3ed:8697:1d83:a16])
        by smtp.gmail.com with ESMTPSA id
 az40-20020a05600c602800b003a310fe1d75sm18265503wmb.38.2022.08.08.00.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 00:38:26 -0700 (PDT)
Message-ID: 
 <22bce10c2755711b42b7a3bd0ce61705961c2552.camel@linuxfoundation.org>
Subject: Re: [PATCH 00/13] kernel-yocto: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 08 Aug 2022 08:38:25 +0100
In-Reply-To: <cover.1659653543.git.bruce.ashfield@gmail.com>
References: <cover.1659653543.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 07:38:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169070

Hi Bruce,

On Thu, 2022-08-04 at 18:57 -0400, bruce.ashfield@gmail.com wrote:
> As I mentioned earlier today, I've built and booted the 5.19 kernel
> on all architectures, have run core-iamge-kernel-dev, core-image-sato
> and validated musl.
>=20
> At this point, we need wider coverage to scare out the remaining
> gremlins.
>=20
> I'm also sending update to 5.10 and 5.15 in the pull request, since
> these are the retbleed stable updates, and I didn't want to sit on
> them any longer. These are of course independenct of the 5.19 work.
>=20
> I found one issue with vboxguestdrivers in meta-oe agains the new
> kernel/headers, and I've sent a patch to that mailing list. I also
> had to fix lttng-modules (as usual) and have sent a patch to that
> mailing list as well.
>=20
> devsrc needed a few tweaks as well, and they are included in the
> series.
>=20
> Note: I've mixed in the poky / meta-yocto patches as part of this
> pull request, just for ease of sending it for wider testing and to
> see if I missed any references to 5.10 or have left any else
> dangling.

We've had a few autobuilder issues but I did run this through with
other changes. The logs were a mess but I think I see three issues
which are likely kernel related. The first kernel module issue happened
a lot, the other two were more isolated to oe-selftest or a single
failure.

https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/4999/step=
s/16/logs/stdio

RESULTS - kernelmodule.KernelModuleTest.test_kernel_module: FAILED (19.47s)

Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/qemuarm64-armhost/build/meta/lib/oeqa/=
core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-worker/qemuarm64-armhost/build/meta/lib/oeqa/=
core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-worker/qemuarm64-armhost/build/meta/lib/oeqa/=
core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  [Previous line repeated 2 more times]
  File "/home/pokybuild/yocto-worker/qemuarm64-armhost/build/meta/lib/oeqa/=
runtime/cases/kernelmodule.py", line 46, in test_kernel_module
    self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
AssertionError: 2 !=3D 0 : cd /tmp && make
make -C /usr/src/kernel M=3D/tmp modules
make[1]: Entering directory '/lib/modules/5.19.0-yocto-standard/build'
/bin/sh: -c: line 1: syntax error near unexpected token `('
/bin/sh: -c: line 1: `if [ "gcc (GCC) 12.1.0" !=3D ""aarch64-poky-linux-gcc=
 (GCC) 12.1.0"" ]; then \'
make[1]: Leaving directory '/lib/modules/5.19.0-yocto-standard/build'
make[1]: *** [Makefile:1728: prepare] Error 2
make: *** [Makefile:5: all] Error 2

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3948/step=
s/15/logs/stdio

 runtime_test.TestImage.test_testimage_virgl_gtk_sdl (subunit.RemotedTestCa=
se)
2022-08-08 02:08:41,717 - oe-selftest - INFO -  ... FAIL

Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa=
/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-6455=
16/meta-selftest/lib/oeqa/runtime/cases/virgl.py", line 17, in test_kmscube
    self.assertEqual(status, 0, "kmscube exited with non-zero status %d and=
 output:\n%s" %(status, output))
AssertionError: 234 !=3D 0 : kmscube exited with non-zero status 234 and ou=
tput:
Using display 0x55f5ecf4d920 with EGL version 1.4
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
EGL information:
  version: "1.4"
  vendor: "Mesa Project"
  client extensions: "EGL_EXT_client_extensions EGL_EXT_device_base EGL_EXT=
_device_enumeration EGL_EXT_device_query EGL_EXT_platform_base EGL_KHR_clie=
nt_get_all_proc_addresses EGL_KHR_debug EGL_EXT_platform_device EGL_EXT_pla=
tform_wayland EGL_KHR_platform_wayland EGL_EXT_platform_x11 EGL_KHR_platfor=
m_x11 EGL_MESA_platform_xcb EGL_MESA_platform_gbm EGL_KHR_platform_gbm EGL_=
MESA_platform_surfaceless"
  display extensions: "EGL_ANDROID_blob_cache EGL_ANDROID_native_fence_sync=
 EGL_EXT_buffer_age EGL_EXT_image_dma_buf_import EGL_EXT_image_dma_buf_impo=
rt_modifiers EGL_KHR_cl_event2 EGL_KHR_config_attribs EGL_KHR_create_contex=
t EGL_KHR_create_context_no_error EGL_KHR_fence_sync EGL_KHR_get_all_proc_a=
ddresses EGL_KHR_gl_colorspace EGL_KHR_gl_renderbuffer_image EGL_KHR_gl_tex=
ture_2D_image EGL_KHR_gl_texture_3D_image EGL_KHR_gl_texture_cubemap_image =
EGL_KHR_image EGL_KHR_image_base EGL_KHR_image_pixmap EGL_KHR_no_config_con=
text EGL_KHR_reusable_sync EGL_KHR_surfaceless_context EGL_EXT_pixel_format=
_float EGL_KHR_wait_sync EGL_MESA_configless_context EGL_MESA_drm_image EGL=
_MESA_image_dma_buf_export EGL_MESA_query_driver EGL_WL_bind_wayland_displa=
y "
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
OpenGL ES 2.x information:
  version: "OpenGL ES 3.2 Mesa 22.1.3"
  shading language version: "OpenGL ES GLSL ES 3.20"
  vendor: "Mesa/X.org"
  renderer: "virgl"
  extensions: "GL_EXT_blend_minmax GL_EXT_multi_draw_arrays GL_EXT_texture_=
compression_s3tc GL_EXT_texture_compression_dxt1 GL_EXT_texture_compression=
_rgtc GL_EXT_texture_format_BGRA8888 GL_OES_compressed_ETC1_RGB8_texture GL=
_OES_depth24 GL_OES_element_index_uint GL_OES_fbo_render_mipmap GL_OES_mapb=
uffer GL_OES_rgb8_rgba8 GL_OES_standard_derivatives GL_OES_stencil8 GL_OES_=
texture_3D GL_OES_texture_float GL_OES_texture_float_linear GL_OES_texture_=
half_float GL_OES_texture_half_float_linear GL_OES_texture_npot GL_OES_vert=
ex_half_float GL_EXT_draw_instanced GL_EXT_texture_sRGB_decode GL_OES_EGL_i=
mage GL_OES_depth_texture GL_OES_packed_depth_stencil GL_EXT_texture_type_2=
_10_10_10_REV GL_NV_conditional_render GL_OES_get_program_binary GL_APPLE_t=
exture_max_level GL_EXT_discard_framebuffer GL_EXT_read_format_bgra GL_NV_p=
ack_subimage GL_EXT_frag_depth GL_NV_fbo_color_attachments GL_OES_EGL_image=
_external GL_OES_EGL_sync GL_OES_vertex_array_object GL_OES_viewport_array =
GL_ANGLE_pack_reverse_row_order GL_ANGLE_texture_compression_dxt3 GL_ANGLE_=
texture_compression_dxt5 GL_EXT_occlusion_query_boolean GL_EXT_robustness G=
L_EXT_texture_rg GL_EXT_unpack_subimage GL_NV_draw_buffers GL_NV_read_buffe=
r GL_NV_read_depth GL_NV_read_depth_stencil GL_NV_read_stencil GL_EXT_draw_=
buffers GL_EXT_map_buffer_range GL_KHR_debug GL_KHR_robustness GL_KHR_textu=
re_compression_astc_ldr GL_NV_pixel_buffer_object GL_OES_depth_texture_cube=
_map GL_OES_required_internalformat GL_OES_surfaceless_context GL_EXT_color=
_buffer_float GL_EXT_sRGB_write_control GL_EXT_separate_shader_objects GL_E=
XT_shader_implicit_conversions GL_EXT_shader_integer_mix GL_EXT_tessellatio=
n_point_size GL_EXT_tessellation_shader GL_ANDROID_extension_pack_es31a GL_=
EXT_base_instance GL_EXT_compressed_ETC1_RGB8_sub_texture GL_EXT_copy_image=
 GL_EXT_draw_buffers_indexed GL_EXT_draw_elements_base_vertex GL_EXT_gpu_sh=
ader5 GL_EXT_polygon_offset_clamp GL_EXT_primitive_bounding_box GL_EXT_rend=
er_snorm GL_EXT_shader_io_blocks GL_EXT_texture_border_clamp GL_EXT_texture=
_buffer GL_EXT_texture_cube_map_array GL_EXT_texture_norm16 GL_EXT_texture_=
view GL_KHR_blend_equation_advanced GL_KHR_context_flush_control GL_KHR_rob=
ust_buffer_access_behavior GL_NV_image_formats GL_OES_copy_image GL_OES_dra=
w_buffers_indexed GL_OES_draw_elements_base_vertex GL_OES_gpu_shader5 GL_OE=
S_primitive_bounding_box GL_OES_sample_shading GL_OES_sample_variables GL_O=
ES_shader_io_blocks GL_OES_shader_multisample_interpolation GL_OES_tessella=
tion_point_size GL_OES_tessellation_shader GL_OES_texture_border_clamp GL_O=
ES_texture_buffer GL_OES_texture_cube_map_array GL_OES_texture_stencil8 GL_=
OES_texture_storage_multisample_2d_array GL_OES_texture_view GL_EXT_blend_f=
unc_extended GL_EXT_float_blend GL_EXT_geometry_point_size GL_EXT_geometry_=
shader GL_EXT_texture_sRGB_R8 GL_KHR_no_error GL_KHR_texture_compression_as=
tc_sliced_3d GL_OES_EGL_image_external_essl3 GL_OES_geometry_point_size GL_=
OES_geometry_shader GL_OES_shader_image_atomic GL_EXT_clear_texture GL_EXT_=
clip_cull_distance GL_EXT_disjoint_timer_query GL_EXT_texture_compression_s=
3tc_srgb GL_MESA_shader_integer_functions GL_EXT_clip_control GL_EXT_color_=
buffer_half_float GL_EXT_texture_compression_bptc GL_EXT_texture_mirror_cla=
mp_to_edge GL_KHR_parallel_shader_compile GL_EXT_EGL_image_storage GL_MESA_=
framebuffer_flip_y GL_EXT_depth_clamp GL_EXT_texture_query_lod GL_MESA_bgra=
 "
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Using modifier ffffffffffffff
failed to set mode: Invalid argument


https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/5569/step=
s/12/logs/stdio

x32 init issue:

[    6.250566] Run /etc/init as init process
[    6.251951] Run /bin/init as init process
[    6.253182] Run /bin/sh as init process
[    6.258191] request_module: kmod_concurrent_max (0) close to 0
(max_modprobes: 50), for module binfmt-464c, throttling...
[   11.363516] request_module: modprobe binfmt-464c cannot be
processed, kmod busy with 50 threads for more than 5 seconds now
[   11.366573] Starting init: /bin/sh exists but couldn't execute it
(error -8)
[   11.369043] Kernel panic - not syncing: No working init found.  Try
passing init=3D option to kernel. See Linux Documentation/admin-
guide/init.rst for guidance.
[   11.371040] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.19.0-yocto-
standard #1
[   11.372059] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
[   11.373541] Call Trace:
[   11.373905]  <TASK>
[   11.374221]  dump_stack_lvl+0x3a/0x50
[   11.374754]  dump_stack+0x10/0x16
[   11.375223]  panic+0x113/0x283
[   11.375684]  ? rest_init+0xc0/0xc0
[   11.376154]  kernel_init+0x127/0x130
[   11.376630]  ret_from_fork+0x22/0x30
[   11.377120]  </TASK>
[   11.377532] Kernel Offset: 0xf600000 from 0xffffffff81000000
(relocation range: 0xffffffff80000000-0xffffffffbfffffff)
[   11.378972] ---[ end Kernel panic - not syncing: No working init
found.  Try passing init=3D option to kernel. See Linux
Documentation/admin-guide/init.rst for guidance. ]---

Cheers,

Richard



