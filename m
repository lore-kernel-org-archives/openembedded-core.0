Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.1703.1617292547558894777
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 08:55:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QMdewHXj;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id l15so2315967ybm.0
        for <Openembedded-core@lists.openembedded.org>; Thu, 01 Apr 2021 08:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mN8073E1jUqVTO3lwdYJ4r1/E+3PwrGTt6zQ9q6n5hg=;
        b=QMdewHXjLpfLv9HpaSC5yP2Oqt3og2NVcItg/qHOQPjqoZ97xvFJgxB1AcAl8IafFL
         S3Z1NK3DogBSzSGXhHZyIZ54r3jlTEwuAsQ/bEkwmeTZknN+TQF+Lj1Wnn92wz6s/d4a
         7/TG20LCEc3Y2DA2hZtQALw0VJSIfJwOlpbZigEWSclC+tsQ+UKUrJLBdcPKi9tBMndT
         5ECSjtea3DTlJbYA0NWr6i5V4at/B7TYIoVVNw/TUgN7TyqMa0kgoy4vpe+wfLWhqlzX
         51UVWSvDWDfu4yn010hTr0FH8tLovpFqYi+MCb+nPbsFVD+W+0u+160is+w+Ra29HytV
         OBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mN8073E1jUqVTO3lwdYJ4r1/E+3PwrGTt6zQ9q6n5hg=;
        b=FtEUbY34fJomglPtcaFC3MSU3igzYvkBsmd2Eq02PsuXdIofwX7s4YdXc1Qupms+xo
         8v4SQrwLIWtqPyqaJMDVS4P7rr0aH6xGWO9zyUgwq4NcO2fHT8xoIQ/uMtroaF6dKRje
         aM1csz6XF17CxA2PEUj295v8tzhzqV9XJVRJADqDgDekTomO664auUABkYNHmaUTCLIc
         jlO99JCLcOfWk0nd97LkH/Gb16nLieCLvvcRDPvcbaXibeLGMIpAJ9+04u1hOo5tQULt
         1fVJYQKgMs/WnAgGseoe6ZxFuTpAavZumycB1OvtM1zfleNzTFTlD/+19jgu0in0QsKP
         tYIw==
X-Gm-Message-State: AOAM530zpZQQ0MdwL7AnuMqM8GMrgfyquFs9rIf3PeBBX7yeLtiWIha9
	M7iJL21/FoNGEGAcko85txiM6MucCCLBEI22D2Q=
X-Google-Smtp-Source: ABdhPJyhj9oEisi/ZheanItGvfYGYKcd9Dt5BgrPFehuWrKVrHE7AAZCXgz0FJVhMJFAMFfZ8bx9PCRt0vQj8uWQ6CQ=
X-Received: by 2002:a25:5381:: with SMTP id h123mr12306848ybb.416.1617292546758;
 Thu, 01 Apr 2021 08:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210331172104.11877-1-Sana.Kazi@kpit.com> <CAOSpxdZ=o+iNofgOJez9J0k1_fT3kHBaCTpoWCrJ_2sHnrpy3g@mail.gmail.com>
 <MAXPR01MB323006DB564C8E9D11E2F4A1997B9@MAXPR01MB3230.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MAXPR01MB323006DB564C8E9D11E2F4A1997B9@MAXPR01MB3230.INDPRD01.PROD.OUTLOOK.COM>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Thu, 1 Apr 2021 05:55:34 -1000
Message-ID: <CAGDS+n=M27Xd2gGN_s2-71n4N30PqwSduyBdRHaxSumurCUqBA@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCHv2] openssh: fix CVE-2020-14145
To: Sana Kazi <Sana.Kazi@kpit.com>
Cc: Patches and discussions about the oe-core layer <Openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Nisha Parrakat <Nisha.Parrakat@kpit.com>, 
	Purushottam Choudhary <Purushottam.Choudhary@kpit.com>, 
	Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2021 at 11:19 PM Sana Kazi <Sana.Kazi@kpit.com> wrote:
>
> Hi Steve,
>
> I have verified the patch on dunfell branch and it builds successfully.

Sorry, I tried your patch both locally and on the autobuilder and it
still fails to build:

https://errors.yoctoproject.org/Errors/Details/575272/

Steve


