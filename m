Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pcjegan@gmail.com>) id 1SdzTh-00029q-Of
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 09:55:57 +0200
Received: by wibhm14 with SMTP id hm14so2310483wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 00:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ZzSe9qVmSDVRwDR30MsSxtvuBJqNyQ32rwtsEPpL4+o=;
	b=SwHr7wq5OvPvSQkZXMU5wtucrsvcpiu5xae4m3Vx1uApNPzimtjj+JRzQQl/dXM7IL
	PRp6QmzMeTP7pShDN6b22vS8AmZDhlPYKssuJl+mENAiKtnLlYBy5sBep9T5T0eqLYCQ
	7ycTxQp1nTvR7IgiMhhBVSHNaL2q11OEF9eQRsfUTSCtx9UUh4csM8mYScNEuq7aGzgO
	frGb7uF22+L4dlFXIACG+/ILMeqfibV1PN5LFrhgYw6BSJ4V5v7WeqMkwXivPeSb5Jd/
	jBa1c+99yyqNbi3vFea/Vd/4/W1age0L13qTOlKLEXBqaS56vxCRmWxyrSg2IVKbT8+s
	T9hg==
Received: by 10.180.80.97 with SMTP id q1mr18522679wix.13.1339400724594; Mon,
	11 Jun 2012 00:45:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.217.1.131 with HTTP; Mon, 11 Jun 2012 00:45:03 -0700 (PDT)
In-Reply-To: <CAAA4K6LV4bPEV2QXUMgwV6NMQSU2h=2Qon08F9hnRjRZUejMgA@mail.gmail.com>
References: <CAAA4K6LV4bPEV2QXUMgwV6NMQSU2h=2Qon08F9hnRjRZUejMgA@mail.gmail.com>
From: Jegan Chandru <pcjegan@gmail.com>
Date: Mon, 11 Jun 2012 13:15:03 +0530
Message-ID: <CAAA4K6L1f77Jh=5-16TMQmGDtki447oj_+Q5ydWER52iKb8Ryg@mail.gmail.com>
To: yocto@yoctoproject.org
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [yocto] Is there anyway to get patched source tar file for gcc while building srpm?
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
X-List-Received-Date: Mon, 11 Jun 2012 07:55:57 -0000
Content-Type: multipart/alternative; boundary=f46d0442835c66bf7204c22d887f

--f46d0442835c66bf7204c22d887f
Content-Type: text/plain; charset=ISO-8859-1

<<bump>>
Added poky and oe-core.

anyone?

On Thu, Jun 7, 2012 at 8:23 PM, Jegan Chandru <pcjegan@gmail.com> wrote:

> Hi,
>
> Framework - poky-denzil-7.0
> arch - x86_64
>
> Is there anyway to get patched source tar file for gcc while building
> srpm? I have checked the srpms created and found gcc srpms has only the
> logs_with_scripts tar file and not the patched source. I have configured
> "archive-patched-source" in local.conf. Upon checking on archiver.bbclass,
> noticed "not_tarball" function is excluding work-shared dir.This dir is
> used by gcc only for building. I can see the obvious reason here
> that(correct me if I am wrong) since this source has been used by,
> say gcc-cross-intermediate, gcc-cross-4.6.3 and gcc-runtime-4.6.3 bb files
> and you dont want to archive that source. But anyone can tell me the exact
> reason on why work-shared is being omitted for archiving? Also, I must
> include that, there are total 40 patches for gcc and all patches getting
> applied in gcc-4.6.inc. So I think there is no harm in archiving that
> source.
>
> As a try and error, I have created a dummy function for not_tarball and
> tried to build, but that didnt work! ;(
>
> So please anyone shed some light on this matter. It is much appreciated.
> I need srpm with source for stabilizing and do some testing.
>
> Also there is a high chance that I missed something, so feel free to
> correct me. ;)
>
> Thanks,
> -JC
>
>

--f46d0442835c66bf7204c22d887f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

&lt;&lt;bump&gt;&gt;<div>Added poky and oe-core.</div><div><br></div><div>a=
nyone?<br><br><div class=3D"gmail_quote">On Thu, Jun 7, 2012 at 8:23 PM, Je=
gan Chandru <span dir=3D"ltr">&lt;<a href=3D"mailto:pcjegan@gmail.com" targ=
et=3D"_blank">pcjegan@gmail.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi,<div><br></div><div>Framework - poky-denz=
il-7.0</div><div>arch - x86_64</div><div><br></div><div>Is there anyway to =
get patched source tar file for gcc while building srpm?=A0I have checked t=
he srpms created and found gcc srpms has only the logs_with_scripts tar fil=
e and not the patched source. I have configured &quot;archive-patched-sourc=
e&quot; in local.conf. Upon checking on archiver.bbclass, noticed &quot;not=
_tarball&quot; function is excluding work-shared dir.This dir is used by gc=
c only for building. I can see the obvious reason here that(correct me if I=
 am wrong) since this source has been used by, say=A0gcc-cross-intermediate=
,=A0gcc-cross-4.6.3 and=A0gcc-runtime-4.6.3 bb files and you dont want to a=
rchive that source. But anyone can tell me the exact reason on why work-sha=
red is being omitted for archiving? Also, I must include that, there are to=
tal 40 patches for gcc and all patches getting applied in=A0gcc-4.6.inc. So=
 I think there is no harm in archiving that source.</div>


<div><br></div><div>As a try and error, I have created a dummy function for=
 not_tarball and tried to build, but that didnt work! ;(</div><div><br></di=
v><div>So please anyone shed some light on this matter. It is much apprecia=
ted.</div>


<div>I need srpm with source for=A0stabilizing and do some testing.</div><d=
iv><br></div><div>Also there is a high chance that I missed something, so f=
eel free to correct me. ;)</div><div><br></div><div>Thanks,</div><div>-JC</=
div>


<div><div><br></div></div></blockquote></div>
</div>

--f46d0442835c66bf7204c22d887f--
