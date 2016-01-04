Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 64AD0731C2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 20:53:45 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id 1so120691925ion.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jan 2016 12:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=KDPVH7Qgxn8RFdhZxZLkjeXku5u5IDxJDegl/Qyj4KY=;
	b=BoXA8+qla5dlx2tvDLOlB8/4awl0RcwWq0F25YRM7ZtvZqZ7bMx76Xi6eetx3E5miS
	UZnO+3SPkACuThS/OaDwuo/WrC9nOO0HuBzc0Gmm8xj+Zq11RqCD7KrLFIO3rLwevzU0
	rlEcXfEUJnkErlpbOyMaqSMYL/pwnxLxZG0voiIr9GfEKxts7NZRetNTX8NBpzqrSafF
	ZOrxZDfVYWETa/wUPbm9vnqRz2HBLJKawo1RUh9mxBaKOhwpdjNSjbQNmZjeE/fuBqLl
	zu2cz0ppUB0utCOmEo41aj4pLO+x2+hFZRwyaBAhqSjppiu2r3BzKV7u2r65GKhlWtct
	ocjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=KDPVH7Qgxn8RFdhZxZLkjeXku5u5IDxJDegl/Qyj4KY=;
	b=YmYysSqxIW4k+RGYT2roJVKboh3S88PyhnPlkDcAo6WlwaZRKVF1gZBKEU6LaDMpZ6
	nGTcIeUS3328OEjoyKUIUb9e7Z1qf7RXvQssT58pJBkdZSEVJaM6KZSY54Fta6+sb9wU
	VcD+N2mM8KkegHEI6lTdVWaAvc5Vu5Q6cPzcgrJBSuodxsr14o88gb2se7Q9Ka2mZqiS
	kwv/ta0E28Rtzl+nngMYC7VT52Lj47aSWs/qZbJdvwdArvODOI7oegzif49qKDSSNw3z
	rnRfXMzV8e1bT1QEKIBpF/UY1Aa/DibTdWxUCJsEBcMoJdb82P6Qfmy2W1azM5av+id0
	BHMA==
X-Gm-Message-State: ALoCoQmsXYQq1P3kRZIZw3V9M8ixnxcFmfUNouZ/Zg6VP8mM3uK7HyOZdqTOjHwgVauWHAPy0zMi2iT3uUTb7+z3jfx7MgA5p2SBnVvwo7WLTHlDyUADzzM=
X-Received: by 10.107.135.104 with SMTP id j101mr52792498iod.133.1451940826495;
	Mon, 04 Jan 2016 12:53:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 4 Jan 2016 12:53:27 -0800 (PST)
In-Reply-To: <CAMKF1soaRON--0ywMMeesGsakmcqS7tNZFxeVD=YCA2TE5532Q@mail.gmail.com>
References: <1451903012-22560-1-git-send-email-ross.burton@intel.com>
	<1451903012-22560-2-git-send-email-ross.burton@intel.com>
	<CAMKF1soaRON--0ywMMeesGsakmcqS7tNZFxeVD=YCA2TE5532Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Jan 2016 20:53:27 +0000
Message-ID: <CAJTo0LZX0AnEjGSsRH87xsXNX1io=T17rBCnzJH_Ek=Lptzg5w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] systemd: add more compression and importd PACKAGECONFIGs
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
X-List-Received-Date: Mon, 04 Jan 2016 20:53:46 -0000
Content-Type: multipart/alternative; boundary=001a113ebe9232d40a0528885127

--001a113ebe9232d40a0528885127
Content-Type: text/plain; charset=UTF-8

On 4 January 2016 at 18:36, Khem Raj <raj.khem@gmail.com> wrote:

> Would it thow some sensible configure errors on enabling importd
> without the dependencies ? now that they are packageconfigs on their
> own. ?
>

No, basically currently if you enable enough options then importd enables
itself so the main aim here was to add some determinism to both all the
compression backends and importd.

Ross

--001a113ebe9232d40a0528885127
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 January 2016 at 18:36, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div id=3D":382" class=3D"a3s" styl=
e=3D"overflow:hidden">Would it thow some sensible configure errors on enabl=
ing importd<br>
without the dependencies ? now that they are packageconfigs on their<br>
own. ?</div></blockquote></div><br>No, basically currently if you enable en=
ough options then importd enables itself so the main aim here was to add so=
me determinism to both all the compression backends and importd.</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ebe9232d40a0528885127--
