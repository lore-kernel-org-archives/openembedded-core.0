Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.8058.1617203256856964989
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 08:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=HgCYcPEV;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.50, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f50.google.com with SMTP id o16so20083962wrn.0
        for <Openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 08:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=E9d27G+jVQ2dDGHwMbuDEC+gezR8EK0ArXEvHcgEVoA=;
        b=HgCYcPEVNN7Zxt1iXClHMGUO75WU7c1puzt7pXq8lEjErNpXz5bgOjssJTGrvUoTFu
         4uKjuQM6QSWJNcifYst2hAh7pXdjxwcpN8ocs8yI24YvJSM+FzSxe6o2ZRjn+WfCf41M
         ukljQIqibi4C9XQik4P6iZdOHdEp66NRIfxjXSd4WzTK1mgBHf4neK12Ff54zAg6zFzE
         hTtb5PZVAzY+vqkxF3upcON7Rr8SChjS7/rnOMOz1iRkUJxk1uTDS8hPLWlxr5TqpmY8
         9BbQE1qxdH+lQvTaM91bJFy6G/bs+3RyOb+qffwgbEIrCX0asANlVx0EcZve7+pZDOAC
         wKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=E9d27G+jVQ2dDGHwMbuDEC+gezR8EK0ArXEvHcgEVoA=;
        b=RT8nXK3RIrS+Zc/6vWtpAExh3j2tL6WiOcM9zmj12lgxHzuPFkjgQ05azj942NAdeR
         iuju279cWSOJYwuik1xD1h9LvD9ke3CBEUyqy8MnMEl1fXsXgO9rfDGYnrqn4OZz6Wv9
         MAaYZKoeGO3mjq6JzBtKrlVaIlcqkpaFxmTF1MIKPyCBArWG1tcq08KxsHvZqeJAbMeS
         umoS7YQI23DdVr7GpsCcsAGirjxj7xjZ6grNTzBRT+TVeDXCBqhCTEjEvlamMTbtjAvG
         6QHtjCtbEsOVToU1rXDhky2rIMTZFQK+2lw5RSRxQvjER2F/yhPcxQYKGPA96sw7N5zu
         eEdg==
X-Gm-Message-State: AOAM533Bm4GmoVPvx7mVKrC5efSImUyH9j0K3lOfB2p8VGuQmgfO3sdv
	50rLvkxu1P0av6ptFnxkyKvCKRkg0sUYw7JmDoHBZA==
X-Google-Smtp-Source: ABdhPJzAkbtU+xpn+ZxQyq9ChLQ1zjOT78UPn99CNvJ7NZj/snRvef16mlY5AEShgvjKcqws15/mGADMT70ZIuVX4wg=
X-Received: by 2002:adf:ed46:: with SMTP id u6mr4203158wro.350.1617203255322;
 Wed, 31 Mar 2021 08:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210331062112.3925-1-Sana.Kazi@kpit.com>
In-Reply-To: <20210331062112.3925-1-Sana.Kazi@kpit.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 31 Mar 2021 05:07:22 -1000
Message-ID: <CAOSpxdbA3KfgbkqXMyM498z1cFs6Xq3QnVLoTNM_L0ftrc0xPQ@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] openssh: Add fix for CVE-2020-14145
To: Sana Kazi <Sana.Kazi@kpit.com>
Cc: Patches and discussions about the oe-core layer <Openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Nisha Parrakat <nisha.parrakat@kpit.com>, Purushottam.Choudhary@kpit.com, 
	Harpritkaur.Bhandari@kpit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patch fails on the autobuilder:

stdio: ERROR: openssh-8.2p1-r0 do_patch: Command Error: 'quilt
--quiltrc /home/pokybuild/yocto-worker/beaglebone-alt/build/build/tmp/work=
/cortexa8hf-neon-poky-linux-gnueabi/openssh/8.2p1-r0/recipe-sysroot-native/=
etc/quiltrc
push' exited with 0 Output:

Steve

On Tue, Mar 30, 2021 at 8:22 PM Sana Kazi <Sana.Kazi@kpit.com> wrote:
>
> Applied patch for CVE-2020-14145 which fixes
> man-in-the-middle attack.
> Link: https://anongit.mindrot.org/openssh.git/patch/?id=3Db3855ff053f507=
8ec3d3c653cdaedefaa5fc362d
>
> Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> ---
>  .../openssh/openssh/CVE-2020-14145.patch      | 97 +++++++++++++++++++
>  .../openssh/openssh_8.2p1.bb                  |  1 +
>  2 files changed, 98 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2020-1=
4145.patch
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.pa=
tch b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch
> new file mode 100644
> index 0000000000..3adb981fb4
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch
> @@ -0,0 +1,97 @@
> +From b3855ff053f5078ec3d3c653cdaedefaa5fc362d Mon Sep 17 00:00:00 2001
> +From: "djm@openbsd.org" <djm@openbsd.org>
> +Date: Fri, 18 Sep 2020 05:23:03 +0000
> +Subject: upstream: tweak the client hostkey preference ordering algorit=
hm to
> +
> +prefer the default ordering if the user has a key that matches the
> +best-preference default algorithm.
> +
> +feedback and ok markus@
> +
> +OpenBSD-Commit-ID: a92dd7d7520ddd95c0a16786a7519e6d0167d35f
> +
> +Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> +---
> + sshconnect2.c | 41 ++++++++++++++++++++++++++++++++++++++---
> + 1 file changed, 38 insertions(+), 3 deletions(-)
> +
> +CVE: CVE-2020-14145
> +Upstream-Status: Backport [https://anongit.mindrot.org/openssh.git/patc=
h/?id=3Db3855ff053f5078ec3d3c653cdaedefaa5fc362d]
> +Comment: Refreshed first hunk
> +
> +diff --git a/sshconnect2.c b/sshconnect2.c
> +index 347e348c..f64aae66 100644
> +--- a/sshconnect2.c
> ++++ b/sshconnect2.c
> +@@ -1,4 +1,4 @@
> +-/* $OpenBSD: sshconnect2.c,v 1.320 2020/02/06 22:48:23 djm Exp $ */
> ++/* $OpenBSD: sshconnect2.c,v 1.326 2020/09/18 05:23:03 djm Exp $ */
> + /*
> +  * Copyright (c) 2000 Markus Friedl.  All rights reserved.
> +  * Copyright (c) 2008 Damien Miller.  All rights reserved.
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
> +--
> +cgit v1.2.3
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
