Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.20434.1618435821720330470
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 14:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=HhJ9XUFV;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [10.8.1.2] (unknown [107.158.96.43])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6189420B8001;
	Wed, 14 Apr 2021 14:30:20 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6189420B8001
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1618435820;
	bh=4xtYxCmUOmyYLXRdMzfa0iNPzLmeNhu4GVjny1VHMwE=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=HhJ9XUFVeJ7t2VgjIpRYYEUfDtVc0CV5BiP6nNKggxtCpOvo/wAh388X8h0vl6fs3
	 Xoni9dAESDm9K01Xew/qHPeAVluuTUFY48jVBXVs5talLwLfArMjB5STBEVZnsriHT
	 PPzzCfq6Q3uxkVeCrmZ5cHA987ZsU2cOjp3KbVhw=
Subject: Re: [OE-core] [PATCH v3] gcc: Upgrade to 10.3.0 bug-fix release
To: Khem Raj <raj.khem@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210411202746.388822-1-raj.khem@gmail.com>
 <dd4c72b2aaf48cb7f015030e232bc2641e38f2ef.camel@linuxfoundation.org>
 <CAMKF1spL71KJfmpPT7F09gc=RB8NPgKFRewAtHhj7bFNp-H8Sg@mail.gmail.com>
 <b5a702f99841616420c8d82b013fd91aa0c11d9d.camel@linuxfoundation.org>
 <2fa1da72-593b-a064-5591-f75e571fe11b@gmail.com>
From: "Alejandro Hernandez Samaniego" <alhe@linux.microsoft.com>
Message-ID: <60020db7-baa5-029b-75dc-6bbc6b97fff2@linux.microsoft.com>
Date: Wed, 14 Apr 2021 21:33:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <2fa1da72-593b-a064-5591-f75e571fe11b@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------BE6F10AA8F67B3323D525B7C"
Content-Language: en-US

--------------BE6F10AA8F67B3323D525B7C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hey Khem,

In case you're not aware, the Distrodata.test_maintainers fails on this on=
e:

The following recipes do not have a maintainer assigned to them. Please=20
add an entry to meta/conf/distro/include/maintainers.inc file.
gcc-source-10.3.0=20
(/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/recipes-devtoo=
ls/gcc/gcc-source_10.3.bb)

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/2022/ste=
ps/14/logs/stdio

Cheers,
Alejandro


On 4/12/21 3:27 PM, Khem Raj wrote:
>
>
> On 4/12/21 2:54 AM, Richard Purdie wrote:
>> On Sun, 2021-04-11 at 16:20 -0700, Khem Raj wrote:
>>> On Sun, Apr 11, 2021 at 3:12 PM Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>
>>>> On Sun, 2021-04-11 at 13:27 -0700, Khem Raj wrote:
>>>>> Drop aarch64 backports which are already upstream
>>>>> List of bugs fixed is [1]
>>>>>
>>>>> [1]=20
>>>>> https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=3DRESOLVED&list_=
id=3D298084&resolution=3DFIXED&target_milestone=3D10.3
>>>>>
>>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>>> ---
>>>>> v2: Fix BINV
>>>>> v3: Fix maintainer entry to use PV
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Fix include poison patch which was old=
 version
>>>>
>>>> Not sure we can put PV into a maintainer's entry like that as it is=
=20
>>>> in the global
>>>> namespace, it isn't gcc specific.
>>>
>>> I checked it with bitbake -e and seems to be effective.
>>>
>>
>> "bitbake -e" didn't show the correct thing for me so I tweaked the patc=
h
>> in master-next.
>
> OK but its a bit confusing, here is what master-next shows fot me
>
> % bitbake -e gcc-source-10.3.0 | grep "RECIPE_MAINTAINER=3D"
> RECIPE_MAINTAINER=3D"Khem Raj <raj.khem@gmail.com>"
>
>
>>
>>>> I also couldn't get this patch to apply, is it on a branch somewhere?
>>>> ]
>>>
>>> Its on kraj/gcc11 branch on contrib tree
>>>
>>> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/g=
cc11=20
>>>
>>
>> Thanks, I've queued up another test run.
>>
>> Cheers,
>>
>> Richard
>>
>
>=20
>

