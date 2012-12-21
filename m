Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <alexandru.damian@intel.com>) id 1Tm267-0003uq-Gf
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 13:53:07 +0100
Received: from mail-ob0-f198.google.com ([209.85.214.198])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 21 Dec 2012 04:38:20 -0800
Received: by mail-ob0-f198.google.com with SMTP id un3so19232828obb.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2012 04:38:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:x-gm-message-state;
	bh=o3V/meyTrixeBCZrcSSMGt02rSKRtnmbuzrsKhn091U=;
	b=U+cvSRx3dOgZv/UvVeOlevesVTEbd5z5ZvIao7cjDyPdL2dR3DjCewJOZZJHla7g8Y
	YLJXIufbQhg13V6VPC03kmxuMucsBCBcrRylYyCiMA5KhPol6/aPKG0O2lanR3WKEzHw
	L7J+oIp6cSlPbtaP/z3jLQJE7m3tiHuQq3UZIxO/cck/NZGIYk9sVrkZhJs2O8/UR2Dk
	BsTg6/aPFNR5+BhYjUtM11CsOB4ORyFHJoZqn9nawR0bXupkb6+RF1n1z1VhEl87XqUT
	ZrCJwg7ECFGOHyeb15s7L5vec60sltVBNGPG3FzjXdjh/BuQGcl5tzMQIOlCz32zyyTt
	PGzw==
X-Received: by 10.50.12.165 with SMTP id z5mr13538979igb.17.1356093498941;
	Fri, 21 Dec 2012 04:38:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.12.165 with SMTP id z5mr13538975igb.17.1356093498839; Fri,
	21 Dec 2012 04:38:18 -0800 (PST)
Received: by 10.64.49.164 with HTTP; Fri, 21 Dec 2012 04:38:18 -0800 (PST)
In-Reply-To: <CAJTo0LbiAedLWj7YNHEjXyS9XhUPpOWcHuB+RUuXhMBkWFSAiQ@mail.gmail.com>
References: <cover.1356021837.git.alexandru.damian@intel.com>
	<CAJTo0LbiAedLWj7YNHEjXyS9XhUPpOWcHuB+RUuXhMBkWFSAiQ@mail.gmail.com>
Date: Fri, 21 Dec 2012 14:38:18 +0200
Message-ID: <CAJ2CSBuAX8OZbCMmiscgUmpTqyxvHf9Nz_DrVVzucKVB=bqWdQ@mail.gmail.com>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmzt/iRxiQ5JOlSsUwT9w5kT0IIUG2H+W5SIQmGA4Q9ilc0IAmdV49Wh3graZPmtaq948vMr6VkEv1tYaqphswCfSbj+2JO4CRBDCV2C6BoRUnAcfIEHxEUnz2gtIpl738J9POCJHWSXmhSX8NPDjOECcKU66hpmmRkltkU2T1bNiVec8bTT9YjJ12s7PCqIOYlPWHX
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Initial wayland integration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Dec 2012 12:53:08 -0000
Content-Type: multipart/alternative; boundary=14dae93409bd47d38204d15c1f08

--14dae93409bd47d38204d15c1f08
Content-Type: text/plain; charset=ISO-8859-1

Actually, I'm thinking like this:

- wayland, weston - initial commits
- mesa-dri - only patches.

It makes sense in my mind to add first the commits and then enable the
recipe change,
especially when it's not gonna work by default anyway (since mesa-git isn't
enabled).

Alex


On Fri, Dec 21, 2012 at 1:47 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 20 December 2012 16:48, Alex DAMIAN <alexandru.damian@intel.com> wrote:
> >   Wayland userspace library initial 1.0.3
> >   Initial commit for wayland/weston 1.0.3
> >   Prepare mesa-dri for weston compatibility
>
> Ordering seems wrong - shouldn't it be wayland, mesa-dri, weston?
>
> Ross
> ---------------------------------------------------------------------
> Intel Corporation (UK) Limited
> Registered No. 1134945 (England)
> Registered Office: Pipers Way, Swindon SN3 1RJ
> VAT No: 860 2173 47
>
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
>

--14dae93409bd47d38204d15c1f08
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Actually, I&#39;m thinking like this:<div><br></div><div s=
tyle>- wayland, weston - initial commits</div><div style>- mesa-dri - only =
patches.=A0</div><div style><br></div><div style>It makes sense in my mind =
to add first the commits and then enable the recipe change,</div>
<div style>especially when it&#39;s not gonna work by default anyway (since=
 mesa-git isn&#39;t enabled).</div><div style><br></div><div style>Alex</di=
v></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Fr=
i, Dec 21, 2012 at 1:47 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt=
;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 20 December 2012 16:48,=
 Alex DAMIAN &lt;<a href=3D"mailto:alexandru.damian@intel.com">alexandru.da=
mian@intel.com</a>&gt; wrote:<br>

&gt; =A0 Wayland userspace library initial 1.0.3<br>
&gt; =A0 Initial commit for wayland/weston 1.0.3<br>
&gt; =A0 Prepare mesa-dri for weston compatibility<br>
<br>
</div>Ordering seems wrong - shouldn&#39;t it be wayland, mesa-dri, weston?=
<br>
<br>
Ross<br>
---------------------------------------------------------------------<br>
Intel Corporation (UK) Limited<br>
Registered No. 1134945 (England)<br>
Registered Office: Pipers Way, Swindon SN3 1RJ<br>
VAT No: 860 2173 47<br>
<br>
This e-mail and any attachments may contain confidential material for<br>
the sole use of the intended recipient(s). Any review or distribution<br>
by others is strictly prohibited. If you are not the intended<br>
recipient, please contact the sender and delete all copies.<br>
</blockquote></div><br></div>

--14dae93409bd47d38204d15c1f08--
