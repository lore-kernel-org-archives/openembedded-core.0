Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 37E1A713D5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 14:40:20 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id rp18so14229184iec.30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Sep 2014 07:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=x3Poq/cqTRMSP6b0Ko8Tkf+bPnLr+XyHZ4N10ygZXro=;
	b=TRuKyo+wFIN3uXlaOjchM5fJnPJHgT+lpqdNYOFMG1L5/xpSaJ2/fe+lrOp51MQ8JT
	Eek0lffNPN8/NSzq5OUjeURfoA5gDu+lJ9CHRDFjJZj2DIiiYh+quIB1TKY2kxRmR4/R
	XdSvX6eXb6Lda+HFm+Xp81yF5Rt3m9aQ4veGYWaKl54IEX52Zt0NCsfMGjseZMqYoY8R
	6t7RxWVaDYlOVtUhGtjAlhC46dnmtE2PdOiXSdaRwauEo0tWsW+Ep7Xa1LeP2lvPCQUM
	gXMZEMEvC5ZMH7orsBAyNWlVtFN7Ht5Eu1z7spHIafQh8UBYPVSnESHMLUNuhwuT8kog
	nQCw==
MIME-Version: 1.0
X-Received: by 10.42.62.6 with SMTP id w6mr15440999ich.24.1409928021203; Fri,
	05 Sep 2014 07:40:21 -0700 (PDT)
Received: by 10.50.102.67 with HTTP; Fri, 5 Sep 2014 07:40:21 -0700 (PDT)
In-Reply-To: <CAJTo0LaQh=cMsbVYgt_xjhXqe0L76KC-efk17Pju6A21Da=j0Q@mail.gmail.com>
References: <53C3A130.4000900@pabigot.com> <53DC39DE.5020105@pabigot.com>
	<CAP9ODKo8dwJvw9cwDKEY0fQNo6Z+NrxavZtZs1AjcvQgHc_5JQ@mail.gmail.com>
	<CAJTo0LaQh=cMsbVYgt_xjhXqe0L76KC-efk17Pju6A21Da=j0Q@mail.gmail.com>
Date: Fri, 5 Sep 2014 07:40:21 -0700
Message-ID: <CAMKF1sqZZaXy9AkRHEeXyeoMWABWMS-+PK_v-6QAr5d8Qc1hPA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: patchwork client problems
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
X-List-Received-Date: Fri, 05 Sep 2014 14:40:29 -0000
Content-Type: multipart/alternative; boundary=90e6ba614f0cdce27405025272a1

--90e6ba614f0cdce27405025272a1
Content-Type: text/plain; charset=UTF-8

On Friday, September 5, 2014, Burton, Ross <ross.burton@intel.com> wrote:

> On 4 August 2014 21:16, Otavio Salvador <otavio@ossystems.com.br
> <javascript:;>> wrote:
> >> And I still get empty documents back from the OE patchwork server for
> every
> >> pwclient command I try.
> >>
> >> Anybody have any idea what's going wrong?
> >>
> >> Thanks.
> >>
> >> Peter
> >>
> >> llc[40]$ /tmp/pwclient projects
> >> Traceback (most recent call last):
> >>   File "/tmp/pwclient", line 500, in <module>
> >>     main()
> >>   File "/tmp/pwclient", line 439, in main
> >>     action_projects(rpc)
> >>   File "/tmp/pwclient", line 213, in action_projects
> >>     projects = rpc.project_list("", 0)
> >>   File "/usr/lib/python2.7/xmlrpclib.py", line 1224, in __call__
> >>     return self.__send(self.__name, args)
> >>   File "/usr/lib/python2.7/xmlrpclib.py", line 1578, in __request
> >>     verbose=self.__verbose
> >>   File "/usr/lib/python2.7/xmlrpclib.py", line 1264, in request
> >>     return self.single_request(host, handler, request_body, verbose)
> >>   File "/usr/lib/python2.7/xmlrpclib.py", line 1297, in single_request
> >>     return self.parse_response(response)
> >>   File "/usr/lib/python2.7/xmlrpclib.py", line 1471, in parse_response
> >>     p.close()
> >>   File "/usr/lib/python2.7/xmlrpclib.py", line 560, in close
> >>     self._parser.Parse("", 1) # end of data
> >> xml.parsers.expat.ExpatError: no element found: line 1, column 0
> >
> > I have same error; I am adding Khem who I know has access to the
> > server and can know more about it.
>
> Khem - have you been able to look at this?  I was hoping to use
> patchwork to merge patches from the list but obviously this is a bit
> of a blocker.


Ok I haven't but over this weekend I can try

>
> Cheers,
> Ross
>

--90e6ba614f0cdce27405025272a1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, September 5, 2014, Burton, Ross &lt;<a href=3D"mailto:ro=
ss.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">On 4 August 2014 21:16, Otavio Salvador &lt;<a href=3D"jav=
ascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;otavio@ossystems.com.b=
r&#39;)">otavio@ossystems.com.br</a>&gt; wrote:<br>
&gt;&gt; And I still get empty documents back from the OE patchwork server =
for every<br>
&gt;&gt; pwclient command I try.<br>
&gt;&gt;<br>
&gt;&gt; Anybody have any idea what&#39;s going wrong?<br>
&gt;&gt;<br>
&gt;&gt; Thanks.<br>
&gt;&gt;<br>
&gt;&gt; Peter<br>
&gt;&gt;<br>
&gt;&gt; llc[40]$ /tmp/pwclient projects<br>
&gt;&gt; Traceback (most recent call last):<br>
&gt;&gt;=C2=A0 =C2=A0File &quot;/tmp/pwclient&quot;, line 500, in &lt;modul=
e&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0main()<br>
&gt;&gt;=C2=A0 =C2=A0File &quot;/tmp/pwclient&quot;, line 439, in main<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0action_projects(rpc)<br>
&gt;&gt;=C2=A0 =C2=A0File &quot;/tmp/pwclient&quot;, line 213, in action_pr=
ojects<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0projects =3D rpc.project_list(&quot;&quot;, 0)<=
br>
&gt;&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python2.7/xmlrpclib.py&quot;, line=
 1224, in __call__<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0return self.__send(self.__name, args)<br>
&gt;&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python2.7/xmlrpclib.py&quot;, line=
 1578, in __request<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0verbose=3Dself.__verbose<br>
&gt;&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python2.7/xmlrpclib.py&quot;, line=
 1264, in request<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0return self.single_request(host, handler, reque=
st_body, verbose)<br>
&gt;&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python2.7/xmlrpclib.py&quot;, line=
 1297, in single_request<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0return self.parse_response(response)<br>
&gt;&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python2.7/xmlrpclib.py&quot;, line=
 1471, in parse_response<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0p.close()<br>
&gt;&gt;=C2=A0 =C2=A0File &quot;/usr/lib/python2.7/xmlrpclib.py&quot;, line=
 560, in close<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0self._parser.Parse(&quot;&quot;, 1) # end of da=
ta<br>
&gt;&gt; xml.parsers.expat.ExpatError: no element found: line 1, column 0<b=
r>
&gt;<br>
&gt; I have same error; I am adding Khem who I know has access to the<br>
&gt; server and can know more about it.<br>
<br>
Khem - have you been able to look at this?=C2=A0 I was hoping to use<br>
patchwork to merge patches from the list but obviously this is a bit<br>
of a blocker.</blockquote><div><br></div><div>Ok I haven&#39;t but over thi=
s weekend I can try=C2=A0=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
Ross<br>
</blockquote>

--90e6ba614f0cdce27405025272a1--
