Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web08.116.1617213704018036071
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 11:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=hsIvggGa;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.49, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f49.google.com with SMTP id y124-20020a1c32820000b029010c93864955so1563877wmy.5
        for <Openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 11:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Zmpcqr2HRWKv1quTaVPh6z49apJdFRK+aYmrvkxVlOg=;
        b=hsIvggGad2o73GUT/Xog+hoxBoUrYbS5uztgQ16KAyywpLv4oGYXhKYVgjDU7hdPWY
         fW/49iG3pgAbYmdL5KLXAB2E2be063jDRoMUc7linDw9YW45/hYLAwNOlXISLUt9Roqw
         Jc0fcbt7GGMpzT2x5kxg4Jfzqu5ws2LL41JVB7oiiJK9F45dlFy1qRdNsr3QeyjddkyI
         R+e3xXaiOXJ+scsA7U21HRZ6EhtElV8ptOs+ySwN1vbxBUorSVdGo2QqJtwfjuIW3raf
         XXpW8olKFYfI0uvChbHiyayYVa25gFImmMCOOCveCQXSzyYLitp2WqDjvdUNWmsbD/Sb
         Tn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Zmpcqr2HRWKv1quTaVPh6z49apJdFRK+aYmrvkxVlOg=;
        b=NMzRaYznJQuk0J3MeOEFOIJ5TaDUsiOc4WkMDQYw/HpwyKtTqb/wGUCOTwU48QvcWv
         IUESnSFdpnURxSwM5Z7eOgw5BJIzqXKJSskcGclKgHK8Bzh3HZymM/dhc+oVmrRP/oI2
         hi48T4Ck3xiy+oakOkDsANs4lRmDSCczmLvSLNMT8MCYQ9P+Wng0X8qPv48Tvhce15BS
         8FDcEitu5XFHL7k/BZ762KmNv7iaAS9qsHtyNcfwMbd9tySEb8EiDu7PG3CIVn9GPLnl
         MHGLUHKAU2ftK3i9xk9Pic1oLrD1RRDSUPs3UKGqY2n5C8IpclEb3KFN/iZQ0noxm+vT
         ATCg==
X-Gm-Message-State: AOAM530tovSFUql0MSCmBY16sFjsafNyvnUHR18aGdIAAw/pQJ8LnjdY
	7R5fz5Jkr1fZPveGoR3zjRVQMNbLxlVlEByH2X6GpA==
X-Google-Smtp-Source: ABdhPJzDMFfyexMHiw92skxA7B9K1dbn2fYDZ4rKbCjftWqzV+8H4Fln28Y1qUUy7bfE+JySMIWWhe1MvsYI/Uw1JXY=
X-Received: by 2002:a1c:7ec4:: with SMTP id z187mr4271485wmc.3.1617213702455;
 Wed, 31 Mar 2021 11:01:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210331172104.11877-1-Sana.Kazi@kpit.com>
In-Reply-To: <20210331172104.11877-1-Sana.Kazi@kpit.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 31 Mar 2021 08:01:30 -1000
Message-ID: <CAOSpxdZ=o+iNofgOJez9J0k1_fT3kHBaCTpoWCrJ_2sHnrpy3g@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCHv2] openssh: fix CVE-2020-14145
To: Sana Kazi <Sana.Kazi@kpit.com>
Cc: Patches and discussions about the oe-core layer <Openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Nisha Parrakat <nisha.parrakat@kpit.com>, Purushottam.Choudhary@kpit.com, 
	Harpritkaur.Bhandari@kpit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

V2 also fails to build:

ERROR: openssh-8.2p1-r0 do_patch: Command Error: 'quilt --quiltrc
/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/openssh=
/8.2p1-r0/recipe-sysroot-native/etc/quiltrc
push' exited with 0  Output:
Applying patch CVE-2020-14145.patch
patching file sshconnect2.c
Hunk #1 FAILED at 102.
Hunk #2 FAILED at 119.
Hunk #3 FAILED at 159.
3 out of 3 hunks FAILED -- rejects in file sshconnect2.c
Patch CVE-2020-14145.patch does not apply (enforce with -f)

Before submitting please verify that your patches both apply to the
head of the dunfell branch, and build as well!

Steve


