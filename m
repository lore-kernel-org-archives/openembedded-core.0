Return-Path: <bounce+8e2b5a.3a5685-openembedded-core=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 97BB578927
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 19:48:29 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1521488910; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=gjpi9dvs3Q1lnWgE2PWwUTSqD09tbfxcPUDH2sw/b9k=;
	b=lAtszZtpPmttaKBqAHTgUasI43QNCpVflG8k58spYam1RER73+Z0/T6eLGj98tDlq7RDfxk4
	ZVQ9IYemK1ra8MBML90ciBoH6Hw03HaQY9dbJnP8B4BGEqV2Sac/nPaC0oecxXT8rkAClrwJ
	59p5B/ww9pXm9rha3fEoj/+/ovM=
X-Mailgun-Sid: WyJiMTQwMSIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgIjNhNTY4NSJd
X-Mailgun-Sending-Ip: 104.130.122.4
Sender: derek@asterius.io
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mxa.mailgun.org with ESMTP id 5ab0140e.7f04f0384f30-smtp-out-n03;
	Mon, 19 Mar 2018 19:48:30 -0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id l12so22221868ioc.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 12:48:30 -0700 (PDT)
X-Gm-Message-State: AElRT7HSRExDIGoM2BmHixwHESm4dLyTTXZVzjGL5Iz0IG6dyh2NfjKj
	L7EjoiJFHuYakxC0kScO0pgJa8++mK52rjGjfgU=
X-Google-Smtp-Source: AG47ELvzeVfSDdaHmocvZuBRYDxCvla0RTmiskylOZ080sIOI49vjK22FuGL2kVu/hvdwbcNPwH3CTdu/NpcdQiRAdM=
X-Received: by 10.107.36.204 with SMTP id k195mr13074791iok.131.1521488909547; 
	Mon, 19 Mar 2018 12:48:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.140.6 with HTTP; Mon, 19 Mar 2018 12:48:29 -0700 (PDT)
In-Reply-To: <CAPGMVzFwWL9xqX-tQSWEFsa-f56nh01ONCCzE2p1+Bx8T1=zdQ@mail.gmail.com>
References: <CAPGMVzFwWL9xqX-tQSWEFsa-f56nh01ONCCzE2p1+Bx8T1=zdQ@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Mon, 19 Mar 2018 15:48:29 -0400
X-Gmail-Original-Message-ID: <CADNbA1ow32P5yvgSWrPS+1yjAa6qNu1Qtwf3YFgVfHNzSUYt=w@mail.gmail.com>
Message-ID: <CADNbA1ow32P5yvgSWrPS+1yjAa6qNu1Qtwf3YFgVfHNzSUYt=w@mail.gmail.com>
To: Rajath C S <rajathcs.1996@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Build Error
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
X-List-Received-Date: Mon, 19 Mar 2018 19:48:29 -0000
Content-Type: multipart/alternative; boundary="001a114041aafbc06e0567c93dec"

--001a114041aafbc06e0567c93dec
Content-Type: text/plain; charset="UTF-8"

Are you mixing and matching branches between layers?  Is your
meta-openembedded on rocko or master?

On Mon, Mar 19, 2018 at 3:44 PM, Rajath C S <rajathcs.1996@gmail.com> wrote:

> Hi,
>
> 1. So while building the target i get the following error,
>
> bitbake core-image-sato
> Loading cache: 100% |#############################
> ####################################################################################|
> Time: 0:00:00
> Loaded 1 entries from dependency cache.
> ERROR: ParseError at /home/jarvis/poky/meta-openembedded/meta-python/
> recipes-extended/python-pyephem/python-pyephem_3.7.6.0.bb:12: Could not
> inherit file classes/pypi.bbclass
>
> for which i create a file called pypi.bbclass and copy the code in it and
> place it it /poky/meta/classes and run
> "bitbake core-image-sato" for which i dont get any error,
> is it the right method to be followed?
>
> 2. This error appears when i am using bitbake in rocko branch but doesnt
> appear when i shift to master branch and build the image; is it fine to
> shift branch (i.e. from rocko to master) and build the image?
>
> Thanks
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a114041aafbc06e0567c93dec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Are you mixing and matching branches between layers?=C2=A0=
 Is your meta-openembedded on rocko or master?</div><div class=3D"gmail_ext=
ra"><br><div class=3D"gmail_quote">On Mon, Mar 19, 2018 at 3:44 PM, Rajath =
C S <span dir=3D"ltr">&lt;<a href=3D"mailto:rajathcs.1996@gmail.com" target=
=3D"_blank">rajathcs.1996@gmail.com</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div dir=3D"ltr"><div><div><div><div>Hi,<br><br>1. So whil=
e building the target i get the following error,<br><br>bitbake core-image-=
sato<br>Loading cache: 100% |#############################<wbr>############=
##################<wbr>##############################<wbr>#################=
#######| Time: 0:00:00<br>Loaded 1 entries from dependency cache.<br>ERROR:=
 ParseError at /home/jarvis/poky/meta-<wbr>openembedded/meta-python/<wbr>re=
cipes-extended/python-<wbr>pyephem/<a href=3D"http://python-pyephem_3.7.6.0=
.bb:12" target=3D"_blank">python-pyephem_3.7.6.<wbr>0.bb:12</a>: Could not =
inherit file classes/pypi.bbclass<br><br></div>for which i create a file ca=
lled pypi.bbclass and copy the code in it and place it it /poky/meta/classe=
s and run <br>&quot;bitbake core-image-sato&quot; for which i dont get any =
error,<br></div>is it the right method to be followed?<br><br></div>2. This=
 error appears when i am using bitbake in rocko branch but doesnt appear wh=
en i shift to master branch and build the image; is it fine to shift branch=
 (i.e. from rocko to master) and build the image?<br><br></div>Thanks<br><d=
iv><div><div><div><br></div></div></div></div></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--001a114041aafbc06e0567c93dec--
