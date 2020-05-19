Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.7740.1589874667949466031
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 00:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=T1hs0FkT;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [192.168.1.135] (cpe-173-172-201-6.elp.res.rr.com [173.172.201.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id 9FFBD20B717B;
	Tue, 19 May 2020 00:51:06 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9FFBD20B717B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1589874667;
	bh=6uqII0K3xCDeZca4k5iZkhpgndPnIp9B3am7Tze0wG0=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=T1hs0FkT1iNcKdUvKduv1tlgnUfz46adq/E/rAgxjB8jOHvLXh34jWPzsljKtJDcQ
	 U0nuGz5tI/RPhwvtqusRIVsZlNfEzFXFRcX7uWPsUqfr0xIPLlVhqA+F/Vt6Wsn5Hq
	 78W3ReRklKZ7wCcLL/M4CNao6QBYvBRJHkxhWBlc=
Subject: Re: [OE-core] [PATCH] python3: add pydoc and urllib to core
To: "Yu, Mingli" <mingli.yu@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20200518073201.23647-1-mingli.yu@windriver.com>
 <1610296324895336.31912@lists.openembedded.org>
 <ae41e89e-8f14-fc87-b4ae-5d9a7763e259@linux.microsoft.com>
 <73eb24f4-91dd-bc2c-2b32-9a1fec299163@windriver.com>
From: "Alejandro Hernandez" <alhe@linux.microsoft.com>
Message-ID: <c82bf9fd-4ca4-6d7c-a2eb-8c28c5cb5ab6@linux.microsoft.com>
Date: Tue, 19 May 2020 00:51:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <73eb24f4-91dd-bc2c-2b32-9a1fec299163@windriver.com>
Content-Type: multipart/alternative;
 boundary="------------77C62BD1CADE6063BCDBBF7D"
Content-Language: en-US

--------------77C62BD1CADE6063BCDBBF7D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hey Mingly Yu,

On 5/19/20 12:43 AM, Yu, Mingli wrote:
> Hi Alejandro,
>
>
> On 2020/5/19 =E4=B8=8B=E5=8D=883:22, Alejandro Hernandez Samaniego wrote=
:
>> Hello,
>>
>> The more I look into this, the more I realize its incorrect.
>
> Understood your concern.
>
>>
>>
>> On 5/18/20 8:36 AM, Alejandro Hernandez wrote:
>>>
>>> Hello Mingli,
>>>
>>> Did you happen to run the create_manifest task after modifying the=20
>>> manifest to make sure that runtime dependencies are still valid?
>>>
>>>
>>> Thanks
>>>
>>> Alejandro
>>>
>>> On 5/18/20 12:32 AM, Yu, Mingli wrote:
>>>> From: Mingli Yu<mingli.yu@windriver.com>
>>>>
>>>> Add pydoc and urllib to core to fix below error:
>>>> =C2=A0 # python3
>>>> =C2=A0 >>> help()
>>>> =C2=A0 Traceback (most recent call last):
>>>> =C2=A0 File "<stdin>", line 1, in <module>
>>>> =C2=A0 File "/usr/lib64/python3.8/sitebuiltins.py", line 102, in __ca=
ll_
>>>> =C2=A0 import pydoc
>>>> =C2=A0 ModuleNotFoundError: No module named 'pydoc'
>>>> =C2=A0 File "/usr/lib64/python3.8/pydoc.py", line 72, in <module>
>>>> =C2=A0 import urllib.parse
>>>> =C2=A0 ModuleNotFoundError: No module named 'urllib'
>>
>> Why would pydoc be required to run python? or urllib in any case?
>
>
> It's better make the python3-core more lightweight.
>
> But in a system which didn't install other python modules but just=20
> python3-core, then we type help() as below and the help cannot show=20
> normally. So add the needed pydoc and urllib file to make the help()=20
> works.
>
> =C2=A0# python3
> =C2=A0>>> help()
> =C2=A0Traceback (most recent call last):
> =C2=A0File "<stdin>", line 1, in <module>
> =C2=A0File "/usr/lib64/python3.8/sitebuiltins.py", line 102, in __call_
> =C2=A0import pydoc
> =C2=A0ModuleNotFoundError: No module named 'pydoc'
> =C2=A0File "/usr/lib64/python3.8/pydoc.py", line 72, in <module>
> =C2=A0import urllib.parse
> =C2=A0ModuleNotFoundError: No module named 'urllib'
>
>
> After pydoc and urllib added and also just install python3-core and no=
=20
> additional python3 modules installed.
>
> # python3
> Python 3.8.2 (default, May 18 2020, 07:15:10)
> [GCC 9.3.0] on linux
> Type "help", "copyright", "credits" or "license" for more information.
> >>> help()
> Welcome to Python 3.8's help utility!
>
> If this is your first time using Python, you should definitely check out
> the tutorial on the Internet at https://docs.python.org/3.8/tutorial/.
>
> Enter the name of any module, keyword, or topic to get help on writing
> Python programs and using Python modules.=C2=A0 To quit this help utilit=
y and
> return to the interpreter, just type "quit".
>
> To get a list of available modules, keywords, symbols, or topics, type
> "modules", "keywords", "symbols", or "topics".=C2=A0 Each module also co=
mes
> with a one-line summary of what it does; to list the modules whose name
> or summary contain a given string such as "spam", type "modules spam".
> help>
>
>
> Thanks,
>
I still believe python3-core should be left as small as possible, the use =
case
of an embedded device calling help() is probably seldom, IMO that fits mor=
e in
the workflow of installing the netlib and pydoc modules for that specific =
usecase.

It also looks like simply installing python3-pydoc would do what you want,=
 since
the error to load urllib is coming out of loading pydoc itself and the man=
ifest
does specify the dependency from pydoc to netclient.

Cheers,

Alejandro


>>
>> I believe there is a discrepancy between what python3-core does and=20
>> what you believe it should do.
>> python3-core is the smallest possible package to get a working=20
>> python3 interpreter, if you install python3-core
>> thats what you get, if you need more modules then you install more=20
>> modules, e.g. python3-pydoc, python3-netlib,
>> this way it allows us to keep installation size at minimum.
>>
>> If what you want is to get a fully working python3 interpreter,=20
>> without adding any new packages to the installation,
>> then you need to install the python3 package (no core), this will in=20
>> fact install python3-modules which contains
>> all the modules, including python3-pydoc and python3-neclient which=20
>> is the one that provides urllib.
>>
>> Cheers,
>>
>> Alejandro
>>
>>>> Signed-off-by: Mingli Yu<mingli.yu@windriver.com>
>>>> ---
>>>> =C2=A0 .../python/python3/python3-manifest.json=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 24=20
>>>> +++++--------------
>>>> =C2=A0 meta/recipes-devtools/python/python3_3.8.2.bb |=C2=A0 3 +--
>>>> =C2=A0 2 files changed, 7 insertions(+), 20 deletions(-)
>>>>
>>>> diff --git=20
>>>> a/meta/recipes-devtools/python/python3/python3-manifest.json=20
>>>> b/meta/recipes-devtools/python/python3/python3-manifest.json
>>>> index 3bcc9b8662..808eadb8f6 100644
>>>> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
>>>> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
>>>> @@ -203,6 +203,7 @@
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0 "${bindir}/python${PYTHON_MAJMIN}",
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0 "${bindir}/python${PYTHON_MAJMIN}.real",
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0 "${bindir}/python3",
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=
${bindir}/pydoc*",
>>>> "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h",
>>>> "${libdir}/python${PYTHON_MAJMIN}/UserDict.py",
>>>> "${libdir}/python${PYTHON_MAJMIN}/UserList.py",
>>>> @@ -289,6 +290,7 @@
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0 "${libdir}/python${PYTHON_MAJMIN}/pkgutil.py",
>>>> "${libdir}/python${PYTHON_MAJMIN}/platform.py",
>>>> "${libdir}/python${PYTHON_MAJMIN}/posixpath.py",
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=
${libdir}/python${PYTHON_MAJMIN}/pydoc.py",
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0 "${libdir}/python${PYTHON_MAJMIN}/re.py",
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0 "${libdir}/python${PYTHON_MAJMIN}/reprlib.py",
>>>> "${libdir}/python${PYTHON_MAJMIN}/rlcompleter.py",
>>>> @@ -313,8 +315,11 @@
>>>> "${libdir}/python${PYTHON_MAJMIN}/tokenize.py",
>>>> "${libdir}/python${PYTHON_MAJMIN}/traceback.py",
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0 "${libdir}/python${PYTHON_MAJMIN}/types.py",
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=
${libdir}/python${PYTHON_MAJMIN}/urllib",
>>>> + "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
>>>> "${libdir}/python${PYTHON_MAJMIN}/warnings.py",
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0 "${libdir}/python${PYTHON_MAJMIN}/weakref.py",
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=
${libdir}/python${PYTHON_MAJMIN}/pydoc_data",
>>>> "${prefix}/lib/python${PYTHON_MAJMIN}/config*/*[!.a]"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ],
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "cached": [
>>>> @@ -363,6 +368,7 @@
>>>> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pkgutil.*.pyc",
>>>> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/platform.*.pyc",
>>>> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/posixpath.*.pyc",
>>>> + "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pydoc.*.pyc",
>>>> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/re.*.pyc",
>>>> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/reprlib.*.pyc",
>>>> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/rlcompleter.*.pyc",
>>>> @@ -798,7 +804,6 @@
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0 "plistlib",
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0 "pprint",
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0 "profile",
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=
pydoc",
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0 "resource",
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0 "shell",
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0 "smtpd",
>>>> @@ -857,8 +862,6 @@
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0 "${libdir}/python${PYTHON_MAJMIN}/poplib.py",
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0 "${libdir}/python${PYTHON_MAJMIN}/smtplib.py",
>>>> "${libdir}/python${PYTHON_MAJMIN}/telnetlib.py",
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=
${libdir}/python${PYTHON_MAJMIN}/urllib",
>>>> - "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0 "${libdir}/python${PYTHON_MAJMIN}/uuid.py"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ],
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "cached": [
>>>> @@ -989,21 +992,6 @@
>>>> "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pstats.*.pyc"
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ]
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>>> -=C2=A0=C2=A0=C2=A0 "pydoc": {
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "summary": "Python intera=
ctive help support",
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "rdepends": [
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=
core",
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=
netclient"
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ],
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "files": [
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=
${bindir}/pydoc*",
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=
${libdir}/python${PYTHON_MAJMIN}/pydoc.py",
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=
${libdir}/python${PYTHON_MAJMIN}/pydoc_data"
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ],
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "cached": [
>>>> - "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pydoc.*.pyc"
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ]
>>>> -=C2=A0=C2=A0=C2=A0 },
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "resource": {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "summary": "Py=
thon resource control interface",
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "rdepends": [
>>>> diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb=20
>>>> b/meta/recipes-devtools/python/python3_3.8.2.bb
>>>> index a4a16fd495..36aa54ba6c 100644
>>>> --- a/meta/recipes-devtools/python/python3_3.8.2.bb
>>>> +++ b/meta/recipes-devtools/python/python3_3.8.2.bb
>>>> @@ -318,7 +318,6 @@ RRECOMMENDS_${PN}-crypt_append_class-nativesdk=20
>>>> =3D " openssl ca-certificates"
>>>> =C2=A0 FILES_${PN} =3D ""
>>>> =C2=A0 RPROVIDES_${PN}-modules =3D "${PN}"
>>>> =C2=A0 -FILES_${PN}-pydoc +=3D "${bindir}/pydoc${PYTHON_MAJMIN}=20
>>>> ${bindir}/pydoc3"
>>>> =C2=A0 FILES_${PN}-idle +=3D "${bindir}/idle3 ${bindir}/idle${PYTHON_=
MAJMIN}"
>>>> =C2=A0 =C2=A0 # provide python-pyvenv from python3-venv
>>>> @@ -332,7 +331,7 @@ INSANE_SKIP_${PN}-dev +=3D "dev-elf"
>>>> =C2=A0 =C2=A0 # catch all the rest (unsorted)
>>>> =C2=A0 PACKAGES +=3D "${PN}-misc"
>>>> -RDEPENDS_${PN}-misc +=3D "python3-core python3-email python3-codecs=
=20
>>>> python3-pydoc python3-pickle python3-audio"
>>>> +RDEPENDS_${PN}-misc +=3D "python3-core python3-email python3-codecs=
=20
>>>> python3-pickle python3-audio"
>>>> =C2=A0 RDEPENDS_${PN}-modules_append_class-target =3D " python3-misc"
>>>> =C2=A0 RDEPENDS_${PN}-modules_append_class-nativesdk =3D " python3-mi=
sc"
>>>> =C2=A0 FILES_${PN}-misc =3D "${libdir}/python${PYTHON_MAJMIN}=20
>>>> ${libdir}/python${PYTHON_MAJMIN}/lib-dynload"
>>>>
>>>
>>>
>
>=20

--------------77C62BD1CADE6063BCDBBF7D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-=
8">
  </head>
  <body>
    <pre>Hey Mingly Yu,

</pre>
    <div class=3D"moz-cite-prefix">On 5/19/20 12:43 AM, Yu, Mingli wrote:<=
br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:73eb24f4-91dd-bc2c-2b32-9a1fec299163@windriver.com">Hi
      Alejandro,
      <br>
      <br>
      <br>
      On 2020/5/19 =E4=B8=8B=E5=8D=883:22, Alejandro Hernandez Samaniego w=
rote:
      <br>
      <blockquote type=3D"cite">Hello,
        <br>
        <br>
        The more I look into this, the more I realize its incorrect.
        <br>
      </blockquote>
      <br>
      Understood your concern.
      <br>
      <br>
      <blockquote type=3D"cite">
        <br>
        <br>
        On 5/18/20 8:36 AM, Alejandro Hernandez wrote:
        <br>
        <blockquote type=3D"cite">
          <br>
          Hello Mingli,
          <br>
          <br>
          Did you happen to run the create_manifest task after modifying
          the manifest to make sure that runtime dependencies are still
          valid?
          <br>
          <br>
          <br>
          Thanks
          <br>
          <br>
          Alejandro
          <br>
          <br>
          On 5/18/20 12:32 AM, Yu, Mingli wrote:
          <br>
          <blockquote type=3D"cite">From: Mingli
            Yu<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:mingli.yu@=
windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
            <br>
            <br>
            Add pydoc and urllib to core to fix below error:
            <br>
            =C2=A0 # python3
            <br>
            =C2=A0 &gt;&gt;&gt; help()
            <br>
            =C2=A0 Traceback (most recent call last):
            <br>
            =C2=A0 File "&lt;stdin&gt;", line 1, in &lt;module&gt;
            <br>
            =C2=A0 File "/usr/lib64/python3.8/sitebuiltins.py", line 102, =
in
            __call_
            <br>
            =C2=A0 import pydoc
            <br>
            =C2=A0 ModuleNotFoundError: No module named 'pydoc'
            <br>
            =C2=A0 File "/usr/lib64/python3.8/pydoc.py", line 72, in
            &lt;module&gt;
            <br>
            =C2=A0 import urllib.parse
            <br>
            =C2=A0 ModuleNotFoundError: No module named 'urllib'
            <br>
          </blockquote>
        </blockquote>
        <br>
        Why would pydoc be required to run python? or urllib in any
        case?
        <br>
      </blockquote>
      <br>
      <br>
      It's better make the python3-core more lightweight.
      <br>
      <br>
      But in a system which didn't install other python modules but just
      python3-core, then we type help() as below and the help cannot
      show normally. So add the needed pydoc and urllib file to make the
      help() works.
      <br>
      <br>
      =C2=A0# python3
      <br>
      =C2=A0&gt;&gt;&gt; help()
      <br>
      =C2=A0Traceback (most recent call last):
      <br>
      =C2=A0File "&lt;stdin&gt;", line 1, in &lt;module&gt;
      <br>
      =C2=A0File "/usr/lib64/python3.8/sitebuiltins.py", line 102, in __ca=
ll_
      <br>
      =C2=A0import pydoc
      <br>
      =C2=A0ModuleNotFoundError: No module named 'pydoc'
      <br>
      =C2=A0File "/usr/lib64/python3.8/pydoc.py", line 72, in &lt;module&g=
t;
      <br>
      =C2=A0import urllib.parse
      <br>
      =C2=A0ModuleNotFoundError: No module named 'urllib'
      <br>
      <br>
      <br>
      After pydoc and urllib added and also just install python3-core
      and no additional python3 modules installed.
      <br>
      <br>
      # python3
      <br>
      Python 3.8.2 (default, May 18 2020, 07:15:10)
      <br>
      [GCC 9.3.0] on linux
      <br>
      Type "help", "copyright", "credits" or "license" for more
      information.
      <br>
      &gt;&gt;&gt; help()
      <br>
      Welcome to Python 3.8's help utility!
      <br>
      <br>
      If this is your first time using Python, you should definitely
      check out
      <br>
      the tutorial on the Internet at
      <a class=3D"moz-txt-link-freetext" href=3D"https://docs.python.org/3=
.8/tutorial/">https://docs.python.org/3.8/tutorial/</a>.
      <br>
      <br>
      Enter the name of any module, keyword, or topic to get help on
      writing
      <br>
      Python programs and using Python modules.=C2=A0 To quit this help
      utility and
      <br>
      return to the interpreter, just type "quit".
      <br>
      <br>
      To get a list of available modules, keywords, symbols, or topics,
      type
      <br>
      "modules", "keywords", "symbols", or "topics".=C2=A0 Each module als=
o
      comes
      <br>
      with a one-line summary of what it does; to list the modules whose
      name
      <br>
      or summary contain a given string such as "spam", type "modules
      spam".
      <br>
      help&gt;
      <br>
      <br>
      <br>
      Thanks,
      <br>
      <br>
    </blockquote>
    <pre>I still believe python3-core should be left as small as possible,=
 the use case
of an embedded device calling help() is probably seldom, IMO that fits mor=
e in
the workflow of installing the netlib and pydoc modules for that specific =
usecase.</pre>
    <pre>It also looks like simply installing python3-pydoc would do what =
you want, since
the error to load urllib is coming out of loading pydoc itself and the man=
ifest
does specify the dependency from pydoc to netclient.
</pre>
    <pre>
</pre>
    <pre>Cheers,</pre>
    <pre>
Alejandro
</pre>
    <p><br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:73eb24f4-91dd-bc2c-2b32-9a1fec299163@windriver.com">
      <blockquote type=3D"cite">
        <br>
        I believe there is a discrepancy between what python3-core does
        and what you believe it should do.
        <br>
        python3-core is the smallest possible package to get a working
        python3 interpreter, if you install python3-core
        <br>
        thats what you get, if you need more modules then you install
        more modules, e.g. python3-pydoc, python3-netlib,
        <br>
        this way it allows us to keep installation size at minimum.
        <br>
        <br>
        If what you want is to get a fully working python3 interpreter,
        without adding any new packages to the installation,
        <br>
        then you need to install the python3 package (no core), this
        will in fact install python3-modules which contains
        <br>
        all the modules, including python3-pydoc and python3-neclient
        which is the one that provides urllib.
        <br>
        <br>
        Cheers,
        <br>
        <br>
        Alejandro
        <br>
        <br>
        <blockquote type=3D"cite">
          <blockquote type=3D"cite">Signed-off-by: Mingli
            Yu<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:mingli.yu@=
windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
            <br>
            ---
            <br>
            =C2=A0 .../python/python3/python3-manifest.json=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0 | 24
            +++++--------------
            <br>
            =C2=A0 meta/recipes-devtools/python/python3_3.8.2.bb |=C2=A0 3=
 +--
            <br>
            =C2=A0 2 files changed, 7 insertions(+), 20 deletions(-)
            <br>
            <br>
            diff --git
            a/meta/recipes-devtools/python/python3/python3-manifest.json
            b/meta/recipes-devtools/python/python3/python3-manifest.json
            <br>
            index 3bcc9b8662..808eadb8f6 100644
            <br>
            ---
            a/meta/recipes-devtools/python/python3/python3-manifest.json
            <br>
            +++
            b/meta/recipes-devtools/python/python3/python3-manifest.json
            <br>
            @@ -203,6 +203,7 @@
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "${bindir}/python${PYTHON_MAJMIN}",
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "${bindir}/python${PYTHON_MAJMIN}.real",
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "${bindir}/python3",
            <br>
            +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "${bindir}/pydoc*",
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
            "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h",
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
            "${libdir}/python${PYTHON_MAJMIN}/UserDict.py",
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
            "${libdir}/python${PYTHON_MAJMIN}/UserList.py",
            <br>
            @@ -289,6 +290,7 @@
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "${libdir}/python${PYTHON_MAJMIN}/pkgutil.py",
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
            "${libdir}/python${PYTHON_MAJMIN}/platform.py",
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
            "${libdir}/python${PYTHON_MAJMIN}/posixpath.py",
            <br>
            +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "${libdir}/python${PYTHON_MAJMIN}/pydoc.py",
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "${libdir}/python${PYTHON_MAJMIN}/re.py",
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "${libdir}/python${PYTHON_MAJMIN}/reprlib.py",
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
            "${libdir}/python${PYTHON_MAJMIN}/rlcompleter.py",
            <br>
            @@ -313,8 +315,11 @@
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
            "${libdir}/python${PYTHON_MAJMIN}/tokenize.py",
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
            "${libdir}/python${PYTHON_MAJMIN}/traceback.py",
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "${libdir}/python${PYTHON_MAJMIN}/types.py",
            <br>
            +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "${libdir}/python${PYTHON_MAJMIN}/urllib",
            <br>
            +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
            "${libdir}/python${PYTHON_MAJMIN}/warnings.py",
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "${libdir}/python${PYTHON_MAJMIN}/weakref.py",
            <br>
            +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "${libdir}/python${PYTHON_MAJMIN}/pydoc_data",
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
            "${prefix}/lib/python${PYTHON_MAJMIN}/config*/*[!.a]"
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ],
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "cached=
": [
            <br>
            @@ -363,6 +368,7 @@
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pkgutil.*.pyc",
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/platform.*.pyc",
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/posixpath.*.pyc"=
,
            <br>
            +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pydoc.*.pyc",
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/re.*.pyc",
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/reprlib.*.pyc",
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/rlcompleter.*.py=
c",
            <br>
            @@ -798,7 +804,6 @@
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "plistlib",
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "pprint",
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "profile",
            <br>
            -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "pydoc",
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "resource",
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "shell",
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "smtpd",
            <br>
            @@ -857,8 +862,6 @@
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "${libdir}/python${PYTHON_MAJMIN}/poplib.py",
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "${libdir}/python${PYTHON_MAJMIN}/smtplib.py",
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
            "${libdir}/python${PYTHON_MAJMIN}/telnetlib.py",
            <br>
            -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "${libdir}/python${PYTHON_MAJMIN}/urllib",
            <br>
            -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "${libdir}/python${PYTHON_MAJMIN}/uuid.py"
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ],
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "cached=
": [
            <br>
            @@ -989,21 +992,6 @@
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pstats.*.pyc"
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ]
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
            <br>
            -=C2=A0=C2=A0=C2=A0 "pydoc": {
            <br>
            -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "summary": "Python=
 interactive help support",
            <br>
            -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "rdepends": [
            <br>
            -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "core",
            <br>
            -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "netclient"
            <br>
            -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ],
            <br>
            -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "files": [
            <br>
            -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "${bindir}/pydoc*",
            <br>
            -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "${libdir}/python${PYTHON_MAJMIN}/pydoc.py",
            <br>
            -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "${libdir}/python${PYTHON_MAJMIN}/pydoc_data"
            <br>
            -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ],
            <br>
            -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "cached": [
            <br>
            -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0
            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pydoc.*.pyc"
            <br>
            -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ]
            <br>
            -=C2=A0=C2=A0=C2=A0 },
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "resource": {
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "summar=
y": "Python resource control interface",
            <br>
            =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "rdepen=
ds": [
            <br>
            diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb
            b/meta/recipes-devtools/python/python3_3.8.2.bb
            <br>
            index a4a16fd495..36aa54ba6c 100644
            <br>
            --- a/meta/recipes-devtools/python/python3_3.8.2.bb
            <br>
            +++ b/meta/recipes-devtools/python/python3_3.8.2.bb
            <br>
            @@ -318,7 +318,6 @@
            RRECOMMENDS_${PN}-crypt_append_class-nativesdk =3D " openssl
            ca-certificates"
            <br>
            =C2=A0 FILES_${PN} =3D ""
            <br>
            =C2=A0 RPROVIDES_${PN}-modules =3D "${PN}"
            <br>
            =C2=A0 -FILES_${PN}-pydoc +=3D "${bindir}/pydoc${PYTHON_MAJMIN=
}
            ${bindir}/pydoc3"
            <br>
            =C2=A0 FILES_${PN}-idle +=3D "${bindir}/idle3
            ${bindir}/idle${PYTHON_MAJMIN}"
            <br>
            =C2=A0 =C2=A0 # provide python-pyvenv from python3-venv
            <br>
            @@ -332,7 +331,7 @@ INSANE_SKIP_${PN}-dev +=3D "dev-elf"
            <br>
            =C2=A0 =C2=A0 # catch all the rest (unsorted)
            <br>
            =C2=A0 PACKAGES +=3D "${PN}-misc"
            <br>
            -RDEPENDS_${PN}-misc +=3D "python3-core python3-email
            python3-codecs python3-pydoc python3-pickle python3-audio"
            <br>
            +RDEPENDS_${PN}-misc +=3D "python3-core python3-email
            python3-codecs python3-pickle python3-audio"
            <br>
            =C2=A0 RDEPENDS_${PN}-modules_append_class-target =3D "
            python3-misc"
            <br>
            =C2=A0 RDEPENDS_${PN}-modules_append_class-nativesdk =3D "
            python3-misc"
            <br>
            =C2=A0 FILES_${PN}-misc =3D "${libdir}/python${PYTHON_MAJMIN}
            ${libdir}/python${PYTHON_MAJMIN}/lib-dynload"
            <br>
            <br>
          </blockquote>
          <br>
          <br>
        </blockquote>
      </blockquote>
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
    </blockquote>
  </body>
</html>

--------------77C62BD1CADE6063BCDBBF7D--
