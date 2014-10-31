Return-Path: <mgloff@emacinc.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id E91547182C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 07:14:37 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id tr6so713278ieb.18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 00:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=qfFEWst32GaxvirbQWAA+9RlB8fZkMkNw3ofuQEc/MI=;
	b=Tb156Ll+wPyosCsnDPf7QUHKgADn6p8seCPQJufPKMUOly1sGzP0S9BGEmUyBM+CJR
	7ld9W8nA701mPUNYZ5rIRyysZ6/RCrDvblinMc+xax3BFvU8nmdz9Rlbdmz7YT/Lz68e
	jjahU67LtVgWGxtF5W7tZCf/6SyF1X55r6IppKlBUDUKhNDNBYjGG52UvpnRA3nreUCH
	q6dtD7SDXMhB03Zc3NOgy71m/FOz6DyFCyfXQzMf1fBBrh3VWRQ2P28rsr4Wa1vFyuYQ
	Lrb0R6TkBAhzq2e8XFNIjRai/GoUsxt0yI1SHXpn3ZtuU5yK3emiFgtaiq1NHtE/ySci
	22xQ==
X-Gm-Message-State: ALoCoQml7vTwzV6eAHE5tuVRwuwGruGRkFZmBZdM0xE0q79Ke9X54JitY4RSfPMfWnbonz5yrdaB
MIME-Version: 1.0
X-Received: by 10.43.128.71 with SMTP id hd7mr21889278icc.36.1414739678051;
	Fri, 31 Oct 2014 00:14:38 -0700 (PDT)
Received: by 10.107.148.145 with HTTP; Fri, 31 Oct 2014 00:14:38 -0700 (PDT)
In-Reply-To: <CANyK_8cv3go0ghbLD73WwEdEyPiB5bLzaN_w8Wa4KxDQo92quQ@mail.gmail.com>
References: <CALXw4G7x6Xbf3Wr=mKUCk6G5e4k=8sz_pph9VUMegLn1txA9WQ@mail.gmail.com>
	<CANyK_8cv3go0ghbLD73WwEdEyPiB5bLzaN_w8Wa4KxDQo92quQ@mail.gmail.com>
Date: Fri, 31 Oct 2014 02:14:38 -0500
Message-ID: <CALXw4G5O2NRCzQ4MiF8fG4G1C_bZNYbuH8NcdYbJUhRctjCgfA@mail.gmail.com>
From: Michael Gloff <mgloff@emacinc.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: Opkg 0.2.3
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
X-List-Received-Date: Fri, 31 Oct 2014 07:14:46 -0000
Content-Type: multipart/alternative; boundary=001a11c20560f5ec1c0506b2bf5f

--001a11c20560f5ec1c0506b2bf5f
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 30, 2014 at 2:48 PM, Paul Barker <paul@paulbarker.me.uk> wrote:

> On 30 October 2014 19:15, Michael Gloff <mgloff@emacinc.com> wrote:
> > As Paul mentioned yesterday opkg 0.2.4 is on it's way and 0.2.3 has been
> > available for 2 months. If there are not any objections, I have an
> updated
> > recipe and re-created previous patches that I could send. This should
> also
> > modify opkg-colateral to use the new syntax for lists_dir.
>
> I'm also sat on tested patches, I was planning to send them tomorrow.
> I've held the patches back as the deadline for such changes for OE 1.7
> had passed.
>

Thanks Paul. I'll wait for your patch set. I hit send before checking inbox.


>
> > I would also at this time like to propose changing the default list
> > directory from /var/lib to something else (/usr/lib ?). On a read only
> > rootfs, everything in /var/lib/ gets mounted on the tmpfs, therefore
> > packages installed get lost.
>
> Changes in v0.3.0 will make this much easier to configure. You'll be
> able to set cache_dir, lists_dir, info_dir, lock_file and status_file
> in opkg.conf. I'd rather we left the defaults as-is and use those
> settings once v0.3.0 is released. v0.3.0 will also create any
> directories needed if they don't exist. So it may make sense to set
> cache_dir to something under /tmp, lock_file to something under /var
> or /run and everything else under /usr if that's what's desired.
>
>
Cool, I'm looking forward to v0.3.0 and beyond
Why not use the new syntax? The recipe should reflect the version of the
package.
Changing the lists_dir with 0.2.1 did not work for me. I can test the old
syntax on 0.2.3 and see, if there is interest.

