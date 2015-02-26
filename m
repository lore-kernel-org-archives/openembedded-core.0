Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id DE653605B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 12:23:10 +0000 (UTC)
Received: by qcxr5 with SMTP id r5so7950304qcx.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 04:23:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/sQPYJZXq+Jszb1+Ro4VPd/eNlNR5IFJERHQxoq/maw=;
	b=XRIQgmWGzXI7yfdEiQTFM/N0KmuDEuxNadfxhVOUz3PS3tcTyHRw3UJAAm3O53oaeA
	2FmSu/ESD+37JtzK4lxXIRFil0frac5Xl/i5xsozOSZ1oRxbQtBQazvnR0q9a7Qw/5i3
	TeNbmHqXiUMRiPttSqMQo5F7Dr1fYpgF00C7U6N/o5TAhVOhihcp6ZkAbAR5gtGkqXCo
	pw9fduIOkdjOZWYevrEmCCWw5NhBewgObPj1M/vOCUMIM+B51anogeN4PyUS3O66nPEq
	72WRLCwpoyVsFSAUQzrJbL3LW1A3aDORNGxSyB9I4nmFIsCtJCmhJzBViEi3DZ5/X//Q
	ZqVQ==
X-Gm-Message-State: ALoCoQn0Vg2QuJ5ACj2pH5TklcMZ7SyjTQU6bjTu2bzakvGpyXwoxNj25CbJUFhSCKNiVeLmgxjv
X-Received: by 10.229.3.8 with SMTP id 8mr18001655qcl.12.1424953391418; Thu,
	26 Feb 2015 04:23:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Thu, 26 Feb 2015 04:22:51 -0800 (PST)
In-Reply-To: <1424888075.6730.19.camel@besquive-mobl.amr.corp.intel.com>
References: <1424685241-17960-1-git-send-email-benjamin.esquivel@linux.intel.com>
	<54ECD3C2.8040005@linux.intel.com>
	<1424816244.6730.14.camel@besquive-mobl.amr.corp.intel.com>
	<CAJTo0LYsD6SZO71Q6BBnX0td8LZWBeRGWXJ-Ga2LbuWMYN6OHw@mail.gmail.com>
	<1424888075.6730.19.camel@besquive-mobl.amr.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Feb 2015 12:22:51 +0000
Message-ID: <CAJTo0LZVJc1=OptZG4vaxyqAq7AgYYkJeMbA5kGg_1n3o+jC5Q@mail.gmail.com>
To: benjamin.esquivel@linux.intel.com, Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: 'yes' within the path sets wrong variables
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
X-List-Received-Date: Thu, 26 Feb 2015 12:23:16 -0000
Content-Type: multipart/alternative; boundary=001a1133997eb7c6bd050ffcd011

--001a1133997eb7c6bd050ffcd011
Content-Type: text/plain; charset=UTF-8

On 25 February 2015 at 18:14, Benjamin Esquivel <
benjamin.esquivel@linux.intel.com> wrote:

> Saul, is there a specific part of the glibc's run.do_configure that
> should re-conf?
>

The glibc recipe explicitly avoids autoreconfig:

"# override this function to avoid the autoconf/automake/aclocal/autoheader
calls for now"

Khem is the person to ask if this is something that can be removed but for
now, patching the configure is all we can do (and sending the patch
upstream so we don't need to patch configure in the future).

Ross

--001a1133997eb7c6bd050ffcd011
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 February 2015 at 18:14, Benjamin Esquivel <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:benjamin.esquivel@linux.intel.com" target=3D"_blank">benjamin.=
esquivel@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=
=3D":4r5" class=3D"" style=3D"overflow:hidden">Saul, is there a specific pa=
rt of the glibc&#39;s run.do_configure that<br>
should re-conf?<br></div></blockquote></div><br>The glibc recipe explicitly=
 avoids autoreconfig:</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">&quot;# override this function to avoid the autoconf/autom=
ake/aclocal/autoheader calls for now&quot;</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Khem is the person to ask if this is s=
omething that can be removed but for now, patching the configure is all we =
can do (and sending the patch upstream so we don&#39;t need to patch config=
ure in the future).</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">Ross</div></div>

--001a1133997eb7c6bd050ffcd011--
