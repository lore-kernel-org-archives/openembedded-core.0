Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S0Dcs-0003kn-6d
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 15:57:02 +0100
Received: by vcqp1 with SMTP id p1so88722vcq.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 06:48:41 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.27.10 as permitted sender) client-ip=10.52.27.10; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.27.10 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.27.10])
	by 10.52.27.10 with SMTP id p10mr15227437vdg.16.1329922121751 (num_hops
	= 1); Wed, 22 Feb 2012 06:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=XbEPNaeyXfNZQV5QxYLKD3a3dth1kYvn+3RBGkZikUE=;
	b=aSJ+kgBKCPeC6LuI9YRfwqlLLf/Kso1nZJK71XWtYCQklUXt8jHAszySPQHw8CTYcw
	dyccGzV7XEbvbwX2lKNJMMaMDeUT21Snv3kZ/em+kyx+cemT2Co5zl7Tz3GnijIwqoHX
	Tmzt7Of9oqMsWBXOMu9eveKSAgnFCurkZlnSs=
MIME-Version: 1.0
Received: by 10.52.27.10 with SMTP id p10mr12456059vdg.16.1329922121636; Wed,
	22 Feb 2012 06:48:41 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.149.81 with HTTP; Wed, 22 Feb 2012 06:48:41 -0800 (PST)
In-Reply-To: <cover.1329916583.git.liezhi.yang@windriver.com>
References: <cover.1329916583.git.liezhi.yang@windriver.com>
Date: Wed, 22 Feb 2012 12:48:41 -0200
X-Google-Sender-Auth: U3kAK_UODSJp7iIDlpfQ15e-FlQ
Message-ID: <CAP9ODKqcsafy0nyUVKPTe2XMO3hqzvgM0ayvd3prf52Vu8ZPbw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] A script to clean obsolete sstate cache files
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
X-List-Received-Date: Wed, 22 Feb 2012 14:57:02 -0000
Content-Type: multipart/alternative; boundary=20cf307d0576a39b8504b98e9f10

--20cf307d0576a39b8504b98e9f10
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 22, 2012 at 11:27, Robert Yang <liezhi.yang@windriver.com>wrote:

> $ ./poky/scripts/sstate-cache-management.sh --cache-dir=sstate-cache.bak/
> --remove-duplicated
> Figuring out the archs in the sstate cache dir ...
> The following archs have been found in the sstate cache dir:
> i586 ppc603e x86_64 qemux86 qemuppc
> Removing the sstate-xxx_deploy-rpm.tgz ... (3034 files)
> Removing the sstate-xxx_deploy-ipk.tgz ... (0 files)
> Removing the sstate-xxx_deploy-deb.tgz ... (0 files)
> Removing the sstate-xxx_deploy.tgz ... (8 files)
> Removing the sstate-xxx_package.tgz ... (3282 files)
> Removing the sstate-xxx_populate-lic.tgz ... (2482 files)
> Removing the sstate-xxx_populate-sysroot.tgz ... (3282 files)
> 12088 files have been removed
>

That's awesome. I was looking for a script for this.

Can you please resend it based on oe-core? I'll give it a good test.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--20cf307d0576a39b8504b98e9f10
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Feb 22, 2012 at 11:27, Robert Yang <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:liezhi.yang@windriver.com">liezhi.yang@w=
indriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div id=3D":1c6">$ ./poky/scripts/sstate-cache-management.sh --cache-dir=3D=
sstate-cache.bak/ --remove-duplicated<br>
Figuring out the archs in the sstate cache dir ...<br>
The following archs have been found in the sstate cache dir:<br>
i586 ppc603e x86_64 qemux86 qemuppc<br>
Removing the sstate-xxx_deploy-rpm.tgz ... (3034 files)<br>
Removing the sstate-xxx_deploy-ipk.tgz ... (0 files)<br>
Removing the sstate-xxx_deploy-deb.tgz ... (0 files)<br>
Removing the sstate-xxx_deploy.tgz ... (8 files)<br>
Removing the sstate-xxx_package.tgz ... (3282 files)<br>
Removing the sstate-xxx_populate-lic.tgz ... (2482 files)<br>
Removing the sstate-xxx_populate-sysroot.tgz ... (3282 files)<br>
12088 files have been removed<br></div></blockquote></div><br>That&#39;s aw=
esome. I was looking for a script for this.<div><br></div><div>Can you plea=
se resend it based on oe-core? I&#39;ll give it a good test.<br clear=3D"al=
l">
<div><br></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@oss=
ystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"=
http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br<=
/a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>
</div>

--20cf307d0576a39b8504b98e9f10--
