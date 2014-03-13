Return-Path: <alex.r.damian@gmail.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id EC74C6DF25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 12:28:02 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id r5so978519qcx.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 05:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=v9KFEv4UxFdSs1E2njUWRxYV5yJx5uaJRajBoXCtG+A=;
	b=fNvaE3dMnUs/uJ+Br30OvEiL84XvAwVOjKx4a8OVbVv3FAo/pjMXSDaJeWAEXqK2H8
	Gcf2CcpGqo+SDv0+DERKvxesK3YI4/pxzpDqMHXed/p7LuvkEK/nmH8USD4pDlOUn59d
	DDVtcaIPE5cWrwXTsu1KSX4ywbZbuyiADRBbZoMGy5OsEAgQQrN7YCvvIFUECEocJ5wI
	Okp9RW3T27pvoFmmrw7/3/YdrGRl/gnZWM91mUogbjMQFMNngCYEQZy2Tpy2WB4X+usM
	qta1Gtiu/oSAyF0wXPP9Q58i7FXEqgJnnV+eB2cs0UmjghM61H1OAciwjFxogmTSplsf
	5xjA==
MIME-Version: 1.0
X-Received: by 10.140.88.212 with SMTP id t78mr1778197qgd.47.1394713683568;
	Thu, 13 Mar 2014 05:28:03 -0700 (PDT)
Received: by 10.224.207.135 with HTTP; Thu, 13 Mar 2014 05:28:03 -0700 (PDT)
In-Reply-To: <CAJ2CSBsdCyfZ+MJ91Wh=6EO_O6NJz5cQuzY8UhKCNeZXZDw3kw@mail.gmail.com>
References: <1392658389-19826-1-git-send-email-alexandru.damian@intel.com>
	<1392906622.1560.1.camel@ted>
	<CAJ2CSBtk4okj2Pn9-qcB-kQ+jBAMU53sxxvYyH9YXL43Go-Pxw@mail.gmail.com>
	<1392912414.1560.8.camel@ted>
	<CAJ2CSBsdCyfZ+MJ91Wh=6EO_O6NJz5cQuzY8UhKCNeZXZDw3kw@mail.gmail.com>
Date: Thu, 13 Mar 2014 12:28:03 +0000
Message-ID: <CAL7ttbd8eS8nEweF=Mzj1kA0nRiVY+A=Yz-42izf1Y-OpUywbg@mail.gmail.com>
From: Alex Damian <alex.r.damian@gmail.com>
To: "Damian, Alexandru" <alexandru.damian@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sstate: list missing files for toaster
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
X-List-Received-Date: Thu, 13 Mar 2014 12:28:04 -0000
Content-Type: multipart/alternative; boundary=001a11c136aaac2ada04f47c15d6

--001a11c136aaac2ada04f47c15d6
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I am following up with this patch. If there are no other objects, can we
please merge it ?

Thanks,
Alex


On Thu, Feb 20, 2014 at 8:29 PM, Damian, Alexandru <
alexandru.damian@intel.com> wrote:

> Yep, tasks that were looked up, and actual filenames attempted.
>
> Alex
>
>
> On Thu, Feb 20, 2014 at 4:06 PM, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Thu, 2014-02-20 at 15:41 +0000, Damian, Alexandru wrote:
>> > I would think against it, because
>>
>> > - it's very inefficient to send a Skipped event for each missed task
>> > than to collect all the data and send it in one shot
>> > - it's faster to send the event from the sstate.bbclass than to return
>> > the task ids and then call again a python function to generate the
>> > sstate file names - basically replicating the sstate.bbclass code in
>> > bitbake
>> > - the queueTaskSkipped event has a different semantic than what we
>> > need here to return a whole batch of data; creating a new event type
>> > from scratch is a bit pointless since the inheritance would need to be
>> > broken
>> > - knotty can receive MetadataEvents just as well as sceneTaskSkipped
>> > event, or any variation of it
>>
>> I guess I'd like to understand which information from this even you're
>> particularly interested in?
>>
>> Do I understand correctly that you want the actual filenames attempted?
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>
>
> --
> Alex Damian
> Yocto Project
> SSG / OTC
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a11c136aaac2ada04f47c15d6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br>I am following up with this patch. If there =
are no other objects, can we please merge it ?<br><br>Thanks,<br>Alex<br></=
div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Thu, F=
eb 20, 2014 at 8:29 PM, Damian, Alexandru <span dir=3D"ltr">&lt;<a href=3D"=
mailto:alexandru.damian@intel.com" target=3D"_blank">alexandru.damian@intel=
.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_default=
" style=3D"font-family:tahoma,sans-serif">Yep, tasks that were looked up, a=
nd actual filenames attempted.</div>
<span class=3D"HOEnZb"><font color=3D"#888888"><div class=3D"gmail_default"=
 style=3D"font-family:tahoma,sans-serif"><br>Alex</div>

</font></span></div><div class=3D"gmail_extra"><div class=3D""><br><br><div=
 class=3D"gmail_quote">On Thu, Feb 20, 2014 at 4:06 PM, Richard Purdie <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" tar=
get=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div>On Thu, 2014-02-20 at 15:41 +0000, Dami=
an, Alexandru wrote:<br>
&gt; I would think against it, because<br>
<br>
&gt; - it&#39;s very inefficient to send a Skipped event for each missed ta=
sk<br>
&gt; than to collect all the data and send it in one shot<br>
&gt; - it&#39;s faster to send the event from the sstate.bbclass than to re=
turn<br>
&gt; the task ids and then call again a python function to generate the<br>
&gt; sstate file names - basically replicating the sstate.bbclass code in<b=
r>
&gt; bitbake<br>
&gt; - the queueTaskSkipped event has a different semantic than what we<br>
&gt; need here to return a whole batch of data; creating a new event type<b=
r>
&gt; from scratch is a bit pointless since the inheritance would need to be=
<br>
&gt; broken<br>
&gt; - knotty can receive MetadataEvents just as well as sceneTaskSkipped<b=
r>
&gt; event, or any variation of it<br>
<br>
</div>I guess I&#39;d like to understand which information from this even y=
ou&#39;re<br>
particularly interested in?<br>
<br>
Do I understand correctly that you want the actual filenames attempted?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div><br><br clear=3D"all"><div><br></div></div><div class=3D=
"">-- <br><div dir=3D"ltr">Alex Damian<div>Yocto Project<br></div><div>SSG =
/ OTC=A0</div></div>
</div></div>
<br>_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
<br></blockquote></div><br></div>

--001a11c136aaac2ada04f47c15d6--
