Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 19B01608B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 22:00:06 +0000 (UTC)
Received: by qgev79 with SMTP id v79so31006383qge.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 15:00:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=RWGVj3itivHL3yv+Sb5+ylFsht6gJSw/eS9NFCUUxTQ=;
	b=Jp/kUBKaYSRoXWwoYfz2yUjk7h81bMA+w6xy8jpfAcx1HpMVujWcnEL6Iu6IUfR23s
	gXjW7s8+udpVd3d//D38hxBrkL9h1YXN5XjpgP1xur03UAxIWlwCzDfetEVVTtiKp0XS
	o2vAARKH5RpdRZXmgVO7tupNQAZAw0LfdfrTA+BHBVVGPkrM9hfg4sUUSs99I9n8mWvN
	sLEQ1Xg79k9ZmILlJ9mcEog6MLnRHA1siR7UefGKucTf+D1Hk89WSIXGaJl4408f8sxn
	Oc2BFBOgCWFsf55zVpOKsaboYzR5L/OuFMXwAsdUuLDoYPudQA8XPRWDp6jsJU7/qZL6
	PpGg==
X-Gm-Message-State: ALoCoQmncQRjO5MGwSbJb4BjmXEIuGpzvLjIam5CdHurPgReDzTYYITRMQWCEYG1TvWjDe6MxOzO
X-Received: by 10.140.165.196 with SMTP id l187mr42280701qhl.93.1443045606658; 
	Wed, 23 Sep 2015 15:00:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Wed, 23 Sep 2015 14:59:47 -0700 (PDT)
In-Reply-To: <0D818C7A2259ED42912C1E04120FDE26711252D1@ORSMSX111.amr.corp.intel.com>
References: <267c50d7a79a2afeb44ac6b0b51fc015d4c82bfb.1443040802.git.reinette.chatre@intel.com>
	<CAJTo0Lb6WQTtZpJvV73jLzJ9v=MrNm=m9e=DyWMVj+BMq9dBGw@mail.gmail.com>
	<0D818C7A2259ED42912C1E04120FDE26711252D1@ORSMSX111.amr.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Sep 2015 22:59:47 +0100
Message-ID: <CAJTo0LY5uB6G6kiu189YN2Dvwc-H9xWntqArSTu06-WnoH=Uow@mail.gmail.com>
To: "Chatre, Reinette" <reinette.chatre@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: fix tmpfiles location when multilib in use
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
X-List-Received-Date: Wed, 23 Sep 2015 22:00:11 -0000
Content-Type: multipart/alternative; boundary=001a1134f674c7b0c50520713c9f

--001a1134f674c7b0c50520713c9f
Content-Type: text/plain; charset=UTF-8

On 23 September 2015 at 22:20, Chatre, Reinette <reinette.chatre@intel.com>
wrote:

> [Reinette] At the moment the rest of this recipe uses ${exec_prefix}/lib
> instead of the new ${nonarch_libdir}. I chose to use ${exec_prefix}/lib to
> remain consistent with the rest of the recipe since doing so makes it clear
> that the files being checked for matches _exactly_ (same  variable name)
> with where they are installed. If you would like to transition this recipe
> to using ${nonarch_libdir} then I think it will be more appropriate to do
> so with a different patch in addition to this one. If this is what you
> prefer to see then I can submit a new patch to do so. Even when doing so I
> would prefer to see this fix go in first so that we can do an easier
> backport of it to fido since cleanups are not appropriate there (and
> ${nonarch_libdir} does not exist there). Considering this, could you please
> reconsider taking this patch and I will submit an additional one to be
> applied afterwards to do the transition to ${nonarch_libdir}.
>

That's a good argument, agreed.

Ross

--001a1134f674c7b0c50520713c9f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 September 2015 at 22:20, Chatre, Reinette <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:reinette.chatre@intel.com" target=3D"_blank">reinette.chatre@i=
ntel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":53f" class=3D"a3s" style=3D"overflow:hidden">[Reinette] At the moment =
the rest of this recipe uses ${exec_prefix}/lib instead of the new ${nonarc=
h_libdir}. I chose to use ${exec_prefix}/lib to remain consistent with the =
rest of the recipe since doing so makes it clear that the files being check=
ed for matches _exactly_ (same=C2=A0 variable name) with where they are ins=
talled. If you would like to transition this recipe to using ${nonarch_libd=
ir} then I think it will be more appropriate to do so with a different patc=
h in addition to this one. If this is what you prefer to see then I can sub=
mit a new patch to do so. Even when doing so I would prefer to see this fix=
 go in first so that we can do an easier backport of it to fido since clean=
ups are not appropriate there (and ${nonarch_libdir} does not exist there).=
 Considering this, could you please reconsider taking this patch and I will=
 submit an additional one to be applied afterwards to do the transition to =
${nonarch_libdir}.<br></div></blockquote></div><br>That&#39;s a good argume=
nt, agreed.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--001a1134f674c7b0c50520713c9f--
