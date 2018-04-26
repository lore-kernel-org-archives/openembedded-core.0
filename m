Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E5F46719B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2018 01:29:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w3Q1T9AA004604
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Apr 2018 18:29:09 -0700 (PDT)
Received: from [128.224.162.165] (128.224.162.165) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 25 Apr 2018 18:29:02 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <1524555471-8816-1-git-send-email-hongxu.jia@windriver.com>
	<CA+chaQcMOcc_uvyibBzwXqdRXw1F5ybuK_UipOGxcO=nA4oWPA@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <58c9f7c7-5040-83f7-4f46-e1aa3c75945e@windriver.com>
Date: Thu, 26 Apr 2018 09:29:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQcMOcc_uvyibBzwXqdRXw1F5ybuK_UipOGxcO=nA4oWPA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] qemu: fix CVE-2017-16845
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
X-List-Received-Date: Thu, 26 Apr 2018 01:29:11 -0000
Content-Type: multipart/alternative;
	boundary="------------C65AE7F8A7D2809C6BFAADA6"
Content-Language: en-US

--------------C65AE7F8A7D2809C6BFAADA6
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2018年04月26日 04:10, Martin Jansa wrote:
> FWIW: in 
> http://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/qemu 
> I have WIP qemu upgrade to 2.12.0 which includes this fix as well.
>

Got it, thanks

//Hongxu

