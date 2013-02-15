Received: from mail-oa0-f46.google.com ([209.85.219.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1U6Gwe-0002QM-IB
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Feb 2013 09:47:07 +0100
Received: by mail-oa0-f46.google.com with SMTP id k1so3460746oag.19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2013 00:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=NwZkDhuahSFMdeucXso45CS9vdNIDUdaBkyhxgcuVBM=;
	b=jQn4/4tTxmDtGC/dZpwNSZaZMfnSNRosj/x1k6KOyd9kH9ogFdGISW2u3NKtoVXsW1
	08/dZ0Yb8+Qt3Zh3nkwUTJ4xW6DbzeSpcZB2iuJgHW/KhQjLA++mUcBIO6dQMtMJ4ATM
	dfEjCMCer6KkVRad2df41PNg1xLPZ6BdcxLiVBs6GO8YMNJOAHFmoR4Sh05iZFWP0M6V
	Q0Yu38ei74cWBzDhjrKjKtFjI1fZFGVvFn8IRcJLkfRazjwpRCS5wXYh4B4ypoGlbZ7J
	qfwMEJsTo1LNHzHcqnR0Oqo6FUbn/Jp/wwQZ/MGiahjLSRMYnKIg1pkk26GT6+t73jfp
	818A==
MIME-Version: 1.0
X-Received: by 10.60.2.164 with SMTP id 4mr1133424oev.85.1360917056648; Fri,
	15 Feb 2013 00:30:56 -0800 (PST)
Received: by 10.182.73.136 with HTTP; Fri, 15 Feb 2013 00:30:56 -0800 (PST)
In-Reply-To: <511D28E2.5060704@linux.intel.com>
References: <0dea01ce0ad2$92793530$b76b9f90$@st.com>
	<511D28E2.5060704@linux.intel.com>
Date: Fri, 15 Feb 2013 09:30:56 +0100
Message-ID: <CAOHjBZv+tf40FdFADCzrO+Wd4ODMfxAaXD074yV3ZbDxHhx_9w@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Question about hanging after git clone try in Prelink
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
X-List-Received-Date: Fri, 15 Feb 2013 08:47:08 -0000
Content-Type: multipart/alternative; boundary=e89a8f923da2baf79d04d5bf3128

--e89a8f923da2baf79d04d5bf3128
Content-Type: text/plain; charset=ISO-8859-1

Hi Saul,

2013/2/14 Saul Wold <sgw@linux.intel.com>

>
> What version of OE-Core/POoky are you using? It would be helpful to know
> that.
>
I'm building against the best so far master git repository.

>
> If you are not using the Poky Distro, then you could try setting
> PREMIRRORS and/or use the own-mirrors.bbclass and set SOURCE_MIRROR_URL
> to something like "http://downloads.**yoctoproject.org/mirror/**sources/<http://downloads.yoctoproject.org/mirror/sources/>
> "
>
Yes, sure!!!! I have read it also in the poky ref manual and I forgot it!!!
Many many thanks for having remembered me that stuff.
Cheers,
Giuseppe

>
> Sau!
>
>
>


>
> On 02/14/2013 08:44 AM, Giuseppe CONDORELLI wrote:
>
>> Hi,
>>
>> due to local company restrictions, I cannot clone external git repository.
>> During prelink-native fetch I catch the warning about that (given that the
>> SRC_URI point to git) but then,
>> trying other mirrors, system is able to download a tar.gz of the prelink.
>> The strange thing is that however bitbake hangs with the error (that was a
>> warning first) about the failure
>> of SRC_URI catch. Why this? Should system be aware the given package was
>> downloaded using mirrors?
>> This happens also for mtd-utils.
>> Please can you help me?
>> Thanks,
>> Giuseppe
>>
>> PS: if I rerun the process than it goes ok, obviously because it finds the
>> tar.gz in download directory.
>>
>>
>> ______________________________**_________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.**openembedded.org<Openembedded-core@lists.openembedded.org>
>> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-core<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>
>>
>>
>>
> ______________________________**_________________
> Openembedded-core mailing list
> Openembedded-core@lists.**openembedded.org<Openembedded-core@lists.openembedded.org>
> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-core<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>
>

--e89a8f923da2baf79d04d5bf3128
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi Saul,</div><div>=A0</div><div class=3D"gmail_quote">2013/2/14 Saul =
Wold <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D=
"_blank">sgw@linux.intel.com</a>&gt;</span><br><blockquote style=3D"margin:=
0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);borde=
r-left-width:1px;border-left-style:solid" class=3D"gmail_quote">
<br>
What version of OE-Core/POoky are you using? It would be helpful to know th=
at.<br></blockquote><div>I&#39;m building against the best so far master gi=
t repository.=A0</div><blockquote style=3D"margin:0px 0px 0px 0.8ex;padding=
-left:1ex;border-left-color:rgb(204,204,204);border-left-width:1px;border-l=
eft-style:solid" class=3D"gmail_quote">

<br>
If you are not using the Poky Distro, then you could try setting PREMIRRORS=
 and/or use the own-mirrors.bbclass and set SOURCE_MIRROR_URL<br>
to something like &quot;<a href=3D"http://downloads.yoctoproject.org/mirror=
/sources/" target=3D"_blank">http://downloads.<u></u>yoctoproject.org/mirro=
r/<u></u>sources/</a>&quot;<br></blockquote><div>Yes, sure!!!! I have read =
it also in the poky ref manual and I forgot it!!!</div>
<div>Many many thanks=A0for having remembered me that stuff.</div><div>Chee=
rs,</div><div>Giuseppe</div><blockquote style=3D"margin:0px 0px 0px 0.8ex;p=
adding-left:1ex;border-left-color:rgb(204,204,204);border-left-width:1px;bo=
rder-left-style:solid" class=3D"gmail_quote">
<p>
<br>
Sau!</p><p>=A0</p></blockquote><div>=A0</div><blockquote style=3D"margin:0p=
x 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);border-=
left-width:1px;border-left-style:solid" class=3D"gmail_quote"><div class=3D=
"HOEnZb">
<div class=3D"h5">
<br>
On 02/14/2013 08:44 AM, Giuseppe CONDORELLI wrote:<br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote">
Hi,<br>
<br>
due to local company restrictions, I cannot clone external git repository.<=
br>
During prelink-native fetch I catch the warning about that (given that the<=
br>
SRC_URI point to git) but then,<br>
trying other mirrors, system is able to download a tar.gz of the prelink.<b=
r>
The strange thing is that however bitbake hangs with the error (that was a<=
br>
warning first) about the failure<br>
of SRC_URI catch. Why this? Should system be aware the given package was<br=
>
downloaded using mirrors?<br>
This happens also for mtd-utils.<br>
Please can you help me?<br>
Thanks,<br>
Giuseppe<br>
<br>
PS: if I rerun the process than it goes ok, obviously because it finds the<=
br>
tar.gz in download directory.<br>
<br>
<br>
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/<u></u>cgi-bin/mailman/=
listinfo/<u></u>openembedded-core</a><br>
<br>
<br>
</blockquote>
<br>
______________________________<u></u>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<u></u>openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/<u></u>cgi-bin/mailman/=
listinfo/<u></u>openembedded-core</a><br>
</div></div></blockquote></div><br>

--e89a8f923da2baf79d04d5bf3128--
