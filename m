Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TRpTt-0005qI-Oc
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 21:22:09 +0200
Received: by mail-vc0-f175.google.com with SMTP id p1so3388302vcq.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2012 12:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=XZbt05OAZ87yxeTnCm9XxIDOKieqoohcgryOVDdsrRw=;
	b=rHZiFEQ9K5Eevx2XEFJuB0L8xnZJtGTpzcTNVMYsdC+WN7GlSr7Z4TGp56FNt68GL/
	4FH+hahDjWd6JXTfP1MO2nX1hUEDwgxA+cu3y7Pt24mrCyV2VJ3NJkiqL8IWs7a5E7wM
	//hDEUTHi4SJrUt96O0khCbTBPAgDQOh5X7nNCzoLPNcXyXKkpGBtQUXsWL9M7YDo2t/
	Cv9jCRwIQ+1RzbEbnit2erC9HxL3QLo61YqR+zhBuKsqMeyFcCoVKzJmKJw5HFDF+gDS
	5n+1zGu857E+qe9Ye3mB2s2RqeK2kPlP83ssZ7gEqQ+PuThlmRmsYzIs45NXH1ckIVZz
	usDQ==
MIME-Version: 1.0
Received: by 10.52.89.132 with SMTP id bo4mr30953361vdb.80.1351278518752; Fri,
	26 Oct 2012 12:08:38 -0700 (PDT)
Received: by 10.58.128.104 with HTTP; Fri, 26 Oct 2012 12:08:38 -0700 (PDT)
In-Reply-To: <CAOHjBZsdfnhLumBym4ZO+wxxzAyCq0yONSbRDc4XZS3TH_mJ=Q@mail.gmail.com>
References: <CAOHjBZsdfnhLumBym4ZO+wxxzAyCq0yONSbRDc4XZS3TH_mJ=Q@mail.gmail.com>
Date: Fri, 26 Oct 2012 12:08:38 -0700
Message-ID: <CAMKF1spobVWMY=F9X45930GmYJZ9fWCCak=zdxKNKab7ZD4x2w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: uclibc sdk issue
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
X-List-Received-Date: Fri, 26 Oct 2012 19:22:09 -0000
Content-Type: multipart/alternative; boundary=bcaec501601b1a55ef04ccfb0c8f

--bcaec501601b1a55ef04ccfb0c8f
Content-Type: text/plain; charset=UTF-8

Why do you want uClibc for narivesdk ? Do you have a build system also
running uclibc

On Friday, October 26, 2012, Giuseppe Condorelli <
giuseppe.condorelli@gmail.com> wrote:
> Hi All,
>
> I need to build sdk using uclibc.
> I'm failing on nativesdk-libc-for-gcc dependence because
> system always finds nativesdk-eglibc as the correct one.
> I've set TCLIBC to uclibc and in fact (builind with -DDD) I can
> say the default nativesdk is the uclibc, although the eglibc part
> will be assigned after checking.
>
> Please can you clarify this to me?
> BR,
> Giuseppe

--bcaec501601b1a55ef04ccfb0c8f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Why do you want uClibc for narivesdk ? Do you have a build system also runn=
ing uclibc<br><br>On Friday, October 26, 2012, Giuseppe Condorelli &lt;<a h=
ref=3D"mailto:giuseppe.condorelli@gmail.com">giuseppe.condorelli@gmail.com<=
/a>&gt; wrote:<br>
&gt; Hi All,<br>&gt; =C2=A0<br>&gt; I need to build sdk using uclibc.<br>&g=
t; I&#39;m failing on nativesdk-libc-for-gcc dependence because<br>&gt; sys=
tem always finds nativesdk-eglibc as the correct one.<br>&gt; I&#39;ve set =
TCLIBC to uclibc and in fact (builind with -DDD) I can<br>
&gt; say the default nativesdk is the uclibc, although the eglibc part<br>&=
gt; will be assigned after checking.<br>&gt; =C2=A0<br>&gt; Please can you =
clarify this to me?<br>&gt; BR,<br>&gt; Giuseppe

--bcaec501601b1a55ef04ccfb0c8f--
