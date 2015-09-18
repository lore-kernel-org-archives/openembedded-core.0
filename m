Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0729277028
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 11:05:55 +0000 (UTC)
Received: by qgez77 with SMTP id z77so35515867qge.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 04:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=gORuvu80X5mL/31B5cI8g+wao80WsKGkjAYCF/3TPcc=;
	b=k8Td4YhT6NXEE8Csm6L+9sbpo4rG9SmHzSZQE52h+WugA5btH5G6jcBloxD6tl9omx
	pEtYLfFnJjeed0gXzm7SKiDw8eijMkm5QUf0ZEfttebgOZWdSpDzGjGiK9AceE/mP/DC
	yWijS9SygvPzWITeW52pmEwG+RlgUK0XiwAElV+YaN6ADu1BfNJDmhhbQOnDMV4K9RpC
	mDWtu7VsVGzgiUyqZIhgDBv9d1vHGN/RLKoZsNI1ocmwn+SG91PLZwRjbsu9VFz2HVzd
	nCnv9UlvOl34hUPLjZcmoDDkeeDzrh2/Q7yQAa6I6lsRaplDcc9ZbqrpgayHsEQO/ziO
	eRAw==
X-Gm-Message-State: ALoCoQnZUs8YRA7PC6g/+tSeVGm55bBQAuXsovAI8VVH8KQ+hGj6e3pAwZTKO8+u7suHXGASpXGi
X-Received: by 10.140.133.202 with SMTP id 193mr5910092qhf.52.1442574355259;
	Fri, 18 Sep 2015 04:05:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Fri, 18 Sep 2015 04:05:35 -0700 (PDT)
In-Reply-To: <1442522311-15326-1-git-send-email-benjamin.esquivel@linux.intel.com>
References: <1442522311-15326-1-git-send-email-benjamin.esquivel@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 18 Sep 2015 12:05:35 +0100
Message-ID: <CAJTo0Lai9oeh3Kvg8wAB9OPFOBG4WaBYqnGRidv-zt9bNrGqgA@mail.gmail.com>
To: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] selftest/buildoptions: pexpect not a builtin module
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
X-List-Received-Date: Fri, 18 Sep 2015 11:05:56 -0000
Content-Type: multipart/alternative; boundary=001a1135a4f4020488052003845a

--001a1135a4f4020488052003845a
Content-Type: text/plain; charset=UTF-8

On 17 September 2015 at 21:38, Benjamin Esquivel <
benjamin.esquivel@linux.intel.com> wrote:

> put the import of pexpect around a try statement so it can tell you
> why it failed to import when in a system that has the module unreachable
>

As the failing import is throwing an exception, can't the calling code
display the exception correctly?

Ross

--001a1135a4f4020488052003845a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 September 2015 at 21:38, Benjamin Esquivel <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:benjamin.esquivel@linux.intel.com" target=3D"_blank">benjamin=
.esquivel@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><div id=3D":bf" class=3D"a3s" style=3D"overflow:hidden">put the impo=
rt of pexpect around a try statement so it can tell you<br>
why it failed to import when in a system that has the module unreachable<br=
></div></blockquote></div><br>As the failing import is throwing an exceptio=
n, can&#39;t the calling code display the exception correctly?</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1135a4f4020488052003845a--
