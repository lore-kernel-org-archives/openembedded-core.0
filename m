Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id AFE4F65DB3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 15:51:31 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id ey11so13241498pad.38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 08:51:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=a4Q/UuESGDMcdYyY18GlAfTMX8K+81PCPTgGUEpLpgE=;
	b=bBUNLeWapwIFkhhhAr8LGiEfnbXY29Rp74qFIaO02UACK/l544iAC/p9U2EtwoWvYi
	5lwVwy+2k0ljtsvsR6GY6rLXEeNWkeSlEMhbOD4ngt/EPbifFFIYqTqgym6m23eEcPRm
	N7yr7uAWaByGknStdkQQmGXAwbpSlc4xJdDDUQz82e8ZtWuoo9nN/AjKmoxv11yYSL28
	n+w/aPAYEaRTtsFgilSSDtXUDq+eX9mqQMXd8jH0ptJ3AuniSMn2vuMcf9ZJwryaT2KE
	UhBVaRhtbxBwRTQsoWnd8if6tFkHR8/mL24uXOI8L81tSHADXZWuAhpax8Olq3EX6aRI
	9LSQ==
X-Gm-Message-State: ALoCoQmx/fyq2pYIsr1ct/vLg0f+8/0UNiqC//aEwunYbfl72PF2qhG+5KWxFrwtR9ezizxEfZ5i
MIME-Version: 1.0
X-Received: by 10.70.88.39 with SMTP id bd7mr5013932pdb.68.1407858692528; Tue,
	12 Aug 2014 08:51:32 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.136 with HTTP; Tue, 12 Aug 2014 08:51:32 -0700 (PDT)
In-Reply-To: <CAJTo0Lazj1tj11_56hnuryzuKCszJqiSkK5TUXYof=YNdnG4Bg@mail.gmail.com>
References: <CAOMwXhMSMY6Bxzn7Qwmz-kUnFez_LkhSU7FArsoo0rdz6ZVifw@mail.gmail.com>
	<CAJTo0LYEYgWqTW7mmeonf=JVbH8hXrKhtBTsy_LfSRpuVZQ_tA@mail.gmail.com>
	<CAOMwXhOxf8x7ty2M4fnBN6yEbmVPbpwWZCeR-1BsEsH=Z9dX+w@mail.gmail.com>
	<CAJTo0Lazj1tj11_56hnuryzuKCszJqiSkK5TUXYof=YNdnG4Bg@mail.gmail.com>
Date: Tue, 12 Aug 2014 16:51:32 +0100
X-Google-Sender-Auth: Jy0az_rA-P5-8ixWUlFMEswPc-c
Message-ID: <CAOMwXhOYAEePg+RGmqOW1u-UsaD9cxQdW8+pdbUKf8GiYt9pWA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Adding cgdb to meta
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
X-List-Received-Date: Tue, 12 Aug 2014 15:51:32 -0000
Content-Type: multipart/alternative; boundary=001a11c22bea431ffa050070a531

--001a11c22bea431ffa050070a531
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 12, 2014 at 4:48 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 12 August 2014 16:46, Laszlo Papp <lpapp@kde.org> wrote:
> > That layer is too big. It is nearly everything that is rejected from
> meta;
> > ok there are some dedicated layers, like meta-networking, but it feels
> like
> > the last resort shelter where everything can just be thrown at.
> >
> > I do not think it is just us who do not wanna pull it into their project.
> > Never mind, it remains to be a feature in our layer, which is closed
> source,
> > then. It is a pity, but I will move along.
>
> People who think its too big are welcome to copy recipes out of it and
> sync them manually - that's still better than not sharing the recipe.
>

I am unfortunately not interested in participating to something that I have
no intent to even test myself before submitting. meta-oe became a monster
can which I personally would not like to deal with. That is said with
due-respect. If its goal were reconsidered and split into several small
layers, then mayhaps... But it is not there, and I am not sure if it was
any soon...

Unfortunately, this feature remains proprietary at the point of writing
this. As long as it works for me, I will not be too much bothered, although
I feel sorry for those who will need to reinvent the recipe, modulo
stabilization.

--001a11c22bea431ffa050070a531
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Aug 12, 2014 at 4:48 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&g=
t;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">On 12 August 2014 16:46, Las=
zlo Papp &lt;<a href=3D"mailto:lpapp@kde.org">lpapp@kde.org</a>&gt; wrote:<=
br>
&gt; That layer is too big. It is nearly everything that is rejected from m=
eta;<br>
&gt; ok there are some dedicated layers, like meta-networking, but it feels=
 like<br>
&gt; the last resort shelter where everything can just be thrown at.<br>
&gt;<br>
&gt; I do not think it is just us who do not wanna pull it into their proje=
ct.<br>
&gt; Never mind, it remains to be a feature in our layer, which is closed s=
ource,<br>
&gt; then. It is a pity, but I will move along.<br>
<br>
</div>People who think its too big are welcome to copy recipes out of it an=
d<br>
sync them manually - that&#39;s still better than not sharing the recipe.<b=
r></blockquote><div><br></div><div>I am unfortunately not interested in par=
ticipating to something that I have no intent to even test myself before su=
bmitting. meta-oe became a monster can which I personally would not like to=
 deal with. That is said with due-respect. If its goal were reconsidered an=
d split into several small layers, then mayhaps... But it is not there, and=
 I am not sure if it was any soon...</div>
<div><br></div><div>Unfortunately, this feature remains proprietary at the =
point of writing this. As long as it works for me, I will not be too much b=
othered, although I feel sorry for those who will need to reinvent the reci=
pe, modulo stabilization.</div>
</div></div></div>

--001a11c22bea431ffa050070a531--
