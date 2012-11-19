Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TaWOC-0002tQ-IG
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Nov 2012 19:48:13 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so1998937pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 10:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=DubgwtKktOK5IGOMtHs3ChMX4/K3OPWI9DVqX99EfXg=;
	b=ZIh/vcHVZCxTTX8kqhwufazFQx1Y5Mb250PHxqh7b1bMjYW0V8meiqdkgMuqCAE2gl
	enFcC6oYlNDO2szxaHfrL34WkpqWwTUNdnTaxgXssw/wxrDRXsyFlnhqn+Jdsiszks6t
	d40dCW3QZbjcfZ8VqOWFII4nwfI8glcj4Y1WoLT9svPc928m+YFOmQAibe8Pa6YCR6a7
	Grsy6Hm58PR3q3mw4Ar3G/NNkjFgv5P/aSndGcaNwnDd59UwTBUk9WU7po1snkrAESqY
	haDSvIZzIHvn1Be0KAM5A1SJ1L0pF8V32oa47ywz4wM21M53+dePSdLSflHC+HQ2hLx8
	O7GA==
MIME-Version: 1.0
Received: by 10.68.132.196 with SMTP id ow4mr41871153pbb.49.1353350049353;
	Mon, 19 Nov 2012 10:34:09 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Mon, 19 Nov 2012 10:34:09 -0800 (PST)
In-Reply-To: <50AA768C.3030503@linux.intel.com>
References: <cover.1353304234.git.sgw@linux.intel.com>
	<a18406267008e5a694bc33da212bde6e8cce0038.1353304234.git.sgw@linux.intel.com>
	<CAP9ODKqqud-1kvFVWqgoe_CJgyro4=eBSNfV_g02FP77EAvFWA@mail.gmail.com>
	<50AA768C.3030503@linux.intel.com>
Date: Mon, 19 Nov 2012 16:34:09 -0200
X-Google-Sender-Auth: b_zvR6mzTSy50TfE8xHs0ZTettY
Message-ID: <CAP9ODKpq-Vogu6o7L4XGcm4oadtd2SYU1ar=_dagp+BjDa=K=g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 16/17] cmake: Update to 2.8.10.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Nov 2012 18:48:15 -0000
Content-Type: multipart/alternative; boundary=047d7b15a8dff2d08304cedd5c87

--047d7b15a8dff2d08304cedd5c87
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 19, 2012 at 4:12 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 11/19/2012 02:20 AM, Otavio Salvador wrote:
>
>> On Mon, Nov 19, 2012 at 3:54 AM, Saul Wold <sgw@linux.intel.com
>> <mailto:sgw@linux.intel.com>> wrote:
>>
>>     Rebase the patches due to macro name changes.
>>
>>     Signed-off-by: Saul Wold <sgw@linux.intel.com
>>     <mailto:sgw@linux.intel.com>>
>>
>>     ...
>>
>>     -PR = "${INC_PR}.0"
>>     -
>>     -SRC_URI[md5sum] = "**ba74b22c788a0c8547976b880cd02b**17"
>>     -SRC_URI[sha256sum] =
>>     "**2b59897864d6220ff20aa8eac64cac**8994e004898a1c0f899c8cb4d7b757**
>> 0b46"
>>
>>
>> I find it hard to spot the checksums to be in the .inc file.
>>
>> I'd prefer to have them in the .bb recipes (even if in this case it'd be
>> a duplication).
>>
>>  I am not sure why this is an issue, we already have about a dozen places
> where the SRC_URI and checksum info is located in the .inc file.


We have two recipes and nothing force them to be always in sync so the
checksum seems to be better placed in the .bb file


>
>  In case you would like to avoid the duplication (which I agree) you
>> might before, or later, merge the native handle onto the cmake_<ver>.bb
>> recipe.
>>
>> What do you think?
>>
>>  Looks like there are bigger issues with trying to merge native into the
> standard recipe, mostly due to the fact that the target recipe inherits
> cmake, while the native version does not.
>

Yes; I think I did a brief try in past and gave up.

So please, think about my comment above...

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--047d7b15a8dff2d08304cedd5c87
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 19, 2012 at 4:12 PM, Saul Wold <span dir=3D"ltr">&lt;<a href=3D=
"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;<=
/span> wrote:<br><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">On 11/19/2012 02:20 AM, Otavio Salvador wrote:<br>
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div class=3D"im">On Mon, Nov 19, 2012=
 at 3:54 AM, Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D=
"_blank">sgw@linux.intel.com</a></div>
<div class=3D"im">
&lt;mailto:<a href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@lin=
ux.intel.com</a>&gt;&gt; wrote:<br>
<br>
=A0 =A0 Rebase the patches due to macro name changes.<br>
<br>
=A0 =A0 Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com"=
 target=3D"_blank">sgw@linux.intel.com</a><br></div>
=A0 =A0 &lt;mailto:<a href=3D"mailto:sgw@linux.intel.com" target=3D"_blank"=
>sgw@linux.intel.com</a>&gt;&gt;<div class=3D"im"><br>
=A0 =A0 ...<br>
<br>
=A0 =A0 -PR =3D &quot;${INC_PR}.0&quot;<br>
=A0 =A0 -<br>
=A0 =A0 -SRC_URI[md5sum] =3D &quot;<u></u>ba74b22c788a0c8547976b880cd02b<u>=
</u>17&quot;<br>
=A0 =A0 -SRC_URI[sha256sum] =3D<br>
=A0 =A0 &quot;<u></u>2b59897864d6220ff20aa8eac64cac<u></u>8994e004898a1c0f8=
99c8cb4d7b757<u></u>0b46&quot;<br>
<br>
<br>
I find it hard to spot the checksums to be in the .inc file.<br>
<br>
I&#39;d prefer to have them in the .bb recipes (even if in this case it&#39=
;d be<br>
a duplication).<br>
<br>
</div></blockquote>
I am not sure why this is an issue, we already have about a dozen places wh=
ere the SRC_URI and checksum info is located in the .inc file.</blockquote>=
<div><br></div><div>We have two recipes and nothing force them to be always=
 in sync so the checksum seems to be better placed in the .bb file</div>
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div class=3D"im">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
In case you would like to avoid the duplication (which I agree) you<br>
might before, or later, merge the native handle onto the cmake_&lt;ver&gt;.=
bb<br>
recipe.<br>
<br>
What do you think?<br>
<br>
</blockquote></div>
Looks like there are bigger issues with trying to merge native into the sta=
ndard recipe, mostly due to the fact that the target recipe inherits cmake,=
 while the native version does not.<br></blockquote><div><br></div><div>
Yes; I think I did a brief try in past and gave up.</div><div><br></div><di=
v>So please, think about my comment above...</div><div><br></div></div>-- <=
br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" targe=
t=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems=
.com.br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--047d7b15a8dff2d08304cedd5c87--
