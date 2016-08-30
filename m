Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 31E896E630
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 07:21:31 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id l203so14756836oib.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 00:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=l3hyiRVpe78yhCRbsjvgtcR+Le/fO+NcdVL1J27nvaE=;
	b=aJO61E+vn3R2v0uj/aU915DdZr3TlP5YqCtIjugT6T3KCHU0mvZPi5U4X4X+u6iJZh
	z5taUeH6QMqgGKKzoUXV0iAuR4r4T/3McNzPAyUsYMcuGA8zRP49j5GZK79Zdr6RyWl3
	F8yIvXy9m2N7oJzEC8w6AP/km5GiL9/2miONjgHKeRmMNFR0/5eFXIEVkiyoGefelPn3
	Qpv5mVsK9QUB8vtoNKbA7mh+MnY7ATPTs7O5VreBgQxa+KIzGV6usbGNjRBahNAcaVBt
	NEC+N5iHXZ40V3xptkCYRhNe6WiF2HkARJj/f/vKkJ4hG7AmCou6Hq/XLmpLXG0IHdbq
	Qo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=l3hyiRVpe78yhCRbsjvgtcR+Le/fO+NcdVL1J27nvaE=;
	b=de/8ARQ934xH7xbfGo1so8DF5Mve2xN78faNOUjWyqISk6c9RczTDdTjAJGPfwNqc/
	5HvdLK1TOPFCuau1+J52wIiRCtRVsn0OQzjdlfZX8l0c+np3Xhz5k9iKHrI20ndzKmsJ
	ntryMwolY8E5Ao1uJzPzgKYRDvElPVj8rzKTgNIR4U0RakuOF8UbwdWd4byIXEXPggqA
	4Y41LSOelgb2KfKYxS9pc1h3s5Il1ZV6oM7P8vLga58aYPVoQI7A6gSPWpVIFCEHSIMX
	k9QP51y2e1LYL+UwWGJRQtmoDX1JfGkjU8z0SPbXAgdoYkluk9CUMSOjHJhnQZ5oexFi
	JuIw==
X-Gm-Message-State: AE9vXwNxEOLX58rraDb/OTztQb0DY8f3CjOsBff6RHw8CjWXn8GP64wFe+QVKZ6ERyFiVj8sF9bCQ5AUzvdSTAz6
X-Received: by 10.157.49.3 with SMTP id e3mr2281943otc.127.1472541692385; Tue,
	30 Aug 2016 00:21:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.241.11 with HTTP; Tue, 30 Aug 2016 00:21:02 -0700 (PDT)
In-Reply-To: <20160830021713.16392-1-edwin.plauchu.camacho@linux.intel.com>
References: <20160830021713.16392-1-edwin.plauchu.camacho@linux.intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 30 Aug 2016 10:21:02 +0300
Message-ID: <CAHiDW_GGyG+-_xatGAX7taNtM+DpWr-j3=bHdZdCi0LGvUYyNw@mail.gmail.com>
To: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V1] unzip: fixes strange output
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
X-List-Received-Date: Tue, 30 Aug 2016 07:21:32 -0000
Content-Type: multipart/alternative; boundary=001a1141c9f87df098053b44d4e9

--001a1141c9f87df098053b44d4e9
Content-Type: text/plain; charset=UTF-8

