Return-Path: <marcus.mueller@ettus.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8557860124
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 10:56:40 +0000 (UTC)
Received: by ykdv3 with SMTP id v3so189832566ykd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Dec 2015 02:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=SVEz4yLIMLky4NXKbY6ahcSktcfQkPSVT7+Z9MbM4wk=;
	b=d/I+3nEVPYUGuCgTka8Bi50LVn2WWg9E199w4RpVqEyVxI/GbYv97753xAbmf6IFjG
	b6ZzcEy1C68ar6tqWrQv8xCMo1I+pacUBttoNSE2u0c/8s70/Hyma3OKyeQg0zHNmMYe
	yauUa4NwONky46VI/atFdeVKnanpQjZsSJem6ZMUlwo0SfG1nWbFMX0JXNcqFzu2V4WE
	EcvHMpeyj2VVbM937f0Gl2aiPAdlVfmoQCuVT6BPkR/Ad3u1RSOosKcZmS9jPU82qQKM
	C4Edk1qlB7A6ZMMkagz1ZCHNi9IX/3CpZ5cT/O9O2hbapHNmHsERoKjRF9gXPRYMBd/S
	/e7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=SVEz4yLIMLky4NXKbY6ahcSktcfQkPSVT7+Z9MbM4wk=;
	b=cftAYK3lOMBxatyKmimIMbQvbk9MKUzcPouzXC6e1wJ5q0AYFbgdzcIoYgxo9x6C4Z
	dxT8ttqgRr33x7SWmI7PxqOCuQeFW7dBLxY+eMgsZxwh5sW5juJhBfyjuAP/BfsYdP4u
	vPlT0gGbr/NCLXyr8jQ0KzUwDxJpqUO7HPeGoRwjuPK/7Z9pDg8BPmbOr4h92kR8DGzT
	AL5HYTYermxfbIzBL+cZ+GOlGCpVaT/kHfMXdlanP7IkAmZegBYaujIv5DYKnNUHwwoL
	KQ7I7PK1L5I67Asi97QRr0H3FIwgnfGGUsHhae9mZ2jP/wg0gpxzJ4IPsGUK+Kf69r4d
	ovcw==
X-Gm-Message-State: ALoCoQlGR394olzx5btuHh2LnynIPqF0CtBxIZMbz8ctUm4/R8yRB+9v13r97ZM3JbhenC17S38U
MIME-Version: 1.0
X-Received: by 10.129.133.2 with SMTP id v2mr24338077ywf.76.1449485800924;
	Mon, 07 Dec 2015 02:56:40 -0800 (PST)
Received: by 10.37.50.3 with HTTP; Mon, 7 Dec 2015 02:56:40 -0800 (PST)
In-Reply-To: <56026B80.2020909@ettus.com>
References: <1442943875-2955-1-git-send-email-marcus.mueller@ettus.com>
	<CALg11mgdLnVNq745Z6vzP5R2t=dcpamHTKkg5ptv5+NXWFxXpQ@mail.gmail.com>
	<5601A1C6.5050205@ettus.com>
	<CALg11mhL1YMX_1aW8FUQoT5qJEgESe3SSQvk+40gukiA2Ffidg@mail.gmail.com>
	<56026B80.2020909@ettus.com>
Date: Mon, 7 Dec 2015 11:56:40 +0100
Message-ID: <CAHrJaSUTmFFPQwPYg7kow6to+kAiETtc+1tAUeQegSLxtnmn6A@mail.gmail.com>
From: =?UTF-8?Q?Marcus_M=C3=BCller?= <marcus.mueller@ettus.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] hand the TEMPLATECONF local over to setup-builddir
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
X-List-Received-Date: Mon, 07 Dec 2015 10:56:40 -0000
X-Groupsio-MsgNum: 74397
Content-Type: multipart/mixed; boundary=001a114f1e8845be9b05264cb6a5

--001a114f1e8845be9b05264cb6a5
Content-Type: multipart/alternative; boundary=001a114f1e8845be9605264cb6a3

--001a114f1e8845be9605264cb6a3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ping!
Attaching a version of the patch that works with current master; without
the fix, oe-init-build-env simply doesn't work with zsh.

It really isn't a big patch, so if you need me to correct anything, please
don't hesitate to point me to it; I'm totally new to openembedded, so if my
contribution doesn't meet OE expectations, I won't object to any criticism
:)

Best regards,
Marcus

On Wed, Sep 23, 2015 at 11:06 AM, Marcus M=C3=BCller <marcus.mueller@ettus.=
com>
wrote:

