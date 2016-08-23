Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6B2B07318C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 11:46:37 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id 33so7656139lfw.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 04:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=im19idGHDSTfAcW5nup472MeMWfx2Ycy2C7AVbbF5cg=;
	b=AMrlccipxLO+NHGEAxB1+IdER8va0YR5MhJCQyYJQf3W6IjoFMweu0YqlY1gxtV7pN
	A7nFbMJxiKprvBlts8509SDBBM3xJUdxxNwe6bMRN/nx6vw3oc8hem6BnaiQr3JJTzWW
	CXvZgdznmX5JGLhbvFGLonPj5p8dU8UbhYjHcevel3L9Jn3Agz01/nOsnQ8BP1tM/9/n
	iQuXMBqPvqMcsrvpt4ZLI4pG6Dgr63eH+T0uXandNMH12qzZcsBh27bc5THPv6TvC++j
	om+jpPh8M7xAkQGMZ8ObKzZHrkOgCzXHXo+vpExUeh50ns/N9uug/vofvD/upTyRYpTU
	1H+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=im19idGHDSTfAcW5nup472MeMWfx2Ycy2C7AVbbF5cg=;
	b=ksdvydXiD+qJjrzQUNd4DKGkUwSSlgQ3O4j2C/qyZ6PKuRwWSe/pcyqLFxX0dRdmM1
	OVBNiP/gkK1HjNOW/MARdkc/fcLoyeNgpwFV55FHpNTAQpAljVrMcKgOg70aDxe404rK
	49ZHXZ1XCtFlN0pRqBkYN1mykesLEr6CT3mef5PZ4U2rGoL3bjQVkrtMKy5FhYut3++b
	OpjnJG7SMSo4YrsAJGlW9XkWIGh7Lv5c5v6aFZ+w1iP84TAlJ92Ro6BG3P9NuJ/B2I9+
	5j5G1tZQ0KROOaJpBR1b5MdWCv5edVekz8vPPot/2mitE7wLQ/NlS3/zmeTvqnqfTVqS
	nX0w==
X-Gm-Message-State: AEkooutzVryZv+x/8JYkjgahhnJzeDb4fD1m8vNd0kAVGaWna6rbIIIzFKx9DH2YAQcPu+m4WkQRXSemTHfk/w==
X-Received: by 10.25.157.19 with SMTP id g19mr8413177lfe.216.1471952796237;
	Tue, 23 Aug 2016 04:46:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.7.8 with HTTP; Tue, 23 Aug 2016 04:46:05 -0700 (PDT)
X-Originating-IP: [177.127.4.56]
In-Reply-To: <CAHiDW_HVkdb2dt=RiqrG+abyD1MqcnTkceZqm3ZspUPzh69GhA@mail.gmail.com>
References: <1471892273-5919-1-git-send-email-fabio.berton@ossystems.com.br>
	<CAHiDW_HVkdb2dt=RiqrG+abyD1MqcnTkceZqm3ZspUPzh69GhA@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Tue, 23 Aug 2016 08:46:05 -0300
Message-ID: <CAAPZna2KCKiy=huVRxOmYZ4udgGQgba+awbxz6cZObJpCnPxnA@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] python-3.5-manifest: Rename Queue module to queue
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
X-List-Received-Date: Tue, 23 Aug 2016 11:46:39 -0000
Content-Type: multipart/alternative; boundary=001a11402ebe8bd572053abbb78d

--001a11402ebe8bd572053abbb78d
Content-Type: text/plain; charset=UTF-8

Ok.

I'll send a v2 using using generate-manifest script.

Thanks.

On Tue, Aug 23, 2016 at 5:08 AM, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> On 22 August 2016 at 21:57, Fabio Berton <fabio.berton@ossystems.com.br>
> wrote:
>
>> The Queue module has been renamed to queue in Python 3.
>>
>> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>> ---
>>  meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>
> This file is generated from scripts/contrib/python/generat
> e-manifest-3.5.py, please modify that file and run it to produce the new
> manifest.inc.
>
> Jussi
>
>
>
>> diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc
>> b/meta/recipes-devtools/python/python-3.5-manifest.inc
>> index b9c2fec..3e07a11 100644
>> --- a/meta/recipes-devtools/python/python-3.5-manifest.inc
>> +++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
>> @@ -247,7 +247,7 @@ FILES_${PN}-textutils="${libdi
>> r}/python3.5/lib-dynload/_csv.*.so ${libdir}/pytho
>>
>>  SUMMARY_${PN}-threading="Python threading & synchronization support"
>>  RDEPENDS_${PN}-threading="${PN}-core ${PN}-lang"
>> -FILES_${PN}-threading="${libdir}/python3.5/_threading_local.*
>> ${libdir}/python3.5/dummy_thread.* ${libdir}/python3.5/dummy_threading.*
>> ${libdir}/python3.5/mutex.* ${libdir}/python3.5/threading.*
>> ${libdir}/python3.5/Queue.* "
>> +FILES_${PN}-threading="${libdir}/python3.5/_threading_local.*
>> ${libdir}/python3.5/dummy_thread.* ${libdir}/python3.5/dummy_threading.*
>> ${libdir}/python3.5/mutex.* ${libdir}/python3.5/threading.*
>> ${libdir}/python3.5/queue.* "
>>
>>  SUMMARY_${PN}-tkinter="Python Tcl/Tk bindings"
>>  RDEPENDS_${PN}-tkinter="${PN}-core"
>> --
>> 2.1.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>