On Wed, Mar 31, 2021 at 7:21 AM Sana Kazi <Sana.Kazi@kpit.com> wrote:
>
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> (From OE-Core rev: 38482edf1a31ed0735b746cf0ab3e1adda4199d1)
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> ---
>  .../openssh/openssh/CVE-2020-14145.patch      | 90 +++++++++++++++++++
>  .../openssh/openssh_8.2p1.bb                  |  1 +
>  2 files changed, 91 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2020-1=
4145.patch
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.pa=
tch b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch
> new file mode 100644
> index 0000000000..0046ee1a51
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch
> @@ -0,0 +1,90 @@
> +From b3855ff053f5078ec3d3c653cdaedefaa5fc362d Mon Sep 17 00:00:00 2001
> +From: "djm@openbsd.org" <djm@openbsd.org>
> +Date: Fri, 18 Sep 2020 05:23:03 +0000
> +Subject: [PATCH] upstream: tweak the client hostkey preference ordering
> + algorithm to
> +
> +prefer the default ordering if the user has a key that matches the
> +best-preference default algorithm.
> +
> +feedback and ok markus@
> +
> +OpenBSD-Commit-ID: a92dd7d7520ddd95c0a16786a7519e6d0167d35f
> +
> +Upstream-Status: Backport
> +[https://github.com/openssh/openssh-portable/commit/b3855ff053f5078ec3d=
3c653cdaedefaa5fc362d]
> +CVE: CVE-2020-14145
> +Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> +
> +---
> + sshconnect2.c | 41 ++++++++++++++++++++++++++++++++++++++---
> + 1 file changed, 37 insertions(+), 2 deletions(-)
> +
> +diff --git a/sshconnect2.c b/sshconnect2.c
> +index 347e348c60..f64aae66af 100644
> +--- a/sshconnect2.c
> ++++ b/sshconnect2.c
> +@@ -102,12 +102,25 @@ verify_host_key_callback(struct sshkey *hostkey, =
struct ssh *ssh)
> +       return 0;
> + }
> +
> ++/* Returns the first item from a comma-separated algorithm list */
> ++static char *
> ++first_alg(const char *algs)
> ++{
> ++      char *ret, *cp;
> ++
> ++      ret =3D xstrdup(algs);
> ++      if ((cp =3D strchr(ret, ',')) !=3D NULL)
> ++              *cp =3D '\0';
> ++      return ret;
> ++}
> ++
> + static char *
> + order_hostkeyalgs(char *host, struct sockaddr *hostaddr, u_short port)
> + {
> +-      char *oavail, *avail, *first, *last, *alg, *hostname, *ret;
> ++      char *oavail =3D NULL, *avail =3D NULL, *first =3D NULL, *last =
=3D NULL;
> ++      char *alg =3D NULL, *hostname =3D NULL, *ret =3D NULL, *best =3D=
 NULL;
> +       size_t maxlen;
> +-      struct hostkeys *hostkeys;
> ++      struct hostkeys *hostkeys =3D NULL;
> +       int ktype;
> +       u_int i;
> +
> +@@ -119,6 +132,26 @@ order_hostkeyalgs(char *host, struct sockaddr *hos=
taddr, u_short port)
> +       for (i =3D 0; i < options.num_system_hostfiles; i++)
> +               load_hostkeys(hostkeys, hostname, options.system_hostfil=
es[i]);
> +
> ++      /*
> ++       * If a plain public key exists that matches the type of the bes=
t
> ++       * preference HostkeyAlgorithms, then use the whole list as is.
> ++       * Note that we ignore whether the best preference algorithm is =
a
> ++       * certificate type, as sshconnect.c will downgrade certs to
> ++       * plain keys if necessary.
> ++       */
> ++      best =3D first_alg(options.hostkeyalgorithms);
> ++      if (lookup_key_in_hostkeys_by_type(hostkeys,
> ++          sshkey_type_plain(sshkey_type_from_name(best)), NULL)) {
> ++              debug3("%s: have matching best-preference key type %s, "
> ++                  "using HostkeyAlgorithms verbatim", __func__, best);
> ++              ret =3D xstrdup(options.hostkeyalgorithms);
> ++              goto out;
> ++      }
> ++
> ++      /*
> ++       * Otherwise, prefer the host key algorithms that match known ke=
ys
> ++       * while keeping the ordering of HostkeyAlgorithms as much as po=
ssible.
> ++       */
> +       oavail =3D avail =3D xstrdup(options.hostkeyalgorithms);
> +       maxlen =3D strlen(avail) + 1;
> +       first =3D xmalloc(maxlen);
> +@@ -159,6 +192,8 @@ order_hostkeyalgs(char *host, struct sockaddr *host=
addr, u_short port)
> +       if (*first !=3D '\0')
> +               debug3("%s: prefer hostkeyalgs: %s", __func__, first);
> +
> ++ out:
> ++      free(best);
> +       free(first);
> +       free(last);
> +       free(hostname);
> diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/r=
ecipes-connectivity/openssh/openssh_8.2p1.bb
> index fe94f30503..17965557a7 100644
> --- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
> @@ -24,6 +24,7 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/OpenSS=
H/portable/openssh-${PV}.tar
>             file://fix-potential-signed-overflow-in-pointer-arithmatic.p=
atch \
>             file://sshd_check_keys \
>             file://add-test-support-for-busybox.patch \
> +           file://CVE-2020-14145.patch \
>             "
>  SRC_URI[md5sum] =3D "3076e6413e8dbe56d33848c1054ac091"
>  SRC_URI[sha256sum] =3D "43925151e6cf6cee1450190c0e9af4dc36b41c12737619e=
dff8bcebdff64e671"
> --
> 2.17.1
>
> This message contains information that may be privileged or confidential=
 and is the property of the KPIT Technologies Ltd. It is intended only for =
the person to whom it is addressed. If you are not the intended recipient, =
you are not authorized to read, print, retain copy, disseminate, distribute=
, or use this message or any part thereof. If you receive this message in e=
rror, please notify the sender immediately and delete all copies of this me=
ssage. KPIT Technologies Ltd. does not accept any liability for virus infec=
ted mails.
>
>=20
>
