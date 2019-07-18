Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id DA1E27F095
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 22:39:06 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id x22so24087268qtp.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 15:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=a1ap3Yi2sXESyZB/x7XJe84o+8ykCQSrTAiQf1TYBl4=;
	b=bxVIZnAOMKnpq2fTPaCN9v39+K9XTF0lSw1TH/5xvhofUlboWRs5nwrqbwBiTXgJNW
	/ayN0yRrQVUXIWJ1mYqQx91nu7g3dsYHa2QaA5GvRyscjQOSTViKzCntilpVhI+HgyLH
	GrCLDyrq8H5ctakRbMhSNUCLEOWE0mh/eqHI73R/gWCc2+6pNnETVrrKBVGkp6O77CB5
	W1EWnPESWLjDG9kDSdX2E2Ga/tPr6VhPCuG/RGpJgEEMZgn/exwREampu3/qi7ZoLy4d
	CMPEZzQ1qXxZrvDCgfV2sbvgK+iJS6y/Irj3ykhq24F3dwWlSSnqrfUt2/29gu0VQukK
	SOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=a1ap3Yi2sXESyZB/x7XJe84o+8ykCQSrTAiQf1TYBl4=;
	b=rO7Cn5mckNn3tiCSD88DlpQysheB31oH4hiAmdV5Sk3QOBGWyj6ah4WMP026G7I9RN
	6hiP+7IOAUE37/VFpENsXyASxJ8C3xyGjW6B01/tVnNOYcXd8zpb0b0Kq1r7XXXwEEth
	9F9hLDXtIkiJblQNI+XcxNLtiKiv2i/V3aaz3VNwF1lp4bOdlPm8XBJzvJU9BcCQipev
	A2GaGPkphXDL0w5TH8mLLpEjQYfdd2LNdVAAwNTbbnSOvT8jhOqYOc6465ESUu4jtzRB
	PdRZz6msP8QBePDxHINN2P5bAbuELXoMhlfHq31TPTgONxyOZCZ2rLyO4ZqOLm3vbPB7
	TRtQ==
X-Gm-Message-State: APjAAAW5FNF3tLiRoc43WM8Ys56fcDNFu2BRpkS6f53lgMOhFqCMyYXV
	OERHNfQCzJfxzFyMxayeTF3b3It2CQjsSD5COiWWXEezUMg=
X-Google-Smtp-Source: APXvYqwrSwR2oxuCkfemQJhZck0x6rfVLLtYoWjusoh7bpTJfheVz9TGCdQ+GSOHFunln94K8n36Js0lIlV3KoutEKY=
X-Received: by 2002:ac8:764f:: with SMTP id i15mr33801185qtr.194.1563489547368;
	Thu, 18 Jul 2019 15:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190718194615.6874-1-ricardo@ribalda.com>
	<CAMKF1spj-LXk1=YxeErV7UHVtWJmacjP1M-_W6M=4ZnSkaFk_w@mail.gmail.com>
	<CAPybu_2tkssPOt8G1ZFZ6s9++7h0KhZV872tFccRXdRYuR=i-Q@mail.gmail.com>
In-Reply-To: <CAPybu_2tkssPOt8G1ZFZ6s9++7h0KhZV872tFccRXdRYuR=i-Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Jul 2019 15:38:41 -0700
Message-ID: <CAMKF1sqzAbADXCR1gW07-j1L=RLWEWJJur8gVZ4GC=xA04KfNA@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] inetutils: Fix abort on invalid files
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
X-List-Received-Date: Thu, 18 Jul 2019 22:39:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 18, 2019 at 2:10 PM Ricardo Ribalda Delgado
<ricardo@ribalda.com> wrote:
>
> Hi Khem
>
> I think the issue is that __memcpy_chk wrongly assume that the target
> size is 0. The origin size is calculated fine:
>
> https://godbolt.org/z/qTaDWP
>
            char tu_data[0];    /* data or error string */

that seems an old stype variable length array
can you change it to char tu_data[] and see if it helps

