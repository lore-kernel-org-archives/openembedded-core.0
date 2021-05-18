Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web11.6778.1621334386147339188
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 May 2021 03:39:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rjXhOG/k;
 spf=pass (domain: gmail.com, ip: 209.85.217.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id 66so4657336vsk.9
        for <openembedded-core@lists.openembedded.org>; Tue, 18 May 2021 03:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t3/ff+YWovqtFLCeoYCeMqaCEtGgoSrLobYD4X2/rTw=;
        b=rjXhOG/kpxY+EtU/GJkF3bsZ/n/o2+fIrVMjYpuCaxZwTmsAk8JrdMjUQSn7Gk/U5f
         w9muk03fcFg+p5XfmS0vveAG/1nrR6hfChBM5w7KuJsM5jgh4Rug631r4bO84cvybun3
         lEwQNNn5L2iCdjNyuUA6mu0ElgcXYKbYSOVxoBPFzD/hJd+d/M1KjY1Nl2r+WM2OCTVK
         nOxYbMsd7uqhyW2RP8lCGU//F4IL5sbDKMnRSPJVV2fN6zu+zb9zbwpFh9Cj8N+ui7lO
         y6eeRd6CZyM6xK/4sOXz2469U0nv+8qPZ8LNPRRSirHDtR1AQSnbGWk0BD2zAaa/Aoo0
         MReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t3/ff+YWovqtFLCeoYCeMqaCEtGgoSrLobYD4X2/rTw=;
        b=WheUcyabTTpA6FWrCRHviSG2YGOfmofn0OFm2+f3Shf/0j+5obbFforyhEVpI7AiVO
         aGP4zYBWuTpmOKsANU2I06uYgB+/aO917wfeZjBQ/tp6DwSEjePaxiSpm/WS8/OH840P
         3UjmDFudA9jzYfO7vzg49UvEHKzp/AjeQaGxXg3B2JWN+MhzmSTQmhsI7FQtlTq/qn+v
         BMebMScFnR9RvIatTjx2ImHGIphViVIwteMV1IxlY9RQOd62hbTIVWoEzhF0Qagn43Lm
         B5DNWQAsPV+c17rN7jMjQMw0L+vnyIkMUPyZb8ue8lZ058RxQPdrlywLXVdzYP7OYSRJ
         4x4g==
X-Gm-Message-State: AOAM530yPpAsHHXL6lpoxQTxSl/vrwjuoJc1Lm9whxzGqr1CEayGySMS
	XIFb/pABy8GqS6YbiTv4Bt0M6gN0rp7IVbuLjtI=
X-Google-Smtp-Source: ABdhPJx4edOAgo/yDDh1oXDEoTqnO/1uYAPwKSSWd+ncTkGi/7Se9uyuuNWSvqqkGXZ9Qr0naf8lZZskf9Sx8R/soIQ=
X-Received: by 2002:a67:1502:: with SMTP id 2mr5663719vsv.54.1621334385253;
 Tue, 18 May 2021 03:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210517225101.1100864-1-wak@google.com> <CANNYZj_ByZv2buE+eEaGJZedSiyFcHtoqq6sSs3YKr_acMxkng@mail.gmail.com>
 <CAPnigK=vSqu+NXskcqrEjWDNb5nvta3-4BZhNtXZSarHTQ=qiw@mail.gmail.com>
In-Reply-To: <CAPnigK=vSqu+NXskcqrEjWDNb5nvta3-4BZhNtXZSarHTQ=qiw@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 18 May 2021 12:39:34 +0200
Message-ID: <CANNYZj-JqRReP++wsuQZzj+76UOvdA_SDv5oNLxaOdKFiGYHig@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] systemd: Fix static neighbor creation in networkd
To: William Kennington <wak@google.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000018621705c29854a2"

--00000000000018621705c29854a2
Content-Type: text/plain; charset="UTF-8"

Yes it's non-trivial, but would be very appreciated. On the other hand,
backporting these fixes (which are not about security, and can be applied
in your private layer via bbappend) removes all incentive for you to work
on the upgrade and it becomes someone else's problem.

Alex


On Tue, 18 May 2021 at 12:18, William Kennington <wak@google.com> wrote:

