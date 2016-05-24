Return-Path: <kergoth@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4E79E60616
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 16:41:35 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id k76so2745645ita.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 09:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=LWE6VCvO3UtvSrTqlv00idlenO4OaZC55QyIzEijmMc=;
	b=PrDkd9nLAALQfi//FO6n6sVQTo+++/JaT+MCfPqUxUvbrsi6T8GgrxB6dGxz7M1aXd
	DtwT6kWPGPcRhOZtMTz2x19UmOux4UIFaEcQM9h/FVthppB9dDmwVNNr0doVgHTIWeBX
	iCyNn77V7Zcpj4SWxg+a1MAgbe8pjssCaZhNJfF6OLtj3lIENAhfi+OIIGvUTO57mrIe
	sWnqLCx8tgkRhYAZ9b4fizPqhB7gjmAVjl29ldo/nNSoO06rq+oxxVaZYYErRYVeT2jT
	AUFWDfh85CguYWFM5TRdfyD7l4qB0FX4YE6yyeoU9AdsY80Osu67+rq0uti1NA95THXC
	c7wA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=LWE6VCvO3UtvSrTqlv00idlenO4OaZC55QyIzEijmMc=;
	b=k5csBWD73NAYVQZZVtwqwxaX8xD2vW+PJc1ZZqU1UOOfueZNJOTzK6TOM7VTlK5EAJ
	DTs+5uyiIideHfOLq6ki87kaLzkCC8mFShReGeCksleLw8reQNxBGDckho1onnIiy4DC
	0J645YG7GFFlLBnd/u6RoNpaCoVdxpT/nVnsWpaTKwp2YhnEw9TKlNR05JoTg1FM7U9u
	JxEDlRDRNTvThldsyWfJjvTMeRBIw3JVEE7M2ngCeTi8Ebglezz69a26nfXdZON9tKUA
	vsfn+nkFVLXpj/KQQMz2NflQqg/hHDtjCjNlhCC0dOl8A62CqfbaTE108UkJylo0GuBm
	Mmow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=LWE6VCvO3UtvSrTqlv00idlenO4OaZC55QyIzEijmMc=;
	b=cXPKGRbceVARrVJ95h+SDzKvzQJKU4Iu2Hj5JRPrJyiyz2piNqSNGcU+MeBVZxN50T
	i79S0lMa3DXPZab9dwREdu7uVBaGcA4bLP1vleyLX7gBiwCR4AicDUcCwHTj2Ldhbt6P
	/iHFKsgeFOh3T2LGAdsFH2Vt8pBH7GxRBglR6vWNnY1/ZkZu14zsEh4Cr0wKz82SjOq/
	Xz+AxL3Qps5EqIt/sbIau2f74eo0Hn2Uc0INa36Y32U/btDfVVrVhQdCnjGGRqGRAEAX
	KuxGei4dkOgIZBQgaGjiw0iE1jQsdb7+v5eVw5cihq6CBQ5mT+1kGmXjsHlR3DuztrpV
	XlPA==
X-Gm-Message-State: ALyK8tJq0paRdKcSbCVYiQuuzpvXrVCVATtRjmgAllxXMLSAPkMIU+dsyFhJQ3ElS5iJKwWzzruHs3tbkT8MOQ==
X-Received: by 10.36.53.134 with SMTP id k128mr4301392ita.66.1464108096673;
	Tue, 24 May 2016 09:41:36 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.5 with HTTP; Tue, 24 May 2016 09:41:17 -0700 (PDT)
In-Reply-To: <CABcZAN=D9C=x+85_w4-4_J4xGoSzU5WJciRsjCbGSAT5mSbUXQ@mail.gmail.com>
References: <1462846173-3640-1-git-send-email-rongqing.li@windriver.com>
	<CABcZAN=D9C=x+85_w4-4_J4xGoSzU5WJciRsjCbGSAT5mSbUXQ@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 24 May 2016 09:41:17 -0700
X-Google-Sender-Auth: 3ZYX1BqbYotjVGYM8lHMIGydozY
Message-ID: <CABcZANm60kBvQyEZZo2FwaJD=Fud2H3gmD8SS3+B9kybR=p2XQ@mail.gmail.com>
To: rongqing.li@windriver.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: re-enable mount propagation for udevd
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
X-List-Received-Date: Tue, 24 May 2016 16:41:36 -0000
Content-Type: multipart/alternative; boundary=001a114aa07003dd190533993b53

--001a114aa07003dd190533993b53
Content-Type: text/plain; charset=UTF-8

On Tue, May 24, 2016 at 9:37 AM, Christopher Larson <clarson@kergoth.com>
wrote:

> On Mon, May 9, 2016 at 7:09 PM, <rongqing.li@windriver.com> wrote:
>
>> From: Roy Li <rongqing.li@windriver.com>
>>
>> With MountFlags=slave, those mounts then become private to the systemd-
>> udevd
>> namespace and are no longer accessible from outside the namespace, which
>> is
>> not expected
>>
>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>>
>
> What's the status of this? Mentor is carrying this patch too :)


Nevermind, I see this is on ross/mut.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a114aa07003dd190533993b53
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, May 24, 2016 at 9:37 AM, Christopher Larson <span dir=3D"ltr">&lt;<=
a href=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""><=
div class=3D"gmail_quote">On Mon, May 9, 2016 at 7:09 PM,  <span dir=3D"ltr=
">&lt;<a href=3D"mailto:rongqing.li@windriver.com" target=3D"_blank">rongqi=
ng.li@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div>From: Roy Li &lt;<a href=3D"mailto:rongqing.li@windriver.com" target=
=3D"_blank">rongqing.li@windriver.com</a>&gt;<br>
<br>
With MountFlags=3Dslave, those <span>mounts</span> then become private to t=
he <span class=3D"il">systemd</span>-<span class=3D"il">udevd</span><br>
namespace and are no longer accessible from outside the namespace, which is=
<br>
not expected<br>
<br>
Signed-off-by: Roy Li &lt;<a href=3D"mailto:rongqing.li@windriver.com" targ=
et=3D"_blank">rongqing.li@windriver.com</a>&gt;</div></blockquote></div><br=
></span>What&#39;s the status of this? Mentor is carrying this patch too :)=
</blockquote></div><br>Nevermind, I see this is on ross/mut.<br>-- <br><div=
 class=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot com=
<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Se=
nior Software Engineer, Mentor Graphics</div>
</div></div>

--001a114aa07003dd190533993b53--
