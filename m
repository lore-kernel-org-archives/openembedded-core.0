Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id A2AE260116
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 08:39:52 +0000 (UTC)
Received: by igl9 with SMTP id 9so6422101igl.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Dec 2015 00:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=IDEWSE4yaczLG3y+eoLPwYQLpaKmEi5tjBeNdBk2Oqk=;
	b=aW6eLhh6NFgCMnewmpymaBn0PzRWh1/uM6MKQEpAqxTvn8Djy9rLfMbRZpN6KNTPPC
	bIeQ7jPAN3u3me4Tuv58BTjKdmX+Lo8/uzoKNjM1Z5GJPdFfkEgx9jcYicFi/BMvyxxr
	esLaVuLXsua6mDUFc3Irvq/7mN5NtW0ez84sC9eR4vgFzAL4nVxbTEDvC5CswIBnAIrE
	wf3SL49W6/N0hoy4go4bHukzoKNrNjB5nUqBqwKffWvkvyDuqhDFFLcj7nzVI94hYEgR
	GEzjDvrAbl2Nr3EEWMElPoFo2rSSTUE6VqZfIlDAgCHv4n4IeBg346R6hIzn2lD9wk4f
	pZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=IDEWSE4yaczLG3y+eoLPwYQLpaKmEi5tjBeNdBk2Oqk=;
	b=FHtdGQAFI/7PhuT6fkXHWgyTBN5v0nYNE8bemT7rXPXL3FEQ7TO1tzvb1LMlSk1HbU
	v+zZ5iFU93bcqJ1vQQHm+h6LhAqGe1tGK/zRIGdoxrNBN1X4HLoFZZRaNMWZvP/o5Tox
	iTQK+1fcB+QhSHotuPjhqaHfH4zozACNwE111Xsee2RNMxcvxp1uQEc9WhXY/ZmdeHdc
	wIh5DjPoCW2X7AgNfwIAzizqic/GHB/E4g8FqnR2n0H+cePdzePInNo7hCevx8HCxb3D
	TOWeVuGqf/UaYOw/UwmYNT2df+TF43iz3f1H8ULObVuNA0m+8gCexRmEMyvm23FElyfe
	LAJA==
X-Gm-Message-State: ALoCoQkvoEzMdt7OcxRbe5LCd1q1JmvNUUn9DhaAC/Xz4oFrmmd2/pg4QBjhIyOhoqbcsIy1DleQ
X-Received: by 10.50.152.98 with SMTP id ux2mr1141338igb.64.1449131993531;
	Thu, 03 Dec 2015 00:39:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Thu, 3 Dec 2015 00:39:34 -0800 (PST)
In-Reply-To: <1449128801.10734.73.camel@intel.com>
References: <e36072a82de706f1485c054adf8cb2d38a01e899.1448029554.git.andrew.shadura@collabora.co.uk>
	<1449073639.10734.65.camel@intel.com>
	<CAJTo0LZZZ8O_xnpg2fmqbD77JVWq89aYSUUujAWm7JbN=Q51hw@mail.gmail.com>
	<1449128801.10734.73.camel@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 3 Dec 2015 08:39:34 +0000
Message-ID: <CAJTo0Laxb5Cs=86vkxeOddf-wViitJt2MfCDoLTqjaZz724w8w@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Andrew Shadura <andrew.shadura@collabora.co.uk>,
	OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/3] dbus: merge .bb and .inc
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
X-List-Received-Date: Thu, 03 Dec 2015 08:39:57 -0000
Content-Type: multipart/alternative; boundary=089e0149baaab526210525fa554e

--089e0149baaab526210525fa554e
Content-Type: text/plain; charset=UTF-8

On 3 December 2015 at 07:46, Patrick Ohly <patrick.ohly@intel.com> wrote:

> In the layer I am trying to be compatible with OE-core master, dizzy,
> fido and jethro. That means I cannot "require
> recipes-core/dbus/dbus_1.8.18.bb" because that file only exists on
> master.
>

In which case you're expecting the dbus.inc file to remain version-agnostic
across three releases.

Could dbus-cynara be replaced with a bbappend that adds a number of patches
and a PACKAGECONFIG[cynara], which defaults to disabled for zero impact,
but can be enabled at the distro level?

Ross

--089e0149baaab526210525fa554e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 December 2015 at 07:46, Patrick Ohly <span dir=3D"ltr">&lt;<a href=3D"=
mailto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":7d0" class=
=3D"a3s" style=3D"overflow:hidden">In the layer I am trying to be compatibl=
e with OE-core master, dizzy,<br>
fido and jethro. That means I cannot &quot;require<br>
recipes-core/dbus/<a href=3D"http://dbus_1.8.18.bb" rel=3D"noreferrer" targ=
et=3D"_blank">dbus_1.8.18.bb</a>&quot; because that file only exists on<br>
master.</div></blockquote></div><br>In which case you&#39;re expecting the =
dbus.inc file to remain version-agnostic across three releases.</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Could dbus-cynara=
 be replaced with a bbappend that adds a number of patches and a PACKAGECON=
FIG[cynara], which defaults to disabled for zero impact, but can be enabled=
 at the distro level?</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--089e0149baaab526210525fa554e--
