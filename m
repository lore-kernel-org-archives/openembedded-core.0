Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id DC0A96017E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 17:48:54 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id w7so9404943qcr.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Nov 2014 09:48:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=T7aSqbQRdzETGEILKt69rCxTEenb0VKBAB6d5eozpm0=;
	b=Rn4b9eNYpBk5WjAFvTfoDI1+C4oftBM77kH/H9V1fj0ZdfR0FIo+H9fah4unsMFvlR
	IwGtnAfyjYBQS88X1ysGCE2zthazj/6jw5Vglp5FxI6NYpsuNr/Qzc15iLChq3J2msh+
	fJsPTZkEZrgBJwcbKjYtc7osy0u84LvlOXRjF94w9/a7DpDZm/m4f8oMNmiyNhvGXXyo
	Gj4TDPqbswSo+Mj/wZ84vSMQ7KPfEXPVnxJplCXDBK4Bkq3nc3NIChKlZ6JZMsHaL+9r
	uuokLsV05XxEzvqxKvbaUzxdgPLqwCbUn+AFXpYnF/k5KidLgvXytwI/tZvIhEst6IWg
	DEbQ==
X-Gm-Message-State: ALoCoQlZg0ZVEQfjoCzjiB10KqTzXLPp5Fs7HXKM9geT/CRxcfATweTV/PPBWeaskqkVpZo5tkoH
X-Received: by 10.224.160.83 with SMTP id m19mr67565410qax.17.1415036934090;
	Mon, 03 Nov 2014 09:48:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Mon, 3 Nov 2014 09:48:33 -0800 (PST)
In-Reply-To: <3b87b5236d394a58a73fbc0068d593e5@BY2PR03MB189.namprd03.prod.outlook.com>
References: <1414088763-15256-1-git-send-email-bogdan.purcareata@freescale.com>
	<1414425094-12256-1-git-send-email-bogdan.purcareata@freescale.com>
	<3b87b5236d394a58a73fbc0068d593e5@BY2PR03MB189.namprd03.prod.outlook.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Nov 2014 17:48:33 +0000
Message-ID: <CAJTo0LZgs419TMoQwLt+yGwB-pzHQYBGMwCanyxOSA4hsmt0xg@mail.gmail.com>
To: "bogdan.purcareata@freescale.com" <bogdan.purcareata@freescale.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] shadow: enable support for subordinate IDs
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
X-List-Received-Date: Mon, 03 Nov 2014 17:49:01 -0000
Content-Type: multipart/alternative; boundary=047d7bacb2aacd0c1f0506f7f56c

--047d7bacb2aacd0c1f0506f7f56c
Content-Type: text/plain; charset=UTF-8

On 3 November 2014 13:09, bogdan.purcareata@freescale.com <
bogdan.purcareata@freescale.com> wrote:

> Can someone kindly review my patch? I haven't sent patches to this list
> yet and I don't know who the maintainer is.


This was incorporated into my consolidated pull on Sunday, so expect to see
it merged into master shortly.

Ross

--047d7bacb2aacd0c1f0506f7f56c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 November 2014 13:09, <a href=3D"mailto:bogdan.purcareata@freescale.com=
">bogdan.purcareata@freescale.com</a> <span dir=3D"ltr">&lt;<a href=3D"mail=
to:bogdan.purcareata@freescale.com" target=3D"_blank">bogdan.purcareata@fre=
escale.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Can some=
one kindly review my patch? I haven&#39;t sent patches to this list yet and=
 I don&#39;t know who the maintainer is.</blockquote></div><br>This was inc=
orporated into my consolidated pull on Sunday, so expect to see it merged i=
nto master shortly.</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">Ross</div></div>

--047d7bacb2aacd0c1f0506f7f56c--
