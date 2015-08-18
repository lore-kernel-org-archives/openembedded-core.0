Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id EC2C460043
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 15:53:54 +0000 (UTC)
Received: by igui7 with SMTP id i7so86083060igu.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 08:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=kNCbXmmF+hiCBL/0nQj6yxdtM9wSdKEXI1i0yhvZAVY=;
	b=x13AwnRtiUh4re+6yplsjoZEzhdNwt9ksrU5bqKFQeEL3upk/y3GdN1vUUy/4YNuqU
	uKoOsIQaWq1T0hJnYoB3UvDq7vQ8LUXjmYU+KTl7IkLgTZqRrCU+YpQLkFF18DB2bw2P
	ZRwwVWZ0UacY5WH6/oGjNE4QfPcLZ0qGprEXi7QDKXydeBudK3P4yx3w0qANZMhyL57E
	X2o3nHoluzbfmhJ8I+/6rtgbTl1uS4EbsHW/FzMHbo5882HEcp/3hAdzgHSAyDCVivSZ
	8g2M6yJT8qP+MK7r7sZ2KGO4hmPzMyIZBjfetcNMV+srL3zTb9vPcHZm1JPTosswWNNS
	E5dA==
X-Received: by 10.50.50.69 with SMTP id a5mr22335742igo.68.1439913234219; Tue,
	18 Aug 2015 08:53:54 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.118.150 with HTTP; Tue, 18 Aug 2015 08:53:34 -0700 (PDT)
In-Reply-To: <CABcZANkgxRSRA9afEaOD0cpeNzzSAti_Ef9D4V4ThoJkQzwmgg@mail.gmail.com>
References: <365E1805BC95084CBE82381A0B869994E73E4FE9@EU-MBX-03.mgc.mentorg.com>
	<969F26A8BAB325438E7EB80D3C3134FB16CFA7F5@IRSMSX105.ger.corp.intel.com>
	<CAP71WjyESzCxJrJsxgSk0ZxnM8q0tQYU+CFmm-QVQGVouYWB+A@mail.gmail.com>
	<CABcZANkgxRSRA9afEaOD0cpeNzzSAti_Ef9D4V4ThoJkQzwmgg@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 18 Aug 2015 08:53:34 -0700
X-Google-Sender-Auth: ITaEiG1Oz36ctKbAgj5E7fwm3N4
Message-ID: <CABcZANmjXndEm+OF8aKvSgHwkiOMuFgHrrJy97CYLpDNtZxCmg@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: "openembedded-core@lists.openembedded.org"
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
X-List-Received-Date: Tue, 18 Aug 2015 15:53:57 -0000
Content-Type: multipart/alternative; boundary=089e010d9e9ed54bba051d97ecd8

--089e010d9e9ed54bba051d97ecd8
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 31, 2014 at 2:05 PM, Chris Larson <clarson@kergoth.com> wrote:

> On Friday, January 31, 2014, Nicolas Dechesne <nicolas.dechesne@linaro.org>
> wrote:
>
>> On Fri, Jan 31, 2014 at 8:01 PM, Iorga, Cristian
>> <cristian.iorga@intel.com> wrote:
>> > On my Ubuntu 13.10 dev machine, wireless-tools and iw are both
>> installed by
>> > default (I might be wrong here, maybe I installed them some time ago by
>> > hand).
>>
>> you are right, they are both on the default install, see
>>
>> http://releases.ubuntu.com/13.10/ubuntu-13.10-desktop-amd64.manifest
>
>
> For what its worth, I personally would love to see wireless-tools go away
> in favor of iw, much as ifconfig has gone to the wayside in favor of
> iputils.
>

Bringing this back up again, as I think we really need to at the *very*
least pull in iw from meta-oe into oe-core, and adjust packagegroup-base
(worst case, with a VIRTUAL-RUNTIME), and better yet also drop
wireless-tools / move it to meta-networking.

From the debian /usr/share/doc/iw/README.Debian:

    Why is wireless-tools being replaced?
    =====================================

    A complete summary of technical reasons for the abandonment of Linux
Wireless
    Extensions API is documented on the wireless.kernel.org wiki page for
WEXT [3].

    In brief, WEXT uses ioctl's as the kernel<->userspace communication
mechanism,
    but some developers wish to have a more structured transport mechanism,
which
    cfg80211 and nl80211 provide, to allow them to address old nagging
problems
    with the current wireless device configuration implementation, and give
them
    more freedom to enhance the process of wireless configuration [4].

    WEXT is in deep maintenance mode, cfg80211 and nl80211 are the
communication
    transport mechanism of the future.

    [3]
