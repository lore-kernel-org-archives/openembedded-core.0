Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkjXh-0001kg-Oi
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 00:19:59 +0200
Received: by eaal1 with SMTP id l1so1549780eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 15:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=loOrsDPjhLeIq+cYn3zzQ8qkMkpJmpx8ILlRxBVQno4=;
	b=XHLaQ+M3tUcChkFGoTZiCDpGJNIahzgxYC1+37/sP+nKiyABl4bc5z89FOK6UvYtdU
	/s1GTQehLhMFT6MhgdfglPpMGfFAikSNcyFb3q+0dmo6TrJk+cOhQ9BIsatL12hCwvz2
	ZYtS2/Yl98eEvFusiaD1P5i9iTHbpMAVf2g2GqCFyvmORY146gsHsMcnabrTM7qMl320
	BHj8wJEEihELfu6FWTh662ymu0V07VXPIOggR0AebqJ0OeL6cp0yIiw8jupk996Ue1u3
	7MXdou4vQj8+9aVSivoygd0rdpdLKUx/oBjsY4AODcvG9q8Nztqf4tdmsQF/+ilZEyuE
	V3ow==
MIME-Version: 1.0
Received: by 10.14.39.1 with SMTP id c1mr618455eeb.142.1341007741613; Fri, 29
	Jun 2012 15:09:01 -0700 (PDT)
Received: by 10.14.210.199 with HTTP; Fri, 29 Jun 2012 15:09:01 -0700 (PDT)
In-Reply-To: <4FEE253F.805@linux.intel.com>
References: <cover.1341004548.git.sgw@linux.intel.com>
	<d273d0ea0fd0059499c54b68ba420043a31f2bb7.1341004548.git.sgw@linux.intel.com>
	<CAMKF1so_1JQY-4eRWZ8Xkq4ixQ7cCmCSVAEohtjRJEFd9KoZiA@mail.gmail.com>
	<4FEE253F.805@linux.intel.com>
Date: Fri, 29 Jun 2012 15:09:01 -0700
Message-ID: <CAMKF1srBr6=b_s-OAbPiL3nYGQuf7V-hG9R2dbcaa+fodyUvuA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] bitbake.conf: Add PACKAGE_BEFORE_PN to PACKAGES
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
X-List-Received-Date: Fri, 29 Jun 2012 22:19:59 -0000
Content-Type: multipart/alternative; boundary=bcaec52be7311475de04c3a3b27c

--bcaec52be7311475de04c3a3b27c
Content-Type: text/plain; charset=UTF-8

On Friday, June 29, 2012, Saul Wold <sgw@linux.intel.com> wrote:
> On 06/29/2012 02:52 PM, Khem Raj wrote:
>>
>>
>> On Friday, June 29, 2012, Saul Wold <sgw@linux.intel.com
>> <mailto:sgw@linux.intel.com>> wrote:
>>  > By doing this we can easily add addtional packages that can be
>>  > greedy before PN, but after some of the other standard packages.
>>  >
>>  > This will also allow us to simplify the lib_package class to set
>>  > this variable.
>>  >
>>  > Signed-off-by: Saul Wold <sgw@linux.intel.com
>> <mailto:sgw@linux.intel.com>>
>>  > ---
>>  >  meta/conf/bitbake.conf |    3 ++-
>>  >  1 file changed, 2 insertions(+), 1 deletion(-)
>>  >
>>  > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>>  > index 9377ee6..df4907e 100644
>>  > --- a/meta/conf/bitbake.conf
>>  > +++ b/meta/conf/bitbake.conf
>>  > @@ -254,7 +254,8 @@ SOLIBSDEV_darwin = ".dylib"
>>  >  SOLIBSDEV_darwin8 = ".dylib"
>>  >  SOLIBSDEV_darwin9 = ".dylib"
>>  >
>>  > -PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc
>> ${PN}-locale ${PN}"
>>  > +PACKAGE_BEFORE_PN ?= ""
>>  > +PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc
>> ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
>>  >  PACKAGES_DYNAMIC = "${PN}-locale-*"
>>  >  FILES = ""
>>  >
>>
>>
>> Can it appear at the beginning before pn-dbg?
>> Then you could just prepend I don't think any of those predefined
>> packages will have anything of interest that's in pn-bin
>
> No that's won't work since pn-dev wants to get -config binaries and
sometimes there are other binaries that pn-dev wants, I did try that
initially, by having -bin in front with =+ and got failures.
>
> This has been a tricky set of changes to deal with.


Hmm this variable really looks very specific not something for general
bitbake.conf I think
Can pn-bin appear after pn  since in case of libraries on should not have
much interest in binaries
> Sau!
>
>>  > --
>>  > 1.7.10.4
>>  >
>>  >
>>  > _______________________________________________
>>  > Openembedded-core mailing list
>>  > Openembedded-core@lists.openembedded.org
>> <mailto:Openembedded-core@lists.openembedded.org>
>>  > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>  >
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--bcaec52be7311475de04c3a3b27c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, June 29, 2012, Saul Wold &lt;<a href=3D"mailto:sgw@linux=
.intel.com">sgw@linux.intel.com</a>&gt; wrote:<br>&gt; On 06/29/2012 02:52 =
PM, Khem Raj wrote:<br>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt; On Friday, June 29,=
 2012, Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@linux.intel=
