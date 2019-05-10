Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 960087D2AE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 10:45:06 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y2so6980470wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 03:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=oeEUfwtT13a1EjcHi3V6AYIYYLEJO3jRbUy3d0mftHo=;
	b=rYJlw8HD6GywqAdQNijVXLOJTTsY6kVwRd1F4IBTbDnSpzQf+A0AZFgYLPsSFpnU0q
	M6pUtTnPFoLGOpaqdh0aII3If5NFMf8799YketeOdBg5AQ4nussU929NVw1EwqBQZ3lM
	Vro+SfzKC4jO/VsZzgC2H4LDuaeK1TudmkTGUTNG3idh6olylqcRt/1VeqxiSqdTW2MN
	XJ/3R74z7fwNfpIc9k6c8Mhln4tZoajxKwE48KRF+d35O83YHdK8IIUP8JeAJ8SXpAAW
	iFXR1r1EuOX03XAVY8sQwp3O+YmoOY+/O0GwzMNq6ktEZaa1lj7rVZ0CH5q6XfdyuBUL
	KcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=oeEUfwtT13a1EjcHi3V6AYIYYLEJO3jRbUy3d0mftHo=;
	b=nW/QwqnaSewc1Fuj7yO5K/YuSirclwz+jUTmz+e5toltzgb1gB2I/XUM7pPWraPsop
	hK1k/67SgcYJkT2yd/DlvQKgvJqepoapbSVvvZ4EMEnR1w2/poIKbzGMemzWz7fU7+wS
	654wfU2NK18Iwkc5ILoSDmPLH5RzXDpBB/lf6Um7tqfuMLkn+/GelXwx8RKbnbQecRTB
	efENZOp/oQT3T1a3bo9AwMebUw2j1g+YC1tFIIrbJsLnNp0YuHqC91KzAsBCOgInMoCR
	KCVGwk7R+7E3iHyagDhWI50iynPE2PN8YH0694+j5vVJBw5fyvnNUC4E9y9VXUUN6gHL
	1J0g==
X-Gm-Message-State: APjAAAWIiaxIxzysTSGaNC76hX5pzIIKN7kRPpeAWGws9hhAMVaY1fKk
	Ut7pe5FByrhKh1ZufQwZJQg=
X-Google-Smtp-Source: APXvYqz/9DDdvIWYeWoLP1YGTMHnYiinkuxhDUTMCoaF2rNBdJi7kQ5uJOjmP9uVyv/3TG24Tb0MmA==
X-Received: by 2002:a1c:7fce:: with SMTP id a197mr6802881wmd.134.1557485107103;
	Fri, 10 May 2019 03:45:07 -0700 (PDT)
Received: from bluca-lenovo ([88.98.246.218])
	by smtp.gmail.com with ESMTPSA id o4sm5995038wmo.20.2019.05.10.03.45.06
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 10 May 2019 03:45:06 -0700 (PDT)
Message-ID: <8c442a101d981e309ce28c8c74ec64fbc849bd6c.camel@gmail.com>
From: Luca Boccassi <luca.boccassi@gmail.com>
To: Martin =?ISO-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2019 11:45:05 +0100
In-Reply-To: <f2b0a420-ed6c-91e2-dd88-399169363349@geanix.com>
References: <20190509214007.13927-1-luca.boccassi@gmail.com>
	<f2b0a420-ed6c-91e2-dd88-399169363349@geanix.com>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Subject: Re: [PATCH] systemd: enable portabled by default and install utilities in systemd-container
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
X-List-Received-Date: Fri, 10 May 2019 10:45:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2019-05-10 at 07:23 +0200, Martin Hundebøll wrote:
> Hi Luca,
> 
> On 09/05/2019 23.40, 
> luca.boccassi@gmail.com
>  wrote:
> > From: Luca Boccassi <
> > luca.boccassi@microsoft.com
> > >
> > 
> > portable services have been declared production ready with v241, so
> > enable
> > by default and install the files in the container package.
> 
> The systemd portables feature is not really related to
> containers/VM's, 
> so I think it should stay in the primary package; or alternatively in
> a 
> separate package.
> 
> // Martin

Hello Martin,

IMHO if VM tools and containers tool can go together in this package,
then portable services utilities can too - they are at different
positions on the same scale after all :-)

But I've got no strong opinion, so I'll send a v2 with them moved to
the main package.