http://wireless.kernel.org/en/developers/Documentation/Wireless-Extensions
    [4] which is one of the areas which, in my opinion, has always been
difficult
        for new adopters on Linux, especially on the desktop.

Also:

    https://wireless.wiki.kernel.org/en/users/Documentation/iw indicates
"The old tool iwconfing, which uses Wireless Extensions interface, is
deprecated and it's strongly recommended to switch to iw and nl80211."
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e010d9e9ed54bba051d97ecd8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Jan 31, 2014 at 2:05 PM, Chris Larson <span dir=3D"ltr">&lt;<a href=
=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Frid=
ay, January 31, 2014, Nicolas Dechesne &lt;<a href=3D"mailto:nicolas.deches=
ne@linaro.org" target=3D"_blank">nicolas.dechesne@linaro.org</a>&gt; wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
On Fri, Jan 31, 2014 at 8:01 PM, Iorga, Cristian<br>
&lt;<a>cristian.iorga@intel.com</a>&gt; wrote:<br>
&gt; On my Ubuntu 13.10 dev machine, wireless-tools and iw are both install=
ed by<br>
&gt; default (I might be wrong here, maybe I installed them some time ago b=
y<br>
&gt; hand).<br>
<br>
you are right, they are both on the default install, see<br>
<br>
<a href=3D"http://releases.ubuntu.com/13.10/ubuntu-13.10-desktop-amd64.mani=
fest" target=3D"_blank">http://releases.ubuntu.com/13.10/ubuntu-13.10-deskt=
op-amd64.manifest</a></blockquote><div><br></div></span><div>For what its w=
orth, I personally would love to see wireless-tools go away in favor of iw,=
 much as ifconfig has gone to the wayside in favor of iputils.</div></block=
quote><div><br></div><div>Bringing this back up again, as I think we really=
 need to at the *very* least pull in iw from meta-oe into oe-core, and adju=
st packagegroup-base (worst case, with a VIRTUAL-RUNTIME), and better yet a=
lso drop wireless-tools / move it to meta-networking.</div><div>=C2=A0</div=
></div><div class=3D"gmail_extra">From the debian /usr/share/doc/iw/README.=
Debian:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">=C2=A0 =C2=A0 Why is wireless-tools being replaced?</div><div class=3D"gm=
ail_extra">=C2=A0 =C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=C2=A0 =C2=A0 A c=
omplete summary of technical reasons for the abandonment of Linux Wireless<=
/div><div class=3D"gmail_extra">=C2=A0 =C2=A0 Extensions API is documented =
on the <a href=3D"http://wireless.kernel.org">wireless.kernel.org</a> wiki =
page for WEXT [3].</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">=C2=A0 =C2=A0 In brief, WEXT uses ioctl&#39;s as the kernel&lt=
;-&gt;userspace communication mechanism,</div><div class=3D"gmail_extra">=
=C2=A0 =C2=A0 but some developers wish to have a more structured transport =
mechanism, which</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 cfg80211 and=
 nl80211 provide, to allow them to address old nagging problems</div><div c=
lass=3D"gmail_extra">=C2=A0 =C2=A0 with the current wireless device configu=
ration implementation, and give them</div><div class=3D"gmail_extra">=C2=A0=
 =C2=A0 more freedom to enhance the process of wireless configuration [4].<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=C2=A0=
 =C2=A0 WEXT is in deep maintenance mode, cfg80211 and nl80211 are the comm=
unication</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 transport mechanism=
 of the future.</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">=C2=A0 =C2=A0 [3] <a href=3D"http://wireless.kernel.org/en/develo=
pers/Documentation/Wireless-Extensions">http://wireless.kernel.org/en/devel=
opers/Documentation/Wireless-Extensions</a></div><div class=3D"gmail_extra"=
>=C2=A0 =C2=A0 [4] which is one of the areas which, in my opinion, has alwa=
ys been difficult</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 for new adopters on Linux, especially on the desktop.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Also:</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=C2=A0 =C2=A0 <a href=
=3D"https://wireless.wiki.kernel.org/en/users/Documentation/iw">https://wir=
eless.wiki.kernel.org/en/users/Documentation/iw</a> indicates &quot;The old=
 tool iwconfing, which uses Wireless Extensions interface, is deprecated an=
d it&#39;s strongly recommended to switch to iw and nl80211.&quot;</div></d=
iv><div class=3D"gmail_extra"><div class=3D"gmail_extra">--=C2=A0<br></div>=
<div class=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot=
 com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<b=
r>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--089e010d9e9ed54bba051d97ecd8--
