Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id B3339608B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 11:56:45 +0000 (UTC)
Received: by qgeb6 with SMTP id b6so1615461qge.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 04:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ohpoAYDNzeiUyiznyD+D2rSYvckXeuPxqIr8fj4qItc=;
	b=ZJP6luMMHH7OFc37scARrOqojk5fHatLx/f1nYnKr98TuwYyKFRbGmTZWB04oAyfrd
	B4V5/YkpDIc0yITxJn2wl2wfuTajq2z6FiisCRuV2WT0T9ZLKMIjU8+irg/Mkr1QExhE
	T0CcEr0PE5AV9UTE/+ZWKUryWgs/4ELwykZvfsL9xdTy8zeu7eg2RRVaA7YdAnmwFze0
	1TepIL4jSMZ4H+xUuQTGoDSy4tiu5q711ueR1Z2Pv2xC4bG5qeHFcFca67cQgHXp0RTr
	o/ZyB18001L9LMzceiX8z1bXIbTd6on+X7I5fhnMimomQJUWqnC5QmFX3cUhe5SgZOUi
	gQGw==
X-Gm-Message-State: ALoCoQmnoGYsOSg9dIceGuo32HS3f7tYPzs5ckrRuZPquo7TK9Tr6RsBoUWHIv7OqP4lqjppJh+A
X-Received: by 10.140.132.71 with SMTP id 68mr23472525qhe.64.1439985405375;
	Wed, 19 Aug 2015 04:56:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Wed, 19 Aug 2015 04:56:26 -0700 (PDT)
In-Reply-To: <CAP9ODKok+TydzwtDA7o9YRS_tVEqffMPWAJtgPPPsbAjv5XpBA@mail.gmail.com>
References: <365E1805BC95084CBE82381A0B869994E73E4FE9@EU-MBX-03.mgc.mentorg.com>
	<969F26A8BAB325438E7EB80D3C3134FB16CFA7F5@IRSMSX105.ger.corp.intel.com>
	<CAP71WjyESzCxJrJsxgSk0ZxnM8q0tQYU+CFmm-QVQGVouYWB+A@mail.gmail.com>
	<CABcZANkgxRSRA9afEaOD0cpeNzzSAti_Ef9D4V4ThoJkQzwmgg@mail.gmail.com>
	<CABcZANmjXndEm+OF8aKvSgHwkiOMuFgHrrJy97CYLpDNtZxCmg@mail.gmail.com>
	<CABcZAN==rSZ2M4f_2-eZ5yvAaHV+k=rC8pgRju425151ijWMZw@mail.gmail.com>
	<20150819071002.GA10916@ad.chargestorm.se>
	<CAJTo0LaoZcQ+398vYS-iaVssQnAVHr0cJCY4izC8=T73nWy4rQ@mail.gmail.com>
	<CAP9ODKok+TydzwtDA7o9YRS_tVEqffMPWAJtgPPPsbAjv5XpBA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Aug 2015 12:56:26 +0100
Message-ID: <CAJTo0LZLL+ui3GEG7HeC7y+JxWdmBXaYwWEzbQB3DZU3ypfckw@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: iw in place of wireless-tools
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
X-List-Received-Date: Wed, 19 Aug 2015 11:56:45 -0000
Content-Type: multipart/alternative; boundary=001a113510d491ebd3051da8ba55

--001a113510d491ebd3051da8ba55
Content-Type: text/plain; charset=UTF-8

On 19 August 2015 at 12:35, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> Em 19/08/2015 12:26, "Burton, Ross" <ross.burton@intel.com> escreveu:
> >
> > And now for the elephant in the room: is anyone going to work on this? :)
>
> I can ask our people to work on this.
>
> Is there a bug number to assign for me?
>
Not as far as I'm aware.  Note that M3 cut-off is fairly soon (August 23rd,
technically) and this would count as a Feature so switching to iw would be
out of scope for M4.

Ross

--001a113510d491ebd3051da8ba55
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On 19 August 2015 at 12:35, Ota=
vio Salvador <span dir=3D"ltr">&lt;<a href=3D"mailto:otavio.salvador@ossyst=
ems.com.br" target=3D"_blank">otavio.salvador@ossystems.com.br</a>&gt;</spa=
n> wrote:<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><p dir=
=3D"ltr"><span>
Em 19/08/2015 12:26, &quot;Burton, Ross&quot; &lt;<a href=3D"mailto:ross.bu=
rton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt; escreveu:<b=
r>
&gt;<br></span><span>
&gt; And now for the elephant in the room: is anyone going to work on this?=
 :)</span></p>
<p dir=3D"ltr">I can ask our people to work on this.</p>
<p dir=3D"ltr">Is there a bug number to assign for me?<br>
</p>
</blockquote></div>Not as far as I&#39;m aware.=C2=A0 Note that M3 cut-off =
is fairly soon (August 23rd, technically) and this would count as a Feature=
 so switching to iw would be out of scope for M4.</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113510d491ebd3051da8ba55--
