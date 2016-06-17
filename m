Return-Path: <d.falko@partner.samsung.com>
Received: from mailout4.w1.samsung.com (mailout4.w1.samsung.com
	[210.118.77.14])
	by mail.openembedded.org (Postfix) with ESMTP id F124F60123
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 10:22:09 +0000 (UTC)
MIME-version: 1.0
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
	by mailout4.w1.samsung.com
	(Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May 5
	2014)) with ESMTP id <0O8W00K8HVGWH940@mailout4.w1.samsung.com> for
	openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2016 11:22:08 +0100 (BST)
X-AuditID: cbfec7f5-f792a6d000001302-23-5763cf4f6f8a
Received: from eusync3.samsung.com ( [203.254.199.213])
	by eucpsbgm2.samsung.com (EUCPMTA) with SMTP id D5.95.04866.F4FC3675;
	Fri, 17 Jun 2016 11:22:07 +0100 (BST)
Received: from [106.109.129.11] by eusync3.samsung.com
	(Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May 5
	2014)) with ESMTPA id <0O8W00KBLVGVIO60@eusync3.samsung.com>; Fri,
	17 Jun 2016 11:22:07 +0100 (BST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1466156019-32399-1-git-send-email-d.falko@partner.samsung.com>
	<CAJTo0La35D2MT3t1OnNgSbX8NUpUBJgLKpgUSYDgZb6Y_RiWAQ@mail.gmail.com>
From: Dmitrii Falko <d.falko@partner.samsung.com>
Message-id: <5763CF4E.60300@partner.samsung.com>
Date: Fri, 17 Jun 2016 13:22:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
In-reply-to: <CAJTo0La35D2MT3t1OnNgSbX8NUpUBJgLKpgUSYDgZb6Y_RiWAQ@mail.gmail.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFLMWRmVeSWpSXmKPExsVy+t/xq7r+55PDDWat17a48/Mdu8W8HfYO
	TB6L97xk8ji3cQVjAFMUl01Kak5mWWqRvl0CV8au11OZC9boVRxt+8nSwNip1MXIySEhYCJx
	5+EdRghbTOLCvfVsXYxcHEICSxkl1p6fxwSS4BUQlPgx+R4LiM0sECax5c5RJoii54wSUx9O
	AysSFvCQePl8NhuILSKgJXH29WNmiKJJjBL/b95gh+g2k5h37SnYOjYBQ4lZPZuApnIAbTCQ
	aHpnDBJmEVCVmD3/BVi5qECExKztP8DmcwoESzzdNoV1AiP/LCQ3zUJy0yyoDV9eHmadBTSV
	WUBe4silbIiwmsTC34uYkIQXMLKtYhRNLU0uKE5KzzXSK07MLS7NS9dLzs/dxAgJ4a87GJce
	szrEKMDBqMTDu0I0OVyINbGsuDL3EKMEB7OSCO/pU0Ah3pTEyqrUovz4otKc1OJDjNIcLEri
	vDN3vQ8REkhPLEnNTk0tSC2CyTJxcEo1MAYaVV5eZ8znbVdz7VyR+hPTeRMXfNVYGWd9as/z
	a3lBDIu677HcsoxdavC9fudehUxb0YzGjRf/yn+r+23vkp8c+vTp31aZeyvq+eyPClxUsFhg
	Ga3VY/X6hY8s18l9pkn/mn/7bX74npfXYWayknn3rVO37uve36UfcTl9r2p1lJbnydT+a0os
	xRmJhlrMRcWJAAy0TihdAgAA
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Alias _obstack_free to fix binutils build
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
X-List-Received-Date: Fri, 17 Jun 2016 10:22:13 -0000
Content-type: multipart/alternative;
	boundary="Boundary_(ID_yucKPrW2mabY7xM0dmoPkw)"

--Boundary_(ID_yucKPrW2mabY7xM0dmoPkw)
Content-type: text/plain; charset=utf-8; format=flowed
Content-transfer-encoding: 8BIT

Hi Ross,

I already re-send this patch(http://patches.openembedded.org/patch/125115/)

More info about this issue i wrote here: 
https://bugzilla.yoctoproject.org/show_bug.cgi?id=9781

17.06.2016 13:15, Burton, Ross пишет:
> Hi Dmitry,
>
> Can you re-send this as a patch against oe-core itself instead of 
> (presumably) binutils, explaining why it breaks for you and why this 
> is the correct fix?
>
> Thanks,
> Ross
>
> On 17 June 2016 at 10:33, Dmitriy Falko <d.falko@partner.samsung.com 
> <mailto:d.falko@partner.samsung.com>> wrote:
>
>     Signed-off-by: Dmitriy Falko <d.falko@partner.samsung.com
>     <mailto:d.falko@partner.samsung.com>>
>     ---
>      libc/misc/gnu/obstack.c | 4 ++--
>      1 file changed, 2 insertions(+), 2 deletions(-)
>
>     diff --git a/libc/misc/gnu/obstack.c b/libc/misc/gnu/obstack.c
>     index 38cfd83..2689263 100644
>     --- a/libc/misc/gnu/obstack.c
>     +++ b/libc/misc/gnu/obstack.c
>     @@ -385,11 +385,11 @@ obstack_free (struct obstack *h, void *obj)
>          abort ();
>      }
>
>     -# if 0
>     +
>      /* Older versions of libc used a function _obstack_free intended
>     to be
>         called by non-GCC compilers.  */
>      strong_alias (obstack_free, _obstack_free)
>     -# endif
>     +
>
>      int
>      _obstack_memory_used (struct obstack *h)
>     --
>     2.7.4
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

-- 
Best regards,

Falko Dmitrii

Leading Software Engineer

Samsung R&D Institute Rus

Tel. 8(495)797-2500 Ext. 3839; mob. +7(999)528-26-02


--Boundary_(ID_yucKPrW2mabY7xM0dmoPkw)
Content-type: text/html; charset=utf-8
Content-transfer-encoding: 8BIT

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hi Ross,<br>
    <br>
    I already re-send this
    patch(<a class="moz-txt-link-freetext" href="http://patches.openembedded.org/patch/125115/">http://patches.openembedded.org/patch/125115/</a>)<br>
    <br>
    More info about this issue i wrote here:
    <a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=9781">https://bugzilla.yoctoproject.org/show_bug.cgi?id=9781</a><br>
    <br>
    <div class="moz-cite-prefix">17.06.2016 13:15, Burton, Ross пишет:<br>
    </div>
    <blockquote
cite="mid:CAJTo0La35D2MT3t1OnNgSbX8NUpUBJgLKpgUSYDgZb6Y_RiWAQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">Hi Dmitry,
        <div><br>
        </div>
        <div>Can you re-send this as a patch against oe-core itself
          instead of (presumably) binutils, explaining why it breaks for
          you and why this is the correct fix?</div>
        <div><br>
        </div>
        <div>Thanks,</div>
        <div>Ross</div>
      </div>
      <div class="gmail_extra"><br>
        <div class="gmail_quote">On 17 June 2016 at 10:33, Dmitriy Falko
          <span dir="ltr">&lt;<a moz-do-not-send="true"
              href="mailto:d.falko@partner.samsung.com" target="_blank">d.falko@partner.samsung.com</a>&gt;</span>
          wrote:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-off-by:
            Dmitriy Falko &lt;<a moz-do-not-send="true"
              href="mailto:d.falko@partner.samsung.com">d.falko@partner.samsung.com</a>&gt;<br>
            ---<br>
             libc/misc/gnu/obstack.c | 4 ++--<br>
             1 file changed, 2 insertions(+), 2 deletions(-)<br>
            <br>
            diff --git a/libc/misc/gnu/obstack.c
            b/libc/misc/gnu/obstack.c<br>
            index 38cfd83..2689263 100644<br>
            --- a/libc/misc/gnu/obstack.c<br>
            +++ b/libc/misc/gnu/obstack.c<br>
            @@ -385,11 +385,11 @@ obstack_free (struct obstack *h, void
            *obj)<br>
                 abort ();<br>
             }<br>
            <br>
            -# if 0<br>
            +<br>
             /* Older versions of libc used a function _obstack_free
            intended to be<br>
                called by non-GCC compilers.  */<br>
             strong_alias (obstack_free, _obstack_free)<br>
            -# endif<br>
            +<br>
            <br>
             int<br>
             _obstack_memory_used (struct obstack *h)<br>
            <span class="HOEnZb"><font color="#888888">--<br>
                2.7.4<br>
                <br>
                --<br>
                _______________________________________________<br>
                Openembedded-core mailing list<br>
                <a moz-do-not-send="true"
                  href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
                <a moz-do-not-send="true"
                  href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                  rel="noreferrer" target="_blank">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
              </font></span></blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
Best regards,

Falko Dmitrii

Leading Software Engineer

Samsung R&amp;D Institute Rus

Tel. 8(495)797-2500 Ext. 3839; mob. +7(999)528-26-02</pre>
  </body>
</html>

--Boundary_(ID_yucKPrW2mabY7xM0dmoPkw)--