On 30 August 2016 at 05:17, Edwin Plauchu <
edwin.plauchu.camacho@linux.intel.com> wrote:
>
> From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
>
> This fixes commit 763a3d424bccf559a8d6add3dc1f2746c82f2933
>
> Output was strange when using unzip to extract zip file.
> This patch fixed so.
>
> [YOCTO #9551]
>
> Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
> ---
>  .../unzip/unzip/fix-security-format.patch          | 198
++++++++-------------
>  1 file changed, 78 insertions(+), 120 deletions(-)
>
> diff --git a/meta/recipes-extended/unzip/unzip/fix-security-format.patch
b/meta/recipes-extended/unzip/unzip/fix-security-format.patch
> index c82f502..8e9b06c 100644
> --- a/meta/recipes-extended/unzip/unzip/fix-security-format.patch
> +++ b/meta/recipes-extended/unzip/unzip/fix-security-format.patch
> @@ -9,131 +9,89 @@ Upstream-Status: Pending
>
>  Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
>
> -diff --git a/unzpriv.h b/unzpriv.h
> -index c8d3eab..85e693a 100644
> ---- a/unzpriv.h
> -+++ b/unzpriv.h
> -@@ -1006,7 +1006,7 @@
> - #    define LoadFarStringSmall(x)   Qstrfix(x)
> - #    define LoadFarStringSmall2(x)  Qstrfix(x)
> - #  else
> --#    define LoadFarString(x)        (char *)(x)
> -+#    define LoadFarString(x)        "%s",(char *)(x)

LoadFarString is used a _lot_ in various different ways, usually as
argument to another macro or function. This sort of macro change seems
potentially very dangerous in C, have you checked this is ok in every case?.

I gave an example from extract.c in the bug report:

    Info(slide, 0x201, ((char *)slide,
        LoadFarString(SymLnkWarnInvalid), FnFilter1(linkfname)))

may end up calling sprintf like this:

    sprintf ((char *)slide,
        LoadFarString(SymLnkWarnInvalid), FnFilter1(linkfname))

That still seems unlikely to work with the proposed LoadFarString change.

another example below.

> - #    define LoadFarStringSmall(x)   (char *)(x)
> - #    define LoadFarStringSmall2(x)  (char *)(x)
> - #  endif
> -diff --git a/fileio.c b/fileio.c
> -index 36bfea3..ca779c2 100644
> ---- a/fileio.c
> -+++ b/fileio.c
> -@@ -588,8 +588,8 @@ unsigned readbuf(__G__ buf, size)   /* return number
of bytes read into buf */
> -             else if (G.incnt < 0) {
> -                 /* another hack, but no real harm copying same thing
twice */
> -                 (*G.message)((zvoid *)&G,
> --                  (uch *)LoadFarString(ReadError),  /* CANNOT use slide
*/
> --                  (ulg)strlen(LoadFarString(ReadError)), 0x401);
> -+                  (uch *)(char*)(ReadError),  /* CANNOT use slide */
> -+                  (ulg)strlen((char*)(ReadError)), 0x401);
> -                 return 0;  /* discarding some data; better than lock-up
*/
> -             }
> -             /* buffer ALWAYS starts on a block boundary:  */
> -@@ -631,8 +631,8 @@ int readbyte(__G)   /* refill inbuf and return a
byte if available, else EOF */
> -         } else if (G.incnt < 0) {  /* "fail" (abort, retry, ...)
returns this */
> -             /* another hack, but no real harm copying same thing twice
*/
> -             (*G.message)((zvoid *)&G,
> --              (uch *)LoadFarString(ReadError),
> --              (ulg)strlen(LoadFarString(ReadError)), 0x401);
> -+              (uch *)(char*)(ReadError),
> -+              (ulg)strlen((char*)(ReadError)), 0x401);
> -             echon();
> - #ifdef WINDLL
> -             longjmp(dll_error_return, 1);
> -@@ -1356,7 +1356,7 @@ int UZ_EXP UzpMessagePrnt(pG, buf, size, flag)
> -                 ++((Uz_Globs *)pG)->lines;
> -                 if (((Uz_Globs *)pG)->lines >= ((Uz_Globs *)pG)->height)
> -                     (*((Uz_Globs *)pG)->mpause)((zvoid *)pG,
> --                      LoadFarString(MorePrompt), 1);
> -+                      (char*)(MorePrompt), 1);
> -             }
> - #endif /* MORE */
> -             if (MSG_STDERR(flag) && ((Uz_Globs *)pG)->UzO.tflag &&
> -@@ -1416,7 +1416,7 @@ int UZ_EXP UzpMessagePrnt(pG, buf, size, flag)
> -                     ((Uz_Globs *)pG)->sol = TRUE;
> -                     q = p + 1;
> -                     (*((Uz_Globs *)pG)->mpause)((zvoid *)pG,
> --                      LoadFarString(MorePrompt), 1);
> -+                      (char*)(MorePrompt), 1);
> +diff --git a/extract.c b/extract.c
> +index 7cd9123..25c5a62 100644
> +--- a/extract.c
> ++++ b/extract.c
> +@@ -475,7 +475,7 @@ int extract_or_test_files(__G)    /* return PK-type
error code */
> +                     Info(slide, 0x401, ((char *)slide,
> +                       LoadFarString(CentSigMsg), j + blknum*DIR_BLKSIZ
+ 1));
> +                     Info(slide, 0x401, ((char *)slide,
> +-                      LoadFarString(ReportMsg)));
> ++                      "%s",LoadFarString(ReportMsg)));

AFAICS this may end up as:
    sprintf ((char *)slide, "%s", LoadFarString(ReportMsg))
which with the new macro definition would mean:
    sprintf ((char *)slide, "%s", "%s", (char *)(ReportMsg))

This also seems unlikely to do what was meant.

Jussi

