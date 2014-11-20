Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 80A9665C78
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 20:34:51 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id a108so2632972qge.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 12:34:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=eCEsOjmzX08IAKwkE12cVvaaE2Hno+o/zjwbGIDpFJU=;
	b=PHMzoqo/ma3ntTBIvWOrViOHY+BaMyK5MurgUHQ8sLKBhzt+O+Q3D5nBD2CHUVZzuc
	RTI+ve3+kN4PwoQCa4W0/CvZeX3tL5j7qi10uhGVVxosQyhHdcAGWdtU+gV9JxyNHyL4
	5kxUCfr0xhS3QOBDLLxKlm5gTSbM/bwhe7sw9fRdfDev9u06uxT3KxZiO4o+TLuGkCL2
	j8LFGGGFWbkmeA2EZ/Hr3gl9O/F18CsAuGEbvpsgJluPnc4RIbq1GREkgSYTWkPkro2+
	LN5UJEZMbNYRXYko4EdBVaNhaI3Nke9ICtfjoR/RBv+PpmL+r5dSOXXWfNn4DiJP4n1j
	0qrw==
X-Gm-Message-State: ALoCoQnKDbAhDs+PvtXu069el06HBP0R7rPcSRPYgz5d5q9HH3IjNeqIJO2FyKoW8A7Zi1JBHWry
X-Received: by 10.224.23.71 with SMTP id q7mr548790qab.22.1416515690402; Thu,
	20 Nov 2014 12:34:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Thu, 20 Nov 2014 12:34:30 -0800 (PST)
In-Reply-To: <042E875E1B5D414CA9BB78B7D4FA691C13CE7004@IRSMSX102.ger.corp.intel.com>
References: <042E875E1B5D414CA9BB78B7D4FA691C13CE7004@IRSMSX102.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Nov 2014 20:34:30 +0000
Message-ID: <CAJTo0Lb9U_xg_sKRBWSigpFXYsBrU8k-DOp3qYxzrZtDYCRboQ@mail.gmail.com>
To: "Musat, George L" <george.l.musat@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oequa/runtime: Added check for ptest-runner to see if it ran correctly
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
X-List-Received-Date: Thu, 20 Nov 2014 20:34:53 -0000
Content-Type: multipart/alternative; boundary=001a11c231568bacce0508504213

--001a11c231568bacce0508504213
Content-Type: text/plain; charset=UTF-8

On 19 November 2014 07:49, Musat, George L <george.l.musat@intel.com> wrote:

> -        cond = oeRuntimeTest.hasPackage("ptest-runner") and
> oeRuntimeTest.hasFeature("ptest") and oeRuntimeTest.hasPackage("-ptest")
>
> -        if not cond:
>
> +        #cond = oeRuntimeTest.hasPackage("ptest-runner") and
> oeRuntimeTest.hasFeature("ptest") and oeRuntimeTest.hasPackage("-ptest")
>
> +        #if not cond:
>

Git is a perfectly good method of recovering previous code, please don't
comment out source like this.  Also the commit log should be something like
"always attempt to install complementary packages" instead of the vague
"modify condition".

Ross

--001a11c231568bacce0508504213
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 November 2014 07:49, Musat, George L <span dir=3D"ltr">&lt;<a href=3D=
"mailto:george.l.musat@intel.com" target=3D"_blank">george.l.musat@intel.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><p>-=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cond =3D oeRuntimeTest.hasPackage(&quot;ptes=
t-runner&quot;) and oeRuntimeTest.hasFeature(&quot;ptest&quot;) and oeRunti=
meTest.hasPackage(&quot;-ptest&quot;)<u></u><u></u></p>
<p>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not cond:<u></u><u></u></=
p>
<p>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #cond =3D oeRuntimeTest.hasP=
ackage(&quot;ptest-runner&quot;) and oeRuntimeTest.hasFeature(&quot;ptest&q=
uot;) and oeRuntimeTest.hasPackage(&quot;-ptest&quot;)<u></u><u></u></p>
<p>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #if not cond:</p></blockquot=
e></div><br>Git is a perfectly good method of recovering previous code, ple=
ase don&#39;t comment out source like this.=C2=A0 Also the commit log shoul=
d be something like &quot;always attempt to install complementary packages&=
quot; instead of the vague &quot;modify condition&quot;.</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c231568bacce0508504213--
