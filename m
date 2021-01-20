Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web08.30280.1611159995510219097
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jan 2021 08:26:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=J3ZWHyoP;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.45, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f45.google.com with SMTP id f1so12339836edr.12
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Jan 2021 08:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yWIMw6XFK67EszoJ7IPBs47QQ2LwfIV+tVXxN2QOAbQ=;
        b=J3ZWHyoPNQyA0kmTRynuUzqx7fUV3VVmuAHYSyMdcT0UX8jcFL4BKRuNDfJGsOAIG8
         0T7rrsvxanq4erjoNPggWT8g8v6iwTOb/kxpf9Vz4JUXGweWR8IuQcS5F4ADXqm6ZObO
         eKtBTub8hoZN+8D9tfQoBvbFTaTkkjroFt7npnTO4De8JXzQ8m/nRLrldpv1cjd39nJh
         wcz6U8zKV0NV6/HBLX2ApUVwZLcX+Nv/zz8oPKZaidM/vrHhM3UDBzjtqGdV23tpbLtr
         w3uFmWZttOJTm3Ur+nMrsEG1aeFN6KAmk//bRtOEFeUr848aXZwh0xHLe6qnD78R5YFg
         WbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yWIMw6XFK67EszoJ7IPBs47QQ2LwfIV+tVXxN2QOAbQ=;
        b=VKaiaB9MPuMVx5pI6NEt+KeQCaTiHO70NBjzaMDvVnVk28wpjN9RkNJ20ar0ln5K97
         TbHHAr5MT5OxNNgyMFCJ66HLy/rtpguVKNW/yrQjMweeFZAnfK2QfmhlkSa5pzdVWU+i
         DfgSjJyt2TYCT/ffzxY1vnA1Vlx+rC7bZjj68s9vs/2mvqtly6zAwEi5PlvLXnHkOnfB
         lfbd4qZR+pWA3/Ecvi9KMAwasJ0R7WlpjC9pbHPN26+GVsPiG3BvCOJMhGqVUINdFAuO
         ji6dl+0XmLvOjvdrw6+AdHxT+S+cu0ih3v00oUBYkNN5tC27IIyfkpA8Lxzo0rFOY/G3
         aDUw==
X-Gm-Message-State: AOAM5301fGRExn3Y9LVDELxz8QzVzgdjX1k4/ApTBKLvOhKSQPLiwFmh
	7KjPu2btqSLNPAazZ6/VPAH11AmrqFcXd+RoEsE0/Q==
X-Google-Smtp-Source: ABdhPJwn/dtGw/gzqCn2Zcm10o7qxUpxkEXOJP2pJGvC+kIblOfYD4L+karol31mu6eIVkwLsasOIPPostvcUij5Pxw=
X-Received: by 2002:a50:ef06:: with SMTP id m6mr7004329eds.216.1611159993888;
 Wed, 20 Jan 2021 08:26:33 -0800 (PST)
MIME-Version: 1.0
References: <1611159212-7640-1-git-send-email-Saloni.Jain@kpit.com>
In-Reply-To: <1611159212-7640-1-git-send-email-Saloni.Jain@kpit.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 20 Jan 2021 06:26:20 -1000
Message-ID: <CAOSpxdY=R1pRpVySuWo_ekr4Pb_7yumuxhHjbggVD4OJ7EDvRA@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] openssh: Added security fix for CVE-2020-14145
To: saloni <saloni.jain@kpit.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Nisha Parrakat <nisha.parrakat@kpit.com>, Anuj Chougule <anuj.chougule@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for helping with CVE's!

On Wed, Jan 20, 2021 at 6:14 AM saloni <saloni.jain@kpit.com> wrote:
>
> Added security fix for below CVE:
>
> CVE-2020-14145
> Link: https://security-tracker.debian.org/tracker/CVE-2020-14145
> Link: https://anongit.mindrot.org/openssh.git/commit/?id=3Db3855ff053f50=
78ec3d3c653cdaedefaa5fc362d
>
> Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
> ---
>  .../openssh/openssh/CVE-2020-14145.patch           | 87 +++++++++++++++=
+++++++
>  meta/recipes-connectivity/openssh/openssh_8.4p1.bb |  3 +-
>  2 files changed, 89 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2020-1=
4145.patch
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.pa=
tch b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch
> new file mode 100644
> index 0000000..50bf74d
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch
> @@ -0,0 +1,87 @@
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
> +CVE: CVE-2020-14145
> +Upstream-Status: Backport [https://security-tracker.debian.org/tracker/=
CVE-2020-14145]
> +Comment: 1 hunk with comment changes removed.

Needs your Signed-off-by here.  See "Patch name convention and commit
message" section at:

https://wiki.yoctoproject.org/wiki/Security

> +---
> + sshconnect2.c | 39 +++++++++++++++++++++++++++++++++++++--
> + 1 file changed, 37 insertions(+), 2 deletions(-)
> +
> +diff --git a/sshconnect2.c b/sshconnect2.c
> +index 347e348c..f64aae66 100644
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
> +
> diff --git a/meta/recipes-connectivity/openssh/openssh_8.4p1.bb b/meta/r=
ecipes-connectivity/openssh/openssh_8.4p1.bb
> index 688fc8a..b71e156 100644
> --- a/meta/recipes-connectivity/openssh/openssh_8.4p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_8.4p1.bb
> @@ -24,12 +24,13 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/Open=
SSH/portable/openssh-${PV}.tar
>             file://fix-potential-signed-overflow-in-pointer-arithmatic.p=
atch \
>             file://sshd_check_keys \
>             file://add-test-support-for-busybox.patch \
> +           file://CVE-2020-14145.patch \
>             "
>  SRC_URI[sha256sum] =3D "5a01d22e407eb1c05ba8a8f7c654d388a13e9f226e4ed33=
bd38748dafa1d2b24"
>
>  # This CVE is specific to OpenSSH server, as used in Fedora and Red Hat=
 Enterprise Linux 7
>  # and when running in a Kerberos environment. As such it is not relevan=
t to OpenEmbedded
> -CVE_CHECK_WHITELIST +=3D "CVE-2014-9278"
> +CVE_CHECK_WHITELIST +=3D "CVE-2014-9278 CVE-2020-15778"

Why are you modifying the whitelist here?

Steve

>  PAM_SRC_URI =3D "file://sshd"
>
> --
> 2.7.4
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
