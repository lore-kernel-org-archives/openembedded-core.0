Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7B5767C420
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 14:37:36 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id u9so3851346pfn.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 07:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=OwsntoxUa9Tsu98/XPqzzSsaJpgBnFZua4vowj9UfsI=;
	b=hFPBgkA7rsc4pVL7FZQ1t5naPvWyTMrUJS5YW/Q4aqoJwnnsf4VVjsSQWPULZ39L9K
	MRNVX1jY5hVgC+0JUmfcedgWBwPcFvRGI3CCqBRDG3ZrkXRgwl2/tvQ4ZfPX3koUA8d0
	kwIGyHhRvzktHKVktap2Br1JRQjDS7UmQ/C2Teh4Nj3aiqg/pFmFqUHNa4NEDXlVdsYa
	f3lbrbpao69NfRf4iRB2Nj+7bI1uImJ+LQc9QbNpSmvl6zm871mOnI1mqwQapYRl9dVC
	FF2fPeWh3OOkSZHoc97gYfW9Uhe8gDJoVzOk7TWV4RHgyQV1fFf3YZvZ3QJ65BouGsxS
	JgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=OwsntoxUa9Tsu98/XPqzzSsaJpgBnFZua4vowj9UfsI=;
	b=C+LzPHBpm20gFNvF3gP47UoyPXqh/tk5xoiv+DGPJDVrBfY1Q9c8ZNYo55C9mvZFUo
	jyT+swUV91KYAfAXWaKAGavVJHc2D5H6JIq8A19AV/V7YPFK40RvCocoOZPkPtx0V6y1
	0roB63vaeOmUUQ3RvEwn62BKal4qAeRXtljXRJZtoq5RGa45RCZmIHnyzjmIgTuWl2gc
	JiciLHTdspK70w8d6GnCcBxME/YRDKi32qr/ZCfn8xwLWupwQ3UUeRfnLwB25egknZzw
	Ol/SaSB3uAKrKIg5UgdC1qLpc2/Q9UfjdG9vGqmCUk0uzaXpIegQA4k8je08BVxmCWNC
	nI+A==
X-Gm-Message-State: APjAAAXTuMxNlqQcpp1l25cioLF1Zy4m8i01EQwa/VRXmwxL+q+NHDoc
	IVJSQ4StZYytMVwYbQ+CRbm7ShTj
X-Google-Smtp-Source: APXvYqwsldsXLK0JYp9tXyY2MCPE++71oAVN5kf+3m1XEGCN29Rt93sRNxY0agZAyNfpkictQ/Mu8A==
X-Received: by 2002:a17:902:b193:: with SMTP id
	s19mr17111046plr.22.1552315057260; 
	Mon, 11 Mar 2019 07:37:37 -0700 (PDT)
Received: from [172.16.1.183] (50-196-139-177-static.hfc.comcastbusiness.net.
	[50.196.139.177]) by smtp.gmail.com with ESMTPSA id
	f28sm10074318pfh.178.2019.03.11.07.37.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Mar 2019 07:37:36 -0700 (PDT)
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1552241263-26116-1-git-send-email-akuster808@gmail.com>
	<1552241263-26116-7-git-send-email-akuster808@gmail.com>
	<38a64e3113ab878066dab3c2dea49573a12b80be.camel@intel.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <a8c41120-3c9f-ee52-7553-3a70bbdde4f4@gmail.com>
Date: Mon, 11 Mar 2019 07:37:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <38a64e3113ab878066dab3c2dea49573a12b80be.camel@intel.com>
Subject: Re: [PATCH 07/12] xev: update to 1.2.3
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
X-List-Received-Date: Mon, 11 Mar 2019 14:37:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/11/19 1:04 AM, Mittal, Anuj wrote:
> Looks like this is failing with musl:
Of course, anything will fall over with a little musl applied against it ; )

>
> https://errors.yoctoproject.org/Errors/Details/232435/

