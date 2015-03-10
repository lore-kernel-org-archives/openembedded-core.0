Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 210A973A5A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 13:51:32 +0000 (UTC)
Received: by qgef51 with SMTP id f51so1902031qge.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 06:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=CemfSQDgVVqaPx7ksD+WMMDjIvPCb47A2GbOEN2+po4=;
	b=HO+hf+NuLPBPgrQxgQrat2V5c5dbfGusuJsepFv1slWSSVUEi9G9GLAfQqdnKNWgZu
	tS2zyKewhXWNsgfWZG7SIs1df7foh/Qi5t1OOzS4Fgu0cF/4WlQ9Qoyl1+eDXAUI9pWL
	U0zMKD6r0J96PwhMIBpcl/LB8E6XlnzuvC4yB57h5CiAer/X1pEbRksVxjOuuZCKFI/o
	GHIk5BLoy5k5LbKaYjxPyWs5sEf6cBLocDa4kzi68WJy0ipaQxn5cAqvSSwE1rpf/YvP
	qr5prL3docm86i2hLrMc/IE62FiMQc8dwKFCmtxN/bVjakHX3hL1PNbsKAu/CxhvNOat
	Zy7w==
X-Gm-Message-State: ALoCoQkL6QfWRL6htNifeYlDlnV9KIm80fPPixO8I0oc3vBMuiH7o/4tsiByZQN85YAnWQACF9dR
X-Received: by 10.55.42.17 with SMTP id q17mr51309669qkh.61.1425995493717;
	Tue, 10 Mar 2015 06:51:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Tue, 10 Mar 2015 06:51:13 -0700 (PDT)
In-Reply-To: <1425945178-14806-1-git-send-email-rob.woolley@windriver.com>
References: <1425945178-14806-1-git-send-email-rob.woolley@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Mar 2015 13:51:13 +0000
Message-ID: <CAJTo0LY-DwnvrtA0mfDTKnggkBZ491POJJVMTTap87koO+c4Fw@mail.gmail.com>
To: Rob Woolley <rob.woolley@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/3] Identify existing configuration files
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
X-List-Received-Date: Tue, 10 Mar 2015 13:51:33 -0000
Content-Type: multipart/alternative; boundary=001a11473b16dadd350510ef7297

--001a11473b16dadd350510ef7297
Content-Type: text/plain; charset=UTF-8

Hi Rob,

On 9 March 2015 at 23:52, Rob Woolley <rob.woolley@windriver.com> wrote:

> Some package formats explicitly track which files are configuration files
> so that they are not overwritten on updates.
>
> This series explicitly identifies files that were already being packaged,
> but not known as configuration files.
>

Do you have these patches in a branch?  git am is claiming they're
corrupted, so something must have happened to them in transit.

Cheers,
Ross

--001a11473b16dadd350510ef7297
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Rob,</div><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On 9 March 2015 at 23:52, Rob Wooll=
ey <span dir=3D"ltr">&lt;<a href=3D"mailto:rob.woolley@windriver.com" targe=
t=3D"_blank">rob.woolley@windriver.com</a>&gt;</span> wrote:<br><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><div id=3D":232" class=3D"a3s" style=3D"overflow:hidden=
">Some package formats explicitly track which files are configuration files=
<br>
so that they are not overwritten on updates.<br>
<br>
This series explicitly identifies files that were already being packaged,<b=
r>
but not known as configuration files.</div></blockquote></div><br>Do you ha=
ve these patches in a branch? =C2=A0git am is claiming they&#39;re corrupte=
d, so something must have happened to them in transit.</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Cheers,</div><div class=3D=
"gmail_extra">Ross</div></div>

--001a11473b16dadd350510ef7297--
