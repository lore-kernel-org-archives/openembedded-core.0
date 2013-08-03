Return-Path: <lpapp@archlinux.us>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5D0D96AECC
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2013 09:41:04 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id ta17so2727627obb.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Aug 2013 02:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=8v2PFLSpk9hc321vp5Muii1mh0999nYl6KNWms1K29o=;
	b=iEwUaeA/p/AF6UqI8AUQs7dVi8Cco/UpTBdb3zQZmZUspaiQPrJkhGl2eFq1mG53qN
	3+XsWetekMaqBDvkbJAMIeY1KU4cBg9dTPgTNbe8yWrflbr0lRI2+h/dCU0HZsO00+r/
	3X4EQs0PRtNaKcFoMg50PyMLBWB/LaYFr0u/oQrStAIlm1acnFZCdzkrnI3jh3MpI43C
	+spX6q8pgoKH0ndST0JLjdgixKwjiVAMEbvAcskJ0bUZtg+BtmYdaM3jkrgw+GRCo2QN
	cS7ZYI47QM1BdQuLhsLAghbOiqS/dR4tsSpOdkIOSJta9sWOV/kQwdRc+6ti2elpeoi/
	vt5w==
MIME-Version: 1.0
X-Received: by 10.42.177.1 with SMTP id bg1mr981849icb.78.1375522864493; Sat,
	03 Aug 2013 02:41:04 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.42.76.199 with HTTP; Sat, 3 Aug 2013 02:41:04 -0700 (PDT)
In-Reply-To: <51FCCBCD.6060106@gmail.com>
References: <1375516603-9720-1-git-send-email-net147@gmail.com>
	<CAOMwXhPTMUKQ+H34k_6pdTPXk=Luy4VPQ8N=kd3hT4CTqJ8qJg@mail.gmail.com>
	<51FCCBCD.6060106@gmail.com>
Date: Sat, 3 Aug 2013 10:41:04 +0100
X-Google-Sender-Auth: S2WpoDwUSUKEF7FSkYEVkPGK0RI
Message-ID: <CAOMwXhNqpcJNy=nznUBt+=fzw1T2Do+awS5OtT75O5d_7n1Ugw@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Jonathan Liu <net147@gmail.com>
X-Gm-Message-State: ALoCoQkGwpyQ5QjtZFnnlfAtXr49fD7dHaG/rLRQkm3xaQBLSWSTftTBOLr++v9VK+i/wr29yiDf
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4: add upstream QTBUG-32534 patch for QHttpMultiPart upload corruption
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
X-List-Received-Date: Sat, 03 Aug 2013 09:41:04 -0000
Content-Type: multipart/alternative; boundary=90e6ba6e83b2b81f9304e307dfe8

--90e6ba6e83b2b81f9304e307dfe8
Content-Type: text/plain; charset=ISO-8859-1

OK, thanks.

We need to be careful not to maintain all the 100-200+ patches they may
have as it makes the update a bit more difficult potentially.

I think in this special case, if you already affected, it is worth
approving.


On Sat, Aug 3, 2013 at 10:22 AM, Jonathan Liu <net147@gmail.com> wrote:

> On 3/08/2013 7:11 PM, Laszlo Papp wrote:
>
>> You need this fix right in your third-party project that it cannot wait
>> until the next upstream bugfix release, or if not you, someone else
>> requested it on the Yocto bugtracker?
>>
> The corruption is a P1 issue and there are currently no plans for Qt 4.8.6
> yet so it is uncertain when it will be released. There were more than 7
> months between the Qt 4.8.4 and Qt 4.8.5 releases.
>
> The issue affects one of my projects.
>
> Regards,
> Jonathan
>

--90e6ba6e83b2b81f9304e307dfe8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">OK, thanks.<div><br></div><div>We need to be careful not t=
o maintain all the 100-200+ patches they may have as it makes the update a =
bit more difficult potentially.</div><div><br></div><div>I think in this sp=
ecial case, if you already affected, it is worth approving.</div>
</div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Sat,=
 Aug 3, 2013 at 10:22 AM, Jonathan Liu <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:net147@gmail.com" target=3D"_blank">net147@gmail.com</a>&gt;</span> wro=
te:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 3/08/2013 7:11 PM, Lasz=
lo Papp wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
You need this fix right in your third-party project that it cannot wait unt=
il the next upstream bugfix release, or if not you, someone else requested =
it on the Yocto bugtracker?<br>
</blockquote></div>
The corruption is a P1 issue and there are currently no plans for Qt 4.8.6 =
yet so it is uncertain when it will be released. There were more than 7 mon=
ths between the Qt 4.8.4 and Qt 4.8.5 releases.<br>
<br>
The issue affects one of my projects.<br>
<br>
Regards,<br>
Jonathan<br>
</blockquote></div><br></div>

--90e6ba6e83b2b81f9304e307dfe8--
