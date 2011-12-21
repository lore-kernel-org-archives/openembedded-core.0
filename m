Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RdGte-0005s6-0h
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 08:47:30 +0100
Received: by eeit10 with SMTP id t10so3264445eei.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2011 23:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rai6jbY7dEjjLjt8CUmb8WST52jfN4KYGJE5yLiUIQ8=;
	b=XLR23WO0z9B/1svVufGoeNMfyX07c2oxkqGvTdlbRo9cgmPrRs0Oy79Hf5SlLsrPeF
	6vfX09kTipvbxE1PdCNmN7cZ11Dl8yzQ9KdDM6oyj4ARD7wQLjYaTDzVGSB+P6bE1/ii
	Zsw4NeJnwM/yneNqMfhBY5t9V/3qeuuN0Zc+w=
Received: by 10.213.113.142 with SMTP id a14mr4318042ebq.92.1324453225269;
	Tue, 20 Dec 2011 23:40:25 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q28sm17475833eea.6.2011.12.20.23.40.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Dec 2011 23:40:23 -0800 (PST)
Date: Wed, 21 Dec 2011 08:40:11 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111221074011.GB12791@jama.jama.net>
References: <1322665120-29586-1-git-send-email-koen@dominion.thruhere.net>
	<D72EA3E2-0752-4F03-875F-77F5764313B1@dominion.thruhere.net>
	<20111220075952.GB3946@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20111220075952.GB3946@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] webkit-gtk svn: update to r101488
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Dec 2011 07:47:30 -0000
X-Groupsio-MsgNum: 14553
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ADZbWkCsHQ7r3kzd"
Content-Disposition: inline

--ADZbWkCsHQ7r3kzd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2011 at 08:59:52AM +0100, Martin Jansa wrote:
> On Thu, Dec 15, 2011 at 04:16:17PM +0100, Koen Kooi wrote:
> > ping
>=20
> I've tried it with older midori-0.4.2 as well as with newer 0.4.3 (which
> I'll send to meta-oe later) but both does segfault, probably not caused
> by this newer webkit-gtk because even with older webkit-gtk 0.4.2 was
> segfaulting (maybe gcc-4.6 issue if you're still using gcc-4.5).
>=20
> I've tried to get usable backtrace.. but webkit-gtk-dbg is huge (>300MB)
> and opkg died twice already when I was waiting for midori-dbg to install
> :/.
>=20
> BTW: it happens on armv4t as well as armv7a-vfp-neon.

627.8M  usr/lib/.debug/libwebkitgtk-1.0.so.0.11.2
=66rom libwebkitgtk-1.0-dbg (1.7.2+svnr101488-r0) wasn't=20
really helpfull as it fails even before that on nokia900:

Starting program: /usr/bin/midori

Program received signal SIGSEGV, Segmentation fault.
_dl_relocate_object (scope=3D0x4300aa00, reloc_mode=3D<optimized out>, cons=
ider_profiling=3D0) at dl-reloc.c:238
238         const char *strtab =3D (const void *) D_PTR (l, l_info[DT_STRTA=
B]);
(gdb) bt
#0  _dl_relocate_object (scope=3D0x4300aa00, reloc_mode=3D<optimized out>, =
consider_profiling=3D0) at dl-reloc.c:238
#1  0x400034f4 in dl_main (phdr=3D<optimized out>, phnum=3D1128496080, user=
_entry=3D0x1, auxv=3D0x0) at rtld.c:2270
#2  0x40014cf8 in _dl_sysdep_start (start_argptr=3D<optimized out>, dl_main=
=3D0x40014cf8 <_dl_sysdep_start+568>) at ../elf/dl-sysdep.c:244
#3  0x40001de0 in _dl_start_final (arg=3D0xbec4a650, info=3D0xbec4a3d0) at =
rtld.c:337
#4  0x40005010 in _dl_start (arg=3D0x0) at rtld.c:565
#5  0x40000ed0 in _start () from /lib/ld-linux.so.3
#6  0x40000ed0 in _start () from /lib/ld-linux.so.3
Backtrace stopped: previous frame identical to this frame (corrupt stack?)

