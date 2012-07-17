Received: from mail-qc0-f179.google.com ([209.85.216.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Sr81k-0006Vf-JG
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 15:41:24 +0200
Received: by qcse14 with SMTP id e14so174440qcs.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 06:30:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=9WpywQb1JZDvcp8qcqKMXItUo4PRrMoJkog7CcktxFY=;
	b=JyL/JzGD0aeBMHOdSJcjvusQH3hgz9ek2If13wdeuOugzsNtcKlK2mAvRn5zCcmA69
	poajSHyNFt7liG2WuY+QRVp1j1bK6stngWgra5AZihYFp95Os8U0moXISKSiue3SOrNo
	EkbaswGZPQXKIXMZsV+NkF2WT6kY6MrytjKKHseSPSBW1ogHBe/6RSThLgOEyXcphQx1
	sdS+8/RvnXb/SHwb8Z/phNPn/Nj7zBJOZN5VoHkjMl6DZ7M77L86qXSFw05OKohwWLbA
	AvJOFqyCVd4lfauXneNFwDOQY0JBNZ0fFXd2iwhJGcYOAxviL/ZvTZydQ8zwNCZQ5DtG
	BXtg==
Received: by 10.50.11.129 with SMTP id q1mr1307900igb.8.1342531804301; Tue, 17
	Jul 2012 06:30:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.98.162 with HTTP; Tue, 17 Jul 2012 06:29:44 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <1880207.FUrsv2Gi0U@helios>
References: <1342513736-468-1-git-send-email-cristian.iorga@intel.com>
	<CAK18fxG7KJvUfL+LN8r42+Px2=adL9Su9ry+0gup0m1RC_u2rw@mail.gmail.com>
	<1880207.FUrsv2Gi0U@helios>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 17 Jul 2012 16:29:44 +0300
Message-ID: <CAK18fxEVXhOJkAZ6m+9Q+CbtNgbSesWgPCO6=GzcbxdRecKtRQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnKtqHCwisZWKCM434xUOOgGUjeObrGlrDQDacshTYU2D3M8ndjK0X9it7lo2Pz3YWYQirw
Subject: Re: [PATCH 1/3] iproute2: upgrade to 3.4.0
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
X-List-Received-Date: Tue, 17 Jul 2012 13:41:24 -0000
Content-Type: multipart/alternative; boundary=e89a8f50320c4b88f404c5068bf8

--e89a8f50320c4b88f404c5068bf8
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 17, 2012 at 4:08 PM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Tuesday 17 July 2012 12:24:41 Andrei Gherzan wrote:
> > On Tue, Jul 17, 2012 at 11:28 AM, Cristian Iorga
> > <cristian.iorga@intel.com>wrote:
> > > +PR = "r0"
> >
> > Not needed anymore. (The same mention for wpa-s. and pulseaudio.)
>
> This is not a hard-and-fast rule for OE-Core AFAIK.
>
>
Indeed but as we have this it's a good thing to use it and clean a little
bit the recipes.

ag

--e89a8f50320c4b88f404c5068bf8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Jul 17, 2012 at 4:08 PM, Paul Eggleton <=
span dir=3D"ltr">&lt;<a href=3D"mailto:paul.eggleton@linux.intel.com" targe=
t=3D"_blank">paul.eggleton@linux.intel.com</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">

On Tuesday 17 July 2012 12:24:41 Andrei Gherzan wrote:<br>
&gt; On Tue, Jul 17, 2012 at 11:28 AM, Cristian Iorga<br>
&gt; &lt;<a href=3D"mailto:cristian.iorga@intel.com">cristian.iorga@intel.c=
om</a>&gt;wrote:<br>
&gt; &gt; +PR =3D &quot;r0&quot;<br>
&gt;<br>
&gt; Not needed anymore. (The same mention for wpa-s. and pulseaudio.)<br>
<br>
This is not a hard-and-fast rule for OE-Core AFAIK.<br><br></blockquote><di=
v>=A0</div><div>Indeed but as we have this it&#39;s a good thing to use it =
and clean a little bit the recipes.</div><div><br></div><div>ag</div></div>


--e89a8f50320c4b88f404c5068bf8--
