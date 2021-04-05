Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.489.1617594859372914895
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Apr 2021 20:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=bDN0UW1M;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [192.168.100.38] (fixed-189-203-100-250.totalplay.net [189.203.100.250])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6991E20B5680;
	Sun,  4 Apr 2021 20:54:18 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6991E20B5680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1617594858;
	bh=+1uJSrwjQojIA3coDu0zINVX7nhTPWCxd7T6UKjXc9Y=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=bDN0UW1MXxkxtzEyHBZgvL0pDePKLBUFfEfp2lCS/jA43B37VRsrWrOSZHppU7k61
	 3f0+A3EuzQEKb8XWYqHHBQE8mnWfKEQQsfsqpzjMA3GJ3xruqHs+CazZB7Q33HVVKf
	 gushuEWBGVsMM7Sf4WTnDBuSLFHboPyMR20eiBFk=
Subject: Re: [OE-core] couple questions about IMAGE_BASENAME usage
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <e14d17a5-53e9-8e68-4f59-59a95a1d9e@crashcourse.ca>
From: "Alejandro Hernandez Samaniego" <alhe@linux.microsoft.com>
Message-ID: <7aa5c545-5359-890a-3bb9-c687a7a9e3ce@linux.microsoft.com>
Date: Sun, 4 Apr 2021 21:54:16 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <e14d17a5-53e9-8e68-4f59-59a95a1d9e@crashcourse.ca>
Content-Type: multipart/alternative;
 boundary="------------A8F0F7D6D45AF29EE2425994"
Content-Language: en-GB

--------------A8F0F7D6D45AF29EE2425994
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable

Hey Robert

On 4/2/2021 12:13 PM, Robert P. J. Day wrote:
>    first, given that the default value of IMAGE_BASENAME is simply the
> package name, then i'm assuming that things like this in
> core-image-tiny-initramfs.bb:
>
>    export IMAGE_BASENAME =3D "core-image-tiny-initramfs"
>
> are superfluous, yes?

In some way it is (at least the definition), although passing the export=
=20
keyword causes a different behavior,

you can look this up on the Bitbake manual, section Exporting Variables=20
To The Environment.

>
>    also, i'm curious about the difference between these two image
> recipes:
>
> core-image-minimal-initramfs.bb:export IMAGE_BASENAME =3D "${MLPREFIX}co=
re-image-minimal-initramfs"
> core-image-tiny-initramfs.bb:export IMAGE_BASENAME =3D "core-image-tiny-=
initramfs"
>
> why does the first accommodate the multilib prefix MLPREFIX, while the
> second does not?

The recipe for core-image-tiny-initramfs is based on=20
core-image-minimal-initramfs,

going throught the git log=A0 it seems that a bug was found and it was=20
only fixed for

core-image-minimal-initramfs and not for the tiny one at e18b7e77ed7 , I=
=20
encourage

you to send patches for these kind of findings, after doing some digging=
=20
if something

is still not making sense, then theres a chance it needs to be fixed=20
(like tihs one)


Cheers,

Alejandro

>
> rday
>
>=20
>

--------------A8F0F7D6D45AF29EE2425994
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html;
      charset=3Dwindows-1252">
  </head>
  <body>
    <p>Hey Robert<br>
    </p>
    <div class=3D"moz-cite-prefix">On 4/2/2021 12:13 PM, Robert P. J. Day
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:e14d17a5-53e9-8e68-4f59-59a95a1d9e@crashcourse.ca">
      <pre class=3D"moz-quote-pre" wrap=3D"">
  first, given that the default value of IMAGE_BASENAME is simply the
package name, then i'm assuming that things like this in
core-image-tiny-initramfs.bb:

  export IMAGE_BASENAME =3D "core-image-tiny-initramfs"

are superfluous, yes?</pre>
    </blockquote>
    <p>In some way it is (at least the definition), although passing the
      export keyword causes a different behavior,</p>
    <p>you can look this up on the Bitbake manual, section Exporting
      Variables To The Environment.<br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:e14d17a5-53e9-8e68-4f59-59a95a1d9e@crashcourse.ca">
      <pre class=3D"moz-quote-pre" wrap=3D"">

  also, i'm curious about the difference between these two image
recipes:

core-image-minimal-initramfs.bb:export IMAGE_BASENAME =3D "${MLPREFIX}core=
-image-minimal-initramfs"
core-image-tiny-initramfs.bb:export IMAGE_BASENAME =3D "core-image-tiny-in=
itramfs"

why does the first accommodate the multilib prefix MLPREFIX, while the
second does not?</pre>
    </blockquote>
    <p>The recipe for core-image-tiny-initramfs is based on
      core-image-minimal-initramfs,</p>
    <p>going throught the git log=A0 it seems that a bug was found and it
      was only fixed for</p>
    <p>core-image-minimal-initramfs and not for the tiny one at
      e18b7e77ed7 , I encourage</p>
    <p>you to send patches for these kind of findings, after doing some
      digging if something</p>
    <p>is still not making sense, then theres a chance it needs to be
      fixed (like tihs one)<br>
    </p>
    <p><br>
    </p>
    <p>Cheers,</p>
    <p>Alejandro<br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:e14d17a5-53e9-8e68-4f59-59a95a1d9e@crashcourse.ca">
      <pre class=3D"moz-quote-pre" wrap=3D"">

rday
</pre>
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">


</pre>
    </blockquote>
  </body>
</html>

--------------A8F0F7D6D45AF29EE2425994--