> It would be nice, but it was non-trivial so I opted to go this path
> first. These patches can be dropped once v248.2 is brought in.
>
> On Tue, May 18, 2021 at 2:26 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > At this point it might be better to update systemd itself to 248?
> >
> > Alex
> >
> > On Tue, 18 May 2021 at 00:51, William A. Kennington III via
> lists.openembedded.org <wak=google.com@lists.openembedded.org> wrote:
> >>
> >> Backport a patch to fix the creation of static neighbors.
> >>
> >> Signed-off-by: William A. Kennington III <wak@google.com>
> >> ---
> >>  ...or-Always-add-neighbors-with-replace.patch | 50 +++++++++++++++++++
> >>  meta/recipes-core/systemd/systemd_247.6.bb    |  1 +
> >>  2 files changed, 51 insertions(+)
> >>  create mode 100644
> meta/recipes-core/systemd/systemd/0001-network-neighbor-Always-add-neighbors-with-replace.patch
> >>
> >> diff --git
> a/meta/recipes-core/systemd/systemd/0001-network-neighbor-Always-add-neighbors-with-replace.patch
> b/meta/recipes-core/systemd/systemd/0001-network-neighbor-Always-add-neighbors-with-replace.patch
> >> new file mode 100644
> >> index 0000000000..5593c3f479
> >> --- /dev/null
> >> +++
> b/meta/recipes-core/systemd/systemd/0001-network-neighbor-Always-add-neighbors-with-replace.patch
> >> @@ -0,0 +1,50 @@
> >> +From faa0f758bc2f194d63bbed6e7f91df176f594a06 Mon Sep 17 00:00:00 2001
> >> +From: "William A. Kennington III" <william@wkennington.com>
> >> +Date: Tue, 27 Apr 2021 01:25:58 -0700
> >> +Subject: [PATCH] network: neighbor: Always add neighbors with replace
> >> +
> >> +We were duplicating setting flags for the message and a combination of
> >> +NLM_F_APPEND and NLM_F_CREATE which does not make sense. We should have
> >> +been using NLM_F_REPLACE and NLM_F_CREATE since the kernel can
> >> +dynamically create neighbors prior to us adding an entry. Otherwise, we
> >> +can end up with cases where the message will time out after ~25s even
> >> +though the neighbor still gets added. This delays the rest of the setup
> >> +of the interface even though the error is ultimately ignored.
> >> +
> >> +Upstream-Status: Backport [
> https://github.com/systemd/systemd/commit/192a9d95ea3e058afd824d38a9cea16ad0a84a57
> ]
> >> +---
> >> + src/libsystemd/sd-netlink/rtnl-message.c | 2 +-
> >> + src/network/networkd-neighbor.c          | 4 ----
> >> + 2 files changed, 1 insertion(+), 5 deletions(-)
> >> +
> >> +diff --git a/src/libsystemd/sd-netlink/rtnl-message.c
> b/src/libsystemd/sd-netlink/rtnl-message.c
> >> +index 4cabbabba6..c9d0c9b1e7 100644
> >> +--- a/src/libsystemd/sd-netlink/rtnl-message.c
> >> ++++ b/src/libsystemd/sd-netlink/rtnl-message.c
> >> +@@ -445,7 +445,7 @@ int sd_rtnl_message_new_neigh(sd_netlink *rtnl,
> sd_netlink_message **ret, uint16
> >> +                 return r;
> >> +
> >> +         if (nlmsg_type == RTM_NEWNEIGH)
> >> +-                (*ret)->hdr->nlmsg_flags |= NLM_F_CREATE |
> NLM_F_APPEND;
> >> ++                (*ret)->hdr->nlmsg_flags |= NLM_F_CREATE |
> NLM_F_REPLACE;
> >> +
> >> +         ndm = NLMSG_DATA((*ret)->hdr);
> >> +
> >> +diff --git a/src/network/networkd-neighbor.c
> b/src/network/networkd-neighbor.c
> >> +index c805d52cf3..adce055009 100644
> >> +--- a/src/network/networkd-neighbor.c
> >> ++++ b/src/network/networkd-neighbor.c
> >> +@@ -259,10 +259,6 @@ static int neighbor_configure(Neighbor *neighbor,
> Link *link) {
> >> +         if (r < 0)
> >> +                 return log_link_error_errno(link, r, "Could not set
> state: %m");
> >> +
> >> +-        r = sd_netlink_message_set_flags(req, NLM_F_REQUEST |
> NLM_F_ACK | NLM_F_CREATE | NLM_F_REPLACE);
> >> +-        if (r < 0)
> >> +-                return log_link_error_errno(link, r, "Could not set
> flags: %m");
> >> +-
> >> +         r = sd_netlink_message_append_data(req, NDA_LLADDR,
> &neighbor->lladdr, neighbor->lladdr_size);
> >> +         if (r < 0)
> >> +                 return log_link_error_errno(link, r, "Could not
> append NDA_LLADDR attribute: %m");
> >> +--
> >> +2.31.1.498.g6c1eba8ee3d-goog
> >> +
> >> diff --git a/meta/recipes-core/systemd/systemd_247.6.bb
> b/meta/recipes-core/systemd/systemd_247.6.bb
> >> index ce6ac7ebaa..fb4acf2d37 100644
> >> --- a/meta/recipes-core/systemd/systemd_247.6.bb
> >> +++ b/meta/recipes-core/systemd/systemd_247.6.bb
> >> @@ -27,6 +27,7 @@ SRC_URI += "file://touchscreen.rules \
> >>
>  file://0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch \
> >>
>  file://0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch \
> >>
>  file://0001-analyze-resolve-executable-path-if-it-is-relative.patch \
> >> +
>  file://0001-network-neighbor-Always-add-neighbors-with-replace.patch \
> >>             "
> >>
> >>  # patches needed by musl
> >> --
> >> 2.31.1.751.gd2f1c929bd-goog
> >>
> >>
> >> 
> >>
>

--00000000000018621705c29854a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes it&#39;s non-trivial, but would be very appreciat=
ed. On the other hand, backporting these fixes (which are not about securit=
y, and can be applied in your private layer via bbappend) removes all incen=
tive for you to work on the upgrade and it becomes someone else&#39;s probl=
em.</div><div><br></div><div>Alex<br></div><br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 18 May 2021 at 12:18=
, William Kennington &lt;<a href=3D"mailto:wak@google.com">wak@google.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">It=
 would be nice, but it was non-trivial so I opted to go this path<br>
first. These patches can be dropped once v248.2 is brought in.<br>
<br>
On Tue, May 18, 2021 at 2:26 AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; At this point it might be better to update systemd itself to 248?<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Tue, 18 May 2021 at 00:51, William A. Kennington III via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">li=
sts.openembedded.org</a> &lt;wak=3D<a href=3D"mailto:google.com@lists.opene=
mbedded.org" target=3D"_blank">google.com@lists.openembedded.org</a>&gt; wr=
ote:<br>
&gt;&gt;<br>
&gt;&gt; Backport a patch to fix the creation of static neighbors.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: William A. Kennington III &lt;<a href=3D"mailto:wa=
k@google.com" target=3D"_blank">wak@google.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 ...or-Always-add-neighbors-with-replace.patch | 50 ++++++++=
+++++++++++<br>
&gt;&gt;=C2=A0 meta/recipes-core/systemd/<a href=3D"http://systemd_247.6.b=
b" rel=3D"noreferrer" target=3D"_blank">systemd_247.6.bb</a>=C2=A0 =C2=A0 |=
=
=C2=A0 1 +<br>
&gt;&gt;=C2=A0 2 files changed, 51 insertions(+)<br>
&gt;&gt;=C2=A0 create mode 100644 meta/recipes-core/systemd/systemd/0001-n=
etwork-neighbor-Always-add-neighbors-with-replace.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-core/systemd/systemd/0001-network-neigh=
bor-Always-add-neighbors-with-replace.patch b/meta/recipes-core/systemd/sys=
temd/0001-network-neighbor-Always-add-neighbors-with-replace.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..5593c3f479<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-core/systemd/systemd/0001-network-neighbor-Alw=
ays-add-neighbors-with-replace.patch<br>
&gt;&gt; @@ -0,0 +1,50 @@<br>
&gt;&gt; +From faa0f758bc2f194d63bbed6e7f91df176f594a06 Mon Sep 17 00:00:0=
0 2001<br>
&gt;&gt; +From: &quot;William A. Kennington III&quot; &lt;<a href=3D"mailt=
o:william@wkennington.com" target=3D"_blank">william@wkennington.com</a>&gt=
;<br>
&gt;&gt; +Date: Tue, 27 Apr 2021 01:25:58 -0700<br>
&gt;&gt; +Subject: [PATCH] network: neighbor: Always add neighbors with re=
place<br>
&gt;&gt; +<br>
&gt;&gt; +We were duplicating setting flags for the message and a combinat=
ion of<br>
&gt;&gt; +NLM_F_APPEND and NLM_F_CREATE which does not make sense. We shou=
ld have<br>
&gt;&gt; +been using NLM_F_REPLACE and NLM_F_CREATE since the kernel can<b=
r>
&gt;&gt; +dynamically create neighbors prior to us adding an entry. Otherw=
ise, we<br>
&gt;&gt; +can end up with cases where the message will time out after ~25s=
 even<br>
&gt;&gt; +though the neighbor still gets added. This delays the rest of th=
e setup<br>
&gt;&gt; +of the interface even though the error is ultimately ignored.<br=
>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/systemd=
/systemd/commit/192a9d95ea3e058afd824d38a9cea16ad0a84a57" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/systemd/systemd/commit/192a9d95ea3e0=
58afd824d38a9cea16ad0a84a57</a>]<br>
&gt;&gt; +---<br>
&gt;&gt; + src/libsystemd/sd-netlink/rtnl-message.c | 2 +-<br>
&gt;&gt; + src/network/networkd-neighbor.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 4 ----<br>
&gt;&gt; + 2 files changed, 1 insertion(+), 5 deletions(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/src/libsystemd/sd-netlink/rtnl-message.c b/src/libs=
ystemd/sd-netlink/rtnl-message.c<br>
&gt;&gt; +index 4cabbabba6..c9d0c9b1e7 100644<br>
&gt;&gt; +--- a/src/libsystemd/sd-netlink/rtnl-message.c<br>
&gt;&gt; ++++ b/src/libsystemd/sd-netlink/rtnl-message.c<br>
&gt;&gt; +@@ -445,7 +445,7 @@ int sd_rtnl_message_new_neigh(sd_netlink *rt=
nl, sd_netlink_message **ret, uint16<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
turn r;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (nlmsg_type =3D=3D RTM_NEWN=
EIGH)<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (*ret)-=
&gt;hdr-&gt;nlmsg_flags |=3D NLM_F_CREATE | NLM_F_APPEND;<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (*ret)-=
&gt;hdr-&gt;nlmsg_flags |=3D NLM_F_CREATE | NLM_F_REPLACE;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ndm =3D NLMSG_DATA((*ret)-&gt;=
hdr);<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/src/network/networkd-neighbor.c b/src/network/netwo=
rkd-neighbor.c<br>
&gt;&gt; +index c805d52cf3..adce055009 100644<br>
&gt;&gt; +--- a/src/network/networkd-neighbor.c<br>
&gt;&gt; ++++ b/src/network/networkd-neighbor.c<br>
&gt;&gt; +@@ -259,10 +259,6 @@ static int neighbor_configure(Neighbor *nei=
ghbor, Link *link) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
turn log_link_error_errno(link, r, &quot;Could not set state: %m&quot;);<br=
>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D sd_netlink_message_set_flags(=
req, NLM_F_REQUEST | NLM_F_ACK | NLM_F_CREATE | NLM_F_REPLACE);<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0)<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
log_link_error_errno(link, r, &quot;Could not set flags: %m&quot;);<br>
&gt;&gt; +-<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D sd_netlink_message_appen=
d_data(req, NDA_LLADDR, &amp;neighbor-&gt;lladdr, neighbor-&gt;lladdr_size)=
;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
turn log_link_error_errno(link, r, &quot;Could not append NDA_LLADDR attrib=
ute: %m&quot;);<br>
&gt;&gt; +--<br>
&gt;&gt; +2.31.1.498.g6c1eba8ee3d-goog<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_=
247.6.bb" rel=3D"noreferrer" target=3D"_blank">systemd_247.6.bb</a> b/meta/=
recipes-core/systemd/<a href=3D"http://systemd_247.6.bb" rel=3D"noreferrer"=
 target=3D"_blank">systemd_247.6.bb</a><br>
&gt;&gt; index ce6ac7ebaa..fb4acf2d37 100644<br>
&gt;&gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd_247.6.b=
b" rel=3D"noreferrer" target=3D"_blank">systemd_247.6.bb</a><br>
&gt;&gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_247.6.b=
b" rel=3D"noreferrer" target=3D"_blank">systemd_247.6.bb</a><br>
&gt;&gt; @@ -27,6 +27,7 @@ SRC_URI +=3D &quot;file://touchscreen.rules \<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-logind=
-Restore-chvt-as-non-root-user-without-polkit.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0027-proc-d=
ont-trigger-mount-error-with-invalid-options-o.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-analyz=
e-resolve-executable-path-if-it-is-relative.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-network-nei=
ghbor-Always-add-neighbors-with-replace.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 # patches needed by musl<br>
&gt;&gt; --<br>
&gt;&gt; 2.31.1.751.gd2f1c929bd-goog<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
</blockquote></div>

--00000000000018621705c29854a2--
