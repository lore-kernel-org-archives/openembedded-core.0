Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web12.54063.1598883266021622066
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2020 07:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=FjSBTTm9;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.67, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f67.google.com with SMTP id nw23so7301126ejb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2020 07:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=A+xfdyqmRohfwVRviO3dHL2IZUa664CdA2VYTsS8N/w=;
        b=FjSBTTm9UeyhMbgJ439g73iv4r0ihy7aWvAHx7Wh51zpK0oDjyIkhAHG9Udu1X/xNz
         U1Pqg/zPjN9LAQj11Qwq5ILjkAWPjhDIA3kam0gUuK4bboKKe/jYqd6/h+8HuZ7j7Shw
         3V8Rl86o159DU942vy1+krSo1Z/NmL0qrdQL+FzND+7uAt7ACGUj8g5mddMLvGxzqfGA
         jyybS3muA2e4ZCggJbzZHWwJX/m3F/MgU285cRIK4vJL7xSiZg1UmY+vnRQP+ynxK6RF
         kosPv9isGkCkC+wm18CmW1bxrCx/eB97T9OEeyFk3edMIgdLeABj2UuZHlx/ZwE8J+/w
         53EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=A+xfdyqmRohfwVRviO3dHL2IZUa664CdA2VYTsS8N/w=;
        b=BYMkCkWbkGTFn/Iav3+ohTAWCatPbvZ0T2A+YlwC8zxplQJ2FklHbTPPEViPkHnVoE
         m7jN7hXCtGL3qzCsCjbxyjTXqVCN1PzTqryhN9bawXKjV+9+FQhxre0cOPvlYDREswHt
         /YL71geczctyvANUv7bqHM92sypnJulk68g25a++AD2API0JSFfIPUsFDGp6PJKhjIpZ
         /cuCDXGcvOBB/AID/n3PAcvp4hrZDiCr1FLT0P0JKy1MrxuSMjkT60GxwvyBtjG3AFWi
         BfFWQCYV5b835ez4u248hOOrIS3HxTduYnZRxYd33u3PTc1XLI5NEkTSdK0zSZSRU0Cd
         uL6w==
X-Gm-Message-State: AOAM533BqOeNACSLnjnQepblAt9xRbWViekLFfl7fTz76DvY/TXVKEtV
	jflDBFHavy/T8BMVm8oALO9j9qgHg1R5fsXYM74qUA==
X-Google-Smtp-Source: ABdhPJwXqb6ENpqg6rhjosnZkf/afqE/uiIrLLedhOPSqWg4jlD904+5TRp8AMJz0V11XciCiwqyJ8vEwVU8thg6yVk=
X-Received: by 2002:a17:906:3bca:: with SMTP id v10mr1311636ejf.57.1598883263896;
 Mon, 31 Aug 2020 07:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200831012446.622194-1-raj.khem@gmail.com>
In-Reply-To: <20200831012446.622194-1-raj.khem@gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 31 Aug 2020 04:14:11 -1000
Message-ID: <CAOSpxdbU39Vnv-1Uu_PC+XmSB+a4UBk=aYHmESTk6Y+yp-QyvA@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] json-c: Fix CVE-2020-12762
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

Thanks for the CVE fix submission, I appreciate the help!
Unfortunately this patch won't apply:

Applying: json-c: Fix CVE-2020-12762
error: corrupt patch at line 241
error: could not build fake ancestor
Patch failed at 0001 json-c: Fix CVE-2020-12762

Steve

