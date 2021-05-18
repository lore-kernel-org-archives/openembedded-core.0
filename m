Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web12.6172.1621330012292050208
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 May 2021 02:26:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FmgHyK4/;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id d13so4592823vso.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 May 2021 02:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5+G/sPHFG9lPH12RYCrnefYX6MA1TdZbeJfN57rJdWs=;
        b=FmgHyK4/qKt10hRpixPgtR/RBAMEXTduPFP7yjjKcHs/iPuqEG5bvlI/WYFFyFvbzh
         Hxe61i2mNX4fHIm3KatOqzZRQzJgau7JmcyxXqiWim/53aPD47xaHN1R3NDQKbZyx7/a
         PZ/n5IsRaQgGwrayVgwg7knGWchsnHHIu7k7V3po8ybvtnBXYXGdwAWTxGwZ/BMvyO8l
         4Wk02+ABIHhkLpV9wShKlZjkNmRNL7I5k2S/J2yVpvZPi/lVtO1FORL7vnEjvU3IAhPa
         /ZNl1pP78Kn2jILDV9gzCa/TVV82syCdKDThYv+N2C+w3TtPXCrdBK7bt/Fjnh06yR6v
         BbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5+G/sPHFG9lPH12RYCrnefYX6MA1TdZbeJfN57rJdWs=;
        b=ogwG/Mrj4XTppZ/ZBldUvexQO3Np4AZzPkCODVzYJWwlI6mcTZc7iXxijkTPGZXdsG
         AAg/AXJrxSBlY7kH1Ss4TZthH6dtzHfPjWMxl6cnNEwUZgb8GtI+DbK4C7iaYVRLdWzF
         ZMcCwrx0B5XQhQo8vrwskS2IMPvmGFoNqoFq/AnhoNucdxa370AxtpEjLRDVLCZ/X86i
         mzjKfhI/3wBPTMNMv2IJ+QZCjxPukgmKtNdHPdTCP/7fCDxkeKjbFihk50Nxpv9jQeTn
         e39vOny/oAaibXcptOxz2/WKIMu64nkRL4G4eU5sPnmtYPsIPJ46sauL658/sN79GO0K
         i5XA==
X-Gm-Message-State: AOAM531r5gVxUaowsN8Gga5ZcMf7kFVWMfLgiHM7KzHoHMEuGUsJ/UjT
	h3gwwzh5MS9c6dYFat79TjWPeu6y0OF41xGre3E=
X-Google-Smtp-Source: ABdhPJxIUl8F3f11ZUQxkx+N1mUpoa5j2HnJ9F/lFt1nfDy3TqM5r3yxDo+jHPqiqU9COPT17DBC2gySrFQ1FDaon+Y=
X-Received: by 2002:a67:f04a:: with SMTP id q10mr5216911vsm.41.1621330011485;
 Tue, 18 May 2021 02:26:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210517225101.1100864-1-wak@google.com>
In-Reply-To: <20210517225101.1100864-1-wak@google.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 18 May 2021 11:26:40 +0200
Message-ID: <CANNYZj_ByZv2buE+eEaGJZedSiyFcHtoqq6sSs3YKr_acMxkng@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] systemd: Fix static neighbor creation in networkd
To: William Kennington <wak@google.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000065f9f505c2974fec"

--00000000000065f9f505c2974fec
Content-Type: text/plain; charset="UTF-8"

At this point it might be better to update systemd itself to 248?

Alex

On Tue, 18 May 2021 at 00:51, William A. Kennington III via
lists.openembedded.org <wak=google.com@lists.openembedded.org> wrote:

