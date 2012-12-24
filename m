Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <alexandru.damian@intel.com>) id 1Tn3Br-0002fN-BI
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 09:15:16 +0100
Received: from mail-ie0-f198.google.com ([209.85.223.198])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 24 Dec 2012 00:00:24 -0800
Received: by mail-ie0-f198.google.com with SMTP id c10so28534293ieb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Dec 2012 00:00:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:x-gm-message-state;
	bh=ylIds7Tmfd6NW2JhwsJW7BRsA+frWm8AJnpaDyj+4VM=;
	b=g5cNY7F98zUMbzJouPLKT8fbSF1d0iEnw1lJ8UVTkPAe2AWYTnQTxFe6fhxxRcGJ+f
	TkAQBHrugf4kGaX1Bb/1ZWqr3lgUaBFvghvubVPS9hiVdE+RrFUFbZPZ6IgumFVej47n
	N8EpOhOPwIP7WDqJphvVFhq8GepbEvpI2T+sB+cq8I5qB9xgv4oNM10iLFxQ0yx5x2QR
	xRWevw93H24MsBn/TKY/H+j7Qm8baO01ca/3plfWTLUd9LzImvUqmdDFeXaBygspbpUu
	cKNJk8wRZtxHPefmDig5C8VyUxYlovVPX/bnKtPDmFG46Q6kSt5+SH6soagWrRdacwjz
	PgHw==
X-Received: by 10.50.12.165 with SMTP id z5mr19469280igb.17.1356336022805;
	Mon, 24 Dec 2012 00:00:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.12.165 with SMTP id z5mr19469277igb.17.1356336022709; Mon,
	24 Dec 2012 00:00:22 -0800 (PST)
Received: by 10.64.49.164 with HTTP; Mon, 24 Dec 2012 00:00:22 -0800 (PST)
In-Reply-To: <CAJTo0LbBM0AWg1Trx_ctKqYyC2RLYgkwBcDX=6F=3agOK8SFiA@mail.gmail.com>
References: <cover.1356094006.git.alexandru.damian@intel.com>
	<45d6f8871229e15a1bca91da7beeee99201ef7a8.1356094006.git.alexandru.damian@intel.com>
	<CAJTo0LbBM0AWg1Trx_ctKqYyC2RLYgkwBcDX=6F=3agOK8SFiA@mail.gmail.com>
Date: Mon, 24 Dec 2012 10:00:22 +0200
Message-ID: <CAJ2CSBvgHoB-oDR5qu7rsK5erCO+kCf+UEGjwcURnYtm5dWQ0A@mail.gmail.com>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnOLePJnZ0cLo3Weh8FNbp3sDj0Tg4fKRrkHD3aUrkv5DTkx2C4nqYz3/haOPinO27VP9Ei4Vq3fkoZfNusm/zyU+tlSWCfe7MqgGzPjPnNwUV2SoswOVW+AbOQz4qGHhhBnFs8f8HR6jYY4Z/KTeonCH/wxXH7F7TrqMjAAw7jEuDZAwTMonuu1PZuq9559BgWtz21
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] Initial commit for wayland/weston 1.0.3
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
X-List-Received-Date: Mon, 24 Dec 2012 08:15:16 -0000
Content-Type: multipart/alternative; boundary=14dae93409bdd4655f04d19496f8

--14dae93409bdd4655f04d19496f8
Content-Type: text/plain; charset=ISO-8859-1

One should follow the wayland website for HOWTO-s and testing
instructions.

Opening a terminal emulator and starting "weston" is the easiest way
to get started, regardless if one is under X or in console.

I don't think the patch comment is the proper place to document this,
should I add a wiki page ?

Alex


On Fri, Dec 21, 2012 at 5:46 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 21 December 2012 12:51, Alex DAMIAN <alexandru.damian@intel.com> wrote:
> > From: Alexandru DAMIAN <alexandru.damian@intel.com>
> >
> > This patch adds the Weston reference compositing
> > manager from Wayland.
>
> How does one test this?  Instructions on how to get a nested weston
> under X would be great, and something that can be used to verify that
> weston is drawing correctly - be it a set of toy apps, the terminal,
> or something else.
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

--14dae93409bdd4655f04d19496f8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">One should follow the wayland website for HOWTO-s and test=
ing=A0<div>instructions.=A0</div><div><br></div><div style>Opening a termin=
al emulator and starting &quot;weston&quot; is the easiest way=A0</div><div=
 style>
to get started, regardless if one is under X or in console.</div><div style=
><br></div><div style>I don&#39;t think the patch comment is the proper pla=
ce to document this,</div><div style>should I add a wiki page ?</div><div s=
tyle>
<br></div><div style>Alex</div></div><div class=3D"gmail_extra"><br><br><di=
v class=3D"gmail_quote">On Fri, Dec 21, 2012 at 5:46 PM, Burton, Ross <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank"=
>ross.burton@intel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 21 December 2012 12:51,=
 Alex DAMIAN &lt;<a href=3D"mailto:alexandru.damian@intel.com">alexandru.da=
mian@intel.com</a>&gt; wrote:<br>

&gt; From: Alexandru DAMIAN &lt;<a href=3D"mailto:alexandru.damian@intel.co=
m">alexandru.damian@intel.com</a>&gt;<br>
&gt;<br>
&gt; This patch adds the Weston reference compositing<br>
&gt; manager from Wayland.<br>
<br>
</div>How does one test this? =A0Instructions on how to get a nested weston=
<br>
under X would be great, and something that can be used to verify that<br>
weston is drawing correctly - be it a set of toy apps, the terminal,<br>
or something else.<br>
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

--14dae93409bdd4655f04d19496f8--