> ________________________________
> From: Steve Sakoman <steve@sakoman.com>
> Sent: Wednesday, March 31, 2021 11:31 PM
> To: Sana Kazi <Sana.Kazi@kpit.com>
> Cc: Patches and discussions about the oe-core layer <Openembedded-core@l=
ists.openembedded.org>; Khem Raj <raj.khem@gmail.com>; Nisha Parrakat <Nish=
a.Parrakat@kpit.com>; Purushottam Choudhary <Purushottam.Choudhary@kpit.com=
>; Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
> Subject: Re: [OE-core] [poky][dunfell][PATCHv2] openssh: fix CVE-2020-14=
145
>
> V2 also fails to build:
>
> ERROR: openssh-8.2p1-r0 do_patch: Command Error: 'quilt --quiltrc
> /home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/opens=
sh/8.2p1-r0/recipe-sysroot-native/etc/quiltrc
> push' exited with 0  Output:
> Applying patch CVE-2020-14145.patch
> patching file sshconnect2.c
> Hunk #1 FAILED at 102.
> Hunk #2 FAILED at 119.
> Hunk #3 FAILED at 159.
> 3 out of 3 hunks FAILED -- rejects in file sshconnect2.c
> Patch CVE-2020-14145.patch does not apply (enforce with -f)
>
> Before submitting please verify that your patches both apply to the
> head of the dunfell branch, and build as well!
>
> Steve
>
>
> On Wed, Mar 31, 2021 at 7:21 AM Sana Kazi <Sana.Kazi@kpit.com> wrote:
> >
> > From: Lee Chee Yang <chee.yang.lee@intel.com>
> >
> > (From OE-Core rev: 38482edf1a31ed0735b746cf0ab3e1adda4199d1)
> >
> > Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> > Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> > ---
> >  .../openssh/openssh/CVE-2020-14145.patch      | 90 ++++++++++++++++++=
+
> >  .../openssh/openssh_8.2p1.bb                  |  1 +
> >  2 files changed, 91 insertions(+)
> >  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2020=
-14145.patch
> >
> > diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.=
patch b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch
> > new file mode 100644
> > index 0000000000..0046ee1a51
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch
> > @@ -0,0 +1,90 @@
> > +From b3855ff053f5078ec3d3c653cdaedefaa5fc362d Mon Sep 17 00:00:00 200=
1
> > +From: "djm@openbsd.org" <djm@openbsd.org>
> > +Date: Fri, 18 Sep 2020 05:23:03 +0000
> > +Subject: [PATCH] upstream: tweak the client hostkey preference orderi=
ng
> > + algorithm to
> > +
> > +prefer the default ordering if the user has a key that matches the
> > +best-preference default algorithm.
> > +
> > +feedback and ok markus@
> > +
> > +OpenBSD-Commit-ID: a92dd7d7520ddd95c0a16786a7519e6d0167d35f
> > +
> > +Upstream-Status: Backport
> > +[https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
github.com%2Fopenssh%2Fopenssh-portable%2Fcommit%2Fb3855ff053f5078ec3d3c653=
cdaedefaa5fc362d&amp;data=3D04%7C01%7CSana.Kazi%40kpit.com%7C4b74e63f0ba745=
d0e18608d8f46f0bd8%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63752810507=
6588451%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI=
6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DFEdHjP9Fp%2BlrVEtby1zBa5W%2BlrkV=
HHFVJgMOk%2BvDusY%3D&amp;reserved=3D0]
> > +CVE: CVE-2020-14145
> > +Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> > +
> > +---
> > + sshconnect2.c | 41 ++++++++++++++++++++++++++++++++++++++---
> > + 1 file changed, 37 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/sshconnect2.c b/sshconnect2.c
> > +index 347e348c60..f64aae66af 100644
> > +--- a/sshconnect2.c
> > ++++ b/sshconnect2.c
> > +@@ -102,12 +102,25 @@ verify_host_key_callback(struct sshkey *hostkey=
, struct ssh *ssh)
> > +       return 0;
> > + }
> > +
> > ++/* Returns the first item from a comma-separated algorithm list */
> > ++static char *
> > ++first_alg(const char *algs)
> > ++{
> > ++      char *ret, *cp;
> > ++
> > ++      ret =3D xstrdup(algs);
> > ++      if ((cp =3D strchr(ret, ',')) !=3D NULL)
> > ++              *cp =3D '\0';
> > ++      return ret;
> > ++}
> > ++
> > + static char *
> > + order_hostkeyalgs(char *host, struct sockaddr *hostaddr, u_short por=
t)
> > + {
> > +-      char *oavail, *avail, *first, *last, *alg, *hostname, *ret;
> > ++      char *oavail =3D NULL, *avail =3D NULL, *first =3D NULL, *last=
 =3D NULL;
> > ++      char *alg =3D NULL, *hostname =3D NULL, *ret =3D NULL, *best =
=3D NULL;
> > +       size_t maxlen;
> > +-      struct hostkeys *hostkeys;
> > ++      struct hostkeys *hostkeys =3D NULL;
> > +       int ktype;
> > +       u_int i;
> > +
> > +@@ -119,6 +132,26 @@ order_hostkeyalgs(char *host, struct sockaddr *h=
ostaddr, u_short port)
> > +       for (i =3D 0; i < options.num_system_hostfiles; i++)
> > +               load_hostkeys(hostkeys, hostname, options.system_hostf=
iles[i]);
> > +
> > ++      /*
> > ++       * If a plain public key exists that matches the type of the b=
est
> > ++       * preference HostkeyAlgorithms, then use the whole list as is=
.
> > ++       * Note that we ignore whether the best preference algorithm i=
s a
> > ++       * certificate type, as sshconnect.c will downgrade certs to
> > ++       * plain keys if necessary.
> > ++       */
> > ++      best =3D first_alg(options.hostkeyalgorithms);
> > ++      if (lookup_key_in_hostkeys_by_type(hostkeys,
> > ++          sshkey_type_plain(sshkey_type_from_name(best)), NULL)) {
> > ++              debug3("%s: have matching best-preference key type %s,=
 "
> > ++                  "using HostkeyAlgorithms verbatim", __func__, best=
);
> > ++              ret =3D xstrdup(options.hostkeyalgorithms);
> > ++              goto out;
> > ++      }
> > ++
> > ++      /*
> > ++       * Otherwise, prefer the host key algorithms that match known =
keys
> > ++       * while keeping the ordering of HostkeyAlgorithms as much as =
possible.
> > ++       */
> > +       oavail =3D avail =3D xstrdup(options.hostkeyalgorithms);
> > +       maxlen =3D strlen(avail) + 1;
> > +       first =3D xmalloc(maxlen);
> > +@@ -159,6 +192,8 @@ order_hostkeyalgs(char *host, struct sockaddr *ho=
staddr, u_short port)
> > +       if (*first !=3D '\0')
> > +               debug3("%s: prefer hostkeyalgs: %s", __func__, first);
> > +
> > ++ out:
> > ++      free(best);
> > +       free(first);
> > +       free(last);
> > +       free(hostname);
> > diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta=
/recipes-connectivity/openssh/openssh_8.2p1.bb
> > index fe94f30503..17965557a7 100644
> > --- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
> > +++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
> > @@ -24,6 +24,7 @@ SRC_URI =3D "https://apc01.safelinks.protection.outl=
ook.com/?url=3Dhttp%3A%2F%2Fftp.openbsd.org%2Fpub%2FOpenBSD%2FOpenSSH%2Fpor=
table%2Fopenssh-%24&amp;data=3D04%7C01%7CSana.Kazi%40kpit.com%7C4b74e63f0ba=
745d0e18608d8f46f0bd8%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63752810=
5076588451%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJB=
TiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Dena%2BrAqlj%2BihIcDkex1Y%2Fd6=
v9GZZN%2BJOCwE34psSas8%3D&amp;reserved=3D0{PV}.tar
> >             file://fix-potential-signed-overflow-in-pointer-arithmatic=
.patch \
> >             file://sshd_check_keys \
> >             file://add-test-support-for-busybox.patch \
> > +           file://CVE-2020-14145.patch \
> >             "
> >  SRC_URI[md5sum] =3D "3076e6413e8dbe56d33848c1054ac091"
> >  SRC_URI[sha256sum] =3D "43925151e6cf6cee1450190c0e9af4dc36b41c1273761=
9edff8bcebdff64e671"
> > --
> > 2.17.1
> >
> > This message contains information that may be privileged or confidenti=
al and is the property of the KPIT Technologies Ltd. It is intended only fo=
r the person to whom it is addressed. If you are not the intended recipient=
, you are not authorized to read, print, retain copy, disseminate, distribu=
te, or use this message or any part thereof. If you receive this message in=
 error, please notify the sender immediately and delete all copies of this =
message. KPIT Technologies Ltd. does not accept any liability for virus inf=
ected mails.
> >
> >
> >
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
