Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6235B6AC24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 08:04:30 +0000 (UTC)
Received: by qcpm10 with SMTP id m10so5222739qcp.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 01:04:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qBI3HRG8WzbCjmz2AlDE6aJbW1MIR4jC1FADuMitPwg=;
	b=fj0NSm+oViU6cu9iyXnPOCGl7jdDGZ72CDE9sLggzCow0t4pfRZ2sqbKsEZWYN8Ky3
	IZjcsn85UCHT+s5MAt8fkkUTFSTryeeNhMtXkBiospE+e8N2vrGt0pfsV8RY/skKOXRh
	we68HOiEcTHbS9wLVcOxbpGfXKuHnuKV0Y2i7AOrzKlK/cj4t7r8s8jCp+iaK+mte/13
	xXWLMNfeCp370Bm67/RSa53KeFn643MzK9dQySK8MpbjTt2nOXakdDonQSPbz8/qqtiq
	yzjGA7/SnYvmeIopoF0mKpFy7mcZr/5UUhIPFmjoaRedIAYMwtj6h8yD0FcrUFWcO/Bu
	652w==
X-Gm-Message-State: ALoCoQk5Dosih6Ex7woivZ1wSTTS0aeFGG3nSiaGxBlBO3HYwQICESAuf7fXpcH6cyQMDDi6Fa8D
X-Received: by 10.55.50.20 with SMTP id y20mr2749536qky.58.1429776271498; Thu,
	23 Apr 2015 01:04:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 23 Apr 2015 01:04:11 -0700 (PDT)
In-Reply-To: <55367179.8090800@linux.intel.com>
References: <55367179.8090800@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Apr 2015 11:04:11 +0300
Message-ID: <CAJTo0LbM+YHNdV95LX7Bq3MtJNWuB6wRLszd52RoYs5mnA6=yg@mail.gmail.com>
To: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: PulseAudio in Sato
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
X-List-Received-Date: Thu, 23 Apr 2015 08:04:33 -0000
Content-Type: multipart/alternative; boundary=001a11471392c5738d05145fbab0

--001a11471392c5738d05145fbab0
Content-Type: text/plain; charset=UTF-8

On 21 April 2015 at 18:49, Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
wrote:

> I'm planning to add a new option to /etc/pulse/client.conf:
> "allow-autospawn-for-root". I'm not sure how to meet the goal of disabling
> that option by default, and enabling it in Sato. I think it could be done
> so that the default version of client.conf would be packaged in the main
> pulseaudio recipe, and then there would be a separate recipe,
> "pulseaudio-client-conf-sato", which would replace the default
> pulseaudio-client-conf package. (Currently client.conf is in the libpulse
> package, so it would have to be split off into its own package first.) I
> don't know if this is the best way to do it, feedback would be very welcome.


Yes, this seems reasonable.

Ross

--001a11471392c5738d05145fbab0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 April 2015 at 18:49, Tanu Kaskinen <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:tanu.kaskinen@linux.intel.com" target=3D"_blank">tanu.kaskinen@linux.=
intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I&#39;m =
planning to add a new option to /etc/pulse/client.conf: &quot;allow-autospa=
wn-for-root&quot;. I&#39;m not sure how to meet the goal of disabling that =
option by default, and enabling it in Sato. I think it could be done so tha=
t the default version of client.conf would be packaged in the main pulseaud=
io recipe, and then there would be a separate recipe, &quot;pulseaudio-clie=
nt-conf-sato&quot;, which would replace the default pulseaudio-client-conf =
package. (Currently client.conf is in the libpulse package, so it would hav=
e to be split off into its own package first.) I don&#39;t know if this is =
the best way to do it, feedback would be very welcome.</blockquote></div><b=
r>Yes, this seems reasonable.</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Ross</div></div>

--001a11471392c5738d05145fbab0--
