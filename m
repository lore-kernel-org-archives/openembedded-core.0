Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4E0FD65CBC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 11:26:03 +0000 (UTC)
Received: by qgj62 with SMTP id 62so1120757qgj.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 04:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=3mqTEQSCVop4+pT9nd2PX60yk07DiR0SaC/OE1GBIqk=;
	b=aiG9Q1yHAwni2GD21vHYxxBTBPYDt+OTEUsehKju8p43dKMDZTaB4yioBAdpP69kKC
	pUBCBMlvClM8i9T062uTx15RWNXVErHXMxBzJVDbP4TNtBViSpiGygBbSUTgdqVaHWpS
	Z40sqLy5Enzii/ELshCaK04B2R090poGsYTj3ps4v/irP5GpqcRBB6ucYL0c4mStNoNq
	4yE41gWQh0WffbCufXkw7Pdq77/kR2MToR+a8qYxw4VaYzmUn86eAdulbYItm8WMD29L
	pRglh5neFdfZB2fI1v0Bn9KeeCqJasn8u2UE6LYio5lbrqS19heEnxUToG47EBJ0x7Fb
	k1UQ==
X-Gm-Message-State: ALoCoQkxSdQScJ7hLKuMJG2t0SAFOu3jlHE82MYbfDSg2poOayrppfcHMXNc2T+YIw3skpvAgOnL
X-Received: by 10.140.133.67 with SMTP id 64mr23172614qhf.52.1439983564108;
	Wed, 19 Aug 2015 04:26:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Wed, 19 Aug 2015 04:25:44 -0700 (PDT)
In-Reply-To: <20150819071002.GA10916@ad.chargestorm.se>
References: <365E1805BC95084CBE82381A0B869994E73E4FE9@EU-MBX-03.mgc.mentorg.com>
	<969F26A8BAB325438E7EB80D3C3134FB16CFA7F5@IRSMSX105.ger.corp.intel.com>
	<CAP71WjyESzCxJrJsxgSk0ZxnM8q0tQYU+CFmm-QVQGVouYWB+A@mail.gmail.com>
	<CABcZANkgxRSRA9afEaOD0cpeNzzSAti_Ef9D4V4ThoJkQzwmgg@mail.gmail.com>
	<CABcZANmjXndEm+OF8aKvSgHwkiOMuFgHrrJy97CYLpDNtZxCmg@mail.gmail.com>
	<CABcZAN==rSZ2M4f_2-eZ5yvAaHV+k=rC8pgRju425151ijWMZw@mail.gmail.com>
	<20150819071002.GA10916@ad.chargestorm.se>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Aug 2015 12:25:44 +0100
Message-ID: <CAJTo0LaoZcQ+398vYS-iaVssQnAVHr0cJCY4izC8=T73nWy4rQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 19 Aug 2015 11:26:04 -0000
Content-Type: multipart/alternative; boundary=001a1136fdced24b52051da84ce7

--001a1136fdced24b52051da84ce7
Content-Type: text/plain; charset=UTF-8

And now for the elephant in the room: is anyone going to work on this? :)

Ross

On 19 August 2015 at 08:10, Anders Darander <anders@chargestorm.se> wrote:

> * Christopher Larson <clarson@kergoth.com> [150818 18:00]:
> > On Tue, Aug 18, 2015 at 8:53 AM, Christopher Larson <clarson@kergoth.com
> >
> > wrote:
> > > Bringing this back up again, as I think we really need to at the *very*
> > > least pull in iw from meta-oe into oe-core, and adjust
> packagegroup-base
> > > (worst case, with a VIRTUAL-RUNTIME), and better yet also drop
> > > wireless-tools / move it to meta-networking.
>
> > Worst case, we could keep both in VIRTUAL-RUNTIME for compatibility, as a
> > temporary measure, but I think we need to get iw into oe-core and into
> the
> > base images for sure.
>
> Yes, we should get iw into oe-core. So, I agree completely with this.
>
> /Anders
>
> --
> Anders Darander
> ChargeStorm AB / eStorm AB
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1136fdced24b52051da84ce7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">And now for the elephant in the room: is anyone going to w=
ork on this? :)<div><br></div><div>Ross</div></div><div class=3D"gmail_extr=
a"><br><div class=3D"gmail_quote">On 19 August 2015 at 08:10, Anders Darand=
er <span dir=3D"ltr">&lt;<a href=3D"mailto:anders@chargestorm.se" target=3D=
"_blank">anders@chargestorm.se</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">* Christopher Larson &lt;<a href=3D"mailto:clarson@kergoth.co=
m">clarson@kergoth.com</a>&gt; [150818 18:00]:<br>
<span class=3D"">&gt; On Tue, Aug 18, 2015 at 8:53 AM, Christopher Larson &=
lt;<a href=3D"mailto:clarson@kergoth.com">clarson@kergoth.com</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt; Bringing this back up again, as I think we really need to at the =
*very*<br>
&gt; &gt; least pull in iw from meta-oe into oe-core, and adjust packagegro=
up-base<br>
&gt; &gt; (worst case, with a VIRTUAL-RUNTIME), and better yet also drop<br=
>
&gt; &gt; wireless-tools / move it to meta-networking.<br>
<br>
&gt; Worst case, we could keep both in VIRTUAL-RUNTIME for compatibility, a=
s a<br>
&gt; temporary measure, but I think we need to get iw into oe-core and into=
 the<br>
&gt; base images for sure.<br>
<br>
</span>Yes, we should get iw into oe-core. So, I agree completely with this=
.<br>
<br>
/Anders<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Anders Darander<br>
ChargeStorm AB / eStorm AB<br>
--<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">_____________________=
__________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br></div>

--001a1136fdced24b52051da84ce7--
