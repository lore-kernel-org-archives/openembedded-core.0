Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5AC5EA4FBD
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 13:20:35 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34874.1771852833243267359
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 05:20:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=G6lKW2yI;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso37275385e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 05:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771852832; x=1772457632; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SPi9XIuJ1I62bupWRlAhPTvcBWusfddXhBZtd83mqs=;
        b=G6lKW2yIJFnmjd2LFWKc0qVitGLLMBnLeEK71AvyNOXsexKWiqRUl8l5rHxaZhzxbA
         puAF4pCUursCfBHosVYLyInvCz4ihhDzxkda2wpO50fgIEUF6wkkvjcXiJju3JgN9ZRW
         1Jih4Pv68JtQDDBOkRGiyKa44MDQa7ltC37pQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771852832; x=1772457632;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2SPi9XIuJ1I62bupWRlAhPTvcBWusfddXhBZtd83mqs=;
        b=IRGPiMoxMwa1RvG2rjGVSDJ0Y8JpxP7digfSmLOfPQdMqlIFM8iqm+xO+3HgDcutPL
         R5FLVFB8L1SOOeuCQTn2waFDCN+PN3WP4Mf2ZtY5xqllXEKU0GdCVeM9xQ+obXnH95Ak
         w2tBByrOqoia5AP3+DGcOnmhqPm2QQpqj9cDWYHd6+vc3+ZF52yHy7JSfYS6/3rHn0RV
         AY83KVqSK5JmdUlQEwN4HdK92GiMsi7AU4qV7qKt5KEx6+CVRKtp8459qXDmyRsmKmFE
         GDG27v01qZLTaSkmAP/6UEolQao655NvG9IRPD2HbdqVB64woZ/I5ocj+MsJBP+SuLia
         224Q==
X-Forwarded-Encrypted: i=1; AJvYcCVXquBg8BSrrXAcEw+TnzfIQLgfaOTjmi9AKkW+5q7DeMQSv/IYYQCrDvG0IR6zRio6kvyBiQxgeERZgLfQqwvmAw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzkbngCgxqzAA9Qg5/2BCjq31IRe/DZEpDdjQJTUaQLEL2VcHof
	tu2jYQnq8bhBIV6MhPfMulf8zVZHHJ2Fr2VaHPLkSPBTISsnwlGMTQkk4ro/eQ8G848=
X-Gm-Gg: AZuq6aIAIllE3TlVqIzb53UXeU4yG+X4A9/rO6peGEnRMeMqPGofyCSb3XcCFCTy4JR
	HD9X4eNlId1QptY77DuYbk1Rg3uy1CgwhdmIWh+Y1Qof7vTRnsvA1gCWI/8EIyOebrHyh/UhTnJ
	LipfFqEcel9F/s7OzVFBK04DnVTyO+CY+Q/r49mVYJlKpVSjEkDrIxk/vbCQL9/E1d5LI2nQyiR
	0qo9w2lYe6sRbZT2Oiv9p0oJAd5sWdNnO+AKy7sQz3MnQqmjAX1hMP+6oDUUl8Saj5TrB6b74pc
	D2YoAPCE8xNOmaIRnKfdVM5BDD5rfef4hecRpDYqRS63t1qsA8zF5IWFz0RnBhv3v7MTthpRlOE
	E/K4s7P0d79p7uU9RRPcfpykJXgyKjb6N5QcLJNimhJhEDpEGaKovmhpl6s14e9nmp0xyfSkRXK
	StqZFBqySChBr7Np7MrXYvkqfhixnounVuMVbE0nxIhdqAotchQ3ukQaxgU0UfoAR0CME1Yq7nA
	ebTNztDlw42fdNs
X-Received: by 2002:a05:600c:8b88:b0:479:35e7:a0e3 with SMTP id 5b1f17b1804b1-483a963d64bmr119941535e9.30.1771852831480;
        Mon, 23 Feb 2026 05:20:31 -0800 (PST)
