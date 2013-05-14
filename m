Received: from mail-ie0-f170.google.com ([209.85.223.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UcHlX-0002ko-DC
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 18:07:52 +0200
Received: by mail-ie0-f170.google.com with SMTP id aq17so1407196iec.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2013 08:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=1VwmUjWwJ2nkwwJ/xNGkn27203Zn0n1AvkyhmTvGJo8=;
	b=f0qYiWgQcV7o56CCGFn24JQZPXAhJaNsh68tpgfkYYhAGB8ddulAnbKVKxYR8sxDmx
	MiYUWrOa5fz/I75Fcl360Xyo3AqjKoTbnvmXY/Ju/umhKf16boHsy5TgUBGRB4zMc8Wf
	ZOnm42Ltwxfgh/FoWBzsvqgUw/HW1ytyn1kE9+kKDNrAQM48GMcONqpBYDK19fEM4eOy
	rdnrHLH77UpaxxpyGFPII775TvOHdwJ2mGS4JLIx35+GK0gNGmGDqf61cBVOMGg0fd4t
	/rGhyttG83wZCZq52T2iSybnHP/MHnkoAQTDNJ/xv9YbF4HS991EZlGz5ydLv5Fuwwv4
	cTQg==
MIME-Version: 1.0
X-Received: by 10.50.87.10 with SMTP id t10mr2497190igz.108.1368546575809;
	Tue, 14 May 2013 08:49:35 -0700 (PDT)
Received: by 10.50.109.133 with HTTP; Tue, 14 May 2013 08:49:35 -0700 (PDT)
In-Reply-To: <3105853.8sfX5FGQrr@helios>
References: <1368513918-16448-1-git-send-email-raj.khem@gmail.com>
	<1368525912.25898.15.camel@ted>
	<CAMKF1srAGRK=9BP5VrqhH50VrtWb+PFL5G5P-EEBPefb16xxTA@mail.gmail.com>
	<3105853.8sfX5FGQrr@helios>
Date: Tue, 14 May 2013 08:49:35 -0700
Message-ID: <CAMKF1srCNBbG2y0vG7-hFiBoNij9ZN1u0P2nQw5_yM7OBwDzpg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pam: Add libtirpc to build dependencies
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
X-List-Received-Date: Tue, 14 May 2013 16:07:52 -0000
Content-Type: multipart/alternative; boundary=089e0102ec5682869704dcaf9422

--089e0102ec5682869704dcaf9422
Content-Type: text/plain; charset=UTF-8

On Tuesday, May 14, 2013, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:
> On Tuesday 14 May 2013 07:33:49 Khem Raj wrote:
>> On Tuesday, May 14, 2013, RicharPurdie <
richard.purdie@linuxfoundation.org>
>> wrote:
>> > On Mon, 2013-05-13 at 23:45 -0700, Khem Raj wrote:
>> >> libtirpc is looked for by configure and if found
>> >> its enabled. So lets make it consistent and enable
>> >> it always
>> >>
>> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >> ---
>> >>
>> >>  meta/recipes-extended/pam/libpam_1.1.6.bb |    2 +-
>> >>  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > What is the benefit of this dependency?
>>
>> When building from sstate the build of libpam would fail during configure
>> if the machine who populated sstate had libtirpc staged before building
>> libpam and with high parallelism its quite often
>
> Understood, but the question was what is the benefit of the added
dependency on
> libtirpc; i.e. should we really be explicitly enabling this or explicitly
> disabling it?

There is no knob to disable/disable it. Adding one would be ideal but for
another day
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

--089e0102ec5682869704dcaf9422
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, May 14, 2013, Paul Eggleton &lt;<a href=3D"mailto:paul.=
eggleton@linux.intel.com">paul.eggleton@linux.intel.com</a>&gt; wrote:<br>&=
gt; On Tuesday 14 May 2013 07:33:49 Khem Raj wrote:<br>&gt;&gt; On Tuesday,=
 May 14, 2013, RicharPurdie &lt;<a href=3D"mailto:richard.purdie@linuxfound=
ation.org">richard.purdie@linuxfoundation.org</a>&gt;<br>
&gt;&gt; wrote:<br>&gt;&gt; &gt; On Mon, 2013-05-13 at 23:45 -0700, Khem Ra=
j wrote:<br>&gt;&gt; &gt;&gt; libtirpc is looked for by configure and if fo=
und<br>&gt;&gt; &gt;&gt; its enabled. So lets make it consistent and enable=
<br>
&gt;&gt; &gt;&gt; it always<br>&gt;&gt; &gt;&gt;<br>&gt;&gt; &gt;&gt; Signe=
d-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail=
.com</a>&gt;<br>&gt;&gt; &gt;&gt; ---<br>&gt;&gt; &gt;&gt;<br>&gt;&gt; &gt;=
&gt; =C2=A0meta/recipes-extended/pam/<a href=3D"http://libpam_1.1.6.bb">lib=
pam_1.1.6.bb</a> | =C2=A0 =C2=A02 +-<br>
&gt;&gt; &gt;&gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>&g=
t;&gt; &gt;<br>&gt;&gt; &gt; What is the benefit of this dependency?<br>&gt=
;&gt;<br>&gt;&gt; When building from sstate the build of libpam would fail =
during configure<br>
&gt;&gt; if the machine who populated sstate had libtirpc staged before bui=
lding<br>&gt;&gt; libpam and with high parallelism its quite often<br>&gt;<=
br>&gt; Understood, but the question was what is the benefit of the added d=
ependency on<br>
&gt; libtirpc; i.e. should we really be explicitly enabling this or explici=
tly<br>&gt; disabling it?<br><br>There is no knob to disable/disable it. Ad=
ding one would be ideal but for another day<br>&gt;<br>&gt; Cheers,<br>
&gt; Paul<br>&gt;<br>&gt; --<br>&gt;<br>&gt; Paul Eggleton<br>&gt; Intel Op=
en Source Technology Centre<br>&gt;

--089e0102ec5682869704dcaf9422--