> +                     error_in_archive = PK_BADERR;
>                   }
> +                 reached_end = TRUE;     /* ...so no more left to do */
> +@@ -754,8 +754,8 @@ int extract_or_test_files(__G)    /* return PK-type
error code */
> +
> + #ifndef SFX
> +     if (no_endsig_found) {                      /* just to make sure */
> +-        Info(slide, 0x401, ((char *)slide, LoadFarString(EndSigMsg)));
> +-        Info(slide, 0x401, ((char *)slide, LoadFarString(ReportMsg)));
> ++        Info(slide, 0x401, ((char *)slide, "%s",
LoadFarString(EndSigMsg)));
> ++        Info(slide, 0x401, ((char *)slide, "%s",
LoadFarString(ReportMsg)));
> +         if (!error_in_archive)       /* don't overwrite stronger error
*/
> +             error_in_archive = PK_WARN;
> +     }
> +diff --git a/list.c b/list.c
> +index 15e0011..0b484f6 100644
> +--- a/list.c
> ++++ b/list.c
> +@@ -181,7 +181,7 @@ int list_files(__G)    /* return PK-type error code
*/
> +                 Info(slide, 0x401,
> +                      ((char *)slide, LoadFarString(CentSigMsg), j));
> +                 Info(slide, 0x401,
> +-                     ((char *)slide, LoadFarString(ReportMsg)));
> ++                     ((char *)slide, "%s", LoadFarString(ReportMsg)));
> +                 return PK_BADERR;   /* sig not found */
>               }
> -             INCSTR(p);
> -@@ -2176,7 +2176,7 @@ int do_string(__G__ length, option)   /* return
PK-type error code */
> -                     (*G.message)((zvoid *)&G, slide, (ulg)(q-slide), 0);
> -                     q = slide;
> -                     if (pause && G.extract_flag) /* don't pause for
list/test */
> --                        (*G.mpause)((zvoid *)&G,
LoadFarString(QuitPrompt), 0);
> -+                        (*G.mpause)((zvoid *)&G, (char*)(QuitPrompt),
0);
> -                 }
> +         }
> +@@ -507,7 +507,7 @@ int list_files(__G)    /* return PK-type error code
*/
> +             && (!G.ecrec.is_zip64_archive)
> +             && (memcmp(G.sig, end_central_sig, 4) != 0)
> +            ) {          /* just to make sure again */
> +-            Info(slide, 0x401, ((char *)slide,
LoadFarString(EndSigMsg)));
> ++            Info(slide, 0x401, ((char *)slide, "%s",
LoadFarString(EndSigMsg)));
> +             error_in_archive = PK_WARN;   /* didn't find sig */
> +         }
> +
> +@@ -591,7 +591,7 @@ int get_time_stamp(__G__ last_modtime, nmember)  /*
return PK-type error code */
> +                 Info(slide, 0x401,
> +                      ((char *)slide, LoadFarString(CentSigMsg), j));
> +                 Info(slide, 0x401,
> +-                     ((char *)slide, LoadFarString(ReportMsg)));
> ++                     ((char *)slide, "%s", LoadFarString(ReportMsg)));
> +                 return PK_BADERR;   /* sig not found */
>               }
> -             (*G.message)((zvoid *)&G, slide, (ulg)(q-slide), 0);
> -diff --git a/unzip.c b/unzip.c
> -index 2d94a38..ca135af 100644
> ---- a/unzip.c
> -+++ b/unzip.c
> -@@ -1079,7 +1079,7 @@ int unzip(__G__ argc, argv)
> - #ifndef _WIN32_WCE /* Win CE does not support environment variables */
> -         if ((error = envargs(&argc, &argv,
LoadFarStringSmall(EnvZipInfo),
> -                              LoadFarStringSmall2(EnvZipInfo2))) !=
PK_OK)
> --            perror(LoadFarString(NoMemEnvArguments));
> -+            perror((char*)(NoMemEnvArguments));
> - #endif
> -     } else
> - #endif /* !NO_ZIPINFO */
> -@@ -1088,7 +1088,7 @@ int unzip(__G__ argc, argv)
> - #ifndef _WIN32_WCE /* Win CE does not support environment variables */
> -         if ((error = envargs(&argc, &argv, LoadFarStringSmall(EnvUnZip),
> -                              LoadFarStringSmall2(EnvUnZip2))) != PK_OK)
> --            perror(LoadFarString(NoMemEnvArguments));
> -+            perror((char*)(NoMemEnvArguments));
> - #endif
> -     }
> +         }
> +@@ -674,7 +674,7 @@ int get_time_stamp(__G__ last_modtime, nmember)  /*
return PK-type error code */
> +
---------------------------------------------------------------------------*/
>
> +     if (memcmp(G.sig, end_central_sig, 4)) {    /* just to make sure
again */
> +-        Info(slide, 0x401, ((char *)slide, LoadFarString(EndSigMsg)));
> ++        Info(slide, 0x401, ((char *)slide, "%s",
LoadFarString(EndSigMsg)));
> +         error_in_archive = PK_WARN;
> +     }
> +     if (*nmember == 0L && error_in_archive <= PK_WARN)
>  diff --git a/zipinfo.c b/zipinfo.c
> -index 0ac75b3..8a0887c 100644
> +index 0ac75b3..1e7fa82 100644
>  --- a/zipinfo.c
>  +++ b/zipinfo.c
> -@@ -1640,14 +1640,14 @@ static int zi_long(__G__ pEndprev,
error_in_archive)
> +@@ -833,7 +833,7 @@ int zipinfo(__G)   /* return PK-type error code */
> +                 Info(slide, 0x401,
> +                      ((char *)slide, LoadFarString(CentSigMsg), j));
> +                 Info(slide, 0x401,
> +-                     ((char *)slide, LoadFarString(ReportMsg)));
> ++                     ((char *)slide, "%s", LoadFarString(ReportMsg)));
> +                 error_in_archive = PK_BADERR;   /* sig not found */
> +                 break;
> +             }
> +@@ -1022,7 +1022,7 @@ int zipinfo(__G)   /* return PK-type error code */
> +             && (!G.ecrec.is_zip64_archive)
> +             && (memcmp(G.sig, end_central_sig, 4) != 0)
> +            ) {          /* just to make sure again */
> +-            Info(slide, 0x401, ((char *)slide,
LoadFarString(EndSigMsg)));
> ++            Info(slide, 0x401, ((char *)slide, "%s",
LoadFarString(EndSigMsg)));
> +             error_in_archive = PK_WARN;   /* didn't find sig */
> +         }
>
> -                         *types = '\0';
> -                         if (*ef_ptr & 1) {
> --                            strcpy(types,
LoadFarString(UTmodification));
> -+                            strcpy(types, (char*)(UTmodification));
> -                             ++num;
> -                         }
> -                         if (*ef_ptr & 2) {
> -                             len = strlen(types);
> -                             if (num)
> -                                 types[len++] = '/';
> --                            strcpy(types+len, LoadFarString(UTaccess));
> -+                            strcpy(types+len, (char*)(UTaccess));
> -                             ++num;
> -                             if (*pEndprev > 0L)
> -                                 *pEndprev += 4L;
> -@@ -1656,7 +1656,7 @@ static int zi_long(__G__ pEndprev,
error_in_archive)
> -                             len = strlen(types);
> -                             if (num)
> -                                 types[len++] = '/';
> --                            strcpy(types+len,
LoadFarString(UTcreation));
> -+                            strcpy(types+len, (char *)(UTcreation));
> -                             ++num;
> -                             if (*pEndprev > 0L)
> -                                 *pEndprev += 4L;
> -@@ -2331,7 +2331,7 @@ static char *zi_time(__G__ datetimez, modtimez,
d_t_str)
> -             /* time conversion error in verbose listing format,
> -              * return string with '?' instead of data
> -              */
> --            return (strcpy(d_t_str, LoadFarString(lngYMDHMSTimeError)));
> -+            return (strcpy(d_t_str, (char*)(lngYMDHMSTimeError)));
> -     } else
> -         t = (struct tm *)NULL;
> -     if (t != (struct tm *)NULL) {
> -
> --
> 2.9.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a1141c9f87df098053b44d4e9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 30 August 2016 at 05:17, Edwin Plauchu &lt;<a href=3D"m=
ailto:edwin.plauchu.camacho@linux.intel.com">edwin.plauchu.camacho@linux.in=
tel.com</a>&gt; wrote:<br>&gt;<br>&gt; From: Edwin Plauchu &lt;<a href=3D"m=
ailto:edwin.plauchu.camacho@intel.com">edwin.plauchu.camacho@intel.com</a>&=
gt;<br>&gt;<br>&gt; This fixes commit 763a3d424bccf559a8d6add3dc1f2746c82f2=
933<br>&gt;<br>&gt; Output was strange when using unzip to extract zip file=
.<br>&gt; This patch fixed so.<br>&gt;<br>&gt; [YOCTO #9551]<br>&gt;<br>&gt=
; Signed-off-by: Edwin Plauchu &lt;<a href=3D"mailto:edwin.plauchu.camacho@=
intel.com">edwin.plauchu.camacho@intel.com</a>&gt;<br>&gt; ---<br>&gt; =C2=
=A0.../unzip/unzip/fix-security-format.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 198 ++++++++-------------<br>&gt; =C2=A01 file changed, 78 insertio=
ns(+), 120 deletions(-)<br>&gt;<br>&gt; diff --git a/meta/recipes-extended/=
unzip/unzip/fix-security-format.patch b/meta/recipes-extended/unzip/unzip/f=
ix-security-format.patch<br>&gt; index c82f502..8e9b06c 100644<br>&gt; --- =
a/meta/recipes-extended/unzip/unzip/fix-security-format.patch<br>&gt; +++ b=
/meta/recipes-extended/unzip/unzip/fix-security-format.patch<br>&gt; @@ -9,=
131 +9,89 @@ Upstream-Status: Pending<br>&gt;<br>&gt; =C2=A0Signed-off-by: =
Edwin Plauchu &lt;<a href=3D"mailto:edwin.plauchu.camacho@intel.com">edwin.=
plauchu.camacho@intel.com</a>&gt;<br>&gt;<br>&gt; -diff --git a/unzpriv.h b=
/unzpriv.h<br>&gt; -index c8d3eab..85e693a 100644<br>&gt; ---- a/unzpriv.h<=
br>&gt; -+++ b/unzpriv.h<br>&gt; -@@ -1006,7 +1006,7 @@<br>&gt; - # =C2=A0 =
=C2=A0define LoadFarStringSmall(x) =C2=A0 Qstrfix(x)<br>&gt; - # =C2=A0 =C2=
=A0define LoadFarStringSmall2(x) =C2=A0Qstrfix(x)<br>&gt; - # =C2=A0else<br=
>&gt; --# =C2=A0 =C2=A0define LoadFarString(x) =C2=A0 =C2=A0 =C2=A0 =C2=A0(=
char *)(x)<br>&gt; -+# =C2=A0 =C2=A0define LoadFarString(x) =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&quot;%s&quot;,(char *)(x)<br><br>LoadFarString is used a _lot=
_ in various different ways, usually as argument to another macro or functi=
on. This sort of macro change seems potentially very dangerous in C, have y=
ou checked this is ok in every case?.<br><br>I gave an example from extract=
.c in the bug report:<div><br></div><div>=C2=A0 =C2=A0 Info(slide, 0x201, (=
(char *)slide,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 LoadFarString(SymLnkWarnInval=
id), FnFilter1(linkfname)))<br><br>may end up calling sprintf like this:<br=
><br></div><div>=C2=A0 =C2=A0 sprintf ((char *)slide,<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 LoadFarString(SymLnkWarnInvalid),=C2=A0FnFilter1(linkfname))<br>=
<br>That still seems unlikely to work with the proposed LoadFarString chang=
e.<br><br></div><div>another example below.</div><div><br></div><div>&gt; -=
 # =C2=A0 =C2=A0define LoadFarStringSmall(x) =C2=A0 (char *)(x)<br>&gt; - #=
 =C2=A0 =C2=A0define LoadFarStringSmall2(x) =C2=A0(char *)(x)<br>&gt; - # =
=C2=A0endif<br>&gt; -diff --git a/fileio.c b/fileio.c<br>&gt; -index 36bfea=
3..ca779c2 100644<br>&gt; ---- a/fileio.c<br>&gt; -+++ b/fileio.c<br>&gt; -=
@@ -588,8 +588,8 @@ unsigned readbuf(__G__ buf, size) =C2=A0 /* return numb=
er of bytes read into buf */<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 else if (G.incnt &lt; 0) {<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* another hack, but no real harm copying same thi=
ng twice */<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (*G.message)((zvoid *)&amp;G,<br>&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(uch *)LoadFarString(ReadError), =C2=A0/*=
 CANNOT use slide */<br>&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(ulg)strlen(LoadFarString(ReadError)), 0x401);<br>&gt; =
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(uch *)(ch=
ar*)(ReadError), =C2=A0/* CANNOT use slide */<br>&gt; -+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(ulg)strlen((char*)(ReadError)=
), 0x401);<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return 0; =C2=A0/* discarding some data; better than lock-up */<br>&gt;=
 - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt; - =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* buffer ALWAYS starts on a block boundary: =C2=
=A0*/<br>&gt; -@@ -631,8 +631,8 @@ int readbyte(__G) =C2=A0 /* refill inbuf=
 and return a byte if available, else EOF */<br>&gt; - =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 } else if (G.incnt &lt; 0) { =C2=A0/* &quot;fail&quot; (abort, retr=
y, ...) returns this */<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 /* another hack, but no real harm copying same thing twice */<br>&gt; - =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (*G.message)((zvoid *)&amp;G,<br>=
&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(uch *)LoadFarStrin=
g(ReadError),<br>&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(u=
lg)strlen(LoadFarString(ReadError)), 0x401);<br>&gt; -+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(uch *)(char*)(ReadError),<br>&gt; -+ =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(ulg)strlen((char*)(ReadError)), =
0x401);<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echon();<br>&gt=
; - #ifdef WINDLL<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 longj=
mp(dll_error_return, 1);<br>&gt; -@@ -1356,7 +1356,7 @@ int UZ_EXP UzpMessa=
gePrnt(pG, buf, size, flag)<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ++((Uz_Globs *)pG)-&gt;lines;<br>&gt; - =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (((Uz_Globs *)pG)-&gt;lines &g=
t;=3D ((Uz_Globs *)pG)-&gt;height)<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (*((Uz_Globs *)pG)-&gt;mpause)((z=
void *)pG,<br>&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0LoadFarString(MorePrompt), 1);<br>&gt; -+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(char*=
)(MorePrompt), 1);<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br=
>&gt; - #endif /* MORE */<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (MSG_STDERR(flag) &amp;&amp; ((Uz_Globs *)pG)-&gt;UzO.tflag &amp;&am=
p;<br>&gt; -@@ -1416,7 +1416,7 @@ int UZ_EXP UzpMessagePrnt(pG, buf, size, =
flag)<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ((Uz_Globs *)pG)-&gt;sol =3D TRUE;<br>&gt; - =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q =3D p + 1;<br>&gt; -=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (*((=
Uz_Globs *)pG)-&gt;mpause)((zvoid *)pG,<br>&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LoadFarString(MorePromp=
t), 1);<br>&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0(char*)(MorePrompt), 1);<br>&gt; +diff --git a/extract.=
c b/extract.c<br>&gt; +index 7cd9123..25c5a62 100644<br>&gt; +--- a/extract=
.c<br>&gt; ++++ b/extract.c<br>&gt; +@@ -475,7 +475,7 @@ int extract_or_tes=
t_files(__G) =C2=A0 =C2=A0/* return PK-type error code */<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Info(slide, =
0x401, ((char *)slide,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LoadFarString(CentSigMsg), j + blknum*DI=
R_BLKSIZ + 1));<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Info(slide, 0x401, ((char *)slide,<br>&gt; +- =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LoadFa=
rString(ReportMsg)));<br>&gt; ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s&quot;,LoadFarString(ReportMsg)))=
;<br><br></div><div>AFAICS this may end up as:</div><div>=C2=A0 =C2=A0 spri=
ntf ((char *)slide, &quot;%s&quot;, LoadFarString(ReportMsg))</div><div>whi=
ch with the new macro definition would mean:</div><div>=C2=A0 =C2=A0=C2=A0s=
printf ((char *)slide, &quot;%s&quot;,=C2=A0&quot;%s&quot;, (char *)(Report=
Msg))</div><div><br></div><div>This also seems unlikely to do what was mean=
t.</div><div><br></div><div>Jussi</div><div><br></div><div>&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_in_arc=
hive =3D PK_BADERR;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 }<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 reached_end =3D TRUE; =C2=A0 =C2=A0 /* ...so no more left to do =
*/<br>&gt; +@@ -754,8 +754,8 @@ int extract_or_test_files(__G) =C2=A0 =C2=
=A0/* return PK-type error code */<br>&gt; +<br>&gt; + #ifndef SFX<br>&gt; =
+ =C2=A0 =C2=A0 if (no_endsig_found) { =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* just to make sure */<br>&gt; +-=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0Info(slide, 0x401, ((char *)slide, LoadFarStrin=
g(EndSigMsg)));<br>&gt; +- =C2=A0 =C2=A0 =C2=A0 =C2=A0Info(slide, 0x401, ((=
char *)slide, LoadFarString(ReportMsg)));<br>&gt; ++ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Info(slide, 0x401, ((char *)slide, &quot;%s&quot;, LoadFarString(EndS=
igMsg)));<br>&gt; ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0Info(slide, 0x401, ((char *=
)slide, &quot;%s&quot;, LoadFarString(ReportMsg)));<br>&gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 if (!error_in_archive) =C2=A0 =C2=A0 =C2=A0 /* don&#39;t ove=
rwrite stronger error */<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 error_in_archive =3D PK_WARN;<br>&gt; + =C2=A0 =C2=A0 }<br>&gt; +diff -=
-git a/list.c b/list.c<br>&gt; +index 15e0011..0b484f6 100644<br>&gt; +--- =
a/list.c<br>&gt; ++++ b/list.c<br>&gt; +@@ -181,7 +181,7 @@ int list_files(=
__G) =C2=A0 =C2=A0/* return PK-type error code */<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Info(slide, 0x401,<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((=
char *)slide, LoadFarString(CentSigMsg), j));<br>&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Info(slide, 0x401,<br>&gt; +- =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((char *)sl=
ide, LoadFarString(ReportMsg)));<br>&gt; ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((char *)slide, &quot;%s&quot;, Load=
FarString(ReportMsg)));<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 return PK_BADERR; =C2=A0 /* sig not found */<br>&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 INCSTR(p);<br>&gt; -@@ -2176,7 +2176,7 @@ int do_strin=
g(__G__ length, option) =C2=A0 /* return PK-type error code */<br>&gt; - =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (*G.m=
essage)((zvoid *)&amp;G, slide, (ulg)(q-slide), 0);<br>&gt; - =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q =3D slide;<br>&g=
t; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
if (pause &amp;&amp; G.extract_flag) /* don&#39;t pause for list/test */<br=
>&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(*G.mpause)((zvoid *)&amp;G, LoadFarString(QuitPrompt), 0)=
;<br>&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0(*G.mpause)((zvoid *)&amp;G, (char*)(QuitPrompt), 0);<=
br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt;=
 + =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt; +@@ -507,7 +507,7 @@ int list_file=
