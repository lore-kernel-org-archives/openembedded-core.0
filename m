Return-Path: <mikko.ylinen@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 359A071D61
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 13:17:09 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id s140so53661393qke.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 05:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=oozVCcv/tmY2e6yqRGFI3Lu9d1ycAPFeVybm16oCsao=;
	b=iz3gYk9faNaA/BmUrLdQE/gmM4Q/CsqKWzAfk8DSGGPgry/xLueonUmonIlvon6FyS
	HwbBs116g1Lxgoj4vcMW7A7A+IK2CAqd7lA9yKnYuP8MUMERWwLc8Exy1Y+LtZOrtbQ2
	M+mXpW8DfQ4IBVNfaV1PBWbfjoIQbg7dSuBHTq3PS7gdDt0EA31HAsJpFKocohEdATCw
	T7sNvr4VCozK9sKGxidPWGEp0IFFEA4qx4l1/YVqWNRsFFxhUgsBYridQnRjP3aMfoTS
	YV8Vhcf510SPECqyMAhssGd/vUHbUmSt8f4y40vxoX66xFKxqYSdi2B14OD/ok0FvpC7
	Gw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=oozVCcv/tmY2e6yqRGFI3Lu9d1ycAPFeVybm16oCsao=;
	b=S1f6iwpJaWy40QosJBCdjFTLucY/1oh6hcHNzOLcDgQWoEqizLNbPF63wleeqWcX+z
	Z6OxUWMkkjneaM1nrLNPy3MXPkOGvVoUdQhA0BN2qS0rI0AkdSFG9y8jQbJ+JsmTbOqo
	E2oZ5uEcQBZUYT3hoClf7GaOvkHbjdLunPSeUZCG/VBbViGb15Z1r0tDaASy6x3lZrcu
	z3DfzR7RbqFfxWT0gZ6NDGt3BWiVHiA1di8sFMIQefldapU6uyV+VevtRD0tylqjL5Po
	A3pWQiV7bcAr3LT/dupnfoKir6T001xU/u30Ju1AbUkmAr2/OCpmRLkX4O5MGamJdwqN
	TWkA==
X-Gm-Message-State: AIkVDXJjll311U2gAq0gZ+Gkzc+UnL8/CEz4SR5KvTQcs1yCsgjH+pEWCkYjR8eH55/UiTD6/4PivxZKfZF3jRiC
X-Received: by 10.55.79.212 with SMTP id d203mr20128404qkb.110.1484313429725; 
	Fri, 13 Jan 2017 05:17:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.173.200 with HTTP; Fri, 13 Jan 2017 05:17:09 -0800 (PST)
From: "Ylinen, Mikko" <mikko.ylinen@intel.com>
Date: Fri, 13 Jan 2017 15:17:09 +0200
Message-ID: <CAHZ0fbFX9AiuQAxXmQbgLevTh9KXE82APqcUBywiBvvKLvs0mQ@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/7] image-live-artifacts: Add support for creating image artifacts only
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
X-List-Received-Date: Fri, 13 Jan 2017 13:17:09 -0000
Content-Type: multipart/alternative; boundary=001a114a9a9cb6e86e0545f9a6e2

--001a114a9a9cb6e86e0545f9a6e2
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 13, 2017 at 12:34 AM, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

[snip]

>
> Not as far as I know, but so that would work when building something AND
> the artifacts, but what if you want to build the artifacts only?, you would
> have to build everything else as well wouldn't you?
>

My only feedback was: we could target something that gives the necessary
artifacts
without depending on any other IMAGE_FSTYPES than wic (and I was assuming
wic
is the reason why the patch exists).

Currently, for example, all "live" artifacts (including rootfs.img) are
built first to get a
wic image created. The same applies with this patch still: one would need
to specify
another image type first to get the artifacts to get wic image type built.
Furthermore, that
image type would give unnecessary build dependencies (depending on your
configuration).

It can also be argued whether the build_*_cfg() are needed here because the
wic source
plugins write their own configs.

The desired outcome (IMO) would be independent from "live" (naming wise
also).

-- Mikko

--001a114a9a9cb6e86e0545f9a6e2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Jan 13, 2017 at 12:34 AM, Alejandro Hernandez <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:alejandro.hernandez@linux.intel.com" target=3D"_blan=
k">alejandro.hernandez@linux.intel.com</a>&gt;</span> wrote:<br><div>=C2=A0=
</div><div>[snip]</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv bgcolor=3D"#FFFFFF"><div><div class=3D"gmail-h5"><blockquote type=3D"cit=
e"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
            </blockquote>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote></div></div>
    Not as far as I know, but so that would work when building something
    AND the artifacts, but what if you want to build the artifacts
    only?, you would have to build everything else as well wouldn&#39;t you=
?<br></div></blockquote><div><br></div><div>My only feedback was: we could =
target something that gives the necessary artifacts</div><div>without depen=
ding on any other IMAGE_FSTYPES than wic (and I was assuming wic=C2=A0</div=
><div>is the reason why the patch exists).</div><div><br></div><div>Current=
ly, for example, all &quot;live&quot; artifacts (including rootfs.img) are =
built first to get a</div><div>wic image created. The same applies with thi=
s patch still: one would need to specify</div><div>another image type first=
 to get the artifacts to get wic image type built. Furthermore, that</div><=
div>image type would give unnecessary build dependencies=C2=A0(depending on=
 your configuration).</div><div><br></div><div><div>It can also be argued w=
hether the build_*_cfg() are needed here because the wic source</div><div>p=
lugins write their own configs.</div></div><div><br></div><div>The desired =
outcome (IMO) would be independent from &quot;live&quot; (naming wise also)=
.</div><div><br></div><div>-- Mikko</div><div><br></div></div></div></div>

--001a114a9a9cb6e86e0545f9a6e2--