thanks,
armin
>
> On Sun, 2019-03-10 at 11:07 -0700, Armin Kuster wrote:
>> refactor diet-x11 patch
>>
>> LIC_FILES_CHKSUM changed to do merging of copyright/license notices
>> https://gitlab.freedesktop.org/xorg/app/mkfontscale/commit/8609ad731b9c9c670a815c915055ae416d2396d8
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  meta/recipes-graphics/xorg-app/xev/diet-x11.patch  | 79
>> ++++++++++++----------
>>  .../xorg-app/{xev_1.2.2.bb => xev_1.2.3.bb}        |  4 +-
>>  2 files changed, 46 insertions(+), 37 deletions(-)
>>  rename meta/recipes-graphics/xorg-app/{xev_1.2.2.bb => xev_1.2.3.bb}
>> (77%)
>>
>> diff --git a/meta/recipes-graphics/xorg-app/xev/diet-x11.patch
>> b/meta/recipes-graphics/xorg-app/xev/diet-x11.patch
>> index 6130959..b4415e3 100644
>> --- a/meta/recipes-graphics/xorg-app/xev/diet-x11.patch
>> +++ b/meta/recipes-graphics/xorg-app/xev/diet-x11.patch
>> @@ -4,79 +4,88 @@ Upstream-Status: Inappropriate [disable feature]
>>   xev.c |   16 ++++++++--------
>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>  
>> -Index: xev-1.2.0/xev.c
>> +Index: xev-1.2.3/xev.c
>>  ===================================================================
>> ---- xev-1.2.0.orig/xev.c
>> -+++ xev-1.2.0/xev.c
>> -@@ -116,7 +116,7 @@ do_KeyPress (XEvent *eventp)
>> -     nbytes = XLookupString (e, str, 256, &ks, NULL);
>> +--- xev-1.2.3.orig/xev.c
>> ++++ xev-1.2.3/xev.c
>> +@@ -125,7 +125,7 @@ do_KeyPress(XEvent *eventp)
>> +     nbytes = XLookupString(e, str, 256, &ks, NULL);
>>   
>>       /* not supposed to call XmbLookupString on a key release event
>> */
>>  -    if (e->type == KeyPress && xic) {
>>  +    /*if (e->type == KeyPress && xic) {
>>           do {
>> -             nmbbytes = XmbLookupString (xic, e, buf, bsize - 1,
>> &ks, &status);
>> +             nmbbytes = XmbLookupString(xic, e, buf, bsize - 1, &ks,
>> &status);
>>               buf[nmbbytes] = '\0';
>> -@@ -126,7 +126,7 @@ do_KeyPress (XEvent *eventp)
>> -                 buf = realloc (buf, bsize);
>> +@@ -135,7 +135,7 @@ do_KeyPress(XEvent *eventp)
>> +                 buf = realloc(buf, bsize);
>>               }
>>           } while (status == XBufferOverflow);
>>  -    }
>>  +    }*/
>>   
>>       if (ks == NoSymbol)
>> - 	ksname = "NoSymbol";
>> -@@ -156,7 +156,7 @@ do_KeyPress (XEvent *eventp)
>> +         ksname = "NoSymbol";
>> +@@ -168,7 +168,7 @@ do_KeyPress(XEvent *eventp)
>>       }
>>   
>>       /* not supposed to call XmbLookupString on a key release event
>> */
>>  -    if (e->type == KeyPress && xic) {
>> -+    /*if (e->type == KeyPress && xic) {
>> -         printf ("    XmbLookupString gives %d bytes: ", nmbbytes);
>> ++    /* if (e->type == KeyPress && xic) {
>> +         printf("    XmbLookupString gives %d bytes: ", nmbbytes);
>>           if (nmbbytes > 0) {
>> -            dump (buf, nmbbytes);
>> -@@ -164,7 +164,7 @@ do_KeyPress (XEvent *eventp)
>> -         } else {
>> -     	   printf ("\n");
>> +             dump(buf, nmbbytes);
>> +@@ -177,7 +177,7 @@ do_KeyPress(XEvent *eventp)
>> +         else {
>> +             printf("\n");
>>           }
>>  -    }
>>  +    } */
>>   
>> -     printf ("    XFilterEvent returns: %s\n",
>> - 	    XFilterEvent (eventp, e->window) ? "True" : "False");
>> -@@ -1015,7 +1015,7 @@ main (int argc, char **argv)
>> -         fprintf (stderr, "%s:  XSetLocaleModifiers failed\n",
>> ProgramName);
>> +     printf("    XFilterEvent returns: %s\n",
>> +            XFilterEvent(eventp, e->window) ? "True" : "False");
>> +@@ -1141,7 +1141,7 @@ parse_event_mask(const char *s, long eve
>> +             if (s)
>> +                 return True;
>> +         }
>> +-    }
>> ++	}*/
>> + 
>> +     if (s != NULL)
>> +         fprintf(stderr, "%s: unrecognized event mask '%s'\n",
>> ProgramName, s);
>> +@@ -1288,7 +1288,7 @@ main(int argc, char **argv)
>> +         fprintf(stderr, "%s:  XSetLocaleModifiers failed\n",
>> ProgramName);
>>       }
>>   
>> --    xim = XOpenIM (dpy, NULL, NULL, NULL);
>> -+    /*xim = XOpenIM (dpy, NULL, NULL, NULL);
>> +-    xim = XOpenIM(dpy, NULL, NULL, NULL);
>> ++    /*xim = XOpenIM(dpy, NULL, NULL, NULL);
>>       if (xim == NULL) {
>> -         fprintf (stderr, "%s:  XOpenIM failed\n", ProgramName);
>> +         fprintf(stderr, "%s:  XOpenIM failed\n", ProgramName);
>>       }
>> -@@ -1042,7 +1042,7 @@ main (int argc, char **argv)
>> +@@ -1317,7 +1317,7 @@ main(int argc, char **argv)
>>               }
>> -             XFree (xim_styles);
>> +             XFree(xim_styles);
>>           }
>>  -    }
>> -+	}*/
>> ++    }*/
>>   
>> -     screen = DefaultScreen (dpy);
>> +     screen = DefaultScreen(dpy);
>>   
>> -@@ -1109,7 +1109,7 @@ main (int argc, char **argv)
>> - 	printf ("Outer window is 0x%lx, inner window is 0x%lx\n", w,
>> subw);
>> +@@ -1373,7 +1373,7 @@ main(int argc, char **argv)
>> +         printf("Outer window is 0x%lx, inner window is 0x%lx\n", w,
>> subw);
>>       }
>>   
>>  -    if (xim && xim_style) {
>>  +    /*if (xim && xim_style) {
>> -         xic = XCreateIC (xim,
>> -                          XNInputStyle, xim_style,
>> -                          XNClientWindow, w,
>> -@@ -1119,7 +1119,7 @@ main (int argc, char **argv)
>> +         xic = XCreateIC(xim,
>> +                         XNInputStyle, xim_style,
>> +                         XNClientWindow, w, XNFocusWindow, w, NULL);
>> +@@ -1381,7 +1381,7 @@ main(int argc, char **argv)
>>           if (xic == NULL) {
>> -             fprintf (stderr, "XCreateIC failed\n");
>> +             fprintf(stderr, "XCreateIC failed\n");
>>           }
>>  -    }
>>  +    }*/
>>   
>> -     have_rr = XRRQueryExtension (dpy, &rr_event_base,
>> &rr_error_base);
>> +     have_rr = XRRQueryExtension(dpy, &rr_event_base,
>> &rr_error_base);
>>       if (have_rr) {
>> diff --git a/meta/recipes-graphics/xorg-app/xev_1.2.2.bb
>> b/meta/recipes-graphics/xorg-app/xev_1.2.3.bb
>> similarity index 77%
>> rename from meta/recipes-graphics/xorg-app/xev_1.2.2.bb
>> rename to meta/recipes-graphics/xorg-app/xev_1.2.3.bb
>> index 0705b7f..6a69e74 100644
>> --- a/meta/recipes-graphics/xorg-app/xev_1.2.2.bb
>> +++ b/meta/recipes-graphics/xorg-app/xev_1.2.3.bb
>> @@ -14,5 +14,5 @@ DEPENDS += "libxrandr xorgproto"
>>  
>>  SRC_URI += "file://diet-x11.patch"
>>  
>> -SRC_URI[md5sum] = "249bdde90f01c0d861af52dc8fec379e"
>> -SRC_URI[sha256sum] =
>> "d94ae62a6c1af56c2961d71f5782076ac4116f0fa4e401420ac7e0db33dc314f"
>> +SRC_URI[md5sum] = "eec82a5d4b599736f0fa637e96136746"
>> +SRC_URI[sha256sum] =
>> "66bc4f1cfa1946d62612737815c34164e4ce40fcebd2c9e1d7e7a1117ad3ad09"
>> -- 
>> 2.7.4
>>