s(__G) =C2=A0 =C2=A0/* return PK-type error code */<br>&gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (!G.ecrec.is_zip64_archive)<br>&gt;=
 + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (memcmp(G.sig, end_=
central_sig, 4) !=3D 0)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
) { =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* just to make sure again */<br>&gt;=
 +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Info(slide, 0x401, ((char *)sl=
ide, LoadFarString(EndSigMsg)));<br>&gt; ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Info(slide, 0x401, ((char *)slide, &quot;%s&quot;, LoadFarString(=
EndSigMsg)));<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_in_=
archive =3D PK_WARN; =C2=A0 /* didn&#39;t find sig */<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 }<br>&gt; +<br>&gt; +@@ -591,7 +591,7 @@ int get_time_sta=
mp(__G__ last_modtime, nmember) =C2=A0/* return PK-type error code */<br>&g=
t; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Info(slide, 0x=
401,<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0((char *)slide, LoadFarString(CentSigMsg), j));<br>&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Info(slide, 0x401,<=
br>&gt; +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ((char *)slide, LoadFarString(ReportMsg)));<br>&gt; ++ =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((char *)slide, &q=
uot;%s&quot;, LoadFarString(ReportMsg)));<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PK_BADERR; =C2=A0 /* sig not foun=
d */<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt; - =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (*G.message)((zvoid *)&amp;G, sli=
de, (ulg)(q-slide), 0);<br>&gt; -diff --git a/unzip.c b/unzip.c<br>&gt; -in=
dex 2d94a38..ca135af 100644<br>&gt; ---- a/unzip.c<br>&gt; -+++ b/unzip.c<b=
r>&gt; -@@ -1079,7 +1079,7 @@ int unzip(__G__ argc, argv)<br>&gt; - #ifndef=
 _WIN32_WCE /* Win CE does not support environment variables */<br>&gt; - =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((error =3D envargs(&amp;argc, &amp;argv, Lo=
adFarStringSmall(EnvZipInfo),<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LoadFa=
rStringSmall2(EnvZipInfo2))) !=3D PK_OK)<br>&gt; -- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0perror(LoadFarString(NoMemEnvArguments));<br>&gt; -+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perror((char*)(NoMemEnvArguments))=
;<br>&gt; - #endif<br>&gt; - =C2=A0 =C2=A0 } else<br>&gt; - #endif /* !NO_Z=
IPINFO */<br>&gt; -@@ -1088,7 +1088,7 @@ int unzip(__G__ argc, argv)<br>&gt=
; - #ifndef _WIN32_WCE /* Win CE does not support environment variables */<=
br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((error =3D envargs(&amp;argc, &am=
p;argv, LoadFarStringSmall(EnvUnZip),<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0LoadFarStringSmall2(EnvUnZip2))) !=3D PK_OK)<br>&gt; -- =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0perror(LoadFarString(NoMemEnvArguments));<br>&gt=
; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perror((char*)(NoMemEnvArgume=
nts));<br>&gt; - #endif<br>&gt; - =C2=A0 =C2=A0 }<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 }<br>&gt; +@@ -674,7 +674,7 @@ int get_time_stamp(__G__ last_=
modtime, nmember) =C2=A0/* return PK-type error code */<br>&gt; + =C2=A0 --=
-------------------------------------------------------------------------*/=
<br>&gt;<br>&gt; + =C2=A0 =C2=A0 if (memcmp(G.sig, end_central_sig, 4)) { =
=C2=A0 =C2=A0/* just to make sure again */<br>&gt; +- =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Info(slide, 0x401, ((char *)slide, LoadFarString(EndSigMsg)));<br>&gt=
; ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0Info(slide, 0x401, ((char *)slide, &quot;%s=
&quot;, LoadFarString(EndSigMsg)));<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 e=
rror_in_archive =3D PK_WARN;<br>&gt; + =C2=A0 =C2=A0 }<br>&gt; + =C2=A0 =C2=
=A0 if (*nmember =3D=3D 0L &amp;&amp; error_in_archive &lt;=3D PK_WARN)<br>=
&gt; =C2=A0diff --git a/zipinfo.c b/zipinfo.c<br>&gt; -index 0ac75b3..8a088=
7c 100644<br>&gt; +index 0ac75b3..1e7fa82 100644<br>&gt; =C2=A0--- a/zipinf=
o.c<br>&gt; =C2=A0+++ b/zipinfo.c<br>&gt; -@@ -1640,14 +1640,14 @@ static i=
nt zi_long(__G__ pEndprev, error_in_archive)<br>&gt; +@@ -833,7 +833,7 @@ i=
nt zipinfo(__G) =C2=A0 /* return PK-type error code */<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Info(slide, 0x401,<br>&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0((char *)slide, LoadFarString(CentSigMsg), j));<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Info(slide, 0x401,<br>&gt; +- =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((char *=
)slide, LoadFarString(ReportMsg)));<br>&gt; ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((char *)slide, &quot;%s&quot;, L=
oadFarString(ReportMsg)));<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 error_in_archive =3D PK_BADERR; =C2=A0 /* sig not found *=
/<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<=
br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt; +@@ -1022,7 +=
1022,7 @@ int zipinfo(__G) =C2=A0 /* return PK-type error code */<br>&gt; +=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (!G.ecrec.is_zip64_ar=
chive)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (memc=
mp(G.sig, end_central_sig, 4) !=3D 0)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0) { =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* just to make sure ag=
ain */<br>&gt; +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Info(slide, 0x40=
1, ((char *)slide, LoadFarString(EndSigMsg)));<br>&gt; ++ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0Info(slide, 0x401, ((char *)slide, &quot;%s&quot;, =
LoadFarString(EndSigMsg)));<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 error_in_archive =3D PK_WARN; =C2=A0 /* didn&#39;t find sig */<br>&g=
t; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt;<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *types =3D &=
#39;\0&#39;;<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*ef_ptr &amp; 1) {<br>&gt; -- =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0strcpy(types, LoadFarString(UTmodification));<br>&gt; -+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0strcpy(types, (char*)(UTmodification));<br>&gt; - =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ++num;<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>&gt; - =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
f (*ef_ptr &amp; 2) {<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D strlen(type=
s);<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (num)<br>&gt; - =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 types[len++] =3D &#39;/&#39;;<br>&gt; -- =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0strcpy(types+len, LoadFarString(UTaccess));<br>&gt; -+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0strcpy(types+len, (char*)(UTaccess));<br>&gt; - =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ++num;<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*pEndprev &gt; 0L)=
<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *pEndprev +=3D 4L;<br>&gt;=
 -@@ -1656,7 +1656,7 @@ static int zi_long(__G__ pEndprev, error_in_archive=
)<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D strlen(types);<br>&gt; - =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (num)<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
ypes[len++] =3D &#39;/&#39;;<br>&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strcpy(types+=
len, LoadFarString(UTcreation));<br>&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strcpy(ty=
pes+len, (char *)(UTcreation));<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ++num;<b=
r>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (*pEndprev &gt; 0L)<br>&gt; - =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 *pEndprev +=3D 4L;<br>&gt; -@@ -2331,7 +2331,7 =
@@ static char *zi_time(__G__ datetimez, modtimez, d_t_str)<br>&gt; - =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* time conversion error in verbose =
listing format,<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*=
 return string with &#39;?&#39; instead of data<br>&gt; - =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return (strcpy(d_t_str, LoadFarString(lngYMDHMSTimeError)));<b=
r>&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (strcpy(d_t_str, =
(char*)(lngYMDHMSTimeError)));<br>&gt; - =C2=A0 =C2=A0 } else<br>&gt; - =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 t =3D (struct tm *)NULL;<br>&gt; - =C2=A0 =C2=A0 i=
f (t !=3D (struct tm *)NULL) {<br>&gt; -<br>&gt; --<br>&gt; 2.9.3<br>&gt;<b=
r>&gt; --<br>&gt; _______________________________________________<br>&gt; O=
penembedded-core mailing list<br>&gt; <a href=3D"mailto:Openembedded-core@l=
ists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>&gt;=
 <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a></di=
v></div>

--001a1141c9f87df098053b44d4e9--
