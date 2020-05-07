Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.1444.1588810241823961877
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 17:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=iR4TCUiO;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [192.168.1.135] (cpe-173-172-201-6.elp.res.rr.com [173.172.201.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id BD55B20B717B;
	Wed,  6 May 2020 17:10:40 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BD55B20B717B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1588810241;
	bh=UollBeqao7/TktD5czttkhpb6M6scAGpiDd2DwTLB4I=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=iR4TCUiOA0ezKiOFEn6njTD6Xgdyv1KmHnZ5uxCZMB+jmEQfPrkzGxFzubeE1go+U
	 F6fLVIbldHH8T6unCZsl6jXDa6j3Cwxa48GfT6TrX+JTH39L6iJczTTZGLuGbp/HxN
	 XNSypjA+6m3Jp/J3Y77MX8pHdQ8Ge1Ul0zb3CIow=
Subject: Re: [OE-core] [PATCH] python fmt: Add recipe to include https://pypi.org/project/fmt/
To: mm.karthik@gmail.com, openembedded-core@lists.openembedded.org
References: <A51m.1588780377074409811.H3E3@lists.openembedded.org>
From: "Alejandro Hernandez" <alhe@linux.microsoft.com>
Message-ID: <6eda525b-e7b9-1f5f-2826-1532d67852a1@linux.microsoft.com>
Date: Wed, 6 May 2020 17:10:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <A51m.1588780377074409811.H3E3@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------6F887D022CAC1B062415448A"
Content-Language: en-US

--------------6F887D022CAC1B062415448A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

If you could please look at the submitting patch guidelines/howto in the 
following link:

https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

At a very high level you should make local changes to the repo, commit 
them through git and create a patch from your commit that you can then 
send through git send-email.

That would allow us to get the patch in the required format (vs 
attachments), to be able to merge it in our repos.

I would also evaluate if python3-fmt belongs to the openembedded core 
repo or the meta-python layer in the meta-openembedded repo 
(http://git.openembedded.org/meta-openembedded/tree/meta-python).


Cheers,

Alejandro


On 5/6/20 8:52 AM, mm.karthik@gmail.com wrote:
> To allow python < 3.6 users to use python 3.6 style f-string 
> formatting, fmt library needs to be integrated.
>
> 

--------------6F887D022CAC1B062415448A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-=
8">
  </head>
  <body>
    <p>Hello,</p>
    <p>If you could please look at the submitting patch guidelines/howto
      in the following link:</p>
    <p><a
href=3D"https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmb=
edded">https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbed=
ded</a></p>
    <p>At a very high level you should make local changes to the repo,
      commit them through git and create a patch from your commit that
      you can then send through git send-email.</p>
    <p>That would allow us to get the patch in the required format (vs
      attachments), to be able to merge it in our repos.</p>
    <p>I would also evaluate if python3-fmt belongs to the openembedded
      core repo or the meta-python layer in the meta-openembedded repo (<a
href=3D"http://git.openembedded.org/meta-openembedded/tree/meta-python">ht=
tp://git.openembedded.org/meta-openembedded/tree/meta-python</a>).<br>
    </p>
    <p><br>
    </p>
    <p>Cheers,</p>
    <p>Alejandro<br>
    </p>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 5/6/20 8:52 AM, <a class=3D"moz-txt-=
link-abbreviated" href=3D"mailto:mm.karthik@gmail.com">mm.karthik@gmail.com=
</a>
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:A51m.1588780377074409811.H3E3@lists.openembedded.org">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUT=
F-8">
      To allow python &lt; 3.6 users to use python 3.6 style f-string
      formatting, fmt library needs to be integrated.=C2=A0=C2=A0
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
    </blockquote>
  </body>
</html>

--------------6F887D022CAC1B062415448A--
