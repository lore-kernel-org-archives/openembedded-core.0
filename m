Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2A14260EC8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 16:19:09 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id t12so3934130vso.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 08:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PGQjH+W4p18jUhFhvuGB6zOBaZV2cxr4nYSg9cMg9y4=;
	b=YB2avRsuZDKJrq6PiTKGZ59X8edRdUjoHw9s9dSxfGFGjSR9ufYy3LwpMsl0nh+HxL
	UfgDqsFF+vgdmla+CvfVBL50FsJknNNrg/VhjlYlYyYunZ+hMVj8lcvikNvYFPqBtWiT
	gtY1AblkfjJQfVp4pH4fWDxuy4Qm3lBfqrU+c8GbMU+gALdcbjsrCbinVPoDrjORjLzn
	jbOR0mz5WltEIu7zXbDzy73RYLPnADMutbQy2eWC23c/XIvjxT3KjbohJgPIkp0ANPlD
	Fsf37SBRNcJEYESxAfmxm23Qfz+pnfg5ofWeGuqZlpIEO0JEDHEadXLjHFlocG54UPxH
	jEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PGQjH+W4p18jUhFhvuGB6zOBaZV2cxr4nYSg9cMg9y4=;
	b=t7mEv96hOZaoN8TeXTj6tddUO18Jovb+ymFBq48lzragMF547tgjyxLIZBLNzphuyQ
	pSYQgHGW/VDj6aAZqS7dRYkd116x+rIpHIhUpyZWt9+8y5hsh/x1bcypVqBakrdma1fF
	9heslaUdSLBi+eoqZS3gym/dQIx/twIB3ckkm1lHFliNcJpdCVNQ5A5XpW5BXz9hvHVx
	7yR37atrfxRbABsoAfWsurZeeCu8QH1EdnSBu1IVHxeQCR7Dz/IVJTDYfo8N/eYsZR/z
	1F5fO4voYyJ59Lcjv4kW4NTOspRlgYS0VpJ8OMaX+Ok+1ceqvytwu5CZzFzv2k249tK6
	Wyjg==
X-Gm-Message-State: APjAAAV1tOHOwm43EUPqcLfwnO1FgSMXUIgD4kar4lpVMnMGmPwKNGt5
	+TSQgxhcOXjPK2oSubvrWPARTVLYDAVCKfZ/6q4=
X-Google-Smtp-Source: APXvYqw3zQyilKqUFThiudIXtLGV1O0ZK28HPyscgn4G4Knp1G1j+yijcJ+7v47ou28XENLym30woy9NSsvdPsjTPLU=
X-Received: by 2002:a05:6102:103:: with SMTP id
	z3mr2551207vsq.23.1581610749955; 
	Thu, 13 Feb 2020 08:19:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581575578.git.raj.khem@gmail.com>
	<CANNYZj_T=J2fs39fpPKQjC5rGSg_opTeUGzPokeiU-5jwhRzTQ@mail.gmail.com>
	<CAMKF1sqJTPVFALwd0qx+zfWq3MsmhVL=n58CDMns1MwJH2mTsw@mail.gmail.com>
In-Reply-To: <CAMKF1sqJTPVFALwd0qx+zfWq3MsmhVL=n58CDMns1MwJH2mTsw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Feb 2020 17:19:38 +0100
Message-ID: <CANNYZj_C7i+2QKaFqjiDh0DFYYuYO7eY72wTR9NKz9JEjDtjCA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/9] recipe updates, testing fixes
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
X-List-Received-Date: Thu, 13 Feb 2020 16:19:09 -0000
Content-Type: multipart/alternative; boundary="000000000000ec9249059e7772a9"

--000000000000ec9249059e7772a9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Feb 2020 at 17:07, Khem Raj <raj.khem@gmail.com> wrote:

>
>> I'd like to request that these two are held back until we figure out wha=
t
>> is going wrong with the rpm test (see separate thread).
>>
>
> We already know what=E2=80=99s going on what more
> Do you want to know ?
>

 As the rpm maintainer, yes I do. The test is not being skipped when it
should be, and I'd like to know why.

Alex

--000000000000ec9249059e7772a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 13 Feb 2020 at 17:07, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex"><div><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div=
><br></div><div>I&#39;d like to request that these two are held back until =
we figure out what is going wrong with the rpm test (see separate thread).<=
/div></div></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"=
>We already know what=E2=80=99s going on what more</div><div dir=3D"auto">D=
o you want to know ?</div></div></div></blockquote><div><br></div><div>=C2=
=A0As the rpm maintainer, yes I do. The test is not being skipped when it s=
hould be, and I&#39;d like to know why.</div><div><br></div><div>Alex=C2=A0=
</div></div></div>

--000000000000ec9249059e7772a9--
