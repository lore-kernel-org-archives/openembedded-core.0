Return-Path: <alexandru.damian@intel.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0E4AE6BD13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 20:29:53 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id uz6so2710270obc.31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 12:29:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jMjhrilGBJU881BkgxBk8+pmSsNaXa3W7kBk4hFxw70=;
	b=gpd/az+6dtFobOJKtRM/i4kWF7fQXy91J4UacRxlvbV/gJiE03sbHnL3dHfTs5g8fN
	IIHiubiioOBZhUuQjr+l/SCS7KXBM7oGiVzeQFC+cIdCGEaeoOkO3GK5KcjpihY82fdG
	751XX1YRVPWfsdy4JBtSTBKv1n+nEtyMD9FnPYyOFhJhHJ4Pk+ACXOFdiU8GnNeJ+6bJ
	PsDgo2Gd8BSaUGst5QJ30E5iVAfEQwxwK+/6oh+91lnlHnJf75F4tPNwbCuWDPYmoC6C
	bczpUBLXfERF+nZLQMd0rdiO8CEdx5n6nWbhioiCI6zHUHm6KBbq/+3COziGjR8WHS9t
	jgAQ==
X-Gm-Message-State: ALoCoQntlhbjwokdK9eHuADC52sbWhkXVgNu5yRwzuJmVWzUabNFwAJ2j2naVMwecxcQBuZjg01v
X-Received: by 10.60.51.230 with SMTP id n6mr3978536oeo.35.1392928194271; Thu,
	20 Feb 2014 12:29:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.124.146 with HTTP; Thu, 20 Feb 2014 12:29:34 -0800 (PST)
In-Reply-To: <1392912414.1560.8.camel@ted>
References: <1392658389-19826-1-git-send-email-alexandru.damian@intel.com>
	<1392906622.1560.1.camel@ted>
	<CAJ2CSBtk4okj2Pn9-qcB-kQ+jBAMU53sxxvYyH9YXL43Go-Pxw@mail.gmail.com>
	<1392912414.1560.8.camel@ted>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
Date: Thu, 20 Feb 2014 20:29:34 +0000
Message-ID: <CAJ2CSBsdCyfZ+MJ91Wh=6EO_O6NJz5cQuzY8UhKCNeZXZDw3kw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sstate: list missing files for toaster
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
X-List-Received-Date: Thu, 20 Feb 2014 20:29:59 -0000
Content-Type: multipart/alternative; boundary=001a11c30c7c37b6f404f2dc5e7e

--001a11c30c7c37b6f404f2dc5e7e
Content-Type: text/plain; charset=UTF-8

Yep, tasks that were looked up, and actual filenames attempted.

Alex


On Thu, Feb 20, 2014 at 4:06 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2014-02-20 at 15:41 +0000, Damian, Alexandru wrote:
> > I would think against it, because
>
> > - it's very inefficient to send a Skipped event for each missed task
> > than to collect all the data and send it in one shot
> > - it's faster to send the event from the sstate.bbclass than to return
> > the task ids and then call again a python function to generate the
> > sstate file names - basically replicating the sstate.bbclass code in
> > bitbake
> > - the queueTaskSkipped event has a different semantic than what we
> > need here to return a whole batch of data; creating a new event type
> > from scratch is a bit pointless since the inheritance would need to be
> > broken
> > - knotty can receive MetadataEvents just as well as sceneTaskSkipped
> > event, or any variation of it
>
> I guess I'd like to understand which information from this even you're
> particularly interested in?
>
> Do I understand correctly that you want the actual filenames attempted?
>
> Cheers,
>
> Richard
>
>
>


-- 
Alex Damian
Yocto Project
SSG / OTC

--001a11c30c7c37b6f404f2dc5e7e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:tahoma,s=
ans-serif">Yep, tasks that were looked up, and actual filenames attempted.<=
/div><div class=3D"gmail_default" style=3D"font-family:tahoma,sans-serif"><=
br>Alex</div>

</div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Thu,=
 Feb 20, 2014 at 4:06 PM, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@=
linuxfoundation.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">On Thu, 2014-02-20 at 15:41 =
+0000, Damian, Alexandru wrote:<br>
&gt; I would think against it, because<br>
<br>
&gt; - it&#39;s very inefficient to send a Skipped event for each missed ta=
sk<br>
&gt; than to collect all the data and send it in one shot<br>
&gt; - it&#39;s faster to send the event from the sstate.bbclass than to re=
turn<br>
&gt; the task ids and then call again a python function to generate the<br>
&gt; sstate file names - basically replicating the sstate.bbclass code in<b=
r>
&gt; bitbake<br>
&gt; - the queueTaskSkipped event has a different semantic than what we<br>
&gt; need here to return a whole batch of data; creating a new event type<b=
r>
&gt; from scratch is a bit pointless since the inheritance would need to be=
<br>
&gt; broken<br>
&gt; - knotty can receive MetadataEvents just as well as sceneTaskSkipped<b=
r>
&gt; event, or any variation of it<br>
<br>
</div>I guess I&#39;d like to understand which information from this even y=
ou&#39;re<br>
particularly interested in?<br>
<br>
Do I understand correctly that you want the actual filenames attempted?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div dir=3D"=
ltr">Alex Damian<div>Yocto Project<br></div><div>SSG / OTC=C2=A0</div></div=
>
</div>

--001a11c30c7c37b6f404f2dc5e7e--