.com</a><br>
&gt;&gt; &lt;mailto:<a href=3D"mailto:sgw@linux.intel.com">sgw@linux.intel.=
com</a>&gt;&gt; wrote:<br>&gt;&gt; =C2=A0&gt; By doing this we can easily a=
dd addtional packages that can be<br>&gt;&gt; =C2=A0&gt; greedy before PN, =
but after some of the other standard packages.<br>
&gt;&gt; =C2=A0&gt;<br>&gt;&gt; =C2=A0&gt; This will also allow us to simpl=
ify the lib_package class to set<br>&gt;&gt; =C2=A0&gt; this variable.<br>&=
gt;&gt; =C2=A0&gt;<br>&gt;&gt; =C2=A0&gt; Signed-off-by: Saul Wold &lt;<a h=
ref=3D"mailto:sgw@linux.intel.com">sgw@linux.intel.com</a><br>
&gt;&gt; &lt;mailto:<a href=3D"mailto:sgw@linux.intel.com">sgw@linux.intel.=
com</a>&gt;&gt;<br>&gt;&gt; =C2=A0&gt; ---<br>&gt;&gt; =C2=A0&gt; =C2=A0met=
a/conf/bitbake.conf | =C2=A0 =C2=A03 ++-<br>&gt;&gt; =C2=A0&gt; =C2=A01 fil=
e changed, 2 insertions(+), 1 deletion(-)<br>
&gt;&gt; =C2=A0&gt;<br>&gt;&gt; =C2=A0&gt; diff --git a/meta/conf/bitbake.c=
onf b/meta/conf/bitbake.conf<br>&gt;&gt; =C2=A0&gt; index 9377ee6..df4907e =
100644<br>&gt;&gt; =C2=A0&gt; --- a/meta/conf/bitbake.conf<br>&gt;&gt; =C2=
=A0&gt; +++ b/meta/conf/bitbake.conf<br>
&gt;&gt; =C2=A0&gt; @@ -254,7 +254,8 @@ SOLIBSDEV_darwin =3D &quot;.dylib&q=
uot;<br>&gt;&gt; =C2=A0&gt; =C2=A0SOLIBSDEV_darwin8 =3D &quot;.dylib&quot;<=
br>&gt;&gt; =C2=A0&gt; =C2=A0SOLIBSDEV_darwin9 =3D &quot;.dylib&quot;<br>&g=
t;&gt; =C2=A0&gt;<br>&gt;&gt; =C2=A0&gt; -PACKAGES =3D &quot;${PN}-dbg ${PN=
}-staticdev ${PN}-dev ${PN}-doc<br>
&gt;&gt; ${PN}-locale ${PN}&quot;<br>&gt;&gt; =C2=A0&gt; +PACKAGE_BEFORE_PN=
 ?=3D &quot;&quot;<br>&gt;&gt; =C2=A0&gt; +PACKAGES =3D &quot;${PN}-dbg ${P=
N}-staticdev ${PN}-dev ${PN}-doc<br>&gt;&gt; ${PN}-locale ${PACKAGE_BEFORE_=
PN} ${PN}&quot;<br>
&gt;&gt; =C2=A0&gt; =C2=A0PACKAGES_DYNAMIC =3D &quot;${PN}-locale-*&quot;<b=
r>&gt;&gt; =C2=A0&gt; =C2=A0FILES =3D &quot;&quot;<br>&gt;&gt; =C2=A0&gt;<b=
r>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt; Can it appear at the beginning before pn=
-dbg?<br>&gt;&gt; Then you could just prepend I don&#39;t think any of thos=
e predefined<br>
&gt;&gt; packages will have anything of interest that&#39;s in pn-bin<br>&g=
t;<br>&gt; No that&#39;s won&#39;t work since pn-dev wants to get -config b=
inaries and sometimes there are other binaries that pn-dev wants, I did try=
 that initially, by having -bin in front with =3D+ and got failures.<br>
&gt;<br>&gt; This has been a tricky set of changes to deal with.<br><br><br=
>Hmm this variable really looks very specific not something for general bit=
bake.conf I think<br>Can pn-bin appear after pn =C2=A0since in case of libr=
aries on should not have much interest in binaries <br>
&gt; Sau!<br>&gt;<br>&gt;&gt; =C2=A0&gt; --<br>&gt;&gt; =C2=A0&gt; 1.7.10.4=
<br>&gt;&gt; =C2=A0&gt;<br>&gt;&gt; =C2=A0&gt;<br>&gt;&gt; =C2=A0&gt; _____=
__________________________________________<br>&gt;&gt; =C2=A0&gt; Openembed=
ded-core mailing list<br>&gt;&gt; =C2=A0&gt; <a href=3D"mailto:Openembedded=
-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><=
br>
&gt;&gt; &lt;mailto:<a href=3D"mailto:Openembedded-core@lists.openembedded.=
org">Openembedded-core@lists.openembedded.org</a>&gt;<br>&gt;&gt; =C2=A0&gt=
; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedd=
ed-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-c=
ore</a><br>
&gt;&gt; =C2=A0&gt;<br>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt; ___________________=
____________________________<br>&gt;&gt; Openembedded-core mailing list<br>=
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openem=
bedded-core@lists.openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/ope=
nembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core</a><br>&gt;

--bcaec52be7311475de04c3a3b27c--
