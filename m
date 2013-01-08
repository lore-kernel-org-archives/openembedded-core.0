Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Tsgl4-000328-QH
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 22:30:55 +0100
Received: by mail-ia0-f175.google.com with SMTP id 21so678087iay.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2013 13:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=8YTypkHWbJOAMy4GgT49fb4hPYq0EEak3QVjv1ZMnPU=;
	b=rL0DJJD0b3eu4HHshOEgXwqAjFOA5nRmN0jcgl59p+fr9JuFRuMFQAM08dKyVV8Un3
	45YgrCERC3I24vddu1HfXfcw1uYuLKksMAscqtWT/QDVHi7gBySTeV44pRpykIUcPaND
	+c8CI3yCaw5trM7kJhMJ6FoJjBAhWdrvurvbiyBm+naPhnH/3cENawSP8aTHZXzshZyT
	Ma6BTHEDqxNR3uHth71i/K+BXXQg8wD9gpsTBnqcloTKh9/h7vkFB8NeattS0O+ar2dr
	ao/nteigSqfOKpIJsDYn2PQAvv9c5sbXRK8sR14R0yynTqslYEQolmkEOz2YqItPS8Oa
	M+yQ==
MIME-Version: 1.0
X-Received: by 10.50.163.104 with SMTP id yh8mr10418314igb.112.1357679743095; 
	Tue, 08 Jan 2013 13:15:43 -0800 (PST)
Received: by 10.64.19.8 with HTTP; Tue, 8 Jan 2013 13:15:43 -0800 (PST)
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A81A7F6@039-SN1MPN1-002.039d.mgd.msft.net>
References: <201301081756.r08Huv1l013540@ibapah.eng.bsdi.com>
	<70CC66F5C30A414DADDA6973E4CA391A81A7F6@039-SN1MPN1-002.039d.mgd.msft.net>
Date: Tue, 8 Jan 2013 13:15:43 -0800
Message-ID: <CAMKF1sovNdz+GNrZjwj=UjJFdwj=3xO00gwVAo=d2zvjo20ruA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: anyone interested in CentOS 5 fixes for dpkg-native?
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
X-List-Received-Date: Tue, 08 Jan 2013 21:30:58 -0000
Content-Type: multipart/alternative; boundary=e89a8f646c97ce54ae04d2cd725d

--e89a8f646c97ce54ae04d2cd725d
Content-Type: text/plain; charset=UTF-8

On Tuesday, January 8, 2013, McClintock Matthew-B29882 <B29882@freescale.com>
wrote:
> On Tue, Jan 8, 2013 at 11:56 AM, Donn Seeley <donn.seeley@windriver.com>
wrote:
>> We recently tried to build using 'PACKAGE_CLASSES = package_deb' and
>> found that our ancient CentOS 5 build VMs couldn't compile and link
>> dpkg-native.  (We support CentOS 5 for very conservative customers, so
>> we run test builds with it regularly.)
>>
>> Given that package_deb isn't used frequently and that CentOS 5 is so
>> old, I thought that I would ask first before submitting fixes for that
>> configuration.  Do we want the patches in oe-core?
>

Second patch is fine first patch should be made gcc version dependent and
not disable the warning unconditionally

> I vote yes, additionally these patches don't look too complex or
intrusive.
>
> -M
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--e89a8f646c97ce54ae04d2cd725d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, January 8, 2013, McClintock Matthew-B29882 &lt;<a href=
=3D"mailto:B29882@freescale.com">B29882@freescale.com</a>&gt; wrote:<br>&gt=
; On Tue, Jan 8, 2013 at 11:56 AM, Donn Seeley &lt;<a href=3D"mailto:donn.s=
eeley@windriver.com">donn.seeley@windriver.com</a>&gt; wrote:<br>
&gt;&gt; We recently tried to build using &#39;PACKAGE_CLASSES =3D package_=
deb&#39; and<br>&gt;&gt; found that our ancient CentOS 5 build VMs couldn&#=
39;t compile and link<br>&gt;&gt; dpkg-native. =C2=A0(We support CentOS 5 f=
or very conservative customers, so<br>
&gt;&gt; we run test builds with it regularly.)<br>&gt;&gt;<br>&gt;&gt; Giv=
en that package_deb isn&#39;t used frequently and that CentOS 5 is so<br>&g=
t;&gt; old, I thought that I would ask first before submitting fixes for th=
at<br>
&gt;&gt; configuration. =C2=A0Do we want the patches in oe-core?<br>&gt;<br=
><br>Second patch is fine first patch should be made gcc version dependent =
and not disable the warning unconditionally<br><br>&gt; I vote yes, additio=
nally these patches don&#39;t look too complex or intrusive.<br>
&gt;<br>&gt; -M<br>&gt;<br>&gt; ___________________________________________=
____<br>&gt; Openembedded-core mailing list<br>&gt; <a href=3D"mailto:Opene=
mbedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.o=
rg</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedde=
d-core</a><br>&gt;

--e89a8f646c97ce54ae04d2cd725d--