with armv4t I got better bt:
#0  0x402e661c in g_object_unref (_object=3D0x0) at gobject.c:2690
#1  0x406919f6 in render_fallback_image (style=3D0x2084f8, direction=3DGTK_=
TEXT_DIR_LTR, state=3DGTK_STATE_NORMAL, size=3DGTK_ICON_SIZE_LARGE_TOOLBAR,=
=20
    widget=3D0x19b230, detail=3D0x0) at gtkiconfactory.c:1588
#2  0x40691d7e in IA__gtk_icon_set_render_icon (icon_set=3D0x159370, style=
=3D0x9c100, direction=3DGTK_TEXT_DIR_LTR, state=3DGTK_STATE_NORMAL,=20
    size=3DGTK_ICON_SIZE_LARGE_TOOLBAR, widget=3D0x19b230, detail=3D0x0) at=
 gtkiconfactory.c:1658
#3  0x4077a366 in IA__gtk_widget_render_icon (widget=3D0x19b230, stock_id=
=3D<optimized out>, size=3DGTK_ICON_SIZE_LARGE_TOOLBAR, detail=3D0x0) at gt=
kwidget.c:7415
#4  0x4069fc0e in gtk_image_calc_size (image=3D0x19b230) at gtkimage.c:2314
#5  0x4069fc1e in gtk_image_size_request (widget=3D0x19b230, requisition=3D=
0x19b24c) at gtkimage.c:2361
#6  0x402e5920 in g_cclosure_marshal_VOID__BOXED (closure=3D0x11c680, retur=
n_value=3D<optimized out>, n_param_values=3D<optimized out>, param_values=
=3D0x210460,=20
    invocation_hint=3D0xbeffe17c, marshal_data=3D0x4069fc15) at gmarshal.c:=
574
#7  0x402e35e8 in g_type_class_meta_marshal (closure=3D0x11c680, return_val=
ue=3D0x0, n_param_values=3D2, param_values=3D0x210460, invocation_hint=3D0x=
beffe17c,=20
    marshal_data=3D0x7c) at gclosure.c:885
#8  0x402e46a8 in g_closure_invoke (closure=3D0x11c680, return_value=3D0x0,=
 n_param_values=3D2, param_values=3D0x210460, invocation_hint=3D0xbeffe17c)
    at gclosure.c:774
#9  0x402f0c54 in signal_emit_unlocked_R (node=3D<optimized out>, detail=3D=
1126, instance=3D0x8001, emission_return=3D0x40313ac8, instance_and_params=
=3D0x210460)
    at gsignal.c:3202
#10 0x402f7740 in g_signal_emit_valist (instance=3D0x1, signal_id=3D<optimi=
zed out>, detail=3D1076968136, var_args=3D...) at gsignal.c:3003
#11 0x402f797c in g_signal_emit_by_name (instance=3D<optimized out>, detail=
ed_signal=3D0x40869d80 "size-request") at gsignal.c:3097
#12 0x407002d0 in do_size_request (widget=3D0x19b230) at gtksizegroup.c:628
#13 do_size_request (widget=3D0x19b230) at gtksizegroup.c:946
#14 _gtk_size_group_compute_requisition (widget=3D0x19b230, requisition=3D0=
xbeffe3b8) at gtksizegroup.c:828
#15 0x4077455a in IA__gtk_widget_size_request (widget=3D0x19b230, requisiti=
on=3D0xbeffe3b8) at gtkwidget.c:3906
#16 0x4063f6e8 in gtk_button_size_request (widget=3D0x1e8568, requisition=
=3D0x1e8584) at gtkbutton.c:1368
#17 0x402e5920 in g_cclosure_marshal_VOID__BOXED (closure=3D0x11c680, retur=
n_value=3D<optimized out>, n_param_values=3D<optimized out>, param_values=
=3D0x210180,=20
    invocation_hint=3D0xbeffe4cc, marshal_data=3D0x4063f639) at gmarshal.c:=
574
#18 0x402e35e8 in g_type_class_meta_marshal (closure=3D0x11c680, return_val=
ue=3D0x0, n_param_values=3D2, param_values=3D0x210180, invocation_hint=3D0x=
beffe4cc,=20
    marshal_data=3D0x7c) at gclosure.c:885