> Backport a patch to fix the creation of static neighbors.
>
> Signed-off-by: William A. Kennington III <wak@google.com>
> ---
>  ...or-Always-add-neighbors-with-replace.patch | 50 +++++++++++++++++++
>  meta/recipes-core/systemd/systemd_247.6.bb    |  1 +
>  2 files changed, 51 insertions(+)
>  create mode 100644
> meta/recipes-core/systemd/systemd/0001-network-neighbor-Always-add-neighbors-with-replace.patch
>
> diff --git
> a/meta/recipes-core/systemd/systemd/0001-network-neighbor-Always-add-neighbors-with-replace.patch
> b/meta/recipes-core/systemd/systemd/0001-network-neighbor-Always-add-neighbors-with-replace.patch
> new file mode 100644
> index 0000000000..5593c3f479
> --- /dev/null
> +++
> b/meta/recipes-core/systemd/systemd/0001-network-neighbor-Always-add-neighbors-with-replace.patch
> @@ -0,0 +1,50 @@
> +From faa0f758bc2f194d63bbed6e7f91df176f594a06 Mon Sep 17 00:00:00 2001
> +From: "William A. Kennington III" <william@wkennington.com>
> +Date: Tue, 27 Apr 2021 01:25:58 -0700
> +Subject: [PATCH] network: neighbor: Always add neighbors with replace
> +
> +We were duplicating setting flags for the message and a combination of
> +NLM_F_APPEND and NLM_F_CREATE which does not make sense. We should have
> +been using NLM_F_REPLACE and NLM_F_CREATE since the kernel can
> +dynamically create neighbors prior to us adding an entry. Otherwise, we
> +can end up with cases where the message will time out after ~25s even
> +though the neighbor still gets added. This delays the rest of the setup
> +of the interface even though the error is ultimately ignored.
> +
> +Upstream-Status: Backport [
> https://github.com/systemd/systemd/commit/192a9d95ea3e058afd824d38a9cea16ad0a84a57
> ]
> +---
> + src/libsystemd/sd-netlink/rtnl-message.c | 2 +-
> + src/network/networkd-neighbor.c          | 4 ----
> + 2 files changed, 1 insertion(+), 5 deletions(-)
> +
> +diff --git a/src/libsystemd/sd-netlink/rtnl-message.c
> b/src/libsystemd/sd-netlink/rtnl-message.c
> +index 4cabbabba6..c9d0c9b1e7 100644
> +--- a/src/libsystemd/sd-netlink/rtnl-message.c
> ++++ b/src/libsystemd/sd-netlink/rtnl-message.c
> +@@ -445,7 +445,7 @@ int sd_rtnl_message_new_neigh(sd_netlink *rtnl,
> sd_netlink_message **ret, uint16
> +                 return r;
> +
> +         if (nlmsg_type == RTM_NEWNEIGH)
> +-                (*ret)->hdr->nlmsg_flags |= NLM_F_CREATE | NLM_F_APPEND;
> ++                (*ret)->hdr->nlmsg_flags |= NLM_F_CREATE | NLM_F_REPLACE;
> +
> +         ndm = NLMSG_DATA((*ret)->hdr);
> +
> +diff --git a/src/network/networkd-neighbor.c
> b/src/network/networkd-neighbor.c
> +index c805d52cf3..adce055009 100644
> +--- a/src/network/networkd-neighbor.c
> ++++ b/src/network/networkd-neighbor.c
> +@@ -259,10 +259,6 @@ static int neighbor_configure(Neighbor *neighbor,
> Link *link) {
> +         if (r < 0)
> +                 return log_link_error_errno(link, r, "Could not set
> state: %m");
> +
> +-        r = sd_netlink_message_set_flags(req, NLM_F_REQUEST | NLM_F_ACK
> | NLM_F_CREATE | NLM_F_REPLACE);
> +-        if (r < 0)
> +-                return log_link_error_errno(link, r, "Could not set
> flags: %m");
> +-
> +         r = sd_netlink_message_append_data(req, NDA_LLADDR,
> &neighbor->lladdr, neighbor->lladdr_size);
> +         if (r < 0)
> +                 return log_link_error_errno(link, r, "Could not append
> NDA_LLADDR attribute: %m");
> +--
> +2.31.1.498.g6c1eba8ee3d-goog
> +
> diff --git a/meta/recipes-core/systemd/systemd_247.6.bb
> b/meta/recipes-core/systemd/systemd_247.6.bb
> index ce6ac7ebaa..fb4acf2d37 100644
> --- a/meta/recipes-core/systemd/systemd_247.6.bb
> +++ b/meta/recipes-core/systemd/systemd_247.6.bb
> @@ -27,6 +27,7 @@ SRC_URI += "file://touchscreen.rules \
>
> file://0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch \
>
> file://0027-proc-dont-trigger-mount-error-with-invalid-options-o.patch \
>
> file://0001-analyze-resolve-executable-path-if-it-is-relative.patch \
> +
>  file://0001-network-neighbor-Always-add-neighbors-with-replace.patch \
>             "
>
>  # patches needed by musl
> --
> 2.31.1.751.gd2f1c929bd-goog
>
>
> 
>
>

--00000000000065f9f505c2974fec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>At this point it might be better to update systemd it=
self to 248?</div><div><br></div><div>Alex<br></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 18 May 2021 at =
00:51, William A. Kennington III via <a href=3D"http://lists.openembedded.o=
rg">lists.openembedded.org</a> &lt;wak=3D<a href=3D"mailto:google.com@lists=
.openembedded.org">google.com@lists.openembedded.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Backport a patch to fix=
 the creation of static neighbors.<br>
<br>
Signed-off-by: William A. Kennington III &lt;<a href=3D"mailto:wak@google.=
com" target=3D"_blank">wak@google.com</a>&gt;<br>
---<br>
=C2=A0...or-Always-add-neighbors-with-replace.patch | 50 +++++++++++++++++=
++<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_247.6.bb" rel=3D=
"noreferrer" target=3D"_blank">systemd_247.6.bb</a>=C2=A0 =C2=A0 |=C2=A0 1 =
+<br>
=C2=A02 files changed, 51 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/systemd/0001-network-ne=
ighbor-Always-add-neighbors-with-replace.patch<br>
<br>
diff --git a/meta/recipes-core/systemd/systemd/0001-network-neighbor-Alway=
s-add-neighbors-with-replace.patch b/meta/recipes-core/systemd/systemd/0001=
-network-neighbor-Always-add-neighbors-with-replace.patch<br>
new file mode 100644<br>
index 0000000000..5593c3f479<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/systemd/0001-network-neighbor-Always-add-n=
eighbors-with-replace.patch<br>
@@ -0,0 +1,50 @@<br>
+From faa0f758bc2f194d63bbed6e7f91df176f594a06 Mon Sep 17 00:00:00 2001<br=
>
+From: &quot;William A. Kennington III&quot; &lt;<a href=3D"mailto:william=
@wkennington.com" target=3D"_blank">william@wkennington.com</a>&gt;<br>
+Date: Tue, 27 Apr 2021 01:25:58 -0700<br>
+Subject: [PATCH] network: neighbor: Always add neighbors with replace<br>
+<br>
+We were duplicating setting flags for the message and a combination of<br=
>
+NLM_F_APPEND and NLM_F_CREATE which does not make sense. We should have<b=
r>
+been using NLM_F_REPLACE and NLM_F_CREATE since the kernel can<br>
+dynamically create neighbors prior to us adding an entry. Otherwise, we<b=
r>
+can end up with cases where the message will time out after ~25s even<br>
+though the neighbor still gets added. This delays the rest of the setup<b=
r>
+of the interface even though the error is ultimately ignored.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/systemd/systemd/=
commit/192a9d95ea3e058afd824d38a9cea16ad0a84a57" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/systemd/systemd/commit/192a9d95ea3e058afd82=
4d38a9cea16ad0a84a57</a>]<br>
+---<br>
+ src/libsystemd/sd-netlink/rtnl-message.c | 2 +-<br>
+ src/network/networkd-neighbor.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 --=
--<br>
+ 2 files changed, 1 insertion(+), 5 deletions(-)<br>
+<br>
+diff --git a/src/libsystemd/sd-netlink/rtnl-message.c b/src/libsystemd/sd=
-netlink/rtnl-message.c<br>
+index 4cabbabba6..c9d0c9b1e7 100644<br>
+--- a/src/libsystemd/sd-netlink/rtnl-message.c<br>
++++ b/src/libsystemd/sd-netlink/rtnl-message.c<br>
+@@ -445,7 +445,7 @@ int sd_rtnl_message_new_neigh(sd_netlink *rtnl, sd_ne=
tlink_message **ret, uint16<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return r;<b=
r>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (nlmsg_type =3D=3D RTM_NEWNEIGH)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (*ret)-&gt;hdr-&=
gt;nlmsg_flags |=3D NLM_F_CREATE | NLM_F_APPEND;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (*ret)-&gt;hdr-&=
gt;nlmsg_flags |=3D NLM_F_CREATE | NLM_F_REPLACE;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ndm =3D NLMSG_DATA((*ret)-&gt;hdr);<br>
+ <br>
+diff --git a/src/network/networkd-neighbor.c b/src/network/networkd-neigh=
bor.c<br>
+index c805d52cf3..adce055009 100644<br>
+--- a/src/network/networkd-neighbor.c<br>
++++ b/src/network/networkd-neighbor.c<br>
+@@ -259,10 +259,6 @@ static int neighbor_configure(Neighbor *neighbor, Li=
nk *link) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return log_=
link_error_errno(link, r, &quot;Could not set state: %m&quot;);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D sd_netlink_message_set_flags(req, NLM_=
F_REQUEST | NLM_F_ACK | NLM_F_CREATE | NLM_F_REPLACE);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_link_=
error_errno(link, r, &quot;Could not set flags: %m&quot;);<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D sd_netlink_message_append_data(re=
q, NDA_LLADDR, &amp;neighbor-&gt;lladdr, neighbor-&gt;lladdr_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return log_=
link_error_errno(link, r, &quot;Could not append NDA_LLADDR attribute: %m&q=
uot;);<br>
+-- <br>
+2.31.1.498.g6c1eba8ee3d-goog<br>
+<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_247.6.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd_247.6.bb</a> b/meta/recipes-c=
ore/systemd/<a href=3D"http://systemd_247.6.bb" rel=3D"noreferrer" target=
=3D"_blank">systemd_247.6.bb</a><br>
index ce6ac7ebaa..fb4acf2d37 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_247.6.bb" rel=3D=
"noreferrer" target=3D"_blank">systemd_247.6.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_247.6.bb" rel=3D=
"noreferrer" target=3D"_blank">systemd_247.6.bb</a><br>
@@ -27,6 +27,7 @@ SRC_URI +=3D &quot;file://touchscreen.rules \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-logind-Restore-chvt-=
as-non-root-user-without-polkit.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0027-proc-dont-trigger-mo=
unt-error-with-invalid-options-o.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-analyze-resolve-exec=
utable-path-if-it-is-relative.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-network-neighbor-Alw=
ays-add-neighbors-with-replace.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0# patches needed by musl<br>
-- <br>
2.31.1.751.gd2f1c929bd-goog<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000065f9f505c2974fec--
