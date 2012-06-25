Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SjBvc-0007nB-Ur
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 18:14:17 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 25 Jun 2012 09:03:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="160439109"
Received: from unknown (HELO [10.255.12.180]) ([10.255.12.180])
	by azsmga001.ch.intel.com with ESMTP; 25 Jun 2012 09:03:24 -0700
Message-ID: <4FE88BCC.1010503@linux.intel.com>
Date: Mon, 25 Jun 2012 09:03:24 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1340179070-6095-1-git-send-email-valentin.popa@intel.com>
In-Reply-To: <1340179070-6095-1-git-send-email-valentin.popa@intel.com>
Subject: Re: [PATCH] xev: updated to 1.2.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jun 2012 16:14:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/20/2012 12:57 AM, Valentin Popa wrote:
> tested on sato
>
> Signed-off-by: Valentin Popa<valentin.popa@intel.com>
> ---
>   meta/recipes-graphics/xorg-app/xev/diet-x11.patch  |   38 ++++++++++----------
>   .../xorg-app/{xev_1.0.3.bb =>  xev_1.2.0.bb}        |    6 ++--
>   2 files changed, 22 insertions(+), 22 deletions(-)
>   rename meta/recipes-graphics/xorg-app/{xev_1.0.3.bb =>  xev_1.2.0.bb} (33%)
>
> diff --git a/meta/recipes-graphics/xorg-app/xev/diet-x11.patch b/meta/recipes-graphics/xorg-app/xev/diet-x11.patch
> index 139838c..6130959 100644
> --- a/meta/recipes-graphics/xorg-app/xev/diet-x11.patch
> +++ b/meta/recipes-graphics/xorg-app/xev/diet-x11.patch
> @@ -4,11 +4,11 @@ Upstream-Status: Inappropriate [disable feature]
>    xev.c |   16 ++++++++--------
>    1 file changed, 8 insertions(+), 8 deletions(-)
>
> -Index: xev-1.0.2/xev.c
> +Index: xev-1.2.0/xev.c
>   ===================================================================
> ---- xev-1.0.2.orig/xev.c	2006-06-02 00:25:44.000000000 +0100
> -+++ xev-1.0.2/xev.c	2007-05-10 15:22:07.000000000 +0100
> -@@ -109,7 +109,7 @@ do_KeyPress (XEvent *eventp)
> +--- xev-1.2.0.orig/xev.c
> ++++ xev-1.2.0/xev.c
> +@@ -116,7 +116,7 @@ do_KeyPress (XEvent *eventp)
>        nbytes = XLookupString (e, str, 256,&ks, NULL);
>
>        /* not supposed to call XmbLookupString on a key release event */
> @@ -17,7 +17,7 @@ Index: xev-1.0.2/xev.c
>            do {
>                nmbbytes = XmbLookupString (xic, e, buf, bsize - 1,&ks,&status);
>                buf[nmbbytes] = '\0';
> -@@ -119,7 +119,7 @@ do_KeyPress (XEvent *eventp)
> +@@ -126,7 +126,7 @@ do_KeyPress (XEvent *eventp)
>                    buf = realloc (buf, bsize);
>                }
>            } while (status == XBufferOverflow);
> @@ -26,7 +26,7 @@ Index: xev-1.0.2/xev.c
>
>        if (ks == NoSymbol)
>    	ksname = "NoSymbol";
> -@@ -149,7 +149,7 @@ do_KeyPress (XEvent *eventp)
> +@@ -156,7 +156,7 @@ do_KeyPress (XEvent *eventp)
>        }
>
>        /* not supposed to call XmbLookupString on a key release event */
> @@ -35,16 +35,16 @@ Index: xev-1.0.2/xev.c
>            printf ("    XmbLookupString gives %d bytes: ", nmbbytes);
>            if (nmbbytes>  0) {
>               dump (buf, nmbbytes);
> -@@ -157,7 +157,7 @@ do_KeyPress (XEvent *eventp)
> +@@ -164,7 +164,7 @@ do_KeyPress (XEvent *eventp)
>            } else {
>        	   printf ("\n");
>            }
>   -    }
>   +    } */
>
> -     printf ("    XFilterEvent returns: %s\n",
> +     printf ("    XFilterEvent returns: %s\n",
>    	    XFilterEvent (eventp, e->window) ? "True" : "False");
> -@@ -804,7 +804,7 @@ main (int argc, char **argv)
> +@@ -1015,7 +1015,7 @@ main (int argc, char **argv)
>            fprintf (stderr, "%s:  XSetLocaleModifiers failed\n", ProgramName);
>        }
>
> @@ -53,30 +53,30 @@ Index: xev-1.0.2/xev.c
>        if (xim == NULL) {
>            fprintf (stderr, "%s:  XOpenIM failed\n", ProgramName);
>        }
> -@@ -831,7 +831,7 @@ main (int argc, char **argv)
> +@@ -1042,7 +1042,7 @@ main (int argc, char **argv)
>                }
>                XFree (xim_styles);
>            }
> --    }
> -+    }*/
> +-    }
> ++	}*/
>
>        screen = DefaultScreen (dpy);
>
> -@@ -891,7 +891,7 @@ main (int argc, char **argv)
> +@@ -1109,7 +1109,7 @@ main (int argc, char **argv)
>    	printf ("Outer window is 0x%lx, inner window is 0x%lx\n", w, subw);
>        }
>
>   -    if (xim&&  xim_style) {
>   +    /*if (xim&&  xim_style) {
> -         xic = XCreateIC (xim,
> -                          XNInputStyle, xim_style,
> -                          XNClientWindow, w,
> -@@ -901,7 +901,7 @@ main (int argc, char **argv)
> +         xic = XCreateIC (xim,
> +                          XNInputStyle, xim_style,
> +                          XNClientWindow, w,
> +@@ -1119,7 +1119,7 @@ main (int argc, char **argv)
>            if (xic == NULL) {
>                fprintf (stderr, "XCreateIC failed\n");
>            }
>   -    }
>   +    }*/
>
> -     for (done = 0; !done; ) {
> - 	XEvent event;
> +     have_rr = XRRQueryExtension (dpy,&rr_event_base,&rr_error_base);
> +     if (have_rr) {
> diff --git a/meta/recipes-graphics/xorg-app/xev_1.0.3.bb b/meta/recipes-graphics/xorg-app/xev_1.2.0.bb
> similarity index 33%
> rename from meta/recipes-graphics/xorg-app/xev_1.0.3.bb
> rename to meta/recipes-graphics/xorg-app/xev_1.2.0.bb
> index 21ba62e..b340409 100644
> --- a/meta/recipes-graphics/xorg-app/xev_1.0.3.bb
> +++ b/meta/recipes-graphics/xorg-app/xev_1.2.0.bb
> @@ -1,10 +1,10 @@
>   require xorg-app-common.inc
> -LIC_FILES_CHKSUM = "file://xev.c;startline=0;endline=35;md5=db2e69260ca64f1d332efa6ab4b7e2b5"
> +LIC_FILES_CHKSUM = "file://xev.c;startline=0;endline=35;md5=2f39a0038b59269c1e62efae64cfd056"
>   DESCRIPTION = "X Event Viewer"
>   LICENSE = "MIT"
>   PE = "1"
>
>   SRC_URI += "file://diet-x11.patch"
>
> -SRC_URI[md5sum] = "a9532c3d1683c99bb5df1895cb3a60b1"
> -SRC_URI[sha256sum] = "d4ac7ae154ee9733be27a5f55586abb9362c768f5fb8a4fc7fd2645100a9313a"
> +SRC_URI[md5sum] = "2727c72f3eba0c23f8f6b2e618d195a2"
> +SRC_URI[sha256sum] = "3786a77dab17741d508d5d117a0ff33bb6eabf93e0935388b5f920bfcf2fb38f"

Merged into OE-Core

Thanks
	Sau!