> > Signed-off-by: Luca Boccassi <
> > luca.boccassi@microsoft.com
> > >
> > ---
> >   meta/recipes-core/systemd/systemd_242.bb | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> > 
> > diff --git a/meta/recipes-core/systemd/systemd_242.bb
> > b/meta/recipes-core/systemd/systemd_242.bb
> > index 73e03c7a77..83b00ba785 100644
> > --- a/meta/recipes-core/systemd/systemd_242.bb
> > +++ b/meta/recipes-core/systemd/systemd_242.bb
> > @@ -81,6 +81,7 @@ PACKAGECONFIG ??= " \
> >       nss \
> >       nss-mymachines \
> >       nss-resolve \
> > +    portabled \
> >       quotacheck \
> >       randomseed \
> >       resolved \
> > @@ -403,8 +404,10 @@ SYSTEMD_SERVICE_${PN}-remote = "systemd-
> > journal-remote.socket"
> >   
> >   FILES_${PN}-container = "${sysconfdir}/dbus-
> > 1/system.d/org.freedesktop.import1.conf \
> >                            ${sysconfdir}/dbus-
> > 1/system.d/org.freedesktop.machine1.conf \
> > +                         ${sysconfdir}/dbus-
> > 1/system.d/org.freedesktop.portable1.conf \
> >                            ${sysconfdir}/systemd/system/multi-
> > user.target.wants/machines.target \
> >                            ${base_bindir}/machinectl \
> > +                         ${base_bindir}/portablectl \
> >                            ${bindir}/systemd-nspawn \
> >                            ${nonarch_libdir}/systemd/import-
> > pubring.gpg \
> >                            ${systemd_system_unitdir}/busnames.targe
> > t.wants/org.freedesktop.import1.busname \
> > @@ -418,21 +421,28 @@ FILES_${PN}-container = "${sysconfdir}/dbus-
> > 1/system.d/org.freedesktop.import1.c
> >                            ${systemd_system_unitdir}/org.freedeskto
> > p.machine1.busname \
> >                            ${systemd_system_unitdir}/systemd-
> > importd.service \
> >                            ${systemd_system_unitdir}/systemd-
> > machined.service \
> > +                         ${systemd_system_unitdir}/systemd-
> > portabled.service \
> >                            ${systemd_system_unitdir}/dbus-
> > org.freedesktop.machine1.service \
> > +                         ${systemd_system_unitdir}/dbus-
> > org.freedesktop.portable1.service \
> >                            ${systemd_system_unitdir}/var-lib-
> > machines.mount \
> >                            ${rootlibexecdir}/systemd/systemd-import 
> > \
> >                            ${rootlibexecdir}/systemd/systemd-
> > importd \
> >                            ${rootlibexecdir}/systemd/systemd-
> > machined \
> > +                         ${rootlibexecdir}/systemd/systemd-
> > portabled \
> >                            ${rootlibexecdir}/systemd/systemd-pull \
> > +                         ${exec_prefix}/lib/tmpfiles.d/portables.c
> > onf \
> >                            ${exec_prefix}/lib/tmpfiles.d/systemd-
> > nspawn.conf \
> >                            ${systemd_system_unitdir}/systemd-
> > nspawn@.service \
> >                            ${libdir}/libnss_mymachines.so.2 \
> >                            ${datadir}/dbus-1/system-
> > services/org.freedesktop.import1.service \
> >                            ${datadir}/dbus-1/system-
> > services/org.freedesktop.machine1.service \
> > +                         ${datadir}/dbus-1/system-
> > services/org.freedesktop.portable1.service \
> >                            ${datadir}/dbus-
> > 1/system.d/org.freedesktop.import1.conf \
> >                            ${datadir}/dbus-
> > 1/system.d/org.freedesktop.machine1.conf \
> > +                         ${datadir}/dbus-
> > 1/system.d/org.freedesktop.portable1.conf \
> >                            ${datadir}/polkit-
> > 1/actions/org.freedesktop.import1.policy \
> >                            ${datadir}/polkit-
> > 1/actions/org.freedesktop.machine1.policy \
> > +                         ${datadir}/polkit-
> > 1/actions/org.freedesktop.portable1.policy \
> >                           "
> >   
> >   RRECOMMENDS_${PN}-container += "\
> > 
> 
> 
-- 
Kind regards,
Luca Boccassi


