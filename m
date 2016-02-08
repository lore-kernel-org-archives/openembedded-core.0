Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0368C731A4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 22:56:47 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id g73so308958ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 14:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=mGlgH0cwuoYuDMnqSr9qE3oYL874yCf6Wbq5z2Dm0Bc=;
	b=Is2PVRNxHm/wXltFaQfcqzO3JSHsDequdWe3IAokDAKcHOp8lniJJy1bn/oh/ZL44U
	42SknQEWsZMujTTdnIT+4Jlu7ZM+b7fVjs3KyO9gPlvgd3y5ZYe/8mPVNPRpOOhaSSSS
	Atf64dhoJUfeNwHR0SB7Rn6rbNp+grfFowPbxVs3iEMvM3HbZus5fv0UxUzAgrO3T7+g
	7tQ/qd3kjtqN4dkObVFn4RjtGGuI3by9p5okbRjCzu1jUazsdYuhKrgRai8dmFT8mSk0
	+FJyDbJLK5891vmyy3dvlWxGWcEiYTfFg5lFDyFpinyCL62ak1MmQgXI+V36IduaBtnq
	fLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mGlgH0cwuoYuDMnqSr9qE3oYL874yCf6Wbq5z2Dm0Bc=;
	b=F7jlZvLGekIexnQEcEp9g7z2FN8Sw5T58IeO1ei5ztIkH8lhEGjR3mlVHAXQAihCZd
	FUUTvJ6jVz+CvnjqezuMPXR93Uwu36cd6Q5lUpmtO135edfWxHJWV3pjn3qNp5wynfGt
	HW1PenMBdV5LEXijW9d/thHWVyb3n185ZHZ6khUC6cR64y7QOTZeCzgcTwThj3E+WraR
	iLMyP7BmIPmDvF5KWKEsPl1R9ZGBbwOy0W1YmAFxdDGgoNJdhlQGNWUWaMQuajhmd0CP
	ghc/j+QeuLiTZb4xPPnPQ4YXY5M+Ff1yJGXlMVfCKZuHPBGJklm2IPPvcOxiKgrEgF1x
	QutA==
X-Gm-Message-State: AG10YOQG+87E14HbDhjBA70SxicbyxPuXX++PKEiq0zoq8wyDfGSP18xolePd2px664WHin/TeDXzit9nRBPGiU5
X-Received: by 10.107.137.92 with SMTP id l89mr18866560iod.133.1454972208332; 
	Mon, 08 Feb 2016 14:56:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 8 Feb 2016 14:56:29 -0800 (PST)
In-Reply-To: <1454963681-18756-2-git-send-email-armccurdy@gmail.com>
References: <1454963681-18756-1-git-send-email-armccurdy@gmail.com>
	<1454963681-18756-2-git-send-email-armccurdy@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Feb 2016 22:56:29 +0000
Message-ID: <CAJTo0LaCMqE5kQR5SApPdBw-LYbdyxwtaFK+DpAfhbhU7LFScQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libproxy: replace PACKAGECONFIG equivalent with the real thing
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
X-List-Received-Date: Mon, 08 Feb 2016 22:56:48 -0000
Content-Type: multipart/alternative; boundary=001a113ebdb4a2df1b052b4a1d29

--001a113ebdb4a2df1b052b4a1d29
Content-Type: text/plain; charset=UTF-8

On 8 February 2016 at 20:34, Andre McCurdy <armccurdy@gmail.com> wrote:

> '' if incompatible_license_contains('GPLv3', 'x', '', d) == 'x' or
> bb.utils.contains('DISTRO_FEATURES', 'x11', 'x', '', d) == '' else 'gnome'
> } \
>

Instead of returning 'x' or '' and then doing string comparisons, why not
just return True or False and let if/or/else do the right thing?

Ross

--001a113ebdb4a2df1b052b4a1d29
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 February 2016 at 20:34, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D=
"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2q2" class=3D"a=
3s" style=3D"overflow:hidden"> &#39;&#39; if incompatible_license_contains(=
&#39;GPLv3&#39;, &#39;x&#39;, &#39;&#39;, d) =3D=3D &#39;x&#39; or bb.utils=
.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;x&#39;, &#39;&#39;=
, d) =3D=3D &#39;&#39; else &#39;gnome&#39; } \</div></blockquote></div><br=
>Instead of returning &#39;x&#39; or &#39;&#39; and then doing string compa=
risons, why not just return True or False and let if/or/else do the right t=
hing?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
Ross</div></div>

--001a113ebdb4a2df1b052b4a1d29--