#19 0x402e46a8 in g_closure_invoke (closure=3D0x11c680, return_value=3D0x0,=
 n_param_values=3D2, param_values=3D0x210180, invocation_hint=3D0xbeffe4cc)
    at gclosure.c:774
#20 0x402f0c54 in signal_emit_unlocked_R (node=3D<optimized out>, detail=3D=
1126, instance=3D0x8001, emission_return=3D0x40313ac8, instance_and_params=
=3D0x210180)
    at gsignal.c:3202
#21 0x402f7740 in g_signal_emit_valist (instance=3D0x1, signal_id=3D<optimi=
zed out>, detail=3D1076968136, var_args=3D...) at gsignal.c:3003
#22 0x402f797c in g_signal_emit_by_name (instance=3D<optimized out>, detail=
ed_signal=3D0x40869d80 "size-request") at gsignal.c:3097
#23 0x407002d0 in do_size_request (widget=3D0x1e8568) at gtksizegroup.c:628
#24 do_size_request (widget=3D0x1e8568) at gtksizegroup.c:946
#25 _gtk_size_group_compute_requisition (widget=3D0x1e8568, requisition=3D0=
xbcd2c) at gtksizegroup.c:828
#26 0x4077455a in IA__gtk_widget_size_request (widget=3D0x1e8568, requisiti=
on=3D0xbcd2c) at gtkwidget.c:3906
#27 0x40741028 in gtk_tool_item_size_request (widget=3D0xbcd10, requisition=
=3D0xbcd2c) at gtktoolitem.c:529
#28 0x402e5920 in g_cclosure_marshal_VOID__BOXED (closure=3D0x11c680, retur=
n_value=3D<optimized out>, n_param_values=3D<optimized out>, param_values=
=3D0x210120,=20
    invocation_hint=3D0xbeffe7e4, marshal_data=3D0x40740fe9) at gmarshal.c:=
574
#29 0x402e35e8 in g_type_class_meta_marshal (closure=3D0x11c680, return_val=
ue=3D0x0, n_param_values=3D2, param_values=3D0x210120, invocation_hint=3D0x=
beffe7e4,=20
    marshal_data=3D0x7c) at gclosure.c:885
#31 0x402f0c54 in signal_emit_unlocked_R (node=3D<optimized out>, detail=3D=
1126, instance=3D0x1, emission_return=3D0x40313ac8, instance_and_params=3D0=
x210120)
    at gsignal.c:3202
#32 0x402f7740 in g_signal_emit_valist (instance=3D0x1, signal_id=3D<optimi=
zed out>, detail=3D1076968136, var_args=3D...) at gsignal.c:3003
#33 0x402f797c in g_signal_emit_by_name (instance=3D<optimized out>, detail=
ed_signal=3D0x40869d80 "size-request") at gsignal.c:3097
#34 0x407002d0 in do_size_request (widget=3D0xbcd10) at gtksizegroup.c:628
#35 do_size_request (widget=3D0xbcd10) at gtksizegroup.c:946
#36 _gtk_size_group_compute_requisition (widget=3D0xbcd10, requisition=3D0x=
beffea34) at gtksizegroup.c:828
#37 0x4077455a in IA__gtk_widget_size_request (widget=3D0xbcd10, requisitio=
n=3D0xbeffea34) at gtkwidget.c:3906
#38 0x4073b194 in toolbar_content_size_request (content=3D0x136490, toolbar=
=3D0x1b6800, requisition=3D0xbeffea34) at gtktoolbar.c:4170
#39 0x4073d6f6 in gtk_toolbar_size_request (widget=3D0x1b6800, requisition=
=3D0x1b681c) at gtktoolbar.c:928
#40 0x402e5920 in g_cclosure_marshal_VOID__BOXED (closure=3D0x11c680, retur=
n_value=3D<optimized out>, n_param_values=3D<optimized out>, param_values=
=3D0x210060,
    invocation_hint=3D0xbeffeb5c, marshal_data=3D0x4073d6a5) at gmarshal.c:=
574
#41 0x402e35e8 in g_type_class_meta_marshal (closure=3D0x11c680, return_val=
ue=3D0x0, n_param_values=3D2, param_values=3D0x210060, invocation_hint=3D0x=
beffeb5c,
    marshal_data=3D0x7c) at gclosure.c:885
