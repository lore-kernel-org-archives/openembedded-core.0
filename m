Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qg0-f46.google.com (unknown [209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7CFB66FCA0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 16:36:30 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id q108so1715195qgd.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 09:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ArmgKzpE2ylBPhW63ejKw5qyCeVMfeZQDvLspe57qYI=;
	b=lI5oLRYwhO2hBI8AvFO73weXHtNCrUAuucQuy8zISRAuPl7bWIa2Ur83jXnvhXHHN0
	9NvCjBojXV8v8ZrX0dGsMUCqOhrJ/hmYwBxJN5m90OtFVGwDSCDqJrHrfx83yLMoOH1t
	/9hQ8/iFsiAms3YIyFeMBFoj+aghreiYlUf1xjX2uPdeoGLjQodMcvSQjTIOtiWrBBWz
	m29X8mWFgR0KLSfyEyFvWy0vPp7RGhQxq6+nfrZzBCQufekBAXyj+IcphagHkTGKYQYE
	/0TqDGLW8Cgv+UvBDY27vGXMD6TZj8v2Bl9tuc3mCtHDfgfN/RJRyp6okpemPFuOnC1K
	g+GA==
X-Received: by 10.140.44.72 with SMTP id f66mr11267935qga.78.1401381391588;
	Thu, 29 May 2014 09:36:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.48.112 with HTTP; Thu, 29 May 2014 09:36:11 -0700 (PDT)
In-Reply-To: <53875026.60107@linux.intel.com>
References: <CAMCfZKEnyyR9ADx1H2X7=9kdCRPU14DRHFgMuhu9gzFnHxP1ag@mail.gmail.com>
	<53875026.60107@linux.intel.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Thu, 29 May 2014 13:36:11 -0300
Message-ID: <CAMCfZKGHKjGrNLbumUXCex8=mc3RmamOu-uRv3Rc2R=7Sq+r6w@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: intltool version check errors
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
X-List-Received-Date: Thu, 29 May 2014 16:36:38 -0000
Content-Type: multipart/alternative; boundary=001a1139a7e40a96ef04fa8c88b8

--001a1139a7e40a96ef04fa8c88b8
Content-Type: text/plain; charset=ISO-8859-1

Hi Sau!,

On Thu, May 29, 2014 at 12:20 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 05/29/2014 06:17 AM, Diego Sueiro wrote:
>
>> Folks,
>>
>> I'm facing with a strange error on daisy branch.
>> Some native recipes are failing on do_configure step with this message:
>>
>> checking for intltool >= 0.35.0...
>> /<snip>/tmp/sysroots/x86_64-linux/usr/bin/nativeperl found
>> configure: error: Your intltool is too old.  You need intltool 0.35.0 or
>> later.
>> Configure failed. The contents of all config.log files follows to aid
>> debugging
>>
>>
>> But intltool-native version is 0.50.2.
>> What am I missing?
>>
>>
>>  What is your Host OS in this case, it seems like you might be having
> somekind of host contamination issue.
>

Ubuntu 14.04 x86_64. I have installed intltools (0.50.2) on host too.


> Can you also look at your config.log and see what it was actually testing
> for.
>

Do you mean the recipe's log.do_configure?


>
> Or attach your config.log for us to review
>
> Thanks
>
> Sau!
>


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a1139a7e40a96ef04fa8c88b8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Sau!,</div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Thu, May 29, 2014 at 12:20 PM, =
Saul Wold <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" targ=
et=3D"_blank">sgw@linux.intel.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">On 05/29/2014 06:17 AM, Dieg=
o Sueiro wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Folks,<br>
<br>
I&#39;m facing with a strange error on daisy branch.<br>
Some native recipes are failing on do_configure step with this message:<br>
<br>
checking for intltool &gt;=3D 0.35.0...<br>
/&lt;snip&gt;/tmp/sysroots/x86_64-<u></u>linux/usr/bin/nativeperl found<br>
configure: error: Your intltool is too old. =A0You need intltool 0.35.0 or<=
br>
later.<br>
Configure failed. The contents of all config.log files follows to aid<br>
debugging<br>
<br>
<br>
But intltool-native version is 0.50.2.<br>
What am I missing?<br>
<br>
<br>
</blockquote></div>
What is your Host OS in this case, it seems like you might be having someki=
nd of host contamination issue.<br></blockquote><div><br></div><div>Ubuntu =
14.04 x86_64. I have installed intltools (0.50.2) on host too.</div><div>

<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
<br>
Can you also look at your config.log and see what it was actually testing f=
or.<br></blockquote><div><br></div><div>Do you mean the recipe&#39;s log.do=
_configure?</div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">


<br>
Or attach your config.log for us to review<br>
<br>
Thanks<br>
<br>
Sau!<br></blockquote></div><br><br><div><div dir=3D"ltr"><div>Regards,</div=
><div><br></div>--<br>*dS<br>Diego Sueiro<br><br>Administrador do Embarcado=
s<br><a href=3D"http://www.embarcados.com.br/?utm_source=3Dassinatura_diego=
&amp;utm_medium=3De-mail&amp;utm_campaign=3DAssinatura%20Email%20Diego" tar=
get=3D"_blank">www.embarcados.com.br</a><br>

<br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--001a1139a7e40a96ef04fa8c88b8--
