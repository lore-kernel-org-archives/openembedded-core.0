Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 74C33734B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jul 2015 11:04:48 +0000 (UTC)
Received: by qkdv3 with SMTP id v3so129958772qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jul 2015 04:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=W5tjg8ZljNtL641yjRkzdzJaTt5IzdfsVHMcRBAG/vY=;
	b=XUUAxgvVu+10iO44h8IkZm7l0ixXroq5h+ZhaEEELH2IBpjq4z2qY50z2BiRMPuXfo
	K9JJpFPR2fprNgwZXmiV48wp7qry39MCjUfLYiY230zYnJKZwQjV+7OVsgWp+oNI6P7g
	F4krLzPvyeBfuMOGf1ejLDBGEjcNrlKXcM9fhkz0SEO/cVc2mDTISlE6OqsidOgYHXmu
	KVgVBjuCXjVR9U0KEbh+XGsGDAMD2BWgbKsaFvCElls/s107uCsxF67/tD0qWygmiYq1
	LJNWNegYLxsRrUwAjKIHAiiX6A7EskU9UAjbNJNuozcs3qEQ+6ZEwzDm974nGEeLAM5C
	lzLQ==
X-Gm-Message-State: ALoCoQnZHCrzOHRDtStV2vjudquLCx2M/i+Wt1+KidZO0oJEYR9qJ/97Mmh9XbVDZ51s41SeZSBx
X-Received: by 10.140.196.85 with SMTP id r82mr24737389qha.64.1437476689044;
	Tue, 21 Jul 2015 04:04:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Tue, 21 Jul 2015 04:04:29 -0700 (PDT)
In-Reply-To: <CAMg8ce-Wa5s4xt-19rdYJ4fOa5q7109XZL40AZSBLbitNBKzGw@mail.gmail.com>
References: <20150620103730.GD2398@jama>
	<1435842191-5106-1-git-send-email-Martin.Jansa@gmail.com>
	<CAMg8ce-Wa5s4xt-19rdYJ4fOa5q7109XZL40AZSBLbitNBKzGw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 21 Jul 2015 12:04:29 +0100
Message-ID: <CAJTo0Lbp1X2om+PpcG7bQqAT4jbpXE_+baYtB18s_8cob477OQ@mail.gmail.com>
To: Tobias Olausson <tobias.olausson@pelagicore.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: respect MESA_EGL_NO_X11_HEADERS even with x11 in PACKAGECONFIG
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
X-List-Received-Date: Tue, 21 Jul 2015 11:04:58 -0000
Content-Type: multipart/alternative; boundary=001a114326526c8be1051b609f1b

--001a114326526c8be1051b609f1b
Content-Type: text/plain; charset=UTF-8

On 20 July 2015 at 22:27, Tobias Olausson <tobias.olausson@pelagicore.com>
wrote:

> I like this patch. I would like a similar patch to be made available in
> the fido branch, but changing "#if defined()" to "#ifdef" The defines seems
> to have been changed between mesa 10.4 and 10.5, so the current patch only
> works for 10.5 - in 10.4 ifdef is used instead so the sed does nothing.
> Should I submit another patch for that?


Yes, please do.

Ross

--001a114326526c8be1051b609f1b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 July 2015 at 22:27, Tobias Olausson <span dir=3D"ltr">&lt;<a href=3D"=
mailto:tobias.olausson@pelagicore.com" target=3D"_blank">tobias.olausson@pe=
lagicore.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I like=
 this patch. I would like a similar patch to be made available in the fido =
branch, but changing &quot;#if defined()&quot; to &quot;#ifdef&quot; The de=
fines seems to have been changed between mesa 10.4 and 10.5, so the current=
 patch only works for 10.5 - in 10.4 ifdef is used instead so the sed does =
nothing. Should I submit another patch for that?</blockquote></div><br>Yes,=
 please do.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--001a114326526c8be1051b609f1b--