> On Tue, Apr 24, 2018 at 9:37 AM, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     During Qemu guest migration, a destination process invokes ps2
>     post_load function. In that, if 'rptr' and 'count' values were
>     invalid, it could lead to OOB access or infinite loop issue.
>     Add check to avoid it.
>
>     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     ---
>      ...ck-PS2Queue-pointers-in-post_load-routine.patch | 63
>     ++++++++++++++++++++++
>      meta/recipes-devtools/qemu/qemu_2.11.1.bb <http://qemu_2.11.1.bb>
>             |  1 +
>      2 files changed, 64 insertions(+)
>      create mode 100644
>     meta/recipes-devtools/qemu/qemu/check-PS2Queue-pointers-in-post_load-routine.patch
>
>     diff --git
>     a/meta/recipes-devtools/qemu/qemu/check-PS2Queue-pointers-in-post_load-routine.patch
>     b/meta/recipes-devtools/qemu/qemu/check-PS2Queue-pointers-in-post_load-routine.patch
>     new file mode 100644
>     index 0000000..f8d7f66
>     --- /dev/null
>     +++
>     b/meta/recipes-devtools/qemu/qemu/check-PS2Queue-pointers-in-post_load-routine.patch
>     @@ -0,0 +1,63 @@
>     +From ee9a17d0e12143971a9676227cce953c0dbe52fb Mon Sep 17 00:00:00
>     2001
>     +From: Prasad J Pandit <pjp@fedoraproject.org
>     <mailto:pjp@fedoraproject.org>>
>     +Date: Thu, 16 Nov 2017 13:21:55 +0530
>     +Subject: [PATCH] ps2: check PS2Queue pointers in post_load routine
>     +
>     +During Qemu guest migration, a destination process invokes ps2
>     +post_load function. In that, if 'rptr' and 'count' values were
>     +invalid, it could lead to OOB access or infinite loop issue.
>     +Add check to avoid it.
>     +
>     +Reported-by: Cyrille Chatras <cyrille.chatras@orange.com
>     <mailto:cyrille.chatras@orange.com>>
>     +Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org
>     <mailto:pjp@fedoraproject.org>>
>     +Message-id: 20171116075155.22378-1-ppandit@redhat.com
>     <mailto:20171116075155.22378-1-ppandit@redhat.com>
>     +Signed-off-by: Gerd Hoffmann <kraxel@redhat.com
>     <mailto:kraxel@redhat.com>>
>     +
>     +CVE: CVE-2017-16845
>     +Upstream-Status: Backport
>     +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     +---
>     + hw/input/ps2.c | 21 +++++++++------------
>     + 1 file changed, 9 insertions(+), 12 deletions(-)
>     +
>     +diff --git a/hw/input/ps2.c b/hw/input/ps2.c
>     +index f388a23..de171a2 100644
>     +--- a/hw/input/ps2.c
>     ++++ b/hw/input/ps2.c
>     +@@ -1225,24 +1225,21 @@ static void ps2_common_reset(PS2State *s)
>     + static void ps2_common_post_load(PS2State *s)
>     + {
>     +     PS2Queue *q = &s->queue;
>     +-    int size;
>     +-    int i;
>     +-    int tmp_data[PS2_QUEUE_SIZE];
>     ++    uint8_t i, size;
>     ++    uint8_t tmp_data[PS2_QUEUE_SIZE];
>     +
>     +     /* set the useful data buffer queue size, < PS2_QUEUE_SIZE */
>     +-    size = q->count > PS2_QUEUE_SIZE ? 0 : q->count;
>     ++    size = (q->count < 0 || q->count > PS2_QUEUE_SIZE) ? 0 :
>     q->count;
>     +
>     +     /* move the queue elements to the start of data array */
>     +-    if (size > 0) {
>     +-        for (i = 0; i < size; i++) {
>     +-            /* move the queue elements to the temporary buffer */
>     +-            tmp_data[i] = q->data[q->rptr];
>     +-            if (++q->rptr == 256) {
>     +-                q->rptr = 0;
>     +-            }
>     ++    for (i = 0; i < size; i++) {
>     ++        if (q->rptr < 0 || q->rptr >= sizeof(q->data)) {
>     ++            q->rptr = 0;
>     +         }
>     +-        memcpy(q->data, tmp_data, size);
>     ++        tmp_data[i] = q->data[q->rptr++];
>     +     }
>     ++    memcpy(q->data, tmp_data, size);
>     ++
>     +     /* reset rptr/wptr/count */
>     +     q->rptr = 0;
>     +     q->wptr = size;
>     +--
>     +2.7.4
>     +
>     diff --git a/meta/recipes-devtools/qemu/qemu_2.11.1.bb
>     <http://qemu_2.11.1.bb>
>     b/meta/recipes-devtools/qemu/qemu_2.11.1.bb <http://qemu_2.11.1.bb>
>     index f4b7d69..ab82c5f 100644
>     --- a/meta/recipes-devtools/qemu/qemu_2.11.1.bb
>     <http://qemu_2.11.1.bb>
>     +++ b/meta/recipes-devtools/qemu/qemu_2.11.1.bb
>     <http://qemu_2.11.1.bb>
>     @@ -22,6 +22,7 @@ SRC_URI =
>     "http://wiki.qemu-project.org/download/${BP}.tar.bz2
>     <http://wiki.qemu-project.org/download/$%7BBP%7D.tar.bz2> \
>                
>     file://linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
>                 file://memfd.patch \
>                
>     file://0001-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch
>     \
>     +         
>      file://check-PS2Queue-pointers-in-post_load-routine.patch \
>                 "
>      UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
>
>     -- 
>     2.7.4
>
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>


--------------C65AE7F8A7D2809C6BFAADA6
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2018年04月26日 04:10, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+chaQcMOcc_uvyibBzwXqdRXw1F5ybuK_UipOGxcO=nA4oWPA@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">FWIW: in <a
href="http://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/qemu"
          moz-do-not-send="true">http://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/qemu</a>
        I have WIP qemu upgrade to 2.12.0 which includes this fix as
        well.</div>
      <div class="gmail_extra"><br>
      </div>
    </blockquote>
    <br>
    Got it, thanks<br>
    <br>
    //Hongxu<br>
    <br>
    <blockquote type="cite"
cite="mid:CA+chaQcMOcc_uvyibBzwXqdRXw1F5ybuK_UipOGxcO=nA4oWPA@mail.gmail.com">
      <div class="gmail_extra">
        <div class="gmail_quote">On Tue, Apr 24, 2018 at 9:37 AM, Hongxu
          Jia <span dir="ltr">&lt;<a
              href="mailto:hongxu.jia@windriver.com" target="_blank"
              moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">During
            Qemu guest migration, a destination process invokes ps2<br>
            post_load function. In that, if 'rptr' and 'count' values
            were<br>
            invalid, it could lead to OOB access or infinite loop issue.<br>
            Add check to avoid it.<br>
            <br>
            Signed-off-by: Hongxu Jia &lt;<a
              href="mailto:hongxu.jia@windriver.com"
              moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;<br>
            ---<br>
             ...ck-PS2Queue-pointers-in-<wbr>post_load-routine.patch |
            63 ++++++++++++++++++++++<br>
             meta/recipes-devtools/qemu/<a href="http://qemu_2.11.1.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">qem<wbr>u_2.11.1.bb</a> 
                    |  1 +<br>
             2 files changed, 64 insertions(+)<br>
             create mode 100644 meta/recipes-devtools/qemu/<wbr>qemu/check-PS2Queue-pointers-<wbr>in-post_load-routine.patch<br>
            <br>
            diff --git a/meta/recipes-devtools/qemu/<wbr>qemu/check-PS2Queue-pointers-<wbr>in-post_load-routine.patch
            b/meta/recipes-devtools/qemu/<wbr>qemu/check-PS2Queue-pointers-<wbr>in-post_load-routine.patch<br>
            new file mode 100644<br>
            index 0000000..f8d7f66<br>
            --- /dev/null<br>
            +++ b/meta/recipes-devtools/qemu/<wbr>qemu/check-PS2Queue-pointers-<wbr>in-post_load-routine.patch<br>
            @@ -0,0 +1,63 @@<br>
            +From ee9a17d0e12143971a9676227cce95<wbr>3c0dbe52fb Mon Sep
            17 00:00:00 2001<br>
            +From: Prasad J Pandit &lt;<a
              href="mailto:pjp@fedoraproject.org" moz-do-not-send="true">pjp@fedoraproject.org</a>&gt;<br>
            +Date: Thu, 16 Nov 2017 13:21:55 +0530<br>
            +Subject: [PATCH] ps2: check PS2Queue pointers in post_load
            routine<br>
            +<br>
            +During Qemu guest migration, a destination process invokes
            ps2<br>
            +post_load function. In that, if 'rptr' and 'count' values
            were<br>
            +invalid, it could lead to OOB access or infinite loop
            issue.<br>
            +Add check to avoid it.<br>
            +<br>
            +Reported-by: Cyrille Chatras &lt;<a
              href="mailto:cyrille.chatras@orange.com"
              moz-do-not-send="true">cyrille.chatras@orange.com</a>&gt;<br>
            +Signed-off-by: Prasad J Pandit &lt;<a
              href="mailto:pjp@fedoraproject.org" moz-do-not-send="true">pjp@fedoraproject.org</a>&gt;<br>
            +Message-id: <a
              href="mailto:20171116075155.22378-1-ppandit@redhat.com"
              moz-do-not-send="true">20171116075155.22378-1-<wbr>ppandit@redhat.com</a><br>
            +Signed-off-by: Gerd Hoffmann &lt;<a
              href="mailto:kraxel@redhat.com" moz-do-not-send="true">kraxel@redhat.com</a>&gt;<br>
            +<br>
            +CVE: CVE-2017-16845<br>
            +Upstream-Status: Backport<br>
            +Signed-off-by: Hongxu Jia &lt;<a
              href="mailto:hongxu.jia@windriver.com"
              moz-do-not-send="true">hongxu.jia@windriver.com</a>&gt;<br>
            +---<br>
            + hw/input/ps2.c | 21 +++++++++------------<br>
            + 1 file changed, 9 insertions(+), 12 deletions(-)<br>
            +<br>
            +diff --git a/hw/input/ps2.c b/hw/input/ps2.c<br>
            +index f388a23..de171a2 100644<br>
            +--- a/hw/input/ps2.c<br>
            ++++ b/hw/input/ps2.c<br>
            +@@ -1225,24 +1225,21 @@ static void
            ps2_common_reset(PS2State *s)<br>
            + static void ps2_common_post_load(PS2State *s)<br>
            + {<br>
            +     PS2Queue *q = &amp;s-&gt;queue;<br>
            +-    int size;<br>
            +-    int i;<br>
            +-    int tmp_data[PS2_QUEUE_SIZE];<br>
            ++    uint8_t i, size;<br>
            ++    uint8_t tmp_data[PS2_QUEUE_SIZE];<br>
            + <br>
            +     /* set the useful data buffer queue size, &lt;
            PS2_QUEUE_SIZE */<br>
            +-    size = q-&gt;count &gt; PS2_QUEUE_SIZE ? 0 :
            q-&gt;count;<br>
            ++    size = (q-&gt;count &lt; 0 || q-&gt;count &gt;
            PS2_QUEUE_SIZE) ? 0 : q-&gt;count;<br>
            + <br>
            +     /* move the queue elements to the start of data array
            */<br>
            +-    if (size &gt; 0) {<br>
            +-        for (i = 0; i &lt; size; i++) {<br>
            +-            /* move the queue elements to the temporary
            buffer */<br>
            +-            tmp_data[i] = q-&gt;data[q-&gt;rptr];<br>
            +-            if (++q-&gt;rptr == 256) {<br>
            +-                q-&gt;rptr = 0;<br>
            +-            }<br>
            ++    for (i = 0; i &lt; size; i++) {<br>
            ++        if (q-&gt;rptr &lt; 0 || q-&gt;rptr &gt;=
            sizeof(q-&gt;data)) {<br>
            ++            q-&gt;rptr = 0;<br>
            +         }<br>
            +-        memcpy(q-&gt;data, tmp_data, size);<br>
            ++        tmp_data[i] = q-&gt;data[q-&gt;rptr++];<br>
            +     }<br>
            ++    memcpy(q-&gt;data, tmp_data, size);<br>
            ++<br>
            +     /* reset rptr/wptr/count */<br>
            +     q-&gt;rptr = 0;<br>
            +     q-&gt;wptr = size;<br>
            +-- <br>
            +2.7.4<br>
            +<br>
            diff --git a/meta/recipes-devtools/qemu/<a
              href="http://qemu_2.11.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">q<wbr>emu_2.11.1.bb</a>
            b/meta/recipes-devtools/qemu/<a href="http://qemu_2.11.1.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">q<wbr>emu_2.11.1.bb</a><br>
            index f4b7d69..ab82c5f 100644<br>
            --- a/meta/recipes-devtools/qemu/<a
              href="http://qemu_2.11.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">q<wbr>emu_2.11.1.bb</a><br>
            +++ b/meta/recipes-devtools/qemu/<a
              href="http://qemu_2.11.1.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">q<wbr>emu_2.11.1.bb</a><br>
            @@ -22,6 +22,7 @@ SRC_URI = "<a
              href="http://wiki.qemu-project.org/download/$%7BBP%7D.tar.bz2"
              rel="noreferrer" target="_blank" moz-do-not-send="true">http://wiki.qemu-project.org/<wbr>download/${BP}.tar.bz2</a>
            \<br>
                        <a class="moz-txt-link-freetext" href="file://linux-user-Fix">file://linux-user-Fix</a>-<wbr>webkitgtk-hangs-on-32-bit-x86-<wbr>target.patch
            \<br>
                        <a class="moz-txt-link-freetext" href="file://memfd.patch">file://memfd.patch</a> \<br>
                        <a class="moz-txt-link-freetext" href="file://0001-arm-translate-a64">file://0001-arm-translate-a64</a>-<wbr>treat-DISAS_UPDATE-as-variant-<wbr>of-D.patch
            \<br>
            +           <a class="moz-txt-link-freetext" href="file://check-PS2Queue">file://check-PS2Queue</a>-<wbr>pointers-in-post_load-routine.<wbr>patch
            \<br>
                        "<br>
             UPSTREAM_CHECK_REGEX = "qemu-(?P&lt;pver&gt;\d+\..*)\.tar"<br>
            <span class="HOEnZb"><font color="#888888"> <br>
                -- <br>
                2.7.4<br>
                <br>
                -- <br>
                ______________________________<wbr>_________________<br>
                Openembedded-core mailing list<br>
                <a
                  href="mailto:Openembedded-core@lists.openembedded.org"
                  moz-do-not-send="true">Openembedded-core@lists.<wbr>openembedded.org</a><br>
                <a
                  href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
              </font></span></blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------C65AE7F8A7D2809C6BFAADA6--
