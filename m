Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 199E071AC8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 11:32:02 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id w63so186277296oiw.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 03:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=X6N30clYcmEITKvVZeXwzZlxDj/eydhZMuBd4UkdcPY=;
	b=m9RcpuSGN1bXom3g686o0DO+zeTCsm/7Wur3DHy1QouoQnOBna0/+g/xINNCM9/WHD
	wIzrlPYhAmgdVWC4Zq5eoHonan69WbitUOYHH2CGvR4l3dnsPFa46wYgTDX9rUUvocb9
	v1VosEXunkRO58zNrY9MK51vCIW7hIrb3MoUOhhBrDclfw8fx1zGjeHTT2hJEvBYnUvQ
	6FYoapz4NnNc3lzvaLanCqkT10aKOT9NPtUV3uDD/3qTy5iuEle9+6azA5F3z0g8Q1vv
	GIejdyVRUqDd3EKsTLTTxwujmib0EFbezKCz4drUig+Q0/iqieq7tTcKb4AfrXh5PZqZ
	By/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=X6N30clYcmEITKvVZeXwzZlxDj/eydhZMuBd4UkdcPY=;
	b=A3KkXrwxpLChTP6uldH9qqTUsYvH9a0RXpJiXIiUT4VPQLsYAul5FMNa3u+bQcgxd1
	YL65P97SrhLCeRzCfPaNULRlMIhOlnUjEbPodoC6aTBkmvSE0WtX85KbkWCC+KjNyRlg
	XDVwPLzTXDsCJgxNUDrLQXudx1Dtax9FAjSjyvf+x+p581mXUdeJsD2tL+3ZYmAVlsvK
	iSBLwkkTSoQCEaVU+PGvJvcg+UuoZBmPgrKoltSWjKQ5/Xx2BpTDsgQDMINc6eSF/v88
	b4opDk1yjAa+eg4Iv88kFDr/54/454UVAZPsLYFFVWfCIRlekzApOy22vrtQ1+no/qZr
	ZVPg==
X-Gm-Message-State: AKaTC028b91lAdN8y1IYQ1iOP18I1qXpHkhRGRhft+gqn+GhjpNuiDSftqRpzPMQevYiAqKKBefMZOhNymqWc+iu
X-Received: by 10.202.184.5 with SMTP id i5mr14553693oif.194.1480419124453;
	Tue, 29 Nov 2016 03:32:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.202.1.198 with HTTP; Tue, 29 Nov 2016 03:31:44 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1611290542100.24580@ca624034.mitel.com>
References: <alpine.LFD.2.20.1611280544090.16875@localhost.localdomain>
	<1480334664.28508.167.camel@linuxfoundation.org>
	<alpine.LFD.2.20.1611290542100.24580@ca624034.mitel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 29 Nov 2016 11:31:44 +0000
Message-ID: <CAJTo0LZrWkbyaDWb-8mfNZm2d3mqsqab4uwtNN6Q=dPEKXhiHg@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: ASSUME_PROVIDED versus SANITY_REQUIRED_UTILITIES versus "The Build Host Packages"
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
X-List-Received-Date: Tue, 29 Nov 2016 11:32:05 -0000
Content-Type: multipart/alternative; boundary=001a113cd0d40836d905426ef0d8

--001a113cd0d40836d905426ef0d8
Content-Type: text/plain; charset=UTF-8

On 29 November 2016 at 10:47, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

> one example i mentioned is that the YP guide does not list "sed" as a
> build host requirement, but "sed-native" is in ASSUME_PROVIDED;
> however, it's not listed in SANITY_REQUIRED_UTILITIES. that seems
> inconsistent.
>

It would be somewhat useful if there where a way to annotate in recipes
what binary to check for on the host, so just doing
ASSUME_PROVIDED=sed-native would look up in the sed recipe to check that
"sed" exists on the host, so that SANITY_REQUIRED_UTILITIES doesn't need to
be maintained separately.

Very low hanging fruit though.  Patches welcome!

Ross

--001a113cd0d40836d905426ef0d8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 November 2016 at 10:47, Robert P. J. Day <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1ah" cl=
ass=3D"a3s aXjCH m158afb4091cd875a">one example i mentioned is that the YP =
guide does not list &quot;sed&quot; as a<br>
build host requirement, but &quot;sed-native&quot; is in ASSUME_PROVIDED;<b=
r>
however, it&#39;s not listed in SANITY_REQUIRED_UTILITIES. that seems<br>
inconsistent.<br>
<div class=3D"HOEnZb"></div></div></blockquote></div><br>It would be somewh=
at useful if there where a way to annotate in recipes what binary to check =
for on the host, so just doing ASSUME_PROVIDED=3Dsed-native would look up i=
n the sed recipe to check that &quot;sed&quot; exists on the host, so that =
SANITY_REQUIRED_UTILITIES doesn&#39;t need to be maintained separately.</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Very low =
hanging fruit though.=C2=A0 Patches welcome!</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113cd0d40836d905426ef0d8--
