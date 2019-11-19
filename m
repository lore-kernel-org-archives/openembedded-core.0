Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
	[209.85.221.193])
	by mail.openembedded.org (Postfix) with ESMTP id DE64F7F777
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 18:14:19 +0000 (UTC)
Received: by mail-vk1-f193.google.com with SMTP id p78so4143699vkp.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 10:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rxzIpxHcxnuzQ161gQJYKU0Eto6kwo13e1eESrft8DQ=;
	b=B3jAuVnosOYOTOeD2qLF7uRIiPAdu/pl0ACzWZlRmvCul+AVuVhJ3QovZyi5mF+tIb
	a5Dlayz/ivoD47SXQEGqES8NbTqYqElsIcFYC0q+PJw0pJnns3K9MWEDCoqcO6Zd/TFf
	Z2tTXr+AXDPPDCR2kTFl8o+ZNSOJ63/tGFSDPXemYT87s07kgeu5Kh5n6ZL3sWXiTq1g
	79sgoxWydw49RSPhbqT/uoHE/b7hOX2wi/GzXd4XqzxawKtlT2Fcw+/mLjC5WQSERZbX
	yN0i+lYDWWwVc+IcLUayaTeH6b12CAiHiigYgOwFLeAcJYPAIe+igTaRBSF8mTMH0LTs
	XXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rxzIpxHcxnuzQ161gQJYKU0Eto6kwo13e1eESrft8DQ=;
	b=LY0Xf30HBtobsvyIg9URutzZ4+qFctA7R4jZihChlFNFASOaHjOYE3ulORFDZytPwr
	kgF7QzIvYNw/XB7DPtCuX43hBwsJQzGWGDZ5ymvekVPu0G5eYJjV3r8QmXmB5W7uZdsl
	11j9LSAnIpUsDEvTJkmZ/BoshOz6l+q5BRs7zb4fb0s3tlew6Arbig4ZSQnwF6nVmxbf
	2SDESFLQaKtSdxMXGWQbTSvUJh/pZJ3sH2iHInsCgXXA7h9cUBg6nbAv6OzhzsLgxA6g
	q0jeQphyr89n5SMlYU37lYE33e+fpvR6fUFKOWatFdiLZWLLt+MiHn+r9Q3NaJ6JWqLR
	A8YQ==
X-Gm-Message-State: APjAAAWEbsD/er2u7fDPhDc3St7DhjBwY9wbzUUy6MPPNpqB2ezDT+C7
	6PGRXvEE3uJeR0wtDQNQFNtAJrWH+Almdue47Sk=
X-Google-Smtp-Source: APXvYqxf95ttqGkT2MF54SE1QMckYG+HaLUZqCGbGnP+CpddSiDiCXr2BHGPfPXkuAR0ASmSTwbxHQuD1oi8TPPOzhY=
X-Received: by 2002:a05:6122:119c:: with SMTP id
	x28mr21300848vkn.9.1574187260629; 
	Tue, 19 Nov 2019 10:14:20 -0800 (PST)
MIME-Version: 1.0
References: <20191118142852.22981-1-alex.kanavin@gmail.com>
	<20191118142852.22981-13-alex.kanavin@gmail.com>
	<CAMKF1srtYneT81UKC0Lcn4U_DgWiWb3Xm11mXL+2i3+yvCE5qg@mail.gmail.com>
	<CANNYZj9rV_qvPV0j7oPwAUw7MCEeVj1NOYXSVGfj_k9w_yEPdQ@mail.gmail.com>
	<CAMKF1spKz9eE6DjDmqHUC_ak0joX4jwrzAVFwDdmKdUtyBVaWA@mail.gmail.com>
	<CANNYZj8A3DhhjHWvL0yQf8JyhSBWmECgJetB1+QeqFPR-4=ZZw@mail.gmail.com>
	<CAMKF1spOt5nU0_VmHpz5FqF3f50x-KrpvkL+wduM1H+CJhGzjQ@mail.gmail.com>
	<CANNYZj-g4E=bRw7=m+RG0vZQywD5KdiaLCr=8JDjaBAgjJ5wrw@mail.gmail.com>
	<709581ab-081f-432d-8631-caac81d40a60@Spark>
