Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 41D7B65D19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 23:38:31 +0000 (UTC)
Received: by qctt3 with SMTP id t3so1273990qct.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 16:38:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=F1oF4JgmE4XuVeP+qg8ZCsl+bimXtmHmtI6UhxeIMBI=;
	b=ggWMC6gIw4Dywyjk5+McYO5zrdEli5C+wU3Ccj3sHCJ+x7E3jpiO7weJN+d26oIJxB
	erVVe/hyTODoUqOlJaxVJ7d6kD+ci6ABtqtidDGmE41iqsvS9TPUllpiK+1lojJn5g+u
	0nAH9emnZvpUJKXCs+70oJ5E1pxR3nCko/XmFcIqa+BAuGo/ulsrl6zYpFE+k+SDmSvu
	ndWa54VCBgUHhCnnb3stAhYfSeD2PG33TKsTY7BeGm1JvaBYxICFR+vuCvlRQ5FGzUVB
	rIiAlET65teOpCuX4gotaiQJcUe2Iz7Bk3JEpEMAxeLOq44pPcjyLMryPvKniFoE5H8K
	PG3w==
X-Gm-Message-State: ALoCoQlhs4d4YWhtvTr+BjzlUho57p4UrOPPZcq2bcuWb+OvKeKm1FTWEqlPBoV3VLC1h8Y3zpci
X-Received: by 10.55.43.130 with SMTP id r2mr12292115qkr.14.1432251512318;
	Thu, 21 May 2015 16:38:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 21 May 2015 16:38:11 -0700 (PDT)
In-Reply-To: <d2900c9f672ce2901dcc464f25434987189e5337.1432199284.git.alejandro.hernandez@linux.intel.com>
References: <cover.1432199284.git.alejandro.hernandez@linux.intel.com>
	<d2900c9f672ce2901dcc464f25434987189e5337.1432199284.git.alejandro.hernandez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 May 2015 00:38:11 +0100
Message-ID: <CAJTo0LYpzyy9gQ0-UZhCyQk=QnZHO3gqhJr_JAaHz3VYJGQzJQ@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] python3-pip: Adds recipe for python3-pip
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
X-List-Received-Date: Thu, 21 May 2015 23:38:36 -0000
Content-Type: multipart/alternative; boundary=001a1147afb09f01b90516a00a2a

--001a1147afb09f01b90516a00a2a
Content-Type: text/plain; charset=UTF-8

On 21 May 2015 at 10:15, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

> PIP is installed by default since python 3.4, due to issues with the
> autobuilders, its default installation had to be disabled, this creates
> a recipe for it, it brings a lot of new dependencies so it is chosen not
> to be installed by default along with python3-core.


Missing dependencies?

ERROR: Function failed: do_compile (log file is located at
/data/poky-master/tmp/work/corei7-64-poky-linux/python3-pip/6.1.1-r0/temp/log.do_compile.7121)
ERROR: Logfile of failure stored in:
/data/poky-master/tmp/work/corei7-64-poky-linux/python3-pip/6.1.1-r0/temp/log.do_compile.7121
Log data follows:
| DEBUG: Executing shell function do_compile
| Traceback (most recent call last):
|   File "setup.py", line 6, in <module>
|     from setuptools import setup, find_packages
| ImportError: No module named 'setuptools'
| ERROR: python3 setup.py build_ext execution failed.
| WARNING: exit code 1 from a shell command.

Ross

--001a1147afb09f01b90516a00a2a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 May 2015 at 10:15, Alejandro Hernandez <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alejandro.hernandez@linux.intel.com" target=3D"_blank">alejandro=
.hernandez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-l=
eft-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><span =
class=3D"">PIP</span> is installed by default since python 3.4, due to issu=
es with the<br>
autobuilders, its default installation had to be disabled, this creates<br>
a recipe for it, it brings a lot of new dependencies so it is chosen not<br=
>
to be installed by default along with python3-core.</blockquote></div><br>M=
issing dependencies?</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra"><div class=3D"gmail_extra">ERROR: Function failed: do_comp=
ile (log file is located at /data/poky-master/tmp/work/corei7-64-poky-linux=
/python3-pip/6.1.1-r0/temp/log.do_compile.7121)</div><div class=3D"gmail_ex=
tra">ERROR: Logfile of failure stored in: /data/poky-master/tmp/work/corei7=
-64-poky-linux/python3-pip/6.1.1-r0/temp/log.do_compile.7121</div><div clas=
s=3D"gmail_extra">Log data follows:</div><div class=3D"gmail_extra">| DEBUG=
: Executing shell function do_compile</div><div class=3D"gmail_extra">| Tra=
ceback (most recent call last):</div><div class=3D"gmail_extra">| =C2=A0 Fi=
le &quot;setup.py&quot;, line 6, in &lt;module&gt;</div><div class=3D"gmail=
_extra">| =C2=A0 =C2=A0 from setuptools import setup, find_packages</div><d=
iv class=3D"gmail_extra">| ImportError: No module named &#39;setuptools&#39=
;</div><div class=3D"gmail_extra">| ERROR: python3 setup.py build_ext execu=
tion failed.</div><div class=3D"gmail_extra">| WARNING: exit code 1 from a =
shell command.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">Ross</div></div></div>

--001a1147afb09f01b90516a00a2a--
