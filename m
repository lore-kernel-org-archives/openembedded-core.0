Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 42A5E78109
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 12:17:14 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id v27so178200216qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 05:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=R8viAo+lE4i9XvfD1RCMkuXXjKA5gm6Xp67BykCkuzw=;
	b=b3lt4OQWvrEzOUwWolahxqlcKFok0OHgSjITASfhDbFGlcDFZfhUBafOqSTq4+vUZZ
	z4E6tTC7c+sMGGqkqM8+ETpOq3ZWpnBgM8FkEtRN8SKwX7nFnQgbloeKyeyjsfiCyiNM
	b2qUZsrV7oM3xj8se+fb1g6MT+V+1bg07mkxBynwcwhP+c2iBMow5/CxVQ7tBDOFUU0/
	78MeMQfgLmvfDhE9QD7HgZ+sBcspajMWsKjLaXx2omRsvzZYo+40xXBEu2glz2LP3MCs
	IvrXPG5yAm7x/ZW4ZKpg/g4iQQpDUuCtIp+GdQv8G82y+1b9+P1+7OG6cr6lihgrKEQ0
	OY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=R8viAo+lE4i9XvfD1RCMkuXXjKA5gm6Xp67BykCkuzw=;
	b=FwCwX0IeitTktqPs+9dLdbUIjeI59xxtPG47ekPw7vqxjvU8hXilBD6OmWwt8kbRct
	jpb7LI5OXS7H/Yndl6PmVtZFNUh0eC8su1U35Ms/jh9Zw97iT5jzWQ+ATcotoH7yFEYf
	iRt96FdYod3vG3PGHmGdtsFszxC3Pa4v9EA3s19LVLREIyt0dJPCKZpyjd7p2FZZ5j91
	mwDhfXdVxolwiRasSbMuD4uz3PgInMMGTBFXBVqc+k8beO43L37/0PFNoeWJzTNefnGg
	ipQLWm5zV9OkfwLH06Wp0y9GQTqQlHI34RZ5CsS/EbgXh2MLKi1v0TIauzH52C6OquR3
	v17Q==
X-Gm-Message-State: AODbwcAMBkpO0wQ2HNBl5wu/LLuMAErppFwytkcMAq/2qPe1+sRQSj9r
	0ZEqmjkEiu/8iZA7YZAosZqx2hxDZ8yZ
X-Received: by 10.200.47.210 with SMTP id m18mr41111998qta.44.1495714636246;
	Thu, 25 May 2017 05:17:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Thu, 25 May 2017 05:16:55 -0700 (PDT)
In-Reply-To: <CAJTo0LaMqnc=yG995vd7vqiHaA9jA4xYtUiSEr065vWVsG0p5Q@mail.gmail.com>
References: <1494933979-5139-1-git-send-email-dv@pseudoterminal.org>
	<1494933979-5139-8-git-send-email-dv@pseudoterminal.org>
	<CAJTo0LYipxZN4VK25oKEcPH4=PUw3BJUQG-W14h8+T7N2P+_1w@mail.gmail.com>
	<CAJTo0LaMqnc=yG995vd7vqiHaA9jA4xYtUiSEr065vWVsG0p5Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 May 2017 13:16:55 +0100
Message-ID: <CAJTo0La0FLQCDy7Mv=9FHvqOfNodsZGN0bk73LHiCBuenpegEQ@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/9] gstreamer1.0-omx: upgrade to version 1.12.0
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
X-List-Received-Date: Thu, 25 May 2017 12:17:15 -0000
Content-Type: multipart/alternative; boundary="001a1142adba9438ee05505833db"

--001a1142adba9438ee05505833db
Content-Type: text/plain; charset="UTF-8"

Finally the test must be quite broken - we have 1.25.  I'll have a quick
dig now.

Ross

On 25 May 2017 at 13:15, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 25 May 2017 at 13:15, Burton, Ross <ross.burton@intel.com> wrote:
>
>> I presume you build without api-documentation as with Poky I get this
>> error:
>>
>
> Oh, this happened *before* your patches were merged.  Clearly this is a
> combination the autobuilder doesn't exercise. :(
>
> Ross
>

--001a1142adba9438ee05505833db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Finally the test must be quite broken - we have 1.25.=C2=
=A0 I&#39;ll have a quick dig now.<div><br></div><div>Ross</div></div><div =
class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 25 May 2017 at 13:1=
5, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.c=
om" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><span =
class=3D""><br><div class=3D"gmail_quote">On 25 May 2017 at 13:15, Burton, =
Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=
=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><div dir=3D"ltr">I presume you build without api-documentati=
on as with Poky I get this error:<div></div></div></blockquote></div><br></=
span>Oh, this happened *before* your patches were merged.=C2=A0 Clearly thi=
s is a combination the autobuilder doesn&#39;t exercise. :(</div><span clas=
s=3D"HOEnZb"><font color=3D"#888888"><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Ross</div></font></span></div>
</blockquote></div><br></div>

--001a1142adba9438ee05505833db--
