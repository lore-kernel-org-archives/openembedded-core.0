Return-Path: <sebmennetrier@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id A78E36CE9E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 15:42:09 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id aq17so11542973iec.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 08:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=HMqu6H6Q0F7x0XM/JDezpATEg1KMkWf5JdozbYsj29A=;
	b=XWuColpNJHBoFvd7uaB6AdPDKNRjdy0xPlXzq/iSenw3urKGESsJ8lbBSDiz8rLasc
	OYP6xzu2VeQR8eOv/yiG0f308OcMihNP99CrsopNM6WRV2P3FdofdUu3/AtOpj3jT0wP
	3wcvUS5htJyiKcn/cY4WvLFUnV07cpKK2en+ZWxgCHAJQ1eppt3mzxpb7khQ7cDLEpSF
	fILTDaasN2C+6w0dUoYRDKUPXsZ2jdYuWdpdbwL777hxpzaA160QRQh5Aik3ePFQu9mt
	k8UXVqjFsBrLZ7P8HkaddnoVBm+VIA3YB931Ie09n1TDEe5N76CItsXgAOs8LqrxOvxT
	oqtg==
MIME-Version: 1.0
X-Received: by 10.50.127.197 with SMTP id ni5mr8899147igb.54.1382974931571;
	Mon, 28 Oct 2013 08:42:11 -0700 (PDT)
Sender: sebmennetrier@gmail.com
Received: by 10.43.141.70 with HTTP; Mon, 28 Oct 2013 08:42:11 -0700 (PDT)
In-Reply-To: <1622119.vHvDT1LZVD@helios>
References: <CABgO3_ODLSb2ZWrkqN6jry7WNehq_rhRTBcorRQj+wuHTjfE7A@mail.gmail.com>
	<1622119.vHvDT1LZVD@helios>
Date: Mon, 28 Oct 2013 16:42:11 +0100
X-Google-Sender-Auth: wO9pRfyMymFPUPLehNrHkIXLpQU
Message-ID: <CABgO3_NxvRU5ZtonpPuSKb_FhmAkKoD1-HUmKD9v-+hqE0s8rg@mail.gmail.com>
From: Sebastien MENNETRIER <s.mennetrier@innotis.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Issue with package_rpm : can't install files named "%name..."
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
X-List-Received-Date: Mon, 28 Oct 2013 15:42:09 -0000
Content-Type: multipart/alternative; boundary=089e013a286e879ca604e9cef140

--089e013a286e879ca604e9cef140
Content-Type: text/plain; charset=ISO-8859-1

Paul,

Thanks for your answer. I filled a bug :
https://bugzilla.yoctoproject.org/show_bug.cgi?id=5397

Regards,
Seb


2013/10/28 Paul Eggleton <paul.eggleton@linux.intel.com>

> Hi Sebastien,
>
> On Monday 28 October 2013 14:44:57 Sebastien MENNETRIER wrote:
> > I try to cross-compile and install rubygems and the gems contain some
> > directories and files named "%name...".
> >
> > To create the rpm package, a spec file that contains the list of all
> files
> > and directories that must be in the rpm package is generated in
> do_package.
> >
> > The rpm process replace all the "%name" in the spec file by the name of
> the
> > package. So the package process try to include some file and directory
> that
> > doesn't exist.
> >
> > How can I resolve this issue ? Is it a bug in package_rpm.bbclass ?
>
> It is a limitation in package_rpm.bbclass's current behaviour, yes. It
> probably needs to be fixed to escape % at the start of a filename when
> writing
> out the spec file (assuming that is possible, that is). Could you please
> file a
> bug for this (at bugzilla.yoctoproject.org)?
>
> Thanks,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

--089e013a286e879ca604e9cef140
Content-Type: text/html; charset=ISO-8859-1

<div dir="ltr"><div><div><div>Paul,<br><br></div>Thanks for your answer. I filled a bug : <a href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=5397" target="_blank">https://bugzilla.yoctoproject.org/show_bug.cgi?id=5397</a></div>
<div>
<br></div>Regards,<br></div>Seb</div><div class="gmail_extra"><br><br><div class="gmail_quote">2013/10/28 Paul Eggleton <span dir="ltr">&lt;<a href="mailto:paul.eggleton@linux.intel.com" target="_blank">paul.eggleton@linux.intel.com</a>&gt;</span><br>
<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Sebastien,<br>
<div><div class="h5"><br>
On Monday 28 October 2013 14:44:57 Sebastien MENNETRIER wrote:<br>
&gt; I try to cross-compile and install rubygems and the gems contain some<br>
&gt; directories and files named &quot;%name...&quot;.<br>
&gt;<br>
&gt; To create the rpm package, a spec file that contains the list of all files<br>
&gt; and directories that must be in the rpm package is generated in do_package.<br>
&gt;<br>
&gt; The rpm process replace all the &quot;%name&quot; in the spec file by the name of the<br>
&gt; package. So the package process try to include some file and directory that<br>
&gt; doesn&#39;t exist.<br>
&gt;<br>
&gt; How can I resolve this issue ? Is it a bug in package_rpm.bbclass ?<br>
<br>
</div></div>It is a limitation in package_rpm.bbclass&#39;s current behaviour, yes. It<br>
probably needs to be fixed to escape % at the start of a filename when writing<br>
out the spec file (assuming that is possible, that is). Could you please file a<br>
bug for this (at <a href="http://bugzilla.yoctoproject.org" target="_blank">bugzilla.yoctoproject.org</a>)?<br>
<br>
Thanks,<br>
Paul<br>
<span class="HOEnZb"><font color="#888888"><br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</font></span></blockquote></div><br></div>

--089e013a286e879ca604e9cef140--
