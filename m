Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id 98DEE601F5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 12:16:41 +0000 (UTC)
Received: by mail-qa0-f45.google.com with SMTP id x12so10267305qac.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Dec 2014 04:16:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ELbWdPbDdCoEBYSGBzR2trurQWzrs0Lz8MFfACBhLEQ=;
	b=kp3J/nReWXN26MD8akINJLtuh3FURgL3AE/LdxsbMmZtUl32ojM+XjsWqL2HpVpvgh
	XXFAdpCw0L0uDlgOkq6LRphWCawEPKI0utwdGsM2zM+M0zBMjBL5fF5ApOW5DTOpII44
	HBjvTXo5FerfIAPdTBAGW+J5JVfJsH9gc4PjmmPLFW978LT75yS7eegwIZoxkfYuhlPA
	wie0F25q/JrfnLo3sL+CiYw8HKiyfWrFy/qzsWKP0ZOt03iCUIPnQ2qBtjybAaCPUttt
	5XzpYJwThBG1GMfRHy/ALvNWjJ+jMnOyqZCfONfXILt2j8lpcCSEkuefydkRMdNi9kCV
	sXEQ==
X-Gm-Message-State: ALoCoQn1DKN5+xO7bwzznhTXkqKPHUW5me95P2TdzbJphwzcV1xXzyypaKPXRdrf14pOzb9cbFgC
X-Received: by 10.140.109.135 with SMTP id l7mr7290072qgf.80.1417609001693;
	Wed, 03 Dec 2014 04:16:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Wed, 3 Dec 2014 04:16:21 -0800 (PST)
In-Reply-To: <547B8E4A.1010601@mailbox.tu-berlin.de>
References: <1416693295-21521-1-git-send-email-msach@mailbox.tu-berlin.de>
	<547B8E4A.1010601@mailbox.tu-berlin.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Dec 2014 12:16:21 +0000
Message-ID: <CAJTo0LYTLcoQTrh5_EdgOk=q+bOhcyA-bV=KjgOL_8Q9CpgOmw@mail.gmail.com>
To: Merten Sach <msach@mailbox.tu-berlin.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] metadata_scm: Fix crash due to uncaught python exception
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
X-List-Received-Date: Wed, 03 Dec 2014 12:16:44 -0000
Content-Type: multipart/alternative; boundary=001a113a4eb2fa0ecb05094ed0f2

--001a113a4eb2fa0ecb05094ed0f2
Content-Type: text/plain; charset=UTF-8

Hi Merten,

On 30 November 2014 at 21:38, Merten Sach <msach@mailbox.tu-berlin.de>
wrote:

> I submitted a patch about a week ago and haven't got any feedback.
>
> This is my first patch submission to the openenmbedded project, so I'm
> eager to know if I missed out on anything.
>

There's too many patches for every one to be commented on, but this is good
and due to be merged into master today.

Cheers,
Ross

--001a113a4eb2fa0ecb05094ed0f2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Merten,</div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On 30 November 2014 at 21:38, Me=
rten Sach <span dir=3D"ltr">&lt;<a href=3D"mailto:msach@mailbox.tu-berlin.d=
e" target=3D"_blank">msach@mailbox.tu-berlin.de</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><div id=3D":6tj" class=3D"a3s" style=3D"overfl=
ow:hidden">I submitted a patch about a week ago and haven&#39;t got any fee=
dback.<br>
<br>
This is my first patch submission to the openenmbedded project, so I&#39;m =
eager to know if I missed out on anything.<br></div></blockquote></div><br>=
There&#39;s too many patches for every one to be commented on, but this is =
good and due to be merged into master today.</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Cheers,</div><div class=3D"gmail_ext=
ra">Ross</div></div>

--001a113a4eb2fa0ecb05094ed0f2--