--001a11402ebe8bd572053abbb78d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small"><div class=3D"gmail_default" style=3D"font-fam=
ily:monospace,monospace;font-size:small">Ok.<br><br></div><div class=3D"gma=
il_default" style=3D"font-family:monospace,monospace;font-size:small">I&#39=
;ll send a v2 using using generate-manifest script.<br><br></div>Thanks.</d=
iv></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, =
Aug 23, 2016 at 5:08 AM, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><di=
v class=3D"gmail_extra"><div class=3D"gmail_quote"><span class=3D"">On 22 A=
ugust 2016 at 21:57, Fabio Berton <span dir=3D"ltr">&lt;<a href=3D"mailto:f=
abio.berton@ossystems.com.br" target=3D"_blank">fabio.berton@ossystems.com.=
br</a><wbr>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">The Queue module has been renamed to queue in Python 3.<br>
<br>
Signed-off-by: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossystems.co=
m.br" target=3D"_blank">fabio.berton@ossystems.com.br</a><wbr>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python/<wbr>python-3.5-manifest.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br></blockquote><div><br></div></span><div>This file is generated from scr=
ipts/contrib/python/<a href=3D"http://generate-manifest-3.5.py" target=3D"_=
blank">generat<wbr>e-manifest-3.5.py</a>, please modify that file and run i=
t to produce the new manifest.inc.</div><div><br></div><div>Jussi</div><div=
><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><span class=3D"">
diff --git a/meta/recipes-devtools/python<wbr>/python-3.5-manifest.inc b/me=
ta/recipes-devtools/python<wbr>/python-3.5-manifest.inc<br>
index b9c2fec..3e07a11 100644<br>
--- a/meta/recipes-devtools/python<wbr>/python-3.5-manifest.inc<br>
+++ b/meta/recipes-devtools/python<wbr>/python-3.5-manifest.inc<br>
@@ -247,7 +247,7 @@ FILES_${PN}-textutils=3D&quot;${libdi<wbr>r}/python3.5/=
lib-dynload/_csv.<wbr>*.so ${libdir}/pytho<br>
<br>
=C2=A0SUMMARY_${PN}-threading=3D&quot;Pyth<wbr>on threading &amp; synchroni=
zation support&quot;<br>
=C2=A0RDEPENDS_${PN}-threading=3D&quot;${P<wbr>N}-core ${PN}-lang&quot;<br>
-FILES_${PN}-threading=3D&quot;${libd<wbr>ir}/python3.5/_threading_local<wb=
r>.* ${libdir}/python3.5/dummy_thre<wbr>ad.* ${libdir}/python3.5/dummy_thre=
<wbr>ading.* ${libdir}/python3.5/mutex.* ${libdir}/python3.5/threading.<wbr=
>* ${libdir}/python3.5/Queue.* &quot;<br>
+FILES_${PN}-threading=3D&quot;${libd<wbr>ir}/python3.5/_threading_local<wb=
r>.* ${libdir}/python3.5/dummy_thre<wbr>ad.* ${libdir}/python3.5/dummy_thre=
<wbr>ading.* ${libdir}/python3.5/mutex.* ${libdir}/python3.5/threading.<wbr=
>* ${libdir}/python3.5/queue.* &quot;<br>
<br>
=C2=A0SUMMARY_${PN}-tkinter=3D&quot;Python Tcl/Tk bindings&quot;<br>
=C2=A0RDEPENDS_${PN}-tkinter=3D&quot;${PN}<wbr>-core&quot;<br>
</span><span><font color=3D"#888888"><span class=3D"HOEnZb"><font color=3D"=
#888888">--<br>
2.1.4<br>
<br></font></span><span class=3D"">
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</span></font></span></blockquote></div><br></div></div>
</blockquote></div><br></div>

--001a11402ebe8bd572053abbb78d--
