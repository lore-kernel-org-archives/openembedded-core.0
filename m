Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1E2FB6AE36
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 12:49:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5SCnOnK000433
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 05:49:24 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 28 Jun 2013 05:49:22 -0700
Message-ID: <51CD8650.7050806@windriver.com>
Date: Fri, 28 Jun 2013 20:49:20 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1371254791-8168-1-git-send-email-net147@gmail.com>
	<51CD7C66.3020702@gmail.com>
	<CA+chaQcjeX_y3c7=MOFkp5jndMdo4xKcAmgA7yWjB_bsaBMb3g@mail.gmail.com>
	<9031819.zlCvcHI3ah@helios> <20130628124534.GN3261@jama>
In-Reply-To: <20130628124534.GN3261@jama>
Subject: Re: [PATCH] qt4e.bbclass: export OE_QMAKE_QT_CONFIG
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
X-List-Received-Date: Fri, 28 Jun 2013 12:49:25 -0000
Content-Type: multipart/alternative;
	boundary="------------090100030206010500060308"

--------------090100030206010500060308
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/28/2013 08:45 PM, Martin Jansa wrote:
> On Fri, Jun 28, 2013 at 01:40:26PM +0100, Paul Eggleton wrote:
>> On Friday 28 June 2013 14:28:56 Martin Jansa wrote:
>>> It's failing in my world builds too now, you can see log here:
>>> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2013
>>> 0627_214856.log/bitbake.log
>>>
>>> Cheers,
>>>
>>> On Fri, Jun 28, 2013 at 2:07 PM, Jonathan Liu <net147@gmail.com> wrote:
>>>> On 15/06/2013 10:06 AM, Jonathan Liu wrote:
>>>>> The class is inheriting qmake2.bbclass which exports OE_QMAKE_QT_CONFIG
>>>>> pointing to the qt4 qconfig.pri when it should be pointing to the
>>>>> qt4-embedded qconfig.pri.
>>>>>
>>>>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>>>>> ---
>>>>>
>>>>>    meta/classes/qt4e.bbclass | 1 +
>>>>>    1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/meta/classes/qt4e.bbclass b/meta/classes/qt4e.bbclass
>>>>> index de2a68d..13b1050 100644
>>>>> --- a/meta/classes/qt4e.bbclass
>>>>> +++ b/meta/classes/qt4e.bbclass
>>>>> @@ -9,6 +9,7 @@ QT_LIBINFIX = "E"
>>>>>
>>>>>    # override variables set by qmake-base to compile Qt/Embedded apps
>>>>>    #
>>>>>    export QMAKESPEC = "${STAGING_DATADIR}/${QT_DIR_**
>>>>>
>>>>> NAME}/mkspecs/${TARGET_OS}-oe-**g++"
>>>>> +export OE_QMAKE_QT_CONFIG = "${STAGING_DATADIR}/${QT_DIR_**
>>>>> NAME}/mkspecs/qconfig.pri"
>>>>>
>>>>>    export OE_QMAKE_INCDIR_QT = "${STAGING_INCDIR}/${QT_DIR_**NAME}"
>>>>>    export OE_QMAKE_LIBDIR_QT = "${STAGING_LIBDIR}"
>>>>>    export OE_QMAKE_LIBS_QT = "qt"
>>>> Hi Saul,
>>>>
>>>> Do you have a log of the error you had building qt4-embedded with this
>>>> patch?
>> FWIW, I see the same error without this patch if I build qt4-embedded after
>> building qt4-x11, so I don't know if this patch is really related to the
>> problem or not.
> It was building fine in world builds until 1-2 weeks ago, but it's
> possible that I was just lucky to have it in right order.
>

Repoduce the bug by STEPS:

bitbake qt4-x11-free
bitbake qt4-embedded
and build qt4-embedded failed.

//Hongxu




>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--------------090100030206010500060308
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 06/28/2013 08:45 PM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote cite="mid:20130628124534.GN3261@jama" type="cite">
      <pre wrap="">On Fri, Jun 28, 2013 at 01:40:26PM +0100, Paul Eggleton wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">On Friday 28 June 2013 14:28:56 Martin Jansa wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">It's failing in my world builds too now, you can see log here:
<a class="moz-txt-link-freetext" href="http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2013">http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2013</a>
0627_214856.log/bitbake.log

Cheers,

On Fri, Jun 28, 2013 at 2:07 PM, Jonathan Liu <a class="moz-txt-link-rfc2396E" href="mailto:net147@gmail.com">&lt;net147@gmail.com&gt;</a> wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="">On 15/06/2013 10:06 AM, Jonathan Liu wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="">The class is inheriting qmake2.bbclass which exports OE_QMAKE_QT_CONFIG
pointing to the qt4 qconfig.pri when it should be pointing to the
qt4-embedded qconfig.pri.

Signed-off-by: Jonathan Liu <a class="moz-txt-link-rfc2396E" href="mailto:net147@gmail.com">&lt;net147@gmail.com&gt;</a>
---

  meta/classes/qt4e.bbclass | 1 +
  1 file changed, 1 insertion(+)

diff --git a/meta/classes/qt4e.bbclass b/meta/classes/qt4e.bbclass
index de2a68d..13b1050 100644
--- a/meta/classes/qt4e.bbclass
+++ b/meta/classes/qt4e.bbclass
@@ -9,6 +9,7 @@ QT_LIBINFIX = "E"

  # override variables set by qmake-base to compile Qt/Embedded apps
  #
  export QMAKESPEC = "${STAGING_DATADIR}/${QT_DIR_**

NAME}/mkspecs/${TARGET_OS}-oe-**g++"
+export OE_QMAKE_QT_CONFIG = "${STAGING_DATADIR}/${QT_DIR_**
NAME}/mkspecs/qconfig.pri"

  export OE_QMAKE_INCDIR_QT = "${STAGING_INCDIR}/${QT_DIR_**NAME}"
  export OE_QMAKE_LIBDIR_QT = "${STAGING_LIBDIR}"
  export OE_QMAKE_LIBS_QT = "qt"
</pre>
            </blockquote>
            <pre wrap="">
Hi Saul,

Do you have a log of the error you had building qt4-embedded with this
patch?
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="">
FWIW, I see the same error without this patch if I build qt4-embedded after 
building qt4-x11, so I don't know if this patch is really related to the 
problem or not.
</pre>
      </blockquote>
      <pre wrap="">
It was building fine in world builds until 1-2 weeks ago, but it's
possible that I was just lucky to have it in right order.

</pre>
    </blockquote>
    <br>
    Repoduce the bug by STEPS:<br>
    <br>
    bitbake qt4-x11-free<br>
    bitbake qt4-embedded<br>
    and build qt4-embedded failed.<br>
    <br>
    //Hongxu<br>
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
    <pre class="bz_comment_text" id="comment_text_5" style="font-size: small; font-family: monospace; white-space: pre-wrap; width: 50em; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">

<pre class="bz_comment_text" id="comment_text_5" style="font-size: small; font-family: monospace; white-space: pre-wrap; width: 50em; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);"></pre>
</pre>
    <br>
    <blockquote cite="mid:20130628124534.GN3261@jama" type="cite"><br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------090100030206010500060308--
