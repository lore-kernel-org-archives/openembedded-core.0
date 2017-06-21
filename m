Return-Path: <a.novikov@yadro.com>
X-Greylist: delayed 385 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 21 Jun 2017 07:11:00 UTC
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
	by mail.openembedded.org (Postfix) with ESMTP id A8EAB71A60
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 07:11:00 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id 03E5A40418
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 07:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	content-language:content-type:content-type:in-reply-to
	:mime-version:user-agent:date:date:message-id:from:from
	:references:subject:subject:received:received:received; s=
	mta-01; t=1498028674; x=1499843075; bh=klERLTh8YKP9HCs7MJq9KXn7e
	X6rxZq0MweslL3bJEQ=; b=S7Ge3dEk0yCdvWdDO32XcCy8K2/PKfTpFT+mGDSnS
	z/Q/SnHobGLYmyluBH0WQ5AVaCrutPleCE4RHsJ3tYT0H0uR2pPet3RlH5bly8zy
	YM+bSOdLJ5TdyGAa5BSNjmFUChLVnQJzDHT8yfjR65RI0V7dj4H+OFwijiPygY4w
	68=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pr423Gm8O6fL
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 10:04:34 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
	[172.17.10.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id 7A9FB40416
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 10:04:34 +0300 (MSK)
Received: from [172.17.15.41] (172.17.15.41) by T-EXCH-02.corp.yadro.com
	(172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32;
	Wed, 21 Jun 2017 10:04:34 +0300
References: <CAMKF1sp3SnGKG7OGuNJAwXZiSUBLDykr8Ds982WdXwJxZ5sNfQ@mail.gmail.com>
To: <openembedded-core@lists.openembedded.org>
From: Anton Novikov <a.novikov@yadro.com>
X-Forwarded-Message-Id: <CAMKF1sp3SnGKG7OGuNJAwXZiSUBLDykr8Ds982WdXwJxZ5sNfQ@mail.gmail.com>
Message-ID: <641d1df8-77f2-3b96-30d5-d770a5e44a9e@yadro.com>
Date: Wed, 21 Jun 2017 10:04:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp3SnGKG7OGuNJAwXZiSUBLDykr8Ds982WdXwJxZ5sNfQ@mail.gmail.com>
X-Originating-IP: [172.17.15.41]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
	T-EXCH-02.corp.yadro.com (172.17.10.102)
Subject: Re: [yocto] Some Arch Linux build fixes
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
X-List-Received-Date: Wed, 21 Jun 2017 07:11:01 -0000
Content-Type: multipart/alternative;
	boundary="------------8840830BCBC299DF257DA8A0"
Content-Language: en-US

--------------8840830BCBC299DF257DA8A0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

people at yocto@yoctoproject.org sent me here.

Please review my commits and apply them or provide me with help to

do it myself.

Thanks,

Anton



-------- Forwarded Message --------
Subject: 	Re: [yocto] Some Arch Linux build fixes
Date: 	Tue, 20 Jun 2017 23:05:16 -0400
From: 	Khem Raj <raj.khem@gmail.com>
To: 	Anton Novikov <a.novikov@yadro.com>
CC: 	yocto@yoctoproject.org <yocto@yoctoproject.org>



On Tue, Jun 20, 2017 at 10:09 AM, Anton Novikov <a.novikov@yadro.com> wrote:
> Hi, and all have a nice day.
>
>
> My company contributes to OpenBMC project, whose code has an
> 'import-layers/yocto-poky'
>
> git subtree. I'm trying to build it on Arch Linux, which is a rolling
> release distribution, and
>
> has pretty recent package versions, which triggers some bugs, which I'm
> fixing.
>
>
> Patrick, an OpenBMC maintainer, sent me here, as the code in this folder
> seems to be
>
> synchronized with Yocto code. So somebody, please look at
> https://github.com/openbmc/openbmc/pull/1817

this are good fixes. Please send them to openembedded-core@ mailing list
for review and inclusion in branches they are required. Please be aware
that rolling releases are hard to use for a time based release like Yocto
since over period of time things will change unless you keep using master
of yocto. I would suggest to consider this fact.

>
> and comment on it here. I want to either re-contribute the changes to Yocto,
> or just maintain arch-fixes
>
> branch of github.com/an146/openbmc and have someone else to adapt the fixes
> to Yocto.
>
>
> Thanks,
>
> Anton
>
> --
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto


--------------8840830BCBC299DF257DA8A0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi all,</p>
    <p>people at <a class="moz-txt-link-abbreviated" href="mailto:yocto@yoctoproject.org">yocto@yoctoproject.org</a> sent me here.</p>
    <p>Please review my commits and apply them or provide me with help
      to</p>
    <p>do it myself.</p>
    <p>Thanks,</p>
    <p>Anton<br>
    </p>
    <div class="moz-forward-container"><br>
      <br>
      -------- Forwarded Message --------
      <table class="moz-email-headers-table" cellspacing="0"
        cellpadding="0" border="0">
        <tbody>
          <tr>
            <th valign="BASELINE" align="RIGHT" nowrap="nowrap">Subject:
            </th>
            <td>Re: [yocto] Some Arch Linux build fixes</td>
          </tr>
          <tr>
            <th valign="BASELINE" align="RIGHT" nowrap="nowrap">Date: </th>
            <td>Tue, 20 Jun 2017 23:05:16 -0400</td>
          </tr>
          <tr>
            <th valign="BASELINE" align="RIGHT" nowrap="nowrap">From: </th>
            <td>Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></td>
          </tr>
          <tr>
            <th valign="BASELINE" align="RIGHT" nowrap="nowrap">To: </th>
            <td>Anton Novikov <a class="moz-txt-link-rfc2396E" href="mailto:a.novikov@yadro.com">&lt;a.novikov@yadro.com&gt;</a></td>
          </tr>
          <tr>
            <th valign="BASELINE" align="RIGHT" nowrap="nowrap">CC: </th>
            <td><a class="moz-txt-link-abbreviated" href="mailto:yocto@yoctoproject.org">yocto@yoctoproject.org</a> <a class="moz-txt-link-rfc2396E" href="mailto:yocto@yoctoproject.org">&lt;yocto@yoctoproject.org&gt;</a></td>
          </tr>
        </tbody>
      </table>
      <br>
      <br>
      <pre>On Tue, Jun 20, 2017 at 10:09 AM, Anton Novikov <a class="moz-txt-link-rfc2396E" href="mailto:a.novikov@yadro.com">&lt;a.novikov@yadro.com&gt;</a> wrote:
&gt; Hi, and all have a nice day.
&gt;
&gt;
&gt; My company contributes to OpenBMC project, whose code has an
&gt; 'import-layers/yocto-poky'
&gt;
&gt; git subtree. I'm trying to build it on Arch Linux, which is a rolling
&gt; release distribution, and
&gt;
&gt; has pretty recent package versions, which triggers some bugs, which I'm
&gt; fixing.
&gt;
&gt;
&gt; Patrick, an OpenBMC maintainer, sent me here, as the code in this folder
&gt; seems to be
&gt;
&gt; synchronized with Yocto code. So somebody, please look at
&gt; <a class="moz-txt-link-freetext" href="https://github.com/openbmc/openbmc/pull/1817">https://github.com/openbmc/openbmc/pull/1817</a>

this are good fixes. Please send them to openembedded-core@ mailing list
for review and inclusion in branches they are required. Please be aware
that rolling releases are hard to use for a time based release like Yocto
since over period of time things will change unless you keep using master
of yocto. I would suggest to consider this fact.

&gt;
&gt; and comment on it here. I want to either re-contribute the changes to Yocto,
&gt; or just maintain arch-fixes
&gt;
&gt; branch of github.com/an146/openbmc and have someone else to adapt the fixes
&gt; to Yocto.
&gt;
&gt;
&gt; Thanks,
&gt;
&gt; Anton
&gt;
&gt; --
&gt; _______________________________________________
&gt; yocto mailing list
&gt; <a class="moz-txt-link-abbreviated" href="mailto:yocto@yoctoproject.org">yocto@yoctoproject.org</a>
&gt; <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/listinfo/yocto">https://lists.yoctoproject.org/listinfo/yocto</a>
</pre>
    </div>
  </body>
</html>

--------------8840830BCBC299DF257DA8A0--