> Hello Lee,
>
> wow, thanks for clearing testing this; actually, to trigger my personal
> need for a patch, variant # A was used.
>
> Cheers,
> Marcus
>
>
> On 22.09.2015 22:25, Lee Nipper wrote:
>
> On Tue, Sep 22, 2015 at 1:45 PM, Marcus M=C3=BCller <marcus.mueller@ettus=
.com>
> wrote:
>
>> Hello,
>> > If I understand correctly it allows a user prepared $TEMPLATECONF
>> > directory
>> > to be used by oe-setup-builddir.
>> Indeed; the point is that oe-setup-builddir was definitely meant to be
>> used with a TEMPLATECONF set by the user; in bash, the TEMPLATECONF
>> local variable is automatically passed on from oe-init-build-env to
>> oe-setup-builddir=C2=B9, but in zsh, this doesn't work without explicite=
ly
>> declaring that should happen (which is the only thing my patch does).
>>
>> Best regards,
>> Marcus
>>
>> =C2=B9 not quite sure how; it's a local to the calling script and should=
n't
>> be a local or env variable to the callee, IMHO.
>>
>
>
> Hello Marcus,
>
> FWIW, I did some test cases to understand the differences.
>
> With bash 4.3.11, and the examples below,
> cases A and B will pass along TEMPLATECONF, but case C does not.
> Your patch makes case C work as well.
>
> # A:
>
> TEMPLATECONF=3D$HOME/my-template-dir source
> ~/openembedded-core/oe-init-build-env $HOME/my-build-dir
>
> # B:
> export TEMPLATECONF=3D$HOME/my-template-dir; source
> ~/openembedded-core/oe-init-build-env $HOME/my-build-dir
>
> # C:
> TEMPLATECONF=3D$HOME/my-template-dir; source
> ~/openembedded-core/oe-init-build-env $HOME/my-build-dir
>
>
> And with zsh 5.0.2, case B will pass along TEMPLATECONF, but cases A and =
C
> do not.
> Your patch makes cases A and C work as well with zsh.
>
> I did not expect case A to be different than case C for bash, but it
> apparently works differently than I thought.
>
> Best regards,
> Lee
>
>
>

--001a114f1e8845be9605264cb6a3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Ping!<br></div>Attaching a version of the patch =
that works with current master; without the fix, oe-init-build-env simply d=
oesn&#39;t work with zsh.<br><br></div><div>It really isn&#39;t a big patch=
, so if you need me to correct anything, please don&#39;t hesitate to point=
 me to it; I&#39;m totally new to openembedded, so if my contribution doesn=
&#39;t meet OE expectations, I won&#39;t object to any criticism :)<br><br>=
</div><div>Best regards,<br></div><div>Marcus<br></div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Wed, Sep 23, 2015 at 11:06 A=
M, Marcus M=C3=BCller <span dir=3D"ltr">&lt;<a href=3D"mailto:marcus.muelle=
r@ettus.com" target=3D"_blank">marcus.mueller@ettus.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF">
    Hello Lee,<br>
    <br>
    wow, thanks for clearing testing this; actually, to trigger my
    personal need for a patch, variant # A was used.<br>
    <br>
    Cheers,<br>
    Marcus<div><div class=3D"h5"><br>
    <br>
    <div>On 22.09.2015 22:25, Lee Nipper wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">On Tue, Sep 22, 2015 at 1:45 PM,
            Marcus M=C3=BCller <span dir=3D"ltr">&lt;<a href=3D"mailto:marc=
us.mueller@ettus.com" target=3D"_blank">marcus.mueller@ettus.com</a>&gt;</s=
pan>
            wrote:<br>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-s=
tyle:solid;padding-left:1ex">Hello,<br>
              <span>&gt; If I understand correctly it allows a
                user prepared $TEMPLATECONF<br>
                &gt; directory<br>
                &gt; to be used by oe-setup-builddir.<br>
              </span>Indeed; the point is that oe-setup-builddir was
              definitely meant to be<br>
              used with a TEMPLATECONF set by the user; in bash, the
              TEMPLATECONF<br>
              local variable is automatically passed on from
              oe-init-build-env to<br>
              oe-setup-builddir=C2=B9, but in zsh, this doesn&#39;t work wi=
thout
              explicitely<br>
              declaring that should happen (which is the only thing my
              patch does).<br>
              <br>
              Best regards,<br>
              Marcus<br>
              <br>
              =C2=B9 not quite sure how; it&#39;s a local to the calling sc=
