Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TgaMf-00061L-8z
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 13:15:41 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so3925172pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Dec 2012 04:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=9rXarnpk5YPGX+O1TCgAa+xpDCA41/IWC2tYHd+BxNs=;
	b=zVA43HG76uvhAiC7goYEw8kZqsTRc9V42x3nlGFD+qOBsqxzHYy5ujSRNRPioBYudR
	S4kTJcm654OmzXr6gzJdpX8lNJ7dfvCvWS/smDiQ9g2hOgdYpAffoZXsBSy2LjiXrr0M
	vVBWskXK50QGknh5o8sljGGlvV9HNn6bo/CD9/pCDav5e4A0BagwAZ89hEcRWGsR4rtf
	SpkfkBk/s8XeprEsIGK3byfLanwFFBzGolEbnXCQ1KAiljhSEGdcMGTNX9VBND3Pe76E
	wnwdnkHPDlQ0Z1VjspLKDq50uj2GcQjwBRmkxFuBXYqlTPeXzFx11vRwnWG2ascdryIC
	O3hg==
MIME-Version: 1.0
Received: by 10.66.80.194 with SMTP id t2mr3566688pax.43.1354795275269; Thu,
	06 Dec 2012 04:01:15 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Thu, 6 Dec 2012 04:01:15 -0800 (PST)
In-Reply-To: <18ff48823dac8258feb94958f9ebe3dcaab32815.1354748735.git.elizabeth.flanagan@intel.com>
References: <cover.1354748735.git.elizabeth.flanagan@intel.com>
	<18ff48823dac8258feb94958f9ebe3dcaab32815.1354748735.git.elizabeth.flanagan@intel.com>
Date: Thu, 6 Dec 2012 10:01:15 -0200
X-Google-Sender-Auth: IMgFIXLAz7KDw-HFY2UDRYfS1o0
Message-ID: <CAP9ODKp_YuFAKA8xS72DM_MtuZnMRBpengyi656p30oJ0EuJvQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] license.bbclass: Including locale packages
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
X-List-Received-Date: Thu, 06 Dec 2012 12:15:41 -0000
Content-Type: multipart/alternative; boundary=f46d042f942e20347a04d02ddb63

--f46d042f942e20347a04d02ddb63
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Dec 5, 2012 at 9:37 PM, Elizabeth Flanagan <
elizabeth.flanagan@intel.com> wrote:

> As locale packages are installed on the image, we should
> be including them in the package/license manifest.
>
> This ensures that the manifests are accurate and complete.
>
> [ YOCTO #2461 ]
>
> Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
>

Do you see any problem in it being add to danny as well?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--f46d042f942e20347a04d02ddb63
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Wed, D=
ec 5, 2012 at 9:37 PM, Elizabeth Flanagan <span dir=3D"ltr">&lt;<a href=3D"=
mailto:elizabeth.flanagan@intel.com" target=3D"_blank">elizabeth.flanagan@i=
ntel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">As locale packages are installed on the imag=
e, we should<br>
be including them in the package/license manifest.<br>
<br>
This ensures that the manifests are accurate and complete.<br>
<br>
[ YOCTO #2461 ]<br>
<br>
Signed-off-by: Elizabeth Flanagan &lt;<a href=3D"mailto:elizabeth.flanagan@=
intel.com">elizabeth.flanagan@intel.com</a>&gt;<br></blockquote><div><br></=
div><div>Do you see any problem in it being add to danny as well?=A0</div>
</div><div><br></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>
</div>

--f46d042f942e20347a04d02ddb63--
