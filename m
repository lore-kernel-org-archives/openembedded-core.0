Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOsiZ-0000ga-0E
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 17:40:51 +0200
Received: by lagw12 with SMTP id w12so1894107lag.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 08:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=M2n7jQLvhZ5mKJ065mFc+tZ48rlEzdzd8pvrpFeg2Jc=;
	b=sxW6s7bqYoViDkaNLfcM4I54ZnhryNGXDWF6RmzrqQ5WJsW2MFp16F1pvrEzCFzjdT
	Gp4KyTRefJN1vQcwDeuFmWoHpcqjHIQw8azoZyLtptUO0DNYAr+hh8rEvSdAXGEnxwGc
	eU+0NH3kjjMDAwfFFwveoF2qxSlvfvRn1ru2280E7uvHK5AU0PZe65Kh2iofutk4cf5/
	GXKSC0hWl6RK0EGQute/6FJG11wdbTLoaObJMr926q05d8rNYOdh1/5eG+a6qLb7/NFw
	kkSDcoJsswJsPl3B59amHQ7yLPhOZQ8NqqXq3g914zHqYG52t+ye3KQskojz9bnogjmQ
	nrRA==
MIME-Version: 1.0
Received: by 10.112.32.72 with SMTP id g8mr4141737lbi.43.1335799868361; Mon,
	30 Apr 2012 08:31:08 -0700 (PDT)
Received: by 10.152.129.134 with HTTP; Mon, 30 Apr 2012 08:31:08 -0700 (PDT)
In-Reply-To: <4F9EAE10.6090901@linux.intel.com>
References: <cover.1335600691.git.dongxiao.xu@intel.com>
	<baa0f344e516b3474cf5f1a5e8afcbc392be16de.1335600691.git.dongxiao.xu@intel.com>
	<20120429084538.GA350@jama.jama.net>
	<4F9EAE10.6090901@linux.intel.com>
Date: Mon, 30 Apr 2012 08:31:08 -0700
Message-ID: <CAMKF1sqAEGtCSg09spZmpseJ2=6Byan+WD9ZnO3oC31565wVzA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/8] ofono: upgrade to version 1.6
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
X-List-Received-Date: Mon, 30 Apr 2012 15:40:51 -0000
Content-Type: multipart/alternative; boundary=bcaec554deaaa50cd504bee72409

--bcaec554deaaa50cd504bee72409
Content-Type: text/plain; charset=UTF-8

On Monday, April 30, 2012, Saul Wold <sgw@linux.intel.com> wrote:
> On 04/29/2012 01:45 AM, Martin Jansa wrote:
>>
>> On Sat, Apr 28, 2012 at 04:12:30PM +0800, Dongxiao Xu wrote:
>>>
>>> Signed-off-by: Dongxiao Xu<dongxiao.xu@intel.com>
>>> ---
>>>  .../ofono/{ofono_1.5.bb =>  ofono_1.6.bb}           |    2 +-
>>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>>  rename meta/recipes-connectivity/ofono/{ofono_1.5.bb =>  ofono_1.6.bb}
(97%)
>>>
>>> diff --git a/meta/recipes-connectivity/ofono/ofono_1.5.bbb/meta/recipes-connectivity/ofono/
ofono_1.6.bb
>>> similarity index 97%
>>> rename from meta/recipes-connectivity/ofono/ofono_1.5.bb
>>> rename to meta/recipes-connectivity/ofono/ofono_1.6.bb
>>> index dad813f..d0f273b 100644
>>> --- a/meta/recipes-connectivity/ofono/ofono_1.5.bb
>>> +++ b/meta/recipes-connectivity/ofono/ofono_1.6.bb
>>> @@ -1,6 +1,6 @@
>>>  require ofono.inc
>>>
>>> -PR = "r1"
>>> +PR = "r0"
>>
>> without checksum change it will fail, right?
>>
>> I'll send patch I have for ofono upgrade in my branch.
>>
> This seems to have uncovered a problem with the Fetcher, it happily pulls
the upstream tarball, raises a BBFetchException, and writes the checksum
failure to the log file, but it seems to still mark the fetch complete with
a .done file and continues to build.
>

Will check summing not be done next time it tries to build the recipe

> I will file a bug.
>
> Sau!
>
>>>
>>>  SRC_URI  =
"${KERNELORG_MIRROR}/linux/network/ofono/${BPN}-${PV}.tar.bz2 \
>>>                  file://ofono"
>>> --
>>> 1.7.4.1
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--bcaec554deaaa50cd504bee72409
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, April 30, 2012, Saul Wold &lt;<a href=3D"mailto:sgw@linu=
x.intel.com">sgw@linux.intel.com</a>&gt; wrote:<br>&gt; On 04/29/2012 01:45=
 AM, Martin Jansa wrote:<br>&gt;&gt;<br>&gt;&gt; On Sat, Apr 28, 2012 at 04=