ript
              and shouldn&#39;t<br>
              be a local or env variable to the callee, IMHO.<br>
            </blockquote>
            <div><br>
            </div>
            <div><br>
            </div>
            <div>Hello Marcus,</div>
            <div><br>
            </div>
            <div>FWIW, I did some test cases to understand the
              differences.</div>
            <div><br>
            </div>
            <div>With bash 4.3.11, and the examples below,</div>
            <div>cases A and B will pass along TEMPLATECONF, but case C
              does not.</div>
            <div>Your patch makes case C work as well.</div>
            <div><br>
            </div>
            <div># A:</div>
            <div><br>
            </div>
            <div>TEMPLATECONF=3D$HOME/my-template-dir source
              ~/openembedded-core/oe-init-build-env $HOME/my-build-dir</div=
>
            <div><br>
            </div>
            <div># B:</div>
            <div>export TEMPLATECONF=3D$HOME/my-template-dir; source
              ~/openembedded-core/oe-init-build-env $HOME/my-build-dir</div=
>
            <div><br>
            </div>
            <div># C:</div>
            <div>TEMPLATECONF=3D$HOME/my-template-dir; source
              ~/openembedded-core/oe-init-build-env $HOME/my-build-dir</div=
>
            <div><br>
            </div>
            <div><br>
            </div>
            <div>And with zsh 5.0.2, case B will pass along
              TEMPLATECONF, but cases A and C do not.</div>
            <div>Your patch makes cases A and C work as well with zsh.</div=
>
            <div><br>
            </div>
            <div>I did not expect case A to be different than case C for
              bash, but it apparently works differently than I thought.</di=
v>
            <div><br>
            </div>
            <div>Best regards,</div>
            <div>Lee</div>
          </div>
          <br>
        </div>
      </div>
    </blockquote>
    <br>
  </div></div></div>

</blockquote></div><br></div>

--001a114f1e8845be9605264cb6a3--

--001a114f1e8845be9b05264cb6a5
Content-Type: text/x-patch; charset=US-ASCII; 
	name="0001-hand-the-TEMPLATECONF-local-over-to-setup-builddir.patch"
Content-Disposition: attachment; 
	filename="0001-hand-the-TEMPLATECONF-local-over-to-setup-builddir.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ihvucake0

RnJvbSAxMmRhMmZiZTI5MjE5YTI5Y2I2MWIxMWIxNTYxZTY2MjVhZDdlZjg1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/TWFyY3VzPTIwTT1DMz1CQ2xsZXI/PSA8bWFy
Y3VzLm11ZWxsZXJAZXR0dXMuY29tPgpEYXRlOiBNb24sIDcgRGVjIDIwMTUgMTE6NDg6NDAgKzAx
MDAKU3ViamVjdDogW1BBVENIXSBoYW5kIHRoZSBURU1QTEFURUNPTkYgbG9jYWwgb3ZlciB0byBz
ZXR1cC1idWlsZGRpcgoKLS0tCiBvZS1pbml0LWJ1aWxkLWVudiB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL29lLWluaXQt
YnVpbGQtZW52IGIvb2UtaW5pdC1idWlsZC1lbnYKaW5kZXggNmZlZTVmNy4uYjdlMjkxOCAxMDA3
NTUKLS0tIGEvb2UtaW5pdC1idWlsZC1lbnYKKysrIGIvb2UtaW5pdC1idWlsZC1lbnYKQEAgLTQ1
LDcgKzQ1LDcgQEAgZmkKIE9FUk9PVD1gcmVhZGxpbmsgLWYgIiRPRVJPT1QiYAogZXhwb3J0IE9F
Uk9PVAogLiAkT0VST09UL3NjcmlwdHMvb2UtYnVpbGRlbnYtaW50ZXJuYWwgJiYgXAotICAgICAk
T0VST09UL3NjcmlwdHMvb2Utc2V0dXAtYnVpbGRkaXIgJiYgXAorICAgICBURU1QTEFURUNPTkY9
IiRURU1QTEFURUNPTkYiICRPRVJPT1Qvc2NyaXB0cy9vZS1zZXR1cC1idWlsZGRpciAmJiBcCiAg
ICAgIFsgLW4gIiRCVUlMRERJUiIgXSAmJiBjZCAiJEJVSUxERElSIgogdW5zZXQgT0VST09UCiB1
bnNldCBCQlBBVEgKLS0gCjIuNC4zCgo=

--001a114f1e8845be9b05264cb6a5--
