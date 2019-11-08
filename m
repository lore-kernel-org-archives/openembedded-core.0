Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 92A4F7F7B3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2019 18:13:33 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id 205so6113757qkk.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Nov 2019 10:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lJLsbj53xtESOsiVAmgrTyJCH+lAQmGqnx4rDTE+MAA=;
	b=FxWjosZhTEfmJ9W8W5He3DCd0ouq4u72YBNa9kZfhSZSDRAOEXyGRz1To1DSTPMd8J
	exoSMrbPQqFkXc6a5IVSY6p+3wSjtZNuoScImq0W6CAaZIZ+CM9pspkTwoW8Ll8u12s6
	KBfjdMTWxyet84nX2thxHg6a63/738EjNwQF2H/GvsfkeapwEmK3BrRYJXLyBANkFjqL
	5bilwCJc0dMwwn8n5jrDBIojnOBB9CDLE/wKiywJ/za/+8dPQoRJ6BFCwZhszUc+AByh
	vUhHIs/SRPlhr0cSK7C+fUNbR+jIqaBplm2F0fkVRyo9whdmNcLjmohzFVEPOSWx1UlO
	9mTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lJLsbj53xtESOsiVAmgrTyJCH+lAQmGqnx4rDTE+MAA=;
	b=WFLREkGjEJp0tyD6N3jjEtXNJ4TnaE0ytimhAIkGtevFOxw36XH6s3BFqGQB7mS29U
	3PdYx1GY2k38AEqzNuaeSHwViDiVbI9tI2CFkZck8r/pZvrtk8grsCvsi4XkcGCwg/IJ
	2Pr39OVSOO/S04jJzYLu834xSGJ7crSCsIl5idS4VF7pbpgVI7F6szlk7LioXWLaOY4N
	faDC2vJI8tvQwHlBl5vls/uZThPygvJTHJhzXcQ9NdrFMzEtovdITSz1QHHj+P3q7xBo
	ZBrSoPY6SGClIBKCd8NdKjW2dzslhd69Me4CFYxWL9MMR7g1Yqn/P+VB/iUXL8YUIGtE
	t8DQ==
X-Gm-Message-State: APjAAAVK5SO8l7T4QP8XGa8XKxOnbQAS1dV12hwZ+fQ9p9vdMFcKOuVf
	MXoKy8rD2Y8R6fmBgV+T6a7hiXs9QIhdcpJtLIM=
X-Google-Smtp-Source: APXvYqy8OMDLn+8g8UvDy9gZyvhmp9eBPqkrUrbP+zv7HIRAGlD+KD2fPSeM3i+vmn/+cN9FZBNjJefT4qnDk/SMGM4=
X-Received: by 2002:a37:6554:: with SMTP id z81mr10580711qkb.9.1573236814092; 
	Fri, 08 Nov 2019 10:13:34 -0800 (PST)
MIME-Version: 1.0
References: <20191104224805.3149-1-alistair.francis@wdc.com>
	<fd81b5bc-cb84-8857-ea5e-bce2c931750b@intel.com>
In-Reply-To: <fd81b5bc-cb84-8857-ea5e-bce2c931750b@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Nov 2019 10:13:07 -0800
Message-ID: <CAMKF1srMzPL4pBAQYscX6fxPPL2SExcYFw+Ti2B656nK3hyH0g@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6] mesa: Upgrade to 19.2.1
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
X-List-Received-Date: Fri, 08 Nov 2019 18:13:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 8, 2019 at 2:32 AM Ross Burton <ross.burton@intel.com> wrote:
>
> On 04/11/2019 22:48, Alistair Francis wrote:
> > From: Alistair Francis <alistair@alistair23.me>
> >
> > Upgrade mesa and mesa-gl to 19.2.1.
> >
> > The license hash change was a trivial new line removal.
> >
> > The glx-tls option was removed as it isn't included in the meson.build
> > file. It has been replaced with 'use-elf-tls' instead.
>
> I think this has regressed something, this is a new warning on musl builds:
>
> do_package_qa: QA Issue: ELF binary
> '[...]libgles2-mesa/usr/lib/libGLESv2.so.2.0.0' has relocations in .text
> [textrel]
>
> (ditto for libGLESv1_CM.so.1.1.0 libGL.so.1.2.0 libglapi.so.0.0.0)
>

right this means glx-tls is not working anymore, and it will fail on
musl at runtime
see
https://gitlab.freedesktop.org/mesa/mesa/issues/966

> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

