Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 545CB60766
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 10:55:17 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id r145so51280402ior.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 03:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Vc636SaBx7wNYYghPnYX9ySDxbzbsM5/iZ8wqbS3Ya4=;
	b=hEeHG1FCFL93DYKj8zENopQjhzQzGe+9x0S4VJgNoS0WvX1MbzGoux/Zkz1EOpSan0
	P7W8APKlwhkmgT6YkVMOvtLlL/JYUAiOSkcdOmBo/LVrU3k58QvQvUHgMMgV4Y+3KEyI
	9xVJO7RwUW3e4AgBNXnrCh3YV/KbDenajKKoRs+MLcB51yF+yyKi9E6PaZOUIDJnR6Yk
	f7b29WAvye/LU18UEOzUHJqwKjBLOtuCQMJ1Xu9Ubp6JuVH/Nss/Um0UaHbXUCORrpFL
	9JJVh7196+Zwm3PK0ClxQ1HnInWWXpSbyduuzLj259rfxHCdgZb1Qipk6gKt2lCv5SVW
	uFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Vc636SaBx7wNYYghPnYX9ySDxbzbsM5/iZ8wqbS3Ya4=;
	b=G4wKPEhtr6LPzjWUn0Qcpbv0frRzAvDyJSgZHQtXmEzY46YuuDCNk0bYMehZaR4ura
	E5h4ehO6KL7IhRblFif65RS1Exwwe1F45/0WHsAXbU23HyqlFQlpb9PIRp+ssHbbdbP8
	rrI/c/Wz/CtpDNET49D0DTSpxvDkCwDRgEbysg5jClWf/AhQeJA65tsDDZbjLFVCN3Tj
	WpyEC6z0DDG0cOIllpRxBGd0L2LaizLrmyhkQWrzTlGXcWnk5pj9c03PuXulTGAogwWq
	LPlSAkVRBBu7P4DaBbBxt5whpIoFbuOWSQF6pNuF5E9cTQxzJgo+lB5w02cTKMbUgFZi
	v7lA==
X-Gm-Message-State: AA6/9RnlXMznpgTILdkquKk9F4x84VMCVtrqBiw1z41q+nmtzbPCrp6kZAp5yqsuMqE3En5CNk/uDTTDrdKjkvjS
X-Received: by 10.107.28.67 with SMTP id c64mr5170015ioc.195.1475060118510;
	Wed, 28 Sep 2016 03:55:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Wed, 28 Sep 2016 03:54:58 -0700 (PDT)
In-Reply-To: <20160926154228.30567-3-git@andred.net>
References: <20160926154228.30567-1-git@andred.net>
	<20160926154228.30567-3-git@andred.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 Sep 2016 11:54:58 +0100
Message-ID: <CAJTo0Lb9AmtOVA73xVkqmXJzQfvQQc0wBspv+miNo_eyuBUCmg@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] cve-check-tool: report progress when downloading CVE database
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
X-List-Received-Date: Wed, 28 Sep 2016 10:55:17 -0000
Content-Type: multipart/alternative; boundary=001a113fd40462f16f053d8f3210

--001a113fd40462f16f053d8f3210
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 26 September 2016 at 16:42, Andr=C3=A9 Draszik <git@andred.net> wrote:

> ++static int progress_callback_new(void *ptr, curl_off_t dltotal,
> curl_off_t dlnow, curl_off_t ultotal, curl_off_t ulnow)
> ++{
> ++        (void) ultotal;
> ++        (void) ulnow;
> ++
> ++        struct percent_t *percent =3D (struct percent_t *) ptr;
> ++
> ++        if (dltotal && percent) {
> ++                long diff =3D percent->end - percent->start;
> ++                if (diff) {
> ++                        fprintf(stderr,"completed: %lu%%\r",
> percent->start + (diff * dlnow / dltotal));
> ++                }
> ++        }
> ++
> ++        return 0;
> ++}
>

This fails on the autobuilder cluster:

| ../../cve-check-tool-5.6.4/src/library/fetch.c: In function
'progress_callback_new':
| ../../cve-check-tool-5.6.4/src/library/fetch.c:55:54: error: format '%lu'
expects argument of type 'long unsigned int', but argument 3 has type
'curl_off_t {aka long long int}' [-Werror=3Dformat=3D]
|                          fprintf(stderr,"completed: %lu%%\r",
percent->start + (diff * dlnow / dltotal));
|                                                       ^

Ross

--001a113fd40462f16f053d8f3210
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 September 2016 at 16:42, Andr=C3=A9 Draszik <span dir=3D"ltr">&lt;<a =
href=3D"mailto:git@andred.net" target=3D"_blank">git@andred.net</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><div id=3D"gmail-:9nn" class=3D"gmail-a3s gm=
ail-aXjCH gmail-m157672a52456100f">++static int progress_callback_new(void =
*ptr, curl_off_t dltotal, curl_off_t dlnow, curl_off_t ultotal, curl_off_t =
ulnow)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) ultotal;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) ulnow;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct percent_t *percent =3D (struct percent=
_t *) ptr;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dltotal &amp;&amp; percent) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 long diff =3D per=
cent-&gt;end - percent-&gt;start;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (diff) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fprintf(stderr,&quot;completed: %lu%%\r&quot;, percent-&gt;start=
 + (diff * dlnow / dltotal));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
++}</div></blockquote></div><div class=3D"gmail_extra"><br></div>This fails=
 on the autobuilder cluster:</div><div class=3D"gmail_extra"><br>| ../../cv=
e-check-tool-5.6.4/src/library/fetch.c: In function &#39;progress_callback_=
new&#39;:<br>| ../../cve-check-tool-5.6.4/src/library/fetch.c:55:54: error:=
 format &#39;%lu&#39; expects argument of type &#39;long unsigned int&#39;,=
 but argument 3 has type &#39;curl_off_t {aka long long int}&#39; [-Werror=
=3Dformat=3D]<br>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr,&quot;completed: %lu%%\r&q=
uot;, percent-&gt;start + (diff * dlnow / dltotal));<br>| =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ^<br><br></div><div class=3D"gmail_extra">Ross</di=
v></div>

--001a113fd40462f16f053d8f3210--
