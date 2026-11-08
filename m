Subject: Re: [PATCH] packagegroups: Add clang to the SDK
To: openembedded-core@lists.openembedded.org
From: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (106.51.221.108)
X-Originating-Platform: Windows Chrome 156
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 08 Nov 2026 03:17:05 -0800
References: <20261108073103.1232032-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20261108073103.1232032-1-khem.raj@oss.qualcomm.com>
Message-ID: <344401.1794136625546968468@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="83utq0xpeE2dJrcmASEp"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 11:17:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249754

--83utq0xpeE2dJrcmASEp
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

Is it intended that this is unconditional? meta-clang gated the SDK
bits on CLANGSDK (default "0") and had the target libs as RRECOMMENDS
under toolchain-clang. With this every populate_sdk builds
nativesdk-clang (0 -> 98 entries in task-depends.dot on master,
nodistro/qemux86-64).

If the opt-in is meant to go, maybe gate on SDK_FEATURES like go/rust?

~Sunil Dora

--83utq0xpeE2dJrcmASEp
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Khem,<br /><br />Is it intended that this is unconditional? meta-cl=
ang gated the SDK<br />bits on CLANGSDK (default "0") and had the target li=
bs as RRECOMMENDS<br />under toolchain-clang. With this every populate_sdk =
builds<br />nativesdk-clang (0 -&gt; 98 entries in task-depends.dot on mast=
er,<br />nodistro/qemux86-64).<br /><br />If the opt-in is meant to go, may=
be gate on SDK_FEATURES like go/rust?<br /><br />~Sunil Dora</div>

--83utq0xpeE2dJrcmASEp--