--------------BE6F10AA8F67B3323D525B7C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-=
8">
  </head>
  <body>
    <p>Hey Khem,</p>
    In case you're not aware, the Distrodata.test_maintainers fails on
    this one:<br>
    <br>
    The following recipes do not have a maintainer assigned to them.
    Please add an entry to meta/conf/distro/include/maintainers.inc
    file.<br>
    gcc-source-10.3.0
(/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/recipes-devtoo=
ls/gcc/gcc-source_10.3.bb)<br>
    <br>
<a class=3D"moz-txt-link-freetext" href=3D"https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/87/builds/2022/steps/14/logs/stdio">https://autobu=
ilder.yoctoproject.org/typhoon/#/builders/87/builds/2022/steps/14/logs/stdi=
o</a><br>
    <br>
    Cheers,<br>
    Alejandro<br>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 4/12/21 3:27 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:2fa1da72-593b-a064-5591-f75e571fe11b@gmail.com">
      <br>
      <br>
      On 4/12/21 2:54 AM, Richard Purdie wrote:
      <br>
      <blockquote type=3D"cite">On Sun, 2021-04-11 at 16:20 -0700, Khem
        Raj wrote:
        <br>
        <blockquote type=3D"cite">On Sun, Apr 11, 2021 at 3:12 PM Richard
          Purdie
          <br>
          <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:richard.purdie=
@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a> wrote:
          <br>
          <blockquote type=3D"cite">
            <br>
            On Sun, 2021-04-11 at 13:27 -0700, Khem Raj wrote:
            <br>
            <blockquote type=3D"cite">Drop aarch64 backports which are
              already upstream
              <br>
              List of bugs fixed is [1]
              <br>
              <br>
              [1]
<a class=3D"moz-txt-link-freetext" href=3D"https://gcc.gnu.org/bugzilla/bu=
glist.cgi?bug_status=3DRESOLVED&amp;list_id=3D298084&amp;resolution=3DFIXED=
&amp;target_milestone=3D10.3">https://gcc.gnu.org/bugzilla/buglist.cgi?bug_=
status=3DRESOLVED&amp;list_id=3D298084&amp;resolution=3DFIXED&amp;target_mi=
lestone=3D10.3</a><br>
              <br>
              Signed-off-by: Khem Raj <a class=3D"moz-txt-link-rfc2396E" h=
ref=3D"mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
              <br>
              ---
              <br>
              v2: Fix BINV
              <br>
              v3: Fix maintainer entry to use PV
              <br>
              =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Fix include poison patch which=
 was old version
              <br>
            </blockquote>
            <br>
            Not sure we can put PV into a maintainer's entry like that
            as it is in the global
            <br>
            namespace, it isn't gcc specific.
            <br>
          </blockquote>
          <br>
          I checked it with bitbake -e and seems to be effective.
          <br>
          <br>
        </blockquote>
        <br>
        "bitbake -e" didn't show the correct thing for me so I tweaked
        the patch
        <br>
        in master-next.
        <br>
      </blockquote>
      <br>
      OK but its a bit confusing, here is what master-next shows fot me
      <br>
      <br>
      % bitbake -e gcc-source-10.3.0 | grep "RECIPE_MAINTAINER=3D"
      <br>
      RECIPE_MAINTAINER=3D"Khem Raj <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>"
      <br>
      <br>
      <br>
      <blockquote type=3D"cite">
        <br>
        <blockquote type=3D"cite">
          <blockquote type=3D"cite">I also couldn't get this patch to
            apply, is it on a branch somewhere?
            <br>
            ]
            <br>
          </blockquote>
          <br>
          Its on kraj/gcc11 branch on contrib tree
          <br>
          <br>
<a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.org/op=
enembedded-core-contrib/log/?h=3Dkraj/gcc11">https://git.openembedded.org/o=
penembedded-core-contrib/log/?h=3Dkraj/gcc11</a>
          <br>
        </blockquote>
        <br>
        Thanks, I've queued up another test run.
        <br>
        <br>
        Cheers,
        <br>
        <br>
        Richard
        <br>
        <br>
      </blockquote>
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">


</pre>
    </blockquote>
  </body>
</html>

--------------BE6F10AA8F67B3323D525B7C--
