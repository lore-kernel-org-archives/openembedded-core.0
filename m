Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>)
	id 1QxoI3-0003Uz-PX; Mon, 29 Aug 2011 00:57:19 +0200
Received: by fxg11 with SMTP id 11so4105185fxg.6
	for <multiple recipients>; Sun, 28 Aug 2011 15:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=DgqaTM/vcisRReiInQKoFPGuQZl7Dp5XBqE9AXfwbkE=;
	b=OCLNMrzaCzuheCOU0LyFKPSdUHsuzQr4hy5xpexpsAY7qB4lU3eaov1lcP8fLE6Ato
	R1kS3ZQTHvH6Yg+caxE6Uv4zyYkQ+5UX9B/faAxz6P6soqP7z9bX+V/aW9mxFW+Ymr+Q
	Czz6U6l9OwlDIjxTtbI7sRYRRdvIvVZ7pHmu0=
MIME-Version: 1.0
Received: by 10.223.21.150 with SMTP id j22mr5959121fab.98.1314571948659; Sun,
	28 Aug 2011 15:52:28 -0700 (PDT)
Received: by 10.223.159.143 with HTTP; Sun, 28 Aug 2011 15:52:28 -0700 (PDT)
Received: by 10.223.159.143 with HTTP; Sun, 28 Aug 2011 15:52:28 -0700 (PDT)
In-Reply-To: <CAD=GYpa40GL3wBoLgsHQ8V8-9o=zmz9HTzJ97--U1Lxm0Q_=8g@mail.gmail.com>
References: <CAD=GYpaZeb18B+wtGM5Wpv+8zNx+r=462K7Yx7+hK4z=dZrG5Q@mail.gmail.com>
	<CABcZANm_0g3gSdxkE7-br1Ds2GMb0vENmGst7cdU--tOPDgw2A@mail.gmail.com>
	<1314568458.5939.271.camel@rex>
	<CAD=GYpZv2NNBjDBMsAT_dik4FPBFr0vDqN2y414Uz0wN2DYNaw@mail.gmail.com>
	<CAD=GYpa6xxUokfZyA-iYOhq==8uT=8iOy9LREJiNxyT5XECEyQ@mail.gmail.com>
	<CAD=GYpbzoHjG+00ONZ5iuzi3g2TKA94znwGpTokb4kZNdUDtWQ@mail.gmail.com>
	<CAD=GYpYqRwGq0_5xq3Jb=i_Hqp8WmD7fDBo=mp=oeAq5dtRMtg@mail.gmail.com>
	<CAD=GYpaiuiKvEzLag03VXF1aaEgRbWsTZ4v0iVjv3pUE2aT5RA@mail.gmail.com>
	<CAD=GYpa40GL3wBoLgsHQ8V8-9o=zmz9HTzJ97--U1Lxm0Q_=8g@mail.gmail.com>
Date: Sun, 28 Aug 2011 17:52:28 -0500
Message-ID: <CAD=GYpYHnY5HO8-DxqLdgnYXDVt_ZUxPoNYQJz7qbRpZUP2XqA@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-devel@lists.openembedded.org, "Kridner, Jason" <jdk@ti.com>,
	"Kooi, Koen" <k-kooi@ti.com>
Subject: Re: How do we get programs into sysroots?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 28 Aug 2011 22:57:20 -0000
Content-Type: multipart/alternative; boundary=001517475e6808170604ab98a2d1

--001517475e6808170604ab98a2d1
Content-Type: text/plain; charset=ISO-8859-1

Hi Richard

Thanks for your email.

Forgive the top post due to the limitations of my phone.

This script should run as native. In this case what steps do we take to
ensure the binaries get installed to the native sysroots path?

Thanks,
Joel

On Aug 28, 2011 4:54 PM, "Richard Purdie" <
richard.purdie@linuxfoundation.org> wrote:

On Sun, 2011-08-28 at 13:45 -0700, Chris Larson wrote:
> On Sun, Aug 28, 2011 at 1:07 PM, Joel A Fer...
For OE-dev you do but this shouldn't be necessary any more with OE-Core
since there is no legacy staging.

In this case I wonder if the -native version or the target version is
being run? We only install libs and headers for the target version but
the binaries should be present for the -native recipe and be installed
to the native sysroot...

Cheers,

Richard




_______________________________________________
Openembedded-core mailing list
Openembedded-core@...

--001517475e6808170604ab98a2d1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p>Hi Richard</p>
<p>Thanks for your email.</p>
<p> Forgive the top post due to the limitations of my phone.</p>
<p>This script should run as native. In this case what steps do we take to =
ensure the binaries get installed to the native sysroots path?</p>
<p>Thanks,<br>
Joel</p>
<p><blockquote type=3D"cite">On Aug 28, 2011 4:54 PM, &quot;Richard Purdie&=
quot; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_=
blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br><br><p><font co=
lor=3D"#500050">On Sun, 2011-08-28 at 13:45 -0700, Chris Larson wrote:<br>


&gt; On Sun, Aug 28, 2011 at 1:07 PM, Joel A Fer...</font></p>For OE-dev yo=
u do but this shouldn&#39;t be necessary any more with OE-Core<br>
since there is no legacy staging.<br>
<br>
In this case I wonder if the -native version or the target version is<br>
being run? We only install libs and headers for the target version but<br>
the binaries should be present for the -native recipe and be installed<br>
to the native sysroot...<br>
<br>
Cheers,<br>
<font color=3D"#888888"><br>
Richard<br>
</font><p><font color=3D"#500050"><br><br><br>_____________________________=
__________________<br>Openembedded-core mailing list<br>Openembedded-core@.=
..</font></p></blockquote></p>

--001517475e6808170604ab98a2d1--