#42 0x402e46a8 in g_closure_invoke (closure=3D0x11c680, return_value=3D0x0,=
 n_param_values=3D2, param_values=3D0x210060, invocation_hint=3D0xbeffeb5c)
    at gclosure.c:774
#43 0x402f0c54 in signal_emit_unlocked_R (node=3D<optimized out>, detail=3D=
1126, instance=3D0x41e64004, emission_return=3D0x40313ac8, instance_and_par=
ams=3D0x210060)
    at gsignal.c:3202
#44 0x402f7740 in g_signal_emit_valist (instance=3D0x1, signal_id=3D<optimi=
zed out>, detail=3D1076968136, var_args=3D...) at gsignal.c:3003
#45 0x402f797c in g_signal_emit_by_name (instance=3D<optimized out>, detail=
ed_signal=3D0x40869d80 "size-request") at gsignal.c:3097
#46 0x407002d0 in do_size_request (widget=3D0x1b6800) at gtksizegroup.c:628
#47 do_size_request (widget=3D0x1b6800) at gtksizegroup.c:946
#48 _gtk_size_group_compute_requisition (widget=3D0x1b6800, requisition=3D0=
xbeffed70) at gtksizegroup.c:828
#49 0x4077455a in IA__gtk_widget_size_request (widget=3D0x1b6800, requisiti=
on=3D0xbeffed70) at gtkwidget.c:3906
#50 0x4063a51a in gtk_box_size_request (widget=3D0x106dc0, requisition=3D0x=
106ddc) at gtkbox.c:280
#51 0x402e5920 in g_cclosure_marshal_VOID__BOXED (closure=3D0x11c680, retur=
n_value=3D<optimized out>, n_param_values=3D<optimized out>, param_values=
=3D0x2019b0,
    invocation_hint=3D0xbeffee94, marshal_data=3D0x4063a4c5) at gmarshal.c:=
574
#52 0x402e35e8 in g_type_class_meta_marshal (closure=3D0x11c680, return_val=
ue=3D0x0, n_param_values=3D2, param_values=3D0x2019b0, invocation_hint=3D0x=
beffee94,
    marshal_data=3D0x7c) at gclosure.c:885
#53 0x402e46a8 in g_closure_invoke (closure=3D0x11c680, return_value=3D0x0,=
 n_param_values=3D2, param_values=3D0x2019b0, invocation_hint=3D0xbeffee94)
    at gclosure.c:774
#54 0x402f0c54 in signal_emit_unlocked_R (node=3D<optimized out>, detail=3D=
1126, instance=3D0x8001, emission_return=3D0x40313ac8, instance_and_params=
=3D0x2019b0)
    at gsignal.c:3202
#55 0x402f7740 in g_signal_emit_valist (instance=3D0x1, signal_id=3D<optimi=
zed out>, detail=3D1076968136, var_args=3D...) at gsignal.c:3003
#56 0x402f797c in g_signal_emit_by_name (instance=3D<optimized out>, detail=
ed_signal=3D0x40869d80 "size-request") at gsignal.c:3097
#57 0x407002d0 in do_size_request (widget=3D0x106dc0) at gtksizegroup.c:628
#58 do_size_request (widget=3D0x106dc0) at gtksizegroup.c:946
#59 _gtk_size_group_compute_requisition (widget=3D0x106dc0, requisition=3D0=
xbefff0a8) at gtksizegroup.c:828
#60 0x4077455a in IA__gtk_widget_size_request (widget=3D0x106dc0, requisiti=
on=3D0xbefff0a8) at gtkwidget.c:3906
#61 0x4077fde0 in gtk_window_size_request (requisition=3D0x133024, widget=
=3D0x133008) at gtkwindow.c:4968
#62 gtk_window_size_request (widget=3D0x133008, requisition=3D0x133024) at =
gtkwindow.c:4952
#63 0x402e5920 in g_cclosure_marshal_VOID__BOXED (closure=3D0x11c680, retur=
n_value=3D<optimized out>, n_param_values=3D<optimized out>, param_values=
=3D0x210000,
    invocation_hint=3D0xbefff1b4, marshal_data=3D0x4077fdad) at gmarshal.c:=
