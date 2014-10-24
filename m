Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id ABD6F65CED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 22:17:03 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id z60so1687970qgd.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 15:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=WWGiK7fkFIpyzr2gwFA6rio8YPMaXUyIw5ReaN+9C6A=;
	b=N5224XJdW2+yrcAGthMXcxU2BZQjQthHlN9/0b1DyibfgnOavVrcsHN/AbQibb6nFh
	MAiqq6EDYWEX4GrFfokbLlB9e9QQIY656cx5MrDM7SKW+bR98e+ASxDQN28vK5+Mxl1G
	B69LAz5SYNAZYfI+/8na+9k+OqkqkVUCgrDoDD+9KB3azbuPcI//uxyQ3aqXQqCe4pZg
	CmWGaUjxedpGh+HCNCC+53uZP3h/NtWOBT2dAq3gkyIhc8Bf5FcEDJGZG0WwjE0kGToe
	+MaG2LDGKbQrUHWcurjcS409pWmzsR1M3sVzfN8Nq+fhAan8WbDuaAHSVhflp6A1/pQ4
	YYWA==
X-Gm-Message-State: ALoCoQngD3JQwvByUZqRlMiZBXzj6ftnT3XO4BTDPNS1lPLVCpL4qe8v3byu0rcYbg9EXmuSrE2N
X-Received: by 10.229.53.133 with SMTP id m5mr10545124qcg.28.1414189024258;
	Fri, 24 Oct 2014 15:17:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.93.65 with HTTP; Fri, 24 Oct 2014 15:16:44 -0700 (PDT)
In-Reply-To: <764d0d5ee52d46b0b33d577675d8fecc3e99800f.1414142394.git.Chong.Lu@windriver.com>
References: <cover.1414142394.git.Chong.Lu@windriver.com>
	<764d0d5ee52d46b0b33d577675d8fecc3e99800f.1414142394.git.Chong.Lu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Oct 2014 23:16:44 +0100
Message-ID: <CAJTo0LY-oHnKxUrtGUyhA=jPoK5Dcjs==7+YyVTV=6M5Jufesw@mail.gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] curl: Security Advisory - curl - CVE-2014-3613
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
X-List-Received-Date: Fri, 24 Oct 2014 22:17:10 -0000
Content-Type: multipart/alternative; boundary=001a1133da326fc0bb0506328a19

--001a1133da326fc0bb0506328a19
Content-Type: text/plain; charset=UTF-8

On 24 October 2014 10:20, Chong Lu <Chong.Lu@windriver.com> wrote:

>  meta/recipes-support/curl/curl/CVE-2014-3613.patch | 269
> +++++++++++++++++++++
>

ERROR: Command Error: exit status: 1  Output:
Applying patch CVE-2014-3613.patch
patching file lib/cookie.c
patching file tests/data/test1105
patching file tests/data/test31
Hunk #1 FAILED at 49.
1 out of 2 hunks FAILED -- rejects in file tests/data/test31
patching file tests/data/test8
Patch CVE-2014-3613.patch does not apply (enforce with -f)

Please verify that your patch applies to current git master.

Ross

--001a1133da326fc0bb0506328a19
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 October 2014 10:20, Chong Lu <span dir=3D"ltr">&lt;<a href=3D"mailto:=
Chong.Lu@windriver.com" target=3D"_blank">Chong.Lu@windriver.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-lef=
t-style:solid;padding-left:1ex"><span class=3D"">=C2=A0meta/recipes-support=
/<span class=3D"">curl</span>/<span class=3D"">curl</span>/CVE-2014-3613.pa=
tch | 269 +++++++++++++++++++++<br></span></blockquote></div><br>ERROR: Com=
mand Error: exit status: 1 =C2=A0Output:</div><div class=3D"gmail_extra">Ap=
plying patch CVE-2014-3613.patch</div><div class=3D"gmail_extra">patching f=
ile lib/cookie.c</div><div class=3D"gmail_extra">patching file tests/data/t=
est1105</div><div class=3D"gmail_extra">patching file tests/data/test31</di=
v><div class=3D"gmail_extra">Hunk #1 FAILED at 49.</div><div class=3D"gmail=
_extra">1 out of 2 hunks FAILED -- rejects in file tests/data/test31</div><=
div class=3D"gmail_extra">patching file tests/data/test8</div><div class=3D=
"gmail_extra">Patch CVE-2014-3613.patch does not apply (enforce with -f)</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Please v=
erify that your patch applies to current git master.</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1133da326fc0bb0506328a19--
