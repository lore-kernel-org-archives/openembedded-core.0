Return-Path: <ap.john.stirling@gmail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 49DEC6F342
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 15:36:04 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id q59so525464wes.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 07:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=lspWA9uuyfkzOh4TfgYMTQTLW8eR5/fmuhViP8cU4hE=;
	b=x6I1EMqpzcVrz9H3BOpQjcDVTIgx+qMw1Jm4v+nN4K4utVIAYYt1w0Pns7I3IoBX7P
	rX0avLYvaAGpMTGYDlUNbmWcIpERCsynkU/JHPJhhagZPLi541tVlZVsfdmdpXFlkPtt
	FcNQX90a2u+NtniFTBOVGNZzoVAMUPfSIQQsveCX9a6EbOZqVKsse/NRAdGxDXM6Lzu5
	rzTvHuV4PgcgEQHFAJ1iNVfrsJsuPT3AAYWN5lHcBGDZpXKfUqwEz4stCxeRiQrOYdrE
	vCdZzIbyV7XWkroV6LaAiRKemRaKve/mWit7LGUUM3XWnytouwkx5RDYx0W4EBY/xsUh
	L/qQ==
MIME-Version: 1.0
X-Received: by 10.194.170.133 with SMTP id am5mr25116116wjc.42.1393342565185; 
	Tue, 25 Feb 2014 07:36:05 -0800 (PST)
Received: by 10.194.8.35 with HTTP; Tue, 25 Feb 2014 07:36:05 -0800 (PST)
In-Reply-To: <33174834.ez2WBfx6yb@peggleto-mobl5.ger.corp.intel.com>
References: <CABuzA3Odaup7ZC1EZPMLEULzjpDxrhRq6Oq97Ben9uLjCOKNEA@mail.gmail.com>
	<CAJTo0LYxZpiSyyQoa_Q=dY8=ShTOc2=aq5Gn4nkqLn-jmbX_BA@mail.gmail.com>
	<CABuzA3O+hVfd0gqgGJYSuGhe40F8teU_Ts+qrhGcSJbir=Ss7A@mail.gmail.com>
	<33174834.ez2WBfx6yb@peggleto-mobl5.ger.corp.intel.com>
Date: Tue, 25 Feb 2014 15:36:05 +0000
Message-ID: <CABuzA3NKP+bxr4s-wmo+gSz8HBmELFNub9GEZTAw+FD9+rwtUg@mail.gmail.com>
From: John Stirling <ap.john.stirling@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: qt4-embedded - jpeg, gif, tiff support
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
X-List-Received-Date: Tue, 25 Feb 2014 15:36:06 -0000
Content-Type: multipart/alternative; boundary=089e0122e92ea6003904f33cd8bd

--089e0122e92ea6003904f33cd8bd
Content-Type: text/plain; charset=ISO-8859-1

thanks


On 24 February 2014 13:09, Paul Eggleton <paul.eggleton@linux.intel.com>wrote:

> On Monday 24 February 2014 12:43:40 John Stirling wrote:
> > Thanks. That works now (tested jpeg, gif, tif).
> >
> > Presume I probably don't need the change to qt4.inc I mentioned earlier ?
> > (rebuild takes a while)
>
> You almost certainly don't want Qt's internal shipped version of these
> libraries. The defaults (i.e. use the "system" libraries) should be fine.
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

--089e0122e92ea6003904f33cd8bd
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">thanks</div><div class=3D"gmail_extra"><br><br><div class=
=3D"gmail_quote">On 24 February 2014 13:09, Paul Eggleton <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">pau=
l.eggleton@linux.intel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">On Monday 24 February 2014 1=
2:43:40 John Stirling wrote:<br>
&gt; Thanks. That works now (tested jpeg, gif, tif).<br>
&gt;<br>
&gt; Presume I probably don&#39;t need the change to qt4.inc I mentioned ea=
rlier ?<br>
&gt; (rebuild takes a while)<br>
<br>
</div>You almost certainly don&#39;t want Qt&#39;s internal shipped version=
 of these<br>
libraries. The defaults (i.e. use the &quot;system&quot; libraries) should =
be fine.<br>
<br>
Cheers,<br>
Paul<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</font></span></blockquote></div><br></div>

--089e0122e92ea6003904f33cd8bd--
