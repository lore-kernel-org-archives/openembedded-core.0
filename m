Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49899.1795635277273944310
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 11:34:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=n2a/hhu4;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5DDDD4E4177E
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 19:34:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A47060480;
	Wed, 25 Nov 2026 19:34:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 33BA111E6B0E6;
	Wed, 25 Nov 2026 20:34:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795635270; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MfHnWdy7FLNfBqLXS8pjFvHMNBCuP7oBfBJedwQx9Cs=;
	b=n2a/hhu43bJGlmyjUpmDxqIxuXxkemFQuZdpuJnGZR8iM3oNntGHetBTqorpAiMqJ1UQTA
	97E4KTO9H41w1gJNZHju5nrlZx0XNdbePycWMyXONx9FzeEw80i/3odoBXLgthxV7BP/wM
	8+D9Jvz48/f9/EqWwKzlz6jlxyqFyQ0E6WBkiQzcH6iMlAwoGiHt4SnlyTWnl89CenRSX7
	kz4Hd4d4Qz+jam+g6dEeDDLFrRsZmI93jynMfCL2e3qagoL+yDHyUA4Z9jNlr9e9PL6YBI
	q4TtyuFhvnwSLmjqZnBszdSJYk6QIV9PcFmnABY7FkJ0jgj17wzdNMPf9eZXfw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 20:34:29 +0100
Message-Id: <DN4JKUWGGW6N.2D27G8AZIUPWW@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 03/11] gtk4: upgrade 4.24.1 -> 4.24.2
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261124171807.74394-1-jaipaul.cheernam@est.tech>
 <20261124171807.74394-4-jaipaul.cheernam@est.tech>
In-Reply-To: <20261124171807.74394-4-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 19:34:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251244

On Tue Nov 24, 2026 at 6:17 PM CET, Jaipaul Cheernam wrote:
> NEWS: https://gitlab.gnome.org/GNOME/gtk/-/blob/4.24.2/NEWS
>
> Changes in 4.24.2, 22-11-2026
> -----------------------------
>

Hi Jaipaul,

Sorry, I thought I replied earlier, but I didn't.

This is having some build failures:

ERROR: gtk4-4.24.2-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker=
/no-x11/build/build/tmp/work/x86-64-v3-poky-linux/gtk4/4.24.2/temp/run.do_c=
ompile.3357389' failed with exit code 1
...
| ../sources/gtk-4.24.2/gtk/media/gtkgstsink.c: In function 'gtk_gst_sink_i=
nitialize_gl':
| ../sources/gtk-4.24.2/gtk/media/gtkgstsink.c:895:25: error: implicit decl=
aration of function 'gst_gl_display_egl_from_gl_display'; did you mean 'gst=
_gl_display_filter_gl_api'? [-Wimplicit-function-declaration]
|   895 |           display_ptr =3D gst_gl_display_egl_from_gl_display (sel=
f->gst_display);
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                         gst_gl_display_filter_gl_api
| ../sources/gtk-4.24.2/gtk/media/gtkgstsink.c:895:25: warning: nested exte=
rn declaration of 'gst_gl_display_egl_from_gl_display' [-Wnested-externs]
| ../sources/gtk-4.24.2/gtk/media/gtkgstsink.c:895:23: error: assignment to=
 'gpointer' {aka 'void *'} from 'int' makes pointer from integer without a =
cast [-Wint-conversion]
|   895 |           display_ptr =3D gst_gl_display_egl_from_gl_display (sel=
f->gst_display);
|       |                       ^
| ../sources/gtk-4.24.2/gtk/media/gtkgstsink.c:897:11: error: implicit decl=
aration of function 'gst_gl_display_egl_set_foreign'; did you mean 'gst_gl_=
display_get_type'? [-Wimplicit-function-declaration]
|   897 |           gst_gl_display_egl_set_foreign (display_ptr, TRUE);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           gst_gl_display_get_type

I can only see this one on the no-x11 build.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/5078

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