:12:30PM +0800, Dongxiao Xu wrote:<br>
&gt;&gt;&gt;<br>&gt;&gt;&gt; Signed-off-by: Dongxiao Xu&lt;<a href=3D"mailt=
o:dongxiao.xu@intel.com">dongxiao.xu@intel.com</a>&gt;<br>&gt;&gt;&gt; ---<=
br>&gt;&gt;&gt; =C2=A0.../ofono/{<a href=3D"http://ofono_1.5.bb">ofono_1.5.=
bb</a> =3D&gt; =C2=A0<a href=3D"http://ofono_1.6.bb">ofono_1.6.bb</a>} =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-<br>
&gt;&gt;&gt; =C2=A01 files changed, 1 insertions(+), 1 deletions(-)<br>&gt;=
&gt;&gt; =C2=A0rename meta/recipes-connectivity/ofono/{<a href=3D"http://of=
ono_1.5.bb">ofono_1.5.bb</a> =3D&gt; =C2=A0<a href=3D"http://ofono_1.6.bb">=
ofono_1.6.bb</a>} (97%)<br>
&gt;&gt;&gt;<br>&gt;&gt;&gt; diff --git a/meta/recipes-connectivity/ofono/<=
a href=3D"http://ofono_1.5.bb">ofono_1.5.bb</a> b/meta/recipes-connectivity=
/ofono/<a href=3D"http://ofono_1.6.bb">ofono_1.6.bb</a><br>&gt;&gt;&gt; sim=
ilarity index 97%<br>
&gt;&gt;&gt; rename from meta/recipes-connectivity/ofono/<a href=3D"http://=
ofono_1.5.bb">ofono_1.5.bb</a><br>&gt;&gt;&gt; rename to meta/recipes-conne=
ctivity/ofono/<a href=3D"http://ofono_1.6.bb">ofono_1.6.bb</a><br>&gt;&gt;&=
gt; index dad813f..d0f273b 100644<br>
&gt;&gt;&gt; --- a/meta/recipes-connectivity/ofono/<a href=3D"http://ofono_=
1.5.bb">ofono_1.5.bb</a><br>&gt;&gt;&gt; +++ b/meta/recipes-connectivity/of=
ono/<a href=3D"http://ofono_1.6.bb">ofono_1.6.bb</a><br>&gt;&gt;&gt; @@ -1,=
6 +1,6 @@<br>
&gt;&gt;&gt; =C2=A0require ofono.inc<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; -PR =
=3D &quot;r1&quot;<br>&gt;&gt;&gt; +PR =3D &quot;r0&quot;<br>&gt;&gt;<br>&g=
t;&gt; without checksum change it will fail, right?<br>&gt;&gt;<br>&gt;&gt;=
 I&#39;ll send patch I have for ofono upgrade in my branch.<br>
&gt;&gt;<br>&gt; This seems to have uncovered a problem with the Fetcher, i=
t happily pulls the upstream tarball, raises a BBFetchException, and writes=
 the checksum failure to the log file, but it seems to still mark the fetch=
 complete with a .done file and continues to build.<br>
&gt;<br><br>Will check summing not be done next time it tries to build the =
recipe <br><br>&gt; I will file a bug.<br>&gt;<br>&gt; Sau!<br>&gt;<br>&gt;=
&gt;&gt;<br>&gt;&gt;&gt; =C2=A0SRC_URI =C2=A0=3D &quot;${KERNELORG_MIRROR}/=
linux/network/ofono/${BPN}-${PV}.tar.bz2 \<br>
&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
file://ofono&quot;<br>&gt;&gt;&gt; --<br>&gt;&gt;&gt; 1.7.4.1<br>&gt;&gt;&g=
t;<br>&gt;&gt;&gt;<br>&gt;&gt;&gt; ________________________________________=
_______<br>&gt;&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Op=
enembedded-core@lists.openembedded.org</a><br>&gt;&gt;&gt; <a href=3D"http:=
//lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core">http://li=
sts.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a><br>
&gt;&gt;<br>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt; ______________________________=
_________________<br>&gt;&gt; Openembedded-core mailing list<br>&gt;&gt; <a=
 href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-core=
@lists.openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/ope=
nembedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core</a><br>&gt;<br>&gt; ____________________________________________=
___<br>
&gt; Openembedded-core mailing list<br>&gt; <a href=3D"mailto:Openembedded-=
core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><b=
r>&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/opene=
mbedded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembed=
ded-core</a><br>
&gt;

--bcaec554deaaa50cd504bee72409--
