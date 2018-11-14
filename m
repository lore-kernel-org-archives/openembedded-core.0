Return-Path: <theknoppix@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id DA4176C183
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 11:46:27 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id r63-v6so15193257wma.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 03:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6iBLNxfDWXldcLFGjxCzxUiB8iHyF+Rm2y4lDHuOQbw=;
	b=lDny4CKt4CLeF1EzyfHtDWm1NldRPjo36XLxv6dJh/DNXpppD6rHFOuIk1oOZVZ5mN
	OroVOQimG9EWgB5gF6ee/QClMY+R+DWw5lzLHl3qY/w16QwWSSwLrgYuec6BBg/ryhL9
	PlEuJ9MlOjpphCvUWuIendUvNwI5AVqcde+RpIx09XYC6RJcS8bC4tyHtGqOF1WP1C+l
	FaQvlBidt78zb/nWIw04xZTjOxbzsycRokUD1Ugl3MbR38Ct49drGoYMlxH5hSBSlP1S
	ZVVguLeIsAQutbPe22WiL+/eZp3WSFYDLdkfBKjJiKs2EqFMYfdO0cFO/qqedFUNFe3l
	SOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6iBLNxfDWXldcLFGjxCzxUiB8iHyF+Rm2y4lDHuOQbw=;
	b=H0h/qzKSVph7fm5oirCX6W3j56BhYheXj9bjNVRWDaaCr12MV0ZslXOv6mfldwhKTc
	lCczQyByd1zu13kFJMJHxsXB+1GSAGBmCY4piOFaKbTqDcGpuEp5lWn1FQR3apbtdH3E
	OiiJDWGbSM4RZWMODj7C39+ec2Qc2LdQd+74pNOoQKIe3Z/1x4aaL+W2cjCgyilzKWq8
	OeH7Y3Sq+F0Nq8dBI4LQHpCXKKWjWzBkAIfKo2CIGXPT5YaxEYdghxNiV69reOlfXNJ0
	Fta5vgXEMdllrxbLyhDNTS8BYnzKS1hajWP4nteuMbzdbm5VcGP63XpWyLWhA3Js8QWA
	K/qg==
X-Gm-Message-State: AGRZ1gKx87CrTwA4UraA3jYfC7PX79B2dW050dtm5KfVSJmsssJwXWcg
	aberfQDvRsH+hXKJpAL9I+7UUSgxRliX/lccTl0=
X-Google-Smtp-Source: AJdET5fwUsWOPmS0ojJJJGAxCjaTSBFF7FnOXDGxe3SsYkBOPozov06BZAZXbW5PI3UWkLF7JSzTk8tYjONfU3BcXo4=
X-Received: by 2002:a1c:a184:: with SMTP id
	k126-v6mr1677337wme.32.1542195988396; 
	Wed, 14 Nov 2018 03:46:28 -0800 (PST)
MIME-Version: 1.0
References: <CAD9sEJu_CbZYAGCiytx1GuM+HEQ+ar8mRG+aWG55dRe_okpK8Q@mail.gmail.com>
	<CAJTo0LY4jYkwWH0LEjzoAmjPWpm3W7P0m45YSWC7CfTW11P_CQ@mail.gmail.com>
In-Reply-To: <CAJTo0LY4jYkwWH0LEjzoAmjPWpm3W7P0m45YSWC7CfTW11P_CQ@mail.gmail.com>
From: Knoppix <theknoppix@gmail.com>
Date: Wed, 14 Nov 2018 14:46:16 +0300
Message-ID: <CAD9sEJsfnEMaPpREK26BoXqteh+3yXw3Uy6jQThBJMnnomJ3EA@mail.gmail.com>
To: ross.burton@intel.com
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: meta-gnome: what are dependencies for gnome-full-desktop (gnome interface)
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
X-List-Received-Date: Wed, 14 Nov 2018 11:46:28 -0000
Content-Type: multipart/alternative; boundary="0000000000001006a5057a9e7c42"

--0000000000001006a5057a9e7c42
Content-Type: text/plain; charset="UTF-8"

My question were implement the missing recipes for yocto->meta-gnome
To start from point I did want to learn dependency graphic of gnome3.
I subscripted devel right know.

Mr Burton: Thank you.

On Wed, Nov 14, 2018 at 2:25 PM Burton, Ross <ross.burton@intel.com> wrote:

> On Wed, 14 Nov 2018 at 08:42, Knoppix <theknoppix@gmail.com> wrote:
>
>> (Excuse me for my english I am not native)
>>
>> One disappointment for me was learn that meta-gnome is not
>> fully-supported for running desktop. So i want to write all remain recipes
>> to use desktop environment. I want to start from scratch (except from
>> meta-debian-recipes) because for learn gnome world.
>>
>> Dear friends, how can I learn what are the necessary binaries&libraries
>> for gnome interface (i.e: desktop window&display-manager panel, topbar,
>> settings and other UI full-desktop-environment) to use on yocto project?
>> Which project is I should start to write its recipe?
>>
>
> If you just want to know what the GNOME dependencies are then you should
> be asking GNOME.  GNOME has a build tool called jhbuild, the module sets in
> tht list all of the dependencies required.
>
> Note that there's a series to add the GNOME 3 desktop to meta-gnome under
> review on the openembedded-devel list, so working on that would avoid
> duplication of effort.
>
> Ross
>

--0000000000001006a5057a9e7c42
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>My question were implement the missing recipes for yo=
cto-&gt;meta-gnome</div><div>To start from point I did want to learn depend=
ency graphic of gnome3.</div><div>I subscripted devel right know.<br></div>=
<div><br></div><div>Mr Burton: Thank you.<br></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr">On Wed, Nov 14, 2018 at 2:25 PM Burton, Ross &lt;<a=
 href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">On Wed, 14 Nov 20=
18 at 08:42, Knoppix &lt;<a href=3D"mailto:theknoppix@gmail.com" target=3D"=
_blank">theknoppix@gmail.com</a>&gt; wrote:<br><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>(Excuse me for my engli=
sh I am not native)<br></div><div><br></div><div>One disappointment for me =
was learn that meta-gnome is not fully-supported for running desktop. So i =
want to write all remain recipes to use desktop environment. I want to star=
t from scratch (except from meta-debian-recipes) because for learn gnome wo=
rld.</div><div><br></div><div>Dear friends, how can I learn what are the ne=
cessary binaries&amp;libraries for gnome interface (i.e: desktop window&amp=
;display-manager panel, topbar, settings and other UI full-desktop-environm=
ent) to use on yocto project? Which project is I should start to write its =
recipe?</div></div></blockquote><div><br></div><div>If you just want to kno=
w what the GNOME dependencies are then you should be asking GNOME.=C2=A0 GN=
OME has a build tool called jhbuild, the module sets in tht list all of the=
 dependencies required.</div><div><br></div><div>Note that there&#39;s a se=
ries to add the GNOME 3 desktop to meta-gnome under review on the openembed=
ded-devel list, so working on that would avoid duplication of effort.</div>=
<div><br></div><div>Ross</div></div></div>
</blockquote></div></div>

--0000000000001006a5057a9e7c42--
