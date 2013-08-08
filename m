Return-Path: <lpapp@archlinux.us>
Received: from mail-pb0-f50.google.com (mail-pb0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1ED0F608BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 16:31:52 +0000 (UTC)
Received: by mail-pb0-f50.google.com with SMTP id uo5so3489915pbc.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2013 09:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=j4PvRFF8lhCZ/OII9LeFyt1FrlXOVOh39OmYHTYXwik=;
	b=O6MwjOucYzO2YQoqZNnWeJWb+CtMK38T4phl2ntcrhTSM/R9RFMrni2thXwBjDR0mA
	Ss9TCJ6bvHBpfx0UWCqX7hhSVx3uQdxw5JUjQaZu4q1kZvRE4d84cOXwbigPZ7MxEVFq
	5ArlAqrzVL5gpZvrC40JH3t/MlpxWVRMql7yj9DEA/uDRN7g30pu3+dIQJCUPnG3T6DX
	9MMAbMJtKjL/T8smJ8wud5iXA7+Gtt9H1qrZHT8ockmyEEGlsExkAkHrvBTjoLG65RVt
	+NeQ1HVO4UH7CxpTK0klLmpHbU0RfGDNxhlZd5Ih2JdkG6s5deW8iHh8MtZ9Kztt/9XE
	Fm1w==
X-Gm-Message-State: ALoCoQncKx7USmbTRGSKfEgiAsAtXLjv4nfmLpRiLmC8rTCBg5B2flGwC9PysYBI1VWrMpNt5JB9
MIME-Version: 1.0
X-Received: by 10.66.141.232 with SMTP id rr8mr6915858pab.184.1375979513152;
	Thu, 08 Aug 2013 09:31:53 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.37.237 with HTTP; Thu, 8 Aug 2013 09:31:53 -0700 (PDT)
In-Reply-To: <CAOMwXhNqpcJNy=nznUBt+=fzw1T2Do+awS5OtT75O5d_7n1Ugw@mail.gmail.com>
References: <1375516603-9720-1-git-send-email-net147@gmail.com>
	<CAOMwXhPTMUKQ+H34k_6pdTPXk=Luy4VPQ8N=kd3hT4CTqJ8qJg@mail.gmail.com>
	<51FCCBCD.6060106@gmail.com>
	<CAOMwXhNqpcJNy=nznUBt+=fzw1T2Do+awS5OtT75O5d_7n1Ugw@mail.gmail.com>
Date: Thu, 8 Aug 2013 17:31:53 +0100
X-Google-Sender-Auth: 8BgxKXMpLfmxyUxeMNQp0fEnPLM
Message-ID: <CAOMwXhNWi8VRkVNaBPL8NSmXio_BB==1_rcTV6YW0Oxi_aHFhw@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Jonathan Liu <net147@gmail.com>
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
X-List-Received-Date: Thu, 08 Aug 2013 16:31:53 -0000
Content-Type: multipart/alternative; boundary=001a11330f1419952804e37232f7

--001a11330f1419952804e37232f7
Content-Type: text/plain; charset=ISO-8859-1

Btw, is it a common enough fix to be included, or otherwise you could just
do your .bbappend appliance?


On Sat, Aug 3, 2013 at 10:41 AM, Laszlo Papp <lpapp@kde.org> wrote:

> OK, thanks.
>
> We need to be careful not to maintain all the 100-200+ patches they may
> have as it makes the update a bit more difficult potentially.
>
> I think in this special case, if you already affected, it is worth
> approving.
>
>
> On Sat, Aug 3, 2013 at 10:22 AM, Jonathan Liu <net147@gmail.com> wrote:
>
>> On 3/08/2013 7:11 PM, Laszlo Papp wrote:
>>
>>> You need this fix right in your third-party project that it cannot wait
>>> until the next upstream bugfix release, or if not you, someone else
>>> requested it on the Yocto bugtracker?
>>>
>> The corruption is a P1 issue and there are currently no plans for Qt
>> 4.8.6 yet so it is uncertain when it will be released. There were more than
>> 7 months between the Qt 4.8.4 and Qt 4.8.5 releases.
>>
>> The issue affects one of my projects.
>>
>> Regards,
>> Jonathan
>>
>
>

--001a11330f1419952804e37232f7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Btw, is it a common enough fix to be included, or otherwis=
e you could just do your .bbappend appliance?</div><div class=3D"gmail_extr=
a"><br><br><div class=3D"gmail_quote">On Sat, Aug 3, 2013 at 10:41 AM, Lasz=
lo Papp <span dir=3D"ltr">&lt;<a href=3D"mailto:lpapp@kde.org" target=3D"_b=
lank">lpapp@kde.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr">OK, thanks.<div><br></div><=
div>We need to be careful not to maintain all the 100-200+ patches they may=
 have as it makes the update a bit more difficult potentially.</div>
<div><br></div><div>I think in this special case, if you already affected, =
it is worth approving.</div>
</div><div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra"><b=
r><br><div class=3D"gmail_quote">On Sat, Aug 3, 2013 at 10:22 AM, Jonathan =
Liu <span dir=3D"ltr">&lt;<a href=3D"mailto:net147@gmail.com" target=3D"_bl=
ank">net147@gmail.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div>On 3/08/2013 7:11 PM, Laszlo Papp wrote=
:<br>
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
</div></div></blockquote></div><br></div>

--001a11330f1419952804e37232f7--
