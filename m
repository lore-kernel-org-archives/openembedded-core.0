Return-Path: <kirgene@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 98862609B1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 11:09:35 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id e89so10778594qgf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 04:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=LQ+NS7pkxQ0nASRDvMGdlYMw0tzSNMCxG/EAtGMfKAQ=;
	b=Na6FaVuaRLx7BX2uDeJXlyjf5dHTLS2ppUjDDw9pB+S2rU6B14qIgIlIsD8q+SVhrs
	MpPViHz0pMVrsFpudG22GFbJdB8ttgVn92OoYY45s6hqk7wiM6xS+rCRpo4jtouRX7/t
	HRjTw12GZ900dXFDALM7h+i9weaMpqOdSuU9xx/RVpqb9d6hkuS6jkk48MLsJ6ClyqWH
	jnzuH0Ok6KWckhjtfUblABK/G2qUpSqEfwWdx6qixbAKwT8+a/M3+98PLxAURMBEv6Em
	rtmZvj27kENxgo1OI1P1iqD5iEutDsOQn9RByKwHp29W5c3dnb9oOjll0nmQgCxRMGh9
	huQA==
MIME-Version: 1.0
X-Received: by 10.229.212.194 with SMTP id gt2mr5786712qcb.6.1407928176701;
	Wed, 13 Aug 2014 04:09:36 -0700 (PDT)
Received: by 10.140.51.103 with HTTP; Wed, 13 Aug 2014 04:09:36 -0700 (PDT)
Received: by 10.140.51.103 with HTTP; Wed, 13 Aug 2014 04:09:36 -0700 (PDT)
In-Reply-To: <CAP71WjyHMhzdRWmxNwM8Ot=t1O0qFvONyaKqpWSaeEZU_+PKVQ@mail.gmail.com>
References: <CADV-EXHPuDtDk8pnFfJ4QQCVQufidX+7YuuK_FdgsEXj_46t6A@mail.gmail.com>
	<CADV-EXHDKqVR8Quu=Vj7-Tk8BrB-OS1Y=Y0iYi+ES2YNUiREMQ@mail.gmail.com>
	<CAP71WjyHMhzdRWmxNwM8Ot=t1O0qFvONyaKqpWSaeEZU_+PKVQ@mail.gmail.com>
Date: Wed, 13 Aug 2014 14:09:36 +0300
Message-ID: <CADV-EXF_+nNXPUEY0hJ3akxNCb0HeD+tHAYAiVcq9hACCv-ExA@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Two distros with same MACHINE
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
X-List-Received-Date: Wed, 13 Aug 2014 11:09:45 -0000
Content-Type: multipart/alternative; boundary=001a11339280d777c0050080d2a1

--001a11339280d777c0050080d2a1
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

13 =E1=D7=C7 2014 =C7. 13:51 =D0=CF=CC=D8=DA=CF=D7=C1=D4=C5=CC=D8 "Nicolas =
Dechesne" <
nicolas.dechesne@linaro.org> =CE=C1=D0=C9=D3=C1=CC:
>
> On Wed, Aug 13, 2014 at 12:46 PM, Yevhen Kyriukha <kirgene@gmail.com>
wrote:
> > I have 2 distro configs that use different PACKAGECONFIG settings for
the
> > same package. I'm building all distros for single MACHINE. Do I need to
set
> > different TMPDIR to build these two distros or I can use same dir?
> >
>
> yes, you should. i generally recommend to use 1 build dir for each
> combination of <machine>, <distro> and <OE version>. keep in mind that
> TMPDIR are 'cheap', assuming you are sharing ssate-cache, downloads
> and using rm_work..

Thanks!

--001a11339280d777c0050080d2a1
Content-Type: text/html; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
13 =E1=D7=C7 2014 =C7. 13:51 =D0=CF=CC=D8=DA=CF=D7=C1=D4=C5=CC=D8 &quot;Nic=
olas Dechesne&quot; &lt;<a href=3D"mailto:nicolas.dechesne@linaro.org">nico=
las.dechesne@linaro.org</a>&gt; =CE=C1=D0=C9=D3=C1=CC:<br>
&gt;<br>
&gt; On Wed, Aug 13, 2014 at 12:46 PM, Yevhen Kyriukha &lt;<a href=3D"mailt=
o:kirgene@gmail.com">kirgene@gmail.com</a>&gt; wrote:<br>
&gt; &gt; I have 2 distro configs that use different PACKAGECONFIG settings=
 for the<br>
&gt; &gt; same package. I&#39;m building all distros for single MACHINE. Do=
 I need to set<br>
&gt; &gt; different TMPDIR to build these two distros or I can use same dir=
?<br>
&gt; &gt;<br>
&gt;<br>
&gt; yes, you should. i generally recommend to use 1 build dir for each<br>
&gt; combination of &lt;machine&gt;, &lt;distro&gt; and &lt;OE version&gt;.=
 keep in mind that<br>
&gt; TMPDIR are &#39;cheap&#39;, assuming you are sharing ssate-cache, down=
loads<br>
&gt; and using rm_work..</p>
<p dir=3D"ltr">Thanks!<br>
</p>

--001a11339280d777c0050080d2a1--
