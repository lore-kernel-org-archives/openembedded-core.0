Subject: Re: [PATCH] rootfs.py: mask run-postinsts systemd service when unneeded
To: openembedded-core@lists.openembedded.org
From: "Awais Belal" <Awais_Belal@mentor.com>
X-Originating-Location: Karachi, Sindh, PK (110.93.212.98)
X-Originating-Platform: Linux Firefox 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 22 Mar 2021 04:41:12 -0700
References: <CANNYZj-+6z3RJQR2eo2_zj9HExHhtGx=oZRa+aLK4mBD-gAV0g@mail.gmail.com>
In-Reply-To: <CANNYZj-+6z3RJQR2eo2_zj9HExHhtGx=oZRa+aLK4mBD-gAV0g@mail.gmail.com>
Message-ID: <32114.1616413272768671921@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="kTwKj1KaXSJ62clApclT"

--kTwKj1KaXSJ62clApclT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

>=20
> Why isn=E2=80=99t this seen in the tests? Can you add a test that shows =
the issue
> please? (Fails without the patch, passes with)

I'm not very well versed with the oe test infrastructure, I'd be happy to =
create a test for this scenario if you can point me to the material that I =
need to go through in order to be able to create a test for this. However, =
if you want me to summarize this tends to fix the issue where the systemd r=
un-postinsts.service is run at the target even when not needed (no pending =
postinsts are found during build).

I do need to send a v2 for this as there's a slight issue in the patch.

--kTwKj1KaXSJ62clApclT
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,<br />
<blockquote>Why isn&rsquo;t this seen in the tests? Can you add a test tha=
t shows the issue please? (Fails without the patch, passes with)</blockquot=
e>
I'm not very well versed with the oe test infrastructure, I'd be happy to =
create a test for this scenario if you can point me to the material that I =
need to go through in order to be able to create a test for this. However, =
if you want me to summarize this tends to fix the issue where the systemd r=
un-postinsts.service is run at the target even when not needed (no pending =
postinsts are found during build).<br /><br />I do need to send a v2 for th=
is as there's a slight issue in the patch.

--kTwKj1KaXSJ62clApclT--