574
#64 0x402e35e8 in g_type_class_meta_marshal (closure=3D0x11c680, return_val=
ue=3D0x0, n_param_values=3D2, param_values=3D0x210000, invocation_hint=3D0x=
befff1b4,=20
    marshal_data=3D0x7c) at gclosure.c:885
#65 0x402e4764 in g_closure_invoke (closure=3D0x11c680, return_value=3D0x0,=
 n_param_values=3D2, param_values=3D0x210000, invocation_hint=3D0xbefff1b4)
    at gclosure.c:774
#66 0x402f0c54 in signal_emit_unlocked_R (node=3D<optimized out>, detail=3D=
1126, instance=3D0x1, emission_return=3D0x40313ac8, instance_and_params=3D0=
x210000)
    at gsignal.c:3202
#67 0x402f7740 in g_signal_emit_valist (instance=3D0x1, signal_id=3D<optimi=
zed out>, detail=3D1076968136, var_args=3D...) at gsignal.c:3003
#68 0x402f797c in g_signal_emit_by_name (instance=3D<optimized out>, detail=
ed_signal=3D0x40869d80 "size-request") at gsignal.c:3097
#69 0x407002d0 in do_size_request (widget=3D0x133008) at gtksizegroup.c:628
#70 do_size_request (widget=3D0x133008) at gtksizegroup.c:946
#71 _gtk_size_group_compute_requisition (widget=3D0x133008, requisition=3D0=
x0) at gtksizegroup.c:828
#72 0x4077455a in IA__gtk_widget_size_request (widget=3D0x133008, requisiti=
on=3D0x0) at gtkwidget.c:3906
#73 0x4077f574 in gtk_window_compute_configure_request (window=3D<optimized=
 out>, request=3D0xbefff504, geometry=3D0xbefff4b8, flags=3D0xbefff514)
    at gtkwindow.c:5842
#74 0x407818a2 in gtk_window_show (widget=3D0x133008) at gtkwindow.c:4509
#75 0x402e540c in g_cclosure_marshal_VOID__VOID (closure=3D0x11bd90, return=
_value=3D<optimized out>, n_param_values=3D<optimized out>,=20
    param_values=3D<optimized out>, invocation_hint=3D0xbefff614, marshal_d=
ata=3D0x40781861) at gmarshal.c:85
#76 0x402e35e8 in g_type_class_meta_marshal (closure=3D0x11bd90, return_val=
ue=3D0x0, n_param_values=3D1, param_values=3D0x15a5c0, invocation_hint=3D0x=
befff614,=20
    marshal_data=3D0x5c) at gclosure.c:885
#77 0x402e4764 in g_closure_invoke (closure=3D0x11bd90, return_value=3D0x0,=
 n_param_values=3D1, param_values=3D0x15a5c0, invocation_hint=3D0xbefff614)
    at gclosure.c:774
#78 0x402f0c54 in signal_emit_unlocked_R (node=3D<optimized out>, detail=3D=
1126, instance=3D0x403139c0, emission_return=3D0x40313ac8, instance_and_par=
ams=3D0x15a5c0)
    at gsignal.c:3202
#79 0x402f7740 in g_signal_emit_valist (instance=3D0x1, signal_id=3D<optimi=
zed out>, detail=3D1257480, var_args=3D...) at gsignal.c:3003
#80 0x402f7860 in g_signal_emit (instance=3D<optimized out>, signal_id=3D<o=
ptimized out>, detail=3D0) at gsignal.c:3060
#81 0x4077b024 in IA__gtk_widget_show (widget=3D0x133008) at gtkwidget.c:32=
10
#82 IA__gtk_widget_show (widget=3D0x133008) at gtkwidget.c:3201
#83 0x000255e8 in _start ()

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ADZbWkCsHQ7r3kzd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7xjVsACgkQN1Ujt2V2gBw/KgCfS/dURwHcS8mVRF2nO1+8hTfZ
vBgAnA6NUyUKJSve29cbDBQLJPxpFams
=cLGE
-----END PGP SIGNATURE-----

--ADZbWkCsHQ7r3kzd--
