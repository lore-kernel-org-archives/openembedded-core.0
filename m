Received: from mail-ia0-f172.google.com ([209.85.210.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UcGa9-0004Cr-Bf
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 16:52:07 +0200
Received: by mail-ia0-f172.google.com with SMTP id i20so717662ian.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2013 07:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=SxmAyZ1itp0gGlCSP8FdRDYmHVI3TS3nO8EAntqBhGQ=;
	b=iZN9p8LQqCVrlH1ib3LwKkDtogS1A9eqs7AxFw0FzSJCe4OrOBYHAo1pTwRG2V2tHd
	mxmkjFTaSupDQEng/h5+qzLVBGsyL7tP++PufbQetI1qsJm+SXqOVRsihpOroppkRHrR
	Y9YTHwssU8F8ZaLeczUpK04VaWdfQ35Lk9ktCHMgd/a5IxSvTTePeB4TOEfkVq+I/smc
	LlusdQUvXAEDdeMx5MkM/GUrpsgc4MLSd316vHZrdSFjR9W6vOJMFjCbQgs6Keje2wD3
	YId4a0LzVHbsYMcwqnpslHZDPBVVZ5CTE2cLFCJL0ejv1PIKxFXEECYmB9iNRuOtJliz
	zVHg==
MIME-Version: 1.0
X-Received: by 10.50.17.166 with SMTP id p6mr2338222igd.12.1368542029254; Tue,
	14 May 2013 07:33:49 -0700 (PDT)
Received: by 10.50.109.133 with HTTP; Tue, 14 May 2013 07:33:49 -0700 (PDT)
In-Reply-To: <1368525912.25898.15.camel@ted>
References: <1368513918-16448-1-git-send-email-raj.khem@gmail.com>
	<1368525912.25898.15.camel@ted>
Date: Tue, 14 May 2013 07:33:49 -0700
Message-ID: <CAMKF1srAGRK=9BP5VrqhH50VrtWb+PFL5G5P-EEBPefb16xxTA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
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
X-List-Received-Date: Tue, 14 May 2013 14:52:14 -0000
Content-Type: multipart/alternative; boundary=14dae9340cc983981b04dcae859f

--14dae9340cc983981b04dcae859f
Content-Type: text/plain; charset=UTF-8

On Tuesday, May 14, 2013, RicharPurdie <richard.purdie@linuxfoundation.org>
wrote:
> On Mon, 2013-05-13 at 23:45 -0700, Khem Raj wrote:
>> libtirpc is looked for by configure and if found
>> its enabled. So lets make it consistent and enable
>> it always
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-extended/pam/libpam_1.1.6.bb |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> What is the benefit of this dependency?


When building from sstate the build of libpam would fail during configure
if the machine who populated sstate had libtirpc staged before building
libpam and with high parallelism its quite often

>
> Cheers,
>
> Richard
>
>

--14dae9340cc983981b04dcae859f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, May 14, 2013, RicharPurdie &lt;<a href=3D"mailto:richar=
d.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wr=
ote:<br>&gt; On Mon, 2013-05-13 at 23:45 -0700, Khem Raj wrote:<br>&gt;&gt;=
 libtirpc is looked for by configure and if found<br>
&gt;&gt; its enabled. So lets make it consistent and enable<br>&gt;&gt; it =
always<br>&gt;&gt;<br>&gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailt=
o:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>&gt;&gt; ---<br>&gt;&gt=
; =C2=A0meta/recipes-extended/pam/<a href=3D"http://libpam_1.1.6.bb">libpam=
_1.1.6.bb</a> | =C2=A0 =C2=A02 +-<br>
&gt;&gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>&gt;<br>&gt=
; What is the benefit of this dependency?<br><br><br>When building from sst=
ate the build of libpam would fail during configure if the machine who popu=
lated sstate had libtirpc staged before building libpam and with high paral=
lelism its quite often <br>
<br>&gt;<br>&gt; Cheers,<br>&gt;<br>&gt; Richard<br>&gt;<br>&gt;

--14dae9340cc983981b04dcae859f--
