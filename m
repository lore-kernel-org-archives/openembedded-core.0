Return-Path: <tomasz.meresinski@comarch.com>
X-Greylist: delayed 1382 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 20 Sep 2017 07:32:01 UTC
Received: from odzwierny3.comarch.com (odzwierny3.comarch.com [217.74.69.18])
	by mail.openembedded.org (Postfix) with ESMTP id C56A677E66
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 07:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	authenticated as tomasz.meresinski@comarch.com
	by odzwierny3.comarch.com with esmtpsa (TLSv1:AES128-SHA:128)(ComArch
	ESMTP) id 1duZ7x-0004SQ-Fd; Wed, 20 Sep 2017 09:08:59 +0200
To: "Burton, Ross" <ross.burton@intel.com>
References: <20170919103653.23870-1-tomasz.meresinski@comarch.pl>
	<CAJTo0LZmbdxxsxVnvxa_h9LCX2Sy9La=+OqiQ1pBzADmfoKHhg@mail.gmail.com>
	<CAJTo0La10Uta7_QSA-QM3N7iczvRrOHONy5CnHw78Gj-JhFFpQ@mail.gmail.com>
From: Tomasz Meresinski <tomasz.meresinski@comarch.pl>
Message-ID: <5caff828-ba37-cb33-b93b-882eb4498a2d@comarch.com>
Date: Wed, 20 Sep 2017 09:08:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0La10Uta7_QSA-QM3N7iczvRrOHONy5CnHw78Gj-JhFFpQ@mail.gmail.com>
X-CA-Antivirus: Scanned by ComArch Antivirus on odzwierny3.comarch.com
X-CA-Is-Spam: No
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/image: fix do_image_qa dependencies
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
X-List-Received-Date: Wed, 20 Sep 2017 07:32:03 -0000
X-Groupsio-MsgNum: 103152
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="------------ms070103090903090206070108"

--------------ms070103090903090206070108
Content-Type: multipart/alternative;
 boundary="------------1B5C0F2C7FDB665EA9A8C070"
Content-Language: en-US

--------------1B5C0F2C7FDB665EA9A8C070
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Your patch works for me. I think your place for do_image_qa is even bette=
r.

Tomasz

On 19.09.2017 18:22, Burton, Ross wrote:
> On 19 September 2017 at 17:07, Burton, Ross <ross.burton@intel.com=20
> <mailto:ross.burton@intel.com>> wrote:
>
>     On 19 September 2017 at 11:36, Tomasz Meresi=C5=84ski
>     <tomasz.meresinski@comarch.pl
>     <mailto:tomasz.meresinski@comarch.pl>> wrote:
>
>         After do_image_complete IMAGE_ROOTFS directory is empty so qa
>         checks do not work
>
>
>     Important context: this only happens if rm_work is enabled.=C2=A0 I=
'm
>     wondering if the task should be moved earlier so its between
>     rootfs and image, as it's actually a *rootfs* QA hook (its
>     expected that functions examine the contents of IMAGE_ROOTFS).
>
>     I think we need to push the task back a bit in the tree and put it
>     in between rootfs and image. This way if it fails the image
>     generation doesn't happen, and rm_work won't break it.
>
>
> I've just sent an alternative patch the list, can you verify that it=20
> solves your problem and doesn't break your existing image QA functions?=

>
> Cheers,
> Ross
>


--------------1B5C0F2C7FDB665EA9A8C070
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf=
-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    Your patch works for me. I think your place for do_image_qa is even
    better.<br>
    <br>
    Tomasz<br>
    <div class=3D"moz-signature">
      <br>
    </div>
    <div class=3D"moz-cite-prefix">On 19.09.2017 18:22, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CAJTo0La10Uta7_QSA-QM3N7iczvRrOHONy5CnHw78Gj-JhFFpQ@mail.gmai=
l.com">
      <div dir=3D"ltr">On 19 September 2017 at 17:07, Burton, Ross <span
          dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com"
            target=3D"_blank" moz-do-not-send=3D"true">ross.burton@intel.=
com</a>&gt;</span>
        wrote:<br>
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div dir=3D"ltr"><span class=3D"">On 19 September 2017 at
                  11:36, Tomasz Meresi=C5=84ski <span dir=3D"ltr">&lt;<a
                      href=3D"mailto:tomasz.meresinski@comarch.pl"
                      target=3D"_blank" moz-do-not-send=3D"true">tomasz.m=
eresinski@comarch.pl</a>&gt;</span>
                  wrote:<br>
                </span>
                <div class=3D"gmail_extra">
                  <div class=3D"gmail_quote"><span class=3D"">
                      <blockquote class=3D"gmail_quote" style=3D"margin:0=
 0
                        0 .8ex;border-left:1px #ccc
                        solid;padding-left:1ex">After do_image_complete
                        IMAGE_ROOTFS directory is empty so qa checks do
                        not work</blockquote>
                      <div><br>
                      </div>
                    </span>
                    <div>Important context: this only happens if rm_work
                      is enabled.=C2=A0 I'm wondering if the task should =
be
                      moved earlier so its between rootfs and image, as
                      it's actually a *rootfs* QA hook (its expected
                      that functions examine the contents of
                      IMAGE_ROOTFS).</div>
                    <div><br>
                    </div>
                    <div>I think we need to push the task back a bit in
                      the tree and put it in between rootfs and image.=C2=
=A0
                      This way if it fails the image generation doesn't
                      happen, and rm_work won't break it.</div>
                  </div>
                </div>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>I've just sent an alternative patch the list, can you
              verify that it solves your problem and doesn't break your
              existing image QA functions?</div>
            <div><br>
            </div>
            <div>Cheers,</div>
            <div>Ross=C2=A0</div>
          </div>
          <br>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------1B5C0F2C7FDB665EA9A8C070--

--------------ms070103090903090206070108
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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

--------------ms070103090903090206070108--