Is there a reason why opkg-collateral.bb exists? And couldn't be merged
with opkg?

Michael Gloff




> > I've tested changing the lists_dir and everything is working as expected.
> >
> > Michael Gloff
> >
>
> Thanks,
>
> --
> Paul Barker
>
> Email: paul@paulbarker.me.uk
> http://www.paulbarker.me.uk
>

--001a11c20560f5ec1c0506b2bf5f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, Oct 30, 2014 at 2:48 PM, Paul Barker <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:paul@paulbarker.me.uk" target=3D"_blank">paul@paulbarker.me.uk</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 30 =
October 2014 19:15, Michael Gloff &lt;<a href=3D"mailto:mgloff@emacinc.com"=
 target=3D"_blank">mgloff@emacinc.com</a>&gt; wrote:<br>
&gt; As Paul mentioned yesterday opkg 0.2.4 is on it&#39;s way and 0.2.3 ha=
s been<br>
&gt; available for 2 months. If there are not any objections, I have an upd=
ated<br>
&gt; recipe and re-created previous patches that I could send. This should =
also<br>
&gt; modify opkg-colateral to use the new syntax for lists_dir.<br>
<br>
I&#39;m also sat on tested patches, I was planning to send them tomorrow.<b=
r>
I&#39;ve held the patches back as the deadline for such changes for OE 1.7<=
br>
had passed.<br></blockquote><div><br>Thanks Paul. I&#39;ll wait for your pa=
tch set. I hit send before checking inbox.<br>=C2=A0<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
&gt; I would also at this time like to propose changing the default list<br=
>
&gt; directory from /var/lib to something else (/usr/lib ?). On a read only=
<br>
&gt; rootfs, everything in /var/lib/ gets mounted on the tmpfs, therefore<b=
r>
&gt; packages installed get lost.<br>
<br>
Changes in v0.3.0 will make this much easier to configure. You&#39;ll be<br=
>
able to set cache_dir, lists_dir, info_dir, lock_file and status_file<br>
in opkg.conf. I&#39;d rather we left the defaults as-is and use those<br>
settings once v0.3.0 is released. v0.3.0 will also create any<br>
directories needed if they don&#39;t exist. So it may make sense to set<br>
cache_dir to something under /tmp, lock_file to something under /var<br>
or /run and everything else under /usr if that&#39;s what&#39;s desired.<br=
>
<br></blockquote><div><br>Cool, I&#39;m looking forward to v0.3.0 and beyon=
d<br>Why not use the new syntax? The recipe should reflect the version of t=
he package.<br>Changing the lists_dir with 0.2.1 did not work for me. I can=
 test the old syntax on 0.2.3 and see, if there is interest. <br><br>Is the=
re a reason why <a href=3D"http://opkg-collateral.bb">opkg-collateral.bb</a=
> exists? And couldn&#39;t be merged with opkg?<br><br></div><div>Michael G=
loff<br></div><div><br><br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
&gt; I&#39;ve tested changing the lists_dir and everything is working as ex=
pected.<br>
&gt;<br>
&gt; Michael Gloff<br>
&gt;<br>
<br>
Thanks,<br>
<span><font color=3D"#888888"><br>
--<br>
Paul Barker<br>
<br>
Email: <a href=3D"mailto:paul@paulbarker.me.uk" target=3D"_blank">paul@paul=
barker.me.uk</a><br>
<a href=3D"http://www.paulbarker.me.uk" target=3D"_blank">http://www.paulba=
rker.me.uk</a><br>
</font></span></blockquote></div><br></div></div>

--001a11c20560f5ec1c0506b2bf5f--