On Sun, Aug 30, 2020 at 3:24 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../json-c/json-c/CVE-2020-12762.patch        | 231 ++++++++++++++++++
>  meta/recipes-devtools/json-c/json-c_0.13.1.bb |   1 +
>  2 files changed, 232 insertions(+)
>  create mode 100644 meta/recipes-devtools/json-c/json-c/CVE-2020-12762.p=
atch
>
> diff --git a/meta/recipes-devtools/json-c/json-c/CVE-2020-12762.patch b/=
meta/recipes-devtools/json-c/json-c/CVE-2020-12762.patch
> new file mode 100644
> index 0000000000..50674f0c5c
> --- /dev/null
> +++ b/meta/recipes-devtools/json-c/json-c/CVE-2020-12762.patch
> @@ -0,0 +1,231 @@
> +From 865b5a65199973bb63dff8e47a2f57e04fec9736 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Bj=3DC3=3DB6rn=3D20Esser?=3D <besser82@fedoraproject.=
org>
> +Date: Thu, 14 May 2020 12:32:30 +0200
> +Subject: [PATCH] Fix CVE-2020-12762.
> +
> +This commit is a squashed backport of the following commits
> +on the master branch:
> +
> +  * 099016b7e8d70a6d5dd814e788bba08d33d48426
> +  * 77d935b7ae7871a1940cd827e850e6063044ec45
> +  * d07b91014986900a3a75f306d302e13e005e9d67
> +  * 519dfe1591d85432986f9762d41d1a883198c157
> +  * a59d5acfab4485d5133114df61785b1fc633e0c6
> +---
> +CVE: CVE-2020-12762
> +Upstream-Status: Backport [https://github.com/json-c/json-c/commit/865b=
5a65199973bb63dff8e47a2f57e04fec9736]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> + arraylist.c          |  3 +++
> + linkhash.c           | 21 ++++++++++++++-------
> + printbuf.c           | 38 ++++++++++++++++++++++++++------------
> + tests/test4.c        | 30 +++++++++++++++++++++++++++++-
> + tests/test4.expected |  1 +
> + 5 files changed, 73 insertions(+), 20 deletions(-)
> +
> +diff --git a/arraylist.c b/arraylist.c
> +index ddeb8d4eb4..e737052e32 100644
> +--- a/arraylist.c
> ++++ b/arraylist.c
> +@@ -135,6 +135,9 @@ array_list_del_idx( struct array_list *arr, size_t =
idx, size_t count )
> + {
> +       size_t i, stop;
> +
> ++      /* Avoid overflow in calculation with large indices. */
> ++      if (idx > SIZE_T_MAX - count)
> ++              return -1;
> +       stop =3D idx + count;
> +       if ( idx >=3D arr->length || stop > arr->length ) return -1;
> +       for ( i =3D idx; i < stop; ++i ) {
> +diff --git a/linkhash.c b/linkhash.c
> +index 5497061a8a..6435a154ac 100644
> +--- a/linkhash.c
> ++++ b/linkhash.c
> +@@ -12,12 +12,13 @@
> +
> + #include "config.h"
> +
> +-#include <stdio.h>
> +-#include <string.h>
> +-#include <stdlib.h>
> ++#include <assert.h>
> ++#include <limits.h>
> + #include <stdarg.h>
> + #include <stddef.h>
> +-#include <limits.h>
> ++#include <stdio.h>
> ++#include <stdlib.h>
> ++#include <string.h>
> +
> + #ifdef HAVE_ENDIAN_H
> + # include <endian.h>    /* attempt to define endianness */
> +@@ -28,8 +29,8 @@
> + # include <windows.h>   /* Get InterlockedCompareExchange */
> + #endif
> +
> +-#include "random_seed.h"
> + #include "linkhash.h"
> ++#include "random_seed.h"
> +
> + /* hash functions */
> + static unsigned long lh_char_hash(const void *k);
> +@@ -498,7 +499,9 @@ struct lh_table* lh_table_new(int size,
> +       int i;
> +       struct lh_table *t;
> +
> +-      t =3D (struct lh_table*)calloc(1, sizeof(struct lh_table));
> ++      /* Allocate space for elements to avoid divisions by zero. */
> ++      assert(size > 0);
> ++      t =3D (struct lh_table *)calloc(1, sizeof(struct lh_table));
> +       if (!t)
> +               return NULL;
> +
> +@@ -577,8 +580,12 @@ int lh_table_insert_w_hash(struct lh_table *t, con=
st void *k, const void *v, con
> +       unsigned long n;
> +
> +       if (t->count >=3D t->size * LH_LOAD_FACTOR)
> +-              if (lh_table_resize(t, t->size * 2) !=3D 0)
> ++      {
> ++              /* Avoid signed integer overflow with large tables. */
> ++              int new_size =3D (t->size > INT_MAX / 2) ? INT_MAX : (t-=
>size * 2);
> ++              if (t->size =3D=3D INT_MAX || lh_table_resize(t, new_siz=
e) !=3D 0)
> +                       return -1;
> ++      }
> +
> +       n =3D h % t->size;
> +
> +diff --git a/printbuf.c b/printbuf.c
> +index 6c77b5defd..6fc56de455 100644
> +--- a/printbuf.c
> ++++ b/printbuf.c
> +@@ -15,6 +15,7 @@
> +
> + #include "config.h"
> +
> ++#include <limits.h>
> + #include <stdio.h>
> + #include <stdlib.h>
> + #include <string.h>
> +@@ -64,10 +65,16 @@ static int printbuf_extend(struct printbuf *p, int =
min_size)
> +
> +       if (p->size >=3D min_size)
> +               return 0;
> +-
> +-      new_size =3D p->size * 2;
> +-      if (new_size < min_size + 8)
> +-              new_size =3D  min_size + 8;
> ++      /* Prevent signed integer overflows with large buffers. */
> ++      if (min_size > INT_MAX - 8)
> ++              return -1;
> ++      if (p->size > INT_MAX / 2)
> ++              new_size =3D min_size + 8;
> ++      else {
> ++              new_size =3D p->size * 2;
> ++              if (new_size < min_size + 8)
> ++                      new_size =3D min_size + 8;
> ++      }
> + #ifdef PRINTBUF_DEBUG
> +       MC_DEBUG("printbuf_memappend: realloc "
> +         "bpos=3D%d min_size=3D%d old_size=3D%d new_size=3D%d\n",
> +@@ -82,14 +89,18 @@ static int printbuf_extend(struct printbuf *p, int =
min_size)
> +
> + int printbuf_memappend(struct printbuf *p, const char *buf, int size)
> + {
> +-  if (p->size <=3D p->bpos + size + 1) {
> +-    if (printbuf_extend(p, p->bpos + size + 1) < 0)
> +-      return -1;
> +-  }
> +-  memcpy(p->buf + p->bpos, buf, size);
> +-  p->bpos +=3D size;
> +-  p->buf[p->bpos]=3D '\0';
> +-  return size;
> ++      /* Prevent signed integer overflows with large buffers. */
> ++      if (size > INT_MAX - p->bpos - 1)
> ++              return -1;
> ++      if (p->size <=3D p->bpos + size + 1)
> ++      {
> ++              if (printbuf_extend(p, p->bpos + size + 1) < 0)
> ++                      return -1;
> ++      }
> ++      memcpy(p->buf + p->bpos, buf, size);
> ++      p->bpos +=3D size;
> ++      p->buf[p->bpos] =3D '\0';
> ++      return size;
> + }
> +
> + int printbuf_memset(struct printbuf *pb, int offset, int charvalue, in=
t len)
> +@@ -98,6 +109,9 @@ int printbuf_memset(struct printbuf *pb, int offset,=
 int charvalue, int len)
> +
> +       if (offset =3D=3D -1)
> +               offset =3D pb->bpos;
> ++      /* Prevent signed integer overflows with large buffers. */
> ++      if (len > INT_MAX - offset)
> ++              return -1;
> +       size_needed =3D offset + len;
> +       if (pb->size < size_needed)
> +       {
> +diff --git a/tests/test4.c b/tests/test4.c
> +index fc8b79dbf4..82d3f494de 100644
> +--- a/tests/test4.c
> ++++ b/tests/test4.c
> +@@ -2,9 +2,11 @@
> +  * gcc -o utf8 utf8.c -I/home/y/include -L./.libs -ljson
> +  */
> +
> ++#include "config.h"
> ++#include <assert.h>
> + #include <stdio.h>
> ++#include <stdlib.h>
> + #include <string.h>
> +-#include "config.h"
> +
> + #include "json_inttypes.h"
> + #include "json_object.h"
> +@@ -24,6 +26,29 @@ void print_hex(const char* s)
> +       putchar('\n');
> + }
> +
> ++static void test_lot_of_adds(void);
> ++static void test_lot_of_adds()
> ++{
> ++      int ii;
> ++      char key[50];
> ++      json_object *jobj =3D json_object_new_object();
> ++      assert(jobj !=3D NULL);
> ++      for (ii =3D 0; ii < 500; ii++)
> ++      {
> ++              snprintf(key, sizeof(key), "k%d", ii);
> ++              json_object *iobj =3D json_object_new_int(ii);
> ++              assert(iobj !=3D NULL);
> ++              if (json_object_object_add(jobj, key, iobj))
> ++              {
> ++                      fprintf(stderr, "FAILED to add object #%d\n", ii=
);
> ++                      abort();
> ++              }
> ++      }
> ++      printf("%s\n", json_object_to_json_string(jobj));
> ++      assert(json_object_object_length(jobj) =3D=3D 500);
> ++      json_object_put(jobj);
> ++}
> ++
> + int main(void)
> + {
> +       const char *input =3D "\"\\ud840\\udd26,\\ud840\\udd27,\\ud800\\=
udd26,\\ud800\\udd27\"";
> +@@ -49,5 +74,8 @@ int main(void)
> +               retval =3D 1;
> +       }
> +       json_object_put(parse_result);
> ++
> ++      test_lot_of_adds();
> ++
> +       return retval;
> + }
> +diff --git a/tests/test4.expected b/tests/test4.expected
> +index 68d4336d90..cb2744012b 100644
> +--- a/tests/test4.expected
> ++++ b/tests/test4.expected
> +@@ -1,3 +1,4 @@
> + input: "\ud840\udd26,\ud840\udd27,\ud800\udd26,\ud800\udd27"
> + JSON parse result is correct: =F0=A0=84=A6,=F0=A0=84=A7,=F0=90=84=A6,=
=F0=90=84=A7
> + PASS
> ++{ "k0": 0, "k1": 1, "k2": 2, "k3": 3, "k4": 4, "k5": 5, "k6": 6, "k7":=
 7, "k8": 8, "k9": 9, "k10": 10, "k11": 11, "k12": 12, "k13": 13, "k14": 14=
, "k15": 15, "k16": 16, "k17": 17, "k18": 18, "k19": 19, "k20": 20, "k21": =
21, "k22": 22, "k23": 23, "k24": 24, "k25": 25, "k26": 26, "k27": 27, "k28"=
: 28, "k29": 29, "k30": 30, "k31": 31, "k32": 32, "k33": 33, "k34": 34, "k3=
5": 35, "k36": 36, "k37": 37, "k38": 38, "k39": 39, "k40": 40, "k41": 41, "=
k42": 42, "k43": 43, "k44": 44, "k45": 45, "k46": 46, "k47": 47, "k48": 48,=
 "k49": 49, "k50": 50, "k51": 51, "k52": 52, "k53": 53, "k54": 54, "k55": 5=
5, "k56": 56, "k57": 57, "k58": 58, "k59": 59, "k60": 60, "k61": 61, "k62":=
 62, "k63": 63, "k64": 64, "k65": 65, "k66": 66, "k67": 67, "k68": 68, "k69=
": 69, "k70": 70, "k71": 71, "k72": 72, "k73": 73, "k74": 74, "k75": 75, "k=
76": 76, "k77": 77, "k78": 78, "k79": 79, "k80": 80, "k81": 81, "k82": 82, =
"k83": 83, "k84": 84, "k85": 85, "k86": 86, "k87": 87, "k88": 88, "k89": 89=
, "k90": 90, "k91": 91, "k92": 92, "k93": 93, "k94": 94, "k95": 95, "k96": =
96, "k97": 97, "k98": 98, "k99": 99, "k100": 100, "k101": 101, "k102": 102,=
 "k103": 103, "k104": 104, "k105": 105, "k106": 106, "k107": 107, "k108": 1=
08, "k109": 109, "k110": 110, "k111": 111, "k112": 112, "k113": 113, "k114"=
: 114, "k115": 115, "k116": 116, "k117": 117, "k118": 118, "k119": 119, "k1=
20": 120, "k121": 121, "k122": 122, "k123": 123, "k124": 124, "k125": 125, =
"k126": 126, "k127": 127, "k128": 128, "k129": 129, "k130": 130, "k131": 13=
1, "k132": 132, "k133": 133, "k134": 134, "k135": 135, "k136": 136, "k137":=
 137, "k138": 138, "k139": 139, "k140": 140, "k141": 141, "k142": 142, "k14=
3": 143, "k144": 144, "k145": 145, "k146": 146, "k147": 147, "k148": 148, "=
k149": 149, "k150": 150, "k151": 151, "k152": 152, "k153": 153, "k154": 154=
, "k155": 155, "k156": 156, "k157": 157, "k158": 158, "k159": 159, "k160": =
160, "k161": 161, "k162": 162, "k163": 163, "k164": 164, "k165": 165, "k166=
": 166, "k167": 167, "k168": 168, "k169": 169, "k170": 170, "k171": 171, "k=
172": 172, "k173": 173, "k174": 174, "k175": 175, "k176": 176, "k177": 177,=
 "k178": 178, "k179": 179, "k180": 180, "k181": 181, "k182": 182, "k183": 1=
83, "k184": 184, "k185": 185, "k186": 186, "k187": 187, "k188": 188, "k189"=
: 189, "k190": 190, "k191": 191, "k192": 192, "k193": 193, "k194": 194, "k1=
95": 195, "k196": 196, "k197": 197, "k198": 198, "k199": 199, "k200": 200, =
"k201": 201, "k202": 202, "k203": 203, "k204": 204, "k205": 205, "k206": 20=
6, "k207": 207, "k208": 208, "k209": 209, "k210": 210, "k211": 211, "k212":=
 212, "k213": 213, "k214": 214, "k215": 215, "k216": 216, "k217": 217, "k21=
8": 218, "k219": 219, "k220": 220, "k221": 221, "k222": 222, "k223": 223, "=
k224": 224, "k225": 225, "k226": 226, "k227": 227, "k228": 228, "k229": 229=
, "k230": 230, "k231": 231, "k232": 232, "k233": 233, "k234": 234, "k235": =
235, "k236": 236, "k237": 237, "k238": 238, "k239": 239, "k240": 240, "k241=
": 241, "k242": 242, "k243": 243, "k244": 244, "k245": 245, "k246": 246, "k=
247": 247, "k248": 248, "k249": 249, "k250": 250, "k251": 251, "k252": 252,=
 "k253": 253, "k254": 254, "k255": 255, "k256": 256, "k257": 257, "k258": 2=
58, "k259": 259, "k260": 260, "k261": 261, "k262": 262, "k263": 263, "k264"=
: 264, "k265": 265, "k266": 266, "k267": 267, "k268": 268, "k269": 269, "k2=
70": 270, "k271": 271, "k272": 272, "k273": 273, "k274": 274, "k275": 275, =
"k276": 276, "k277": 277, "k278": 278, "k279": 279, "k280": 280, "k281": 28=
1, "k282": 282, "k283": 283, "k284": 284, "k285": 285, "k286": 286, "k287":=
 287, "k288": 288, "k289": 289, "k290": 290, "k291": 291, "k292": 292, "k29=
3": 293, "k294": 294, "k295": 295, "k296": 296, "k297": 297, "k298": 298, "=
k299": 299, "k300": 300, "k301": 301, "k302": 302, "k303": 303, "k304": 304=
, "k305": 305, "k306": 306, "k307": 307, "k308": 308, "k309": 309, "k310": =
310, "k311": 311, "k312": 312, "k313": 313, "k314": 314, "k315": 315, "k316=
": 316, "k317": 317, "k318": 318, "k319": 319, "k320": 320, "k321": 321, "k=
322": 322, "k323": 323, "k324": 324, "k325": 325, "k326": 326, "k327": 327,=
 "k328": 328, "k329": 329, "k330": 330, "k331": 331, "k332": 332, "k333": 3=
33, "k334": 334, "k335": 335, "k336": 336, "k337": 337, "k338": 338, "k339"=
: 339, "k340": 340, "k341": 341, "k342": 342, "k343": 343, "k344": 344, "k3=
45": 345, "k346": 346, "k347": 347, "k348": 348, "k349": 349, "k350": 350, =
"k351": 351, "k352": 352, "k353": 353, "k354": 354, "k355": 355, "k356": 35=
6, "k357": 357, "k358": 358, "k359": 359, "k360": 360, "k361": 361, "k362":=
 362, "k363": 363, "k364": 364, "k365": 365, "k366": 366, "k367": 367, "k36=
8": 368, "k369": 369, "k370": 370, "k371": 371, "k372": 372, "k373": 373, "=
k374": 374, "k375": 375, "k376": 376, "k377": 377, "k378": 378, "k379": 379=
, "k380": 380, "k381": 381, "k382": 382, "k383": 383, "k384": 384, "k385": =
385, "k386": 386, "k387": 387, "k388": 388, "k389": 389, "k390": 390, "k391=
": 391, "k392": 392, "k393": 393, "k394": 394, "k395": 395, "k396": 396, "k=
397": 397, "k398": 398, "k399": 399, "k400": 400, "k401": 401, "k402": 402,=
 "k403": 403, "k404": 404, "k405": 405, "k406": 406, "k407": 407, "k408": 4=
08, "k409": 409, "k410": 410, "k411": 411, "k412": 412, "k413": 413, "k414"=
: 414, "k415": 415, "k416": 416, "k417": 417, "k418": 418, "k419": 419, "k4=
20": 420, "k421": 421, "k422": 422, "k423": 423, "k424": 424, "k425": 425, =
"k426": 426, "k427": 427, "k428": 428, "k429": 429, "k430": 430, "k431": 43=
1, "k432": 432, "k433": 433, "k434": 434, "k435": 435, "k436": 436, "k437":=
 437, "k438": 438, "k439": 439, "k440": 440, "k441": 441, "k442": 442, "k44=
3": 443, "k444": 444, "k445": 445, "k446": 446, "k447": 447, "k448": 448, "=
k449": 449, "k450": 450, "k451": 451, "k452": 452, "k453": 453, "k454": 454=
, "k455": 455, "k456": 456, "k457": 457, "k458": 458, "k459": 459, "k460": =
460, "k461": 461, "k462": 462, "k463": 463, "k464": 464, "k465": 465, "k466=
": 466, "k467": 467, "k468": 468, "k469": 469, "k470": 470, "k471": 471, "k=
472": 472, "k473": 473, "k474": 474, "k475": 475, "k476": 476, "k477": 477,=
 "k478": 478, "k479": 479, "k480": 480, "k481": 481, "k482": 482, "k483": 4=
83, "k484": 484, "k485": 485, "k486": 486, "k487": 487, "k488": 488, "k489"=
: 489, "k490": 490, "k491": 491, "k492": 492, "k493": 493, "k494": 494, "k4=
95": 495, "k496": 496, "k497": 497, "k498": 498, "k499": 499 }
> diff --git a/meta/recipes-devtools/json-c/json-c_0.13.1.bb b/meta/recipe=
s-devtools/json-c/json-c_0.13.1.bb
> index 522879f21f..c7c755bb16 100644
> --- a/meta/recipes-devtools/json-c/json-c_0.13.1.bb
> +++ b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
> @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dde54b60fbbc35=
123ba193fea8ee216f2"
>
>  SRC_URI =3D "https://s3.amazonaws.com/json-c_releases/releases/${BP}.ta=
r.gz \
>             file://add-disable-werror-option-to-configure.patch \
> +           file://CVE-2020-12762.patch \
>             "
>  SRC_URI[md5sum] =3D "04969ad59cc37bddd83741a08b98f350"
>  SRC_URI[sha256sum] =3D "b87e608d4d3f7bfdd36ef78d56d53c74e66ab278d318b71=
e6002a369d36f4873"
> --
> 2.28.0
>
>=20