Received: from localhost (2a01cb001331aa00f13df544104db802.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:f13d:f544:104d:b802])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3ff27sm20848344f8f.22.2026.02.23.05.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 05:20:30 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 14:20:30 +0100
Message-Id: <DGMDEP9PTC0Z.PSJ7FSZGEZ3D@smile.fr>
Subject: Re: [OE-core] [kirkstone][PATCH] grub: fix CVE-2025-54770
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260128050900.112191-1-hprajapati@mvista.com>
In-Reply-To: <20260128050900.112191-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 13:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231669

On Wed Jan 28, 2026 at 6:09 AM CET, Hitendra Prajapati via lists.openembedd=
ed.org wrote:
> Upstream-Status: Backport from https://gitweb.git.savannah.gnu.org/gitweb=
/?p=3Dgrub.git;a=3Dcommit;h=3D954c48b9c833d64b74ced1f27701af2ea5c6f55a && h=
ttps://gitweb.git.savannah.gnu.org/gitweb/?p=3Dgrub.git;a=3Dpatch;h=3D10e58=
a14db20e17d1b6a39abe38df01fef98e29d

Thanks for the patch. But the commit message needs improvement: Please
add a justification as to why you think this particular patch fixes this
CVE: Cited in the NVD report? upstream? another source?

Also, this "Upstream-Status:" line is only useful in patches, you can
remove it from the commit message.

> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../grub/files/CVE-2025-54770-01.patch        | 138 ++++++++++++++++++
>  .../grub/files/CVE-2025-54770-02.patch        |  39 +++++
>  meta/recipes-bsp/grub/grub2.inc               |   2 +
>  3 files changed, 179 insertions(+)
>  create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-54770-01.patch
>  create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-54770-02.patch
>
> diff --git a/meta/recipes-bsp/grub/files/CVE-2025-54770-01.patch b/meta/r=
ecipes-bsp/grub/files/CVE-2025-54770-01.patch
> new file mode 100644
> index 0000000000..ea749fc8f6
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/CVE-2025-54770-01.patch
> @@ -0,0 +1,138 @@
> +From 954c48b9c833d64b74ced1f27701af2ea5c6f55a Mon Sep 17 00:00:00 2001
> +From: Chad Kimes <chkimes@github.com>
> +Date: Mon, 21 Mar 2022 17:29:16 -0400
> +Subject: [PATCH] net/net: Add net_set_vlan command
> +
> +Previously there was no way to set the 802.1Q VLAN identifier, despite
> +support for vlantag in the net module. The only location vlantag was
> +being populated was from PXE boot and only for Open Firmware hardware.
> +This commit allows users to manually configure VLAN information for any
> +interface.
> +
> +Example usage:
> +  grub> net_ls_addr
> +  efinet1 00:11:22:33:44:55 192.0.2.100
> +  grub> net_set_vlan efinet1 100
> +  grub> net_ls_addr
> +  efinet1 00:11:22:33:44:55 192.0.2.100 vlan100
> +  grub> net_set_vlan efinet1 0
> +  efinet1 00:11:22:33:44:55 192.0.2.100
> +
> +Signed-off-by: Chad Kimes <chkimes@github.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +CVE: CVE-2025-54770
> +Upstream-Status: Backport [https://gitweb.git.savannah.gnu.org/gitweb/?p=
=3Dgrub.git;a=3Dcommit;h=3D954c48b9c833d64b74ced1f27701af2ea5c6f55a]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + docs/grub.texi      | 20 ++++++++++++++++++++
> + grub-core/net/net.c | 41 ++++++++++++++++++++++++++++++++++++++++-
> + 2 files changed, 60 insertions(+), 1 deletion(-)
> +
> +diff --git a/docs/grub.texi b/docs/grub.texi
> +index f8b4b3b..f7fc6d7 100644
> +--- a/docs/grub.texi
> ++++ b/docs/grub.texi
> +@@ -5493,6 +5493,7 @@ This command is only available on AArch64 systems.
> + * net_ls_dns::                  List DNS servers
> + * net_ls_routes::               List routing entries
> + * net_nslookup::                Perform a DNS lookup
> ++* net_set_vlan::                Set vlan id on an interface
> + @end menu
> +=20
> +=20
> +@@ -5669,6 +5670,25 @@ is given, use default list of servers.
> + @end deffn
> +=20
> +=20
> ++@node net_set_vlan
> ++@subsection net_set_vlan
> ++
> ++@deffn Command net_set_vlan @var{interface} @var{vlanid}
> ++Set the 802.1Q VLAN identifier on @var{interface} to @var{vlanid}. For =
example,
> ++to set the VLAN identifier on interface @samp{efinet1} to @samp{100}:
> ++
> ++@example
> ++net_set_vlan efinet1 100
> ++@end example
> ++
> ++The VLAN identifier can be removed by setting it to @samp{0}:
> ++
> ++@example
> ++net_set_vlan efinet1 0
> ++@end example
> ++@end deffn
> ++
> ++
> + @node Internationalisation
> + @chapter Internationalisation
> +=20
> +diff --git a/grub-core/net/net.c b/grub-core/net/net.c
> +index ec7f01c..03ede6d 100644
> +--- a/grub-core/net/net.c
> ++++ b/grub-core/net/net.c
> +@@ -1162,6 +1162,42 @@ grub_cmd_addroute (struct grub_command *cmd __att=
ribute__ ((unused)),
> +     }
> + }
> +=20
> ++static grub_err_t
> ++grub_cmd_setvlan (struct grub_command *cmd __attribute__ ((unused)),
> ++		  int argc, char **args)
> ++{
> ++  const char *vlan_string, *vlan_string_end;
> ++  unsigned long vlantag;
> ++  struct grub_net_network_level_interface *inter;
> ++
> ++  if (argc !=3D 2)
> ++    return grub_error (GRUB_ERR_BAD_ARGUMENT, N_("two arguments expecte=
d"));
> ++
> ++  vlan_string =3D args[1];
> ++  vlantag =3D grub_strtoul (vlan_string, &vlan_string_end, 10);
> ++
> ++  if (*vlan_string =3D=3D '\0' || *vlan_string_end !=3D '\0')
> ++    return grub_error (GRUB_ERR_BAD_NUMBER,
> ++		       N_("non-numeric or invalid number `%s'"), vlan_string);
> ++
> ++  if (vlantag > 4094)
> ++    return grub_error (GRUB_ERR_OUT_OF_RANGE,
> ++		       N_("vlan id `%s' not in the valid range of 0-4094"),
> ++		       vlan_string);
> ++
> ++  FOR_NET_NETWORK_LEVEL_INTERFACES (inter)
> ++    {
> ++      if (grub_strcmp (inter->name, args[0]) !=3D 0)
> ++	continue;
> ++
> ++      inter->vlantag =3D vlantag;
> ++      return GRUB_ERR_NONE;
> ++    }
> ++
> ++  return grub_error (GRUB_ERR_BAD_ARGUMENT,
> ++                     N_("network interface not found"));
> ++}
> ++
> + static void
> + print_net_address (const grub_net_network_level_netaddress_t *target)
> + {
> +@@ -1876,7 +1912,7 @@ grub_net_search_config_file (char *config, grub_si=
ze_t config_buf_len)
> + static struct grub_preboot *fini_hnd;
> +=20
> + static grub_command_t cmd_addaddr, cmd_deladdr, cmd_addroute, cmd_delro=
ute;
> +-static grub_command_t cmd_lsroutes, cmd_lscards;
> ++static grub_command_t cmd_setvlan, cmd_lsroutes, cmd_lscards;
> + static grub_command_t cmd_lsaddr, cmd_slaac;
> +=20
> + GRUB_MOD_INIT(net)
> +@@ -1914,6 +1950,9 @@ GRUB_MOD_INIT(net)
> +   cmd_delroute =3D grub_register_command ("net_del_route", grub_cmd_del=
route,
> + 					N_("SHORTNAME"),
> + 					N_("Delete a network route."));
> ++  cmd_setvlan =3D grub_register_command ("net_set_vlan", grub_cmd_setvl=
an,
> ++				       N_("SHORTNAME VLANID"),
> ++				       N_("Set an interface's vlan id."));
> +   cmd_lsroutes =3D grub_register_command ("net_ls_routes", grub_cmd_lis=
troutes,
> + 					"", N_("list network routes"));
> +   cmd_lscards =3D grub_register_command ("net_ls_cards", grub_cmd_listc=
ards,
> +--=20
> +2.50.1
> +
> diff --git a/meta/recipes-bsp/grub/files/CVE-2025-54770-02.patch b/meta/r=
ecipes-bsp/grub/files/CVE-2025-54770-02.patch
> new file mode 100644
> index 0000000000..bc56997726
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/CVE-2025-54770-02.patch
> @@ -0,0 +1,39 @@
> +From 10e58a14db20e17d1b6a39abe38df01fef98e29d Mon Sep 17 00:00:00 2001
> +From: Thomas Frauendorfer | Miray Software <tf@miray.de>
> +Date: Fri, 9 May 2025 14:20:47 +0200
> +Subject: [PATCH] net/net: Unregister net_set_vlan command on unload
> +
> +The commit 954c48b9c (net/net: Add net_set_vlan command) added command
> +net_set_vlan to the net module. Unfortunately the commit only added the
> +grub_register_command() call on module load but missed the
> +grub_unregister_command() on unload. Let's fix this.
> +
> +Fixes: CVE-2025-54770
> +Fixes: 954c48b9c (net/net: Add net_set_vlan command)
> +
> +Reported-by: Thomas Frauendorfer | Miray Software <tf@miray.de>
> +Signed-off-by: Thomas Frauendorfer | Miray Software <tf@miray.de>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +
> +CVE: CVE-2025-54770
> +Upstream-Status: Backport [https://gitweb.git.savannah.gnu.org/gitweb/?p=
=3Dgrub.git;a=3Dpatch;h=3D10e58a14db20e17d1b6a39abe38df01fef98e29d]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + grub-core/net/net.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/grub-core/net/net.c b/grub-core/net/net.c
> +index 03ede6d..e66d192 100644
> +--- a/grub-core/net/net.c
> ++++ b/grub-core/net/net.c
> +@@ -1980,6 +1980,7 @@ GRUB_MOD_FINI(net)
> +   grub_unregister_command (cmd_deladdr);
> +   grub_unregister_command (cmd_addroute);
> +   grub_unregister_command (cmd_delroute);
> ++  grub_unregister_command (cmd_setvlan);
> +   grub_unregister_command (cmd_lsroutes);
> +   grub_unregister_command (cmd_lscards);
> +   grub_unregister_command (cmd_lsaddr);
> +--=20
> +2.50.1
> +
> diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub=
2.inc
> index 4744e26693..b21afe34f7 100644
> --- a/meta/recipes-bsp/grub/grub2.inc
> +++ b/meta/recipes-bsp/grub/grub2.inc
> @@ -63,6 +63,8 @@ SRC_URI =3D "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
>             file://CVE-2025-61661.patch \
>             file://CVE-2025-61662.patch \
>             file://CVE-2025-61663_61664.patch \
> +           file://CVE-2025-54770-01.patch \
> +           file://CVE-2025-54770-02.patch \
>  "
> =20
>  SRC_URI[sha256sum] =3D "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f=
62aa3f53ae803f5f"


--=20
Yoann Congal
Smile ECS


