Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 413CD7D577
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2019 21:11:46 +0000 (UTC)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 5F4C51C06DA;
	Tue,  9 Apr 2019 09:11:46 +1200 (NZST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20190408205558.11994-1-douglas.royds@taitradio.com>
	<CAJTo0LZSDcbaqTx=6gi3SuYDC-r3F_iVSBXLMYdjRaQGsQ1QuA@mail.gmail.com>
From: Douglas Royds <douglas.royds@taitradio.com>
Message-ID: <2ba57997-fef9-5f83-5f2f-c62957fb37b3@taitradio.com>
Date: Tue, 9 Apr 2019 09:11:46 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZSDcbaqTx=6gi3SuYDC-r3F_iVSBXLMYdjRaQGsQ1QuA@mail.gmail.com>
Cc: Nikhil Pal Singh <nikhilpal.singh@taitradio.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: Support Eclipse and other cmake generators
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
X-List-Received-Date: Mon, 08 Apr 2019 21:11:47 -0000
Content-Type: multipart/alternative;
	boundary="------------8A0C63F90C88D18D3A81AEC4"
Content-Language: en-GB

--------------8A0C63F90C88D18D3A81AEC4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 9/04/19 9:04 AM, Burton, Ross wrote:

> On Mon, 8 Apr 2019 at 21:56, Douglas Royds <douglas.royds@taitradio.com=
> wrote:
>>   python() {
>>       generator =3D d.getVar("OECMAKE_GENERATOR")
>> -    if generator =3D=3D "Unix Makefiles":
>> -        args =3D "-G 'Unix Makefiles' -DCMAKE_MAKE_PROGRAM=3D" + d.ge=
tVar("MAKE")
>> +    if "Unix Makefiles" in generator:
>> +        args =3D "-G '" + generator +  "' -DCMAKE_MAKE_PROGRAM=3D" + =
d.getVar("MAKE")
> So are there other generators such as "Unix Makefiles - Something
> Else" that needs to trigger this code path?  A real world example
> would be useful.
>
>>       else:
>>           bb.fatal("Unknown CMake Generator %s" % generator)
> Because obviously at this point, arbitrary generators are very much
> not supported yet.
>
> Ross


Here's the complete list, from cmake --help:

    The following generators are available on this platform:
     =C2=A0 Unix Makefiles=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D Generates standard UNIX makefile=
s.
     =C2=A0 Ninja=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D Generates build.ninja files.
     =C2=A0 Watcom WMake=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D Generates Watcom WMake =
makefiles.
     =C2=A0 CodeBlocks - Ninja=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D Generates CodeBlocks project files.
     =C2=A0 CodeBlocks - Unix Makefiles=C2=A0 =3D Generates CodeBlocks pr=
oject files.
     =C2=A0 CodeLite - Ninja=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D Generates CodeLite project files.
     =C2=A0 CodeLite - Unix Makefiles=C2=A0=C2=A0=C2=A0 =3D Generates Cod=
eLite project files.
     =C2=A0 Sublime Text 2 - Ninja=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
 Generates Sublime Text 2 project
    files.
     =C2=A0 Sublime Text 2 - Unix Makefiles
     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D Generates Sublime Text 2 project
    files.
     =C2=A0 Kate - Ninja=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D Generates Kate project =
files.
     =C2=A0 Kate - Unix Makefiles=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D Generates Kate project files.
     =C2=A0 Eclipse CDT4 - Ninja=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D Generates Eclipse CDT 4.0 project
    files.
     =C2=A0 Eclipse CDT4 - Unix Makefiles=3D Generates Eclipse CDT 4.0 pr=
oject
    files.

All but one of them contain one of the strings, "Unix Makefiles" or=20
"Ninja". In each of these cases, they generate the Makefiles (or ninja=20
files respectively), but also generate the appropriate project files,=20
eg. .project and .cproject for Eclipse.

A user can set their OECMAKE_GENERATOR to any one of these strings,=20
except "Watcom WMake".



--------------8A0C63F90C88D18D3A81AEC4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p>On 9/04/19 9:04 AM, Burton, Ross wrote:
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">On Mon, 8 Apr 2019 at 21:5=
6, Douglas Royds <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:dougla=
s.royds@taitradio.com">&lt;douglas.royds@taitradio.com&gt;</a> wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D""> python() {
     generator =3D d.getVar("OECMAKE_GENERATOR")
-    if generator =3D=3D "Unix Makefiles":
-        args =3D "-G 'Unix Makefiles' -DCMAKE_MAKE_PROGRAM=3D" + d.getVa=
r("MAKE")
+    if "Unix Makefiles" in generator:
+        args =3D "-G '" + generator +  "' -DCMAKE_MAKE_PROGRAM=3D" + d.g=
etVar("MAKE")
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
So are there other generators such as "Unix Makefiles - Something
Else" that needs to trigger this code path?  A real world example
would be useful.

</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">     else:
         bb.fatal("Unknown CMake Generator %s" % generator)
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
Because obviously at this point, arbitrary generators are very much
not supported yet.

Ross
</pre>
      </blockquote>
    </p>
    <p><br>
    </p>
    <p>Here's the complete list, from cmake --help:</p>
    <blockquote>
      <p>The following generators are available on this platform:<br>
        =C2=A0 Unix Makefiles=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D Generates standard UNIX
        makefiles.<br>
        =C2=A0 Ninja=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D Generates build.ninja files.<br>
        =C2=A0 Watcom WMake=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D Generates Watcom WMa=
ke
        makefiles.<br>
        =C2=A0 CodeBlocks - Ninja=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =3D Generates CodeBlocks project
        files.<br>
        =C2=A0 CodeBlocks - Unix Makefiles=C2=A0 =3D Generates CodeBlocks=
 project
        files.<br>
        =C2=A0 CodeLite - Ninja=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D Generates CodeLite project
        files.<br>
        =C2=A0 CodeLite - Unix Makefiles=C2=A0=C2=A0=C2=A0 =3D Generates =
CodeLite project
        files.<br>
        =C2=A0 Sublime Text 2 - Ninja=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D Generates Sublime Text 2
        project files.<br>
        =C2=A0 Sublime Text 2 - Unix Makefiles<br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D Generates Sublime Text 2
        project files.<br>
        =C2=A0 Kate - Ninja=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D Generates Kate proje=
ct files.<br>
        =C2=A0 Kate - Unix Makefiles=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D Generates Kate project files.<br>
        =C2=A0 Eclipse CDT4 - Ninja=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D Generates Eclipse CDT 4.0
        project files.<br>
        =C2=A0 Eclipse CDT4 - Unix Makefiles=3D Generates Eclipse CDT 4.0
        project files.<br>
      </p>
    </blockquote>
    <p>All but one of them contain one of the strings, "Unix Makefiles"
      or "Ninja". In each of these cases, they generate the Makefiles
      (or ninja files respectively), but also generate the appropriate
      project files, eg. .project and .cproject for Eclipse.</p>
    <p>A user can set their OECMAKE_GENERATOR to any one of these
      strings, except "Watcom WMake".</p>
    <p><br>
    </p>
  </body>
</html>

--------------8A0C63F90C88D18D3A81AEC4--