In-Reply-To: <709581ab-081f-432d-8631-caac81d40a60@Spark>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Nov 2019 19:14:07 +0100
Message-ID: <CANNYZj-q73f8hbQbn1wxqjrNhJbvsoefqQyqJtGqLoxrA_2b9Q@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/13] man-pages: correct the SRC_URI
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
X-List-Received-Date: Tue, 19 Nov 2019 18:14:20 -0000
Content-Type: multipart/alternative; boundary="0000000000007adab50597b7082e"

--0000000000007adab50597b7082e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I never said they are modifying files in place, I think you misunderstood
me somehow. 'Archive' in this discussion is a folder on a server with
tarballs, not a tarball.

Maybe it's easier if I provide clickable links:
https://mirrors.edge.kernel.org/pub/linux/docs/man-pages/
https://mirrors.edge.kernel.org/pub/linux/docs/man-pages/Archive/

Alex

On Tue, 19 Nov 2019 at 19:08, Christopher Larson <kergoth@gmail.com> wrote:

> The whole point of having PV in the filename is ensuring it won=E2=80=99t=
 change
> out from under us. If they=E2=80=99re modifying files in place that=E2=80=
=99s going to
> cause us headaches whether we pull from archive or not due to checksum
> changes.
> On Nov 19, 2019, 9:46 AM -0700, Alexander Kanavin <alex.kanavin@gmail.com=
>,
> wrote:
>
> On Tue, 19 Nov 2019 at 17:38, Khem Raj <raj.khem@gmail.com> wrote:
>
>>
>> If I was asking you to store the tarball some place in arctic then I
>> would understand your concern but in this case I am not able to. can you
>> describe why using archive location is not suitable here perhaps that wi=
ll
>> help me
>>
>
> The archive location is missing several latest releases of man-pages,
> which are only available from the main location. Which means that we alwa=
ys
> ship an out of date version of manpages, and aren't aware (via version
> check tooling) that later versions exist.
>
> Alex
>
>

--0000000000007adab50597b7082e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I never said they are modifying files in place, I thi=
nk you misunderstood me somehow. &#39;Archive&#39; in this discussion is a =
folder on a server with tarballs, not a tarball.</div><div><br></div><div>M=
aybe it&#39;s easier if I provide clickable links:</div><div><a href=3D"htt=
ps://mirrors.edge.kernel.org/pub/linux/docs/man-pages/">https://mirrors.edg=
e.kernel.org/pub/linux/docs/man-pages/</a></div><div><a href=3D"https://mir=
rors.edge.kernel.org/pub/linux/docs/man-pages/Archive/">https://mirrors.edg=
e.kernel.org/pub/linux/docs/man-pages/Archive/</a></div><div><br></div><div=
>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, 19 Nov 2019 at 19:08, Christopher Larson &lt;<a hre=
f=3D"mailto:kergoth@gmail.com">kergoth@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">



<div>
<div name=3D"messageBodySection">
<div dir=3D"auto">The whole point of having PV in the filename is ensuring =
it won=E2=80=99t change out from under us. If they=E2=80=99re modifying fil=
es in place that=E2=80=99s going to cause us headaches whether we pull from=
 archive or not due to checksum changes.</div>
</div>
<div name=3D"messageReplySection">On Nov 19, 2019, 9:46 AM -0700, Alexander=
 Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">al=
ex.kanavin@gmail.com</a>&gt;, wrote:<br>
<blockquote type=3D"cite" style=3D"margin:5px;padding-left:10px;border-left=
:thin solid rgb(26,188,156)">
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, 19 Nov 2019 at 17:38, Khem Ra=
j &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmai=
l.com</a>&gt; wrote:<br></div>
<blockquote class=3D"gmail_quote" style=3D"margin:5px;padding-left:10px;bor=
der-left:thin solid rgb(230,126,34)">
<div>
<div class=3D"gmail_quote"><br>
<div dir=3D"auto">If I was asking you to store the tarball some place in ar=
ctic then I would understand your concern but in this case I am not able to=
. can you describe why using archive location is not suitable here perhaps =
that will help me<br></div>
</div>
</div>
</blockquote>
<div><br></div>
<div>The archive location is missing several latest releases of man-pages, =
which are only available from the main location. Which means that we always=
 ship an out of date version of manpages, and aren&#39;t aware (via version=
 check tooling) that later versions exist.</div>
<div><br></div>
<div>Alex<br></div>
</div>
</div>
</blockquote>
</div>
</div>

</blockquote></div>

--0000000000007adab50597b7082e--
