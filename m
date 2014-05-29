Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 840AC6FD07
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 17:48:54 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id hl10so3804340igb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 10:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=cRFfTK38EO/+hYYEiA4BITwSgkjo7ke46DOzYkeSWkw=;
	b=Qp719oLTlsVnWng3Qf3oix7619nZLRlNdfG5Svy3/0EGpP2dM10vj2ea8B3rYRiQgA
	KqUOguw5AlSYGlLKStUP8UWn5diRTYWHTznjWDLkUa2b7Ev2GCBihTpeslIVGmkLvbxc
	HvX1nHar4wvOL01yHQCqjRNpyKJ47W8tNSdNqrgLBfXwyF7Vs9MdzuJUw/q3AUpwOiDc
	vSZTxmxGfFcbbS1/lSb3l9kPLayXWNAgXTKBflp3GWm+m6sawdVdFigbReiR669SRAB3
	VTwU/S6UY2IhzL7BSASJAxCxff2+XlhypuRAiYDiY3CRtd040rnQpbSnIl/Fy5U5d0As
	PvyQ==
X-Received: by 10.50.65.3 with SMTP id t3mr55175579igs.20.1401385735910; Thu,
	29 May 2014 10:48:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.33 with HTTP; Thu, 29 May 2014 10:48:25 -0700 (PDT)
In-Reply-To: <CAMCfZKGm8UnqaDS38vqqqri2EGnKLhPZcQmoO1SdBWfOcurwDQ@mail.gmail.com>
References: <CAMCfZKEnyyR9ADx1H2X7=9kdCRPU14DRHFgMuhu9gzFnHxP1ag@mail.gmail.com>
	<53875026.60107@linux.intel.com>
	<CAMCfZKGHKjGrNLbumUXCex8=mc3RmamOu-uRv3Rc2R=7Sq+r6w@mail.gmail.com>
	<5387654C.5090309@linux.intel.com>
	<CAMCfZKGm8UnqaDS38vqqqri2EGnKLhPZcQmoO1SdBWfOcurwDQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 May 2014 10:48:25 -0700
Message-ID: <CAMKF1sqy9DQ+zwMA_HHijYXF9Ltk-Nm6U4i0C6yDuxndfWx34w@mail.gmail.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: intltool version check errors
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
X-List-Received-Date: Thu, 29 May 2014 17:48:58 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 29, 2014 at 10:23 AM, Diego Sueiro <diego.sueiro@gmail.com> wrote:
> For now these are the recipes:
>
> shared-mime-info_1.2.bb
> gconf_3.2.6.bb
> libsoup-2.4_2.45.3.bb
> gconf_3.2.6.bb
> avahi_0.6.31.bb
> xkeyboard-config_2.11.bb
> libfm_1.1.2.2.bb
> glib-networking_2.38.0.bb
> connman-gnome_0.7.bb
>
>
> Find attached the config.log for shared-mime-info-native.
>
> I had recently update my Ubuntu from 12.10 to 14.04. Do you think it can
> cause this error?
>

Do you have intltool-update binary on your host ? outside sys root ?

and if yes then whats the version of it.