> Thanks!
>
> On Thu, Jul 18, 2019 at 11:02 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Thu, Jul 18, 2019 at 12:46 PM Ricardo Ribalda Delgado
> > <ricardo@ribalda.com> wrote:
> > >
> > > When the code is compiled with  "-fstack-protector-strong
> > > -D_FORTIFY_SOURCE=2", everytime ftpfd is asked for a non existent file,
> > > it crashes with the following error:
> > >
> > > *** buffer overflow detected ***:
> > > Aborted
> > >
> > > This seems to be a bug/feature of gcc. A bug has been open on their
> > > bugzilla, and also inetutils have been posted with the proposed patch.
> > >
> > > Without this patch, pxelinux fails to boot because it keeps asking the
> > > server for the pxelinux.cfg/00-01-02-03-04 and never jumps to /default.
> > >
> > > Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > > ---
> > >  .../inetutils/fix-buffer-fortify-tfpt.patch   | 25 +++++++++++++++++++
> > >  .../inetutils/inetutils_1.9.4.bb              |  1 +
> > >  2 files changed, 26 insertions(+)
> > >  create mode 100644 meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch
> > >
> > > diff --git a/meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch b/meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch
> > > new file mode 100644
> > > index 0000000000..a91913cb51
> > > --- /dev/null
> > > +++ b/meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch
> > > @@ -0,0 +1,25 @@
> > > +tftpd: Fix abort on error path
> > > +
> > > +When trying to fetch a non existent file, the app crashes with:
> > > +
> > > +*** buffer overflow detected ***:
> > > +Aborted
> > > +
> > > +
> > > +Upstream-Status: Submitted [https://www.mail-archive.com/bug-inetutils@gnu.org/msg03036.html https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91205]
> > > +Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > > +diff --git a/src/tftpd.c b/src/tftpd.c
> > > +index 56002a0..144012f 100644
> > > +--- a/src/tftpd.c
> > > ++++ b/src/tftpd.c
> > > +@@ -864,9 +864,8 @@ nak (int error)
> > > +       pe->e_msg = strerror (error - 100);
> > > +       tp->th_code = EUNDEF;   /* set 'undef' errorcode */
> > > +     }
> > > +-  strcpy (tp->th_msg, pe->e_msg);
> > > +   length = strlen (pe->e_msg);
> >
> > I wonder if length calculation is a problem as well here, if so then
> > it would need
> > correcting because it used in code below as well.
> >
> > > +-  tp->th_msg[length] = '\0';
> > > ++  memcpy(tp->th_msg, pe->e_msg, length + 1);
> > > +   length += 5;
> > > +   if (sendto (peer, buf, length, 0, (struct sockaddr *) &from, fromlen) != length)
> > > +     syslog (LOG_ERR, "nak: %m\n");
> > > diff --git a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> > > index ac2e017d8b..684fbe09e1 100644
> > > --- a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> > > +++ b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> > > @@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
> > >             file://inetutils-1.9-PATH_PROCNET_DEV.patch \
> > >             file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
> > >             file://0001-rcp-fix-to-work-with-large-files.patch \
> > > +           file://fix-buffer-fortify-tfpt.patch \
> > >  "
> > >
> > >  SRC_URI[md5sum] = "04852c26c47cc8c6b825f2b74f191f52"
> > > --
> > > 2.20.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> Ricardo Ribalda
> Thanks!
>
> On Thu, Jul 18, 2019 at 11:02 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Thu, Jul 18, 2019 at 12:46 PM Ricardo Ribalda Delgado
> > <ricardo@ribalda.com> wrote:
> > >
> > > When the code is compiled with  "-fstack-protector-strong
> > > -D_FORTIFY_SOURCE=2", everytime ftpfd is asked for a non existent file,
> > > it crashes with the following error:
> > >
> > > *** buffer overflow detected ***:
> > > Aborted
> > >
> > > This seems to be a bug/feature of gcc. A bug has been open on their
> > > bugzilla, and also inetutils have been posted with the proposed patch.
> > >
> > > Without this patch, pxelinux fails to boot because it keeps asking the
> > > server for the pxelinux.cfg/00-01-02-03-04 and never jumps to /default.
> > >
> > > Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > > ---
> > >  .../inetutils/fix-buffer-fortify-tfpt.patch   | 25 +++++++++++++++++++
> > >  .../inetutils/inetutils_1.9.4.bb              |  1 +
> > >  2 files changed, 26 insertions(+)
> > >  create mode 100644 meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch
> > >
> > > diff --git a/meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch b/meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch
> > > new file mode 100644
> > > index 0000000000..a91913cb51
> > > --- /dev/null
> > > +++ b/meta/recipes-connectivity/inetutils/inetutils/fix-buffer-fortify-tfpt.patch
> > > @@ -0,0 +1,25 @@
> > > +tftpd: Fix abort on error path
> > > +
> > > +When trying to fetch a non existent file, the app crashes with:
> > > +
> > > +*** buffer overflow detected ***:
> > > +Aborted
> > > +
> > > +
> > > +Upstream-Status: Submitted [https://www.mail-archive.com/bug-inetutils@gnu.org/msg03036.html https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91205]
> > > +Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > > +diff --git a/src/tftpd.c b/src/tftpd.c
> > > +index 56002a0..144012f 100644
> > > +--- a/src/tftpd.c
> > > ++++ b/src/tftpd.c
> > > +@@ -864,9 +864,8 @@ nak (int error)
> > > +       pe->e_msg = strerror (error - 100);
> > > +       tp->th_code = EUNDEF;   /* set 'undef' errorcode */
> > > +     }
> > > +-  strcpy (tp->th_msg, pe->e_msg);
> > > +   length = strlen (pe->e_msg);
> >
> > I wonder if length calculation is a problem as well here, if so then
> > it would need
> > correcting because it used in code below as well.
> >
> > > +-  tp->th_msg[length] = '\0';
> > > ++  memcpy(tp->th_msg, pe->e_msg, length + 1);
> > > +   length += 5;
> > > +   if (sendto (peer, buf, length, 0, (struct sockaddr *) &from, fromlen) != length)
> > > +     syslog (LOG_ERR, "nak: %m\n");
> > > diff --git a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> > > index ac2e017d8b..684fbe09e1 100644
> > > --- a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> > > +++ b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
> > > @@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
> > >             file://inetutils-1.9-PATH_PROCNET_DEV.patch \
> > >             file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
> > >             file://0001-rcp-fix-to-work-with-large-files.patch \
> > > +           file://fix-buffer-fortify-tfpt.patch \
> > >  "
> > >
> > >  SRC_URI[md5sum] = "04852c26c47cc8c6b825f2b74f191f52"
> > > --
> > > 2.20.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> Ricardo Ribalda

