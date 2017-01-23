Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id CBDF2731D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 17:19:46 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id x49so134580640qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 09:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rln/CKK3lPKJjbDwU1kRdePzBNq3AK7NeOXwUzKej2U=;
	b=iFZnwOx141A0rnlteP1NbBAaDgMAywM/njim2J372vDhG3TuDpOp8DlFua3eTkUVvm
	lZrggaaRxnJ69B7RNpxfbtZkQ6+VHLD9rgUWQhJl3bA1GIK8cWZB17vpo9pkE8s/j0kS
	pPoYQ2YRG9FF6gp+1VwreamByiICaz0Frs3kdOBv2xrWvyDMHP/WSshAecQb85pTXz6U
	fAmzbTsK4Shpk3mMKKRKtRCPfjYNKU7cE6EUdTJMlilOUsuSuVh50CwzzF9m6g4wJbr3
	3ly1P0y9XflWg0Iq6NFyqU2SVataa++FQvCIW0s8jhcpasLgRHoXjKuc0MR/uDWx53FT
	qPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rln/CKK3lPKJjbDwU1kRdePzBNq3AK7NeOXwUzKej2U=;
	b=lQjCSw+8h5v9DWeKxP55eiALe0NENkC0FFrnBA3Yl3mKd9BDpgEOtOV/xPiWqq36us
	GdSKSjp6XRLGA5Hivjej+NhVB0G7ngYYw6UNLQmJPHmIune8MccPoV13inScG4H6FWRM
	18iGpb/DoENtL7/GPf1kl9l2ClEGfeSPKf+KssoF3KMP5EnnaVJvs5zPBlLDFy8eCdhJ
	qzaASvdqUJY7J862zbI0lOME9/fUak+mq6flBbwcmfd2sEb9clX6Hm7YEH4ZmDSQn5ba
	goOQtRuXMEspP/TUavZ3+mlh7rB+mP2t7Mr4XeDiCu1+EWyO1GLgYzE911n7a5X7uk81
	oxHQ==
X-Gm-Message-State: AIkVDXIlX6WTKFWmRPuZrSGNfKd/RySVeSEeXYtWd5rbzrzUU8M5CaOFzJKWSVvL1uiRVe2Nbp44l6Am7fd+8NDg
X-Received: by 10.200.39.212 with SMTP id x20mr24482221qtx.109.1485191986391; 
	Mon, 23 Jan 2017 09:19:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 23 Jan 2017 09:19:26 -0800 (PST)
In-Reply-To: <CAMKF1socZ7RtN+0UcLtmGF9GQVcEP8LXjCVxA3Y3feeHKtokhQ@mail.gmail.com>
References: <1485176279-1373-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CAMKF1socZ7RtN+0UcLtmGF9GQVcEP8LXjCVxA3Y3feeHKtokhQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Jan 2017 17:19:26 +0000
Message-ID: <CAJTo0LaBCwwZqYVW5UwhydZQJZMU0rpJ63umNzRjaJToveinLQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tremor: Use mirror tarball instead of svn url
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
X-List-Received-Date: Mon, 23 Jan 2017 17:19:47 -0000
Content-Type: multipart/alternative; boundary=001a1135b542c5e0e40546c63488

--001a1135b542c5e0e40546c63488
Content-Type: text/plain; charset=UTF-8

On 23 January 2017 at 17:11, Khem Raj <raj.khem@gmail.com> wrote:

> Do we explicitly add subversion-native to builds ?  or is it going to
> be removed automatically now that there is nothing needed it ?
> subversion-native should still remain though for other layers to use.
>

It's automatic:

        if scheme == "svn":
            d.appendVarFlag('do_fetch', 'depends', '
subversion-native:do_populate_sysroot')

(base.bbclass)

--001a1135b542c5e0e40546c63488
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 January 2017 at 17:11, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-sty=
le:solid;padding-left:1ex"><div id=3D"gmail-:15a" class=3D"gmail-a3s gmail-=
aXjCH gmail-m159cc505ebf98d28">Do we explicitly add subversion-native to bu=
ilds ?=C2=A0 or is it going to<br>
be removed automatically now that there is nothing needed it ?<br>
subversion-native should still remain though for other layers to use.</div>=
</blockquote></div><br>It&#39;s automatic:</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if scheme =3D=3D &quot;svn&quot;:<br></div><div class=3D"=
gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVarFlag(&#39=
;do_fetch&#39;, &#39;depends&#39;, &#39; subversion-native:do_populate_sysr=
oot&#39;)<br></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">(base.bbclass)</div></div></div>

--001a1135b542c5e0e40546c63488--
