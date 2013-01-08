Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Florin.Sarbu@windriver.com>) id 1TsUL3-0002SI-Dm
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 09:15:18 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0869IHN029140
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Jan 2013 22:09:18 -0800 (PST)
Received: from [128.224.18.193] (128.224.18.193) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Mon, 7 Jan 2013 22:09:15 -0800
Message-ID: <50EBB80A.2090704@windriver.com>
Date: Tue, 8 Jan 2013 08:09:14 +0200
From: Florin Sarbu <florin.sarbu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <50EB3FF4.60601@windriver.com>
	<CABcZAN=nVVoNxdu7tZKQ=uK5Q7jcCrhvFezX-YYpyWPZbTw9jg@mail.gmail.com>
In-Reply-To: <CABcZAN=nVVoNxdu7tZKQ=uK5Q7jcCrhvFezX-YYpyWPZbTw9jg@mail.gmail.com>
Subject: Re: alsaconf and bash
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
X-List-Received-Date: Tue, 08 Jan 2013 08:15:24 -0000
X-List-Received-Date: Tue, 08 Jan 2013 08:15:24 -0000
Content-Type: multipart/alternative;
	boundary="------------010205030408040505070102"

--------------010205030408040505070102
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id r0869IHN029140

On 01/08/2013 02:44 AM, Chris Larson wrote:
> On Mon, Jan 7, 2013 at 2:36 PM, Florin Sarbu=20
> <florin.sarbu@windriver.com <mailto:florin.sarbu@windriver.com>> wrote:
>
>     in alsa-utils_1.0.25.bb <http://alsa-utils_1.0.25.bb>, I see this
>     comment:
>
>     # We omit alsaconf, because
>     # a) this is a bash script
>     # b) it creates config files not suitable for OE-based distros
>
>     Trying out on master, I get a do_rootfs error because bash is not
>     a rundep of alsa-utils, and there is nothing in the alsa-utils
>     recipe that actually does the above mentioned removal of the
>     alsaconf script. Looking in the git log, I only see that the
>     comment has suddenly appeared in an older alsa-utils recipe and
>     has been carried along since with every update to the recipe, and
>     not left over there as an artifact of some older commit as I expect=
ed.
>     Can anyone shed some light on this?
>
>
>
> From some quick git log -S commands in the old openembedded classic=20
> repository, it seems to have originated=20
> with 7653e980f66b4bd147df308f9b04d6b197382d6a from 2005, and the line=20
> below the comment was 'FILES_${PN} =3D ""', so presumably that was what=
=20
> left it out =E2=80=94 none of the files patterns matched it.
Okay, so it seems that the comment actually said at that time that the=20
alsa-utils generated rpm won't contain alsaconf. And bellow, this bash=20
script gets into the alsa-utils-alsaconf rpm. Unfortunately, even though=20
there is this separation, the alsa-utils rpm depends on the=20
alsa-utils-alsaconf rpm so it's pretty much the same thing as do_rootfs=20
is concerned. (missing bash dependency). How would you guys see this=20
resolved upstream? Add bash as a dep, remove alsa-utils-alsaconf as a=20
dep or alsa-utils (as the comment says the script is not suitable for=20
OE-based distros) or check the alsaconf script for bashisms and fix if=20
any and make alsa-utils rely on a busybox shell interpreter if possible=20
(with the modification of the !/bin/bash shabang from the alsaconf=20
script to /bin/sh)?

Florin

> --=20
> Christopher Larson


--------------010205030408040505070102
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id r0869IHN029140

<html>
  <head>
    <meta content=3D"text/html; charset=3DUTF-8" http-equiv=3D"Content-Ty=
pe">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    <div class=3D"moz-cite-prefix">On 01/08/2013 02:44 AM, Chris Larson
      wrote:<br>
    </div>
    <blockquote
cite=3D"mid:CABcZAN=3DnVVoNxdu7tZKQ=3DuK5Q7jcCrhvFezX-YYpyWPZbTw9jg@mail.=
gmail.com"
      type=3D"cite">
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DU=
TF-8">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">On Mon, Jan 7, 2013 at 2:36 PM, Florin
          Sarbu <span dir=3D"ltr">&lt;<a moz-do-not-send=3D"true"
              href=3D"mailto:florin.sarbu@windriver.com" target=3D"_blank=
">florin.sarbu@windriver.com</a>&gt;</span>
          wrote:<br>
          <div class=3D"gmail_quote">
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-lef=
t-style:solid;padding-left:1ex">
              <div id=3D":10h">in <a moz-do-not-send=3D"true"
                  href=3D"http://alsa-utils_1.0.25.bb" target=3D"_blank">=
alsa-utils_1.0.25.bb</a>,
                I see this comment:<br>
                <br>
                # We omit alsaconf, because<br>
                # a) this is a bash script<br>
                # b) it creates config files not suitable for OE-based
                distros<br>
                <br>
                Trying out on master, I get a do_rootfs error because
                bash is not a rundep of alsa-utils, and there is nothing
                in the alsa-utils recipe that actually does the above
                mentioned removal of the alsaconf script. Looking in the
                git log, I only see that the comment has suddenly
                appeared in an older alsa-utils recipe and has been
                carried along since with every update to the recipe, and
                not left over there as an artifact of some older commit
                as I expected.<br>
                Can anyone shed some light on this?<br>
              </div>
            </blockquote>
          </div>
          <br>
          <br clear=3D"all">
          <div style=3D"">From some quick git log -S commands in the old
            openembedded classic repository, it seems to have originated
            with=C2=A07653e980f66b4bd147df308f9b04d6b197382d6a from 2005,=
 and
            the line below the comment was 'FILES_${PN} =3D ""', so
            presumably that was what left it out =E2=80=94 none of the fi=
les
            patterns matched it.</div>
        </div>
      </div>
    </blockquote>
    Okay, so it seems that the comment actually said at that time that
    the alsa-utils generated rpm won't contain alsaconf. And bellow,
    this bash script gets into the alsa-utils-alsaconf rpm.
    Unfortunately, even though there is this separation, the alsa-utils
    rpm depends on the alsa-utils-alsaconf rpm so it's pretty much the
    same thing as do_rootfs is concerned. (missing bash dependency). How
    would you guys see this resolved upstream? Add bash as a dep, remove
    alsa-utils-alsaconf as a dep or alsa-utils (as the comment says the
    script is not suitable for OE-based distros) or check the alsaconf
    script for bashisms and fix if any and make alsa-utils rely on a
    busybox shell interpreter if possible (with the modification of the
    !/bin/bash shabang from the alsaconf script to /bin/sh)?<br>
    <br>
    Florin<br>
    <br>
    <blockquote
cite=3D"mid:CABcZAN=3DnVVoNxdu7tZKQ=3DuK5Q7jcCrhvFezX-YYpyWPZbTw9jg@mail.=
gmail.com"
      type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          -- <br>
          Christopher Larson</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------010205030408040505070102--
