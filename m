Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id B707471014
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 12:43:38 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id l89so306175qgf.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Dec 2014 04:43:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=awoEecD1prYmmvYAuq8t0JsQNu66i+Hae9taGm4Yy34=;
	b=EwQvoVt1uRzRDn1K49PqFIkNuQL5dgXefb9fCb7twh3Y6iM0A44cMmJG6pQKFA9+SI
	CGg4aIo5IF+KvLfBG1kVIyF29QiqcXMhAB3tr77F9bkjzoYJNEus1WI8sB3133eeKxFh
	XECWrIzHClv9rdFYDE81dCwjQSNhUdcJIHVhBZtxKx30P9pQFtHO+4dThw2WpFnZ+Z4E
	ddUA4MOJ7ggjuUwIYTiFKak7DzwnChJHZXeg89PDDkyaB5QZwOY14zfKZFv6dZeeDfTo
	SikZqIbb+BCxI5L9J6NKnYTWyhw1q8dAaOyrumTYY2EgnwsEziYDkvoUZwSMV4ny35Ia
	Ibbw==
X-Gm-Message-State: ALoCoQmXaP/tph4fas+6DNwHuk3N6BZWt0elEa6V68iIADqVGy9uznYjkSqzmV2rggthnsPRHBR0
X-Received: by 10.140.102.144 with SMTP id w16mr4552395qge.59.1418129019128;
	Tue, 09 Dec 2014 04:43:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Tue, 9 Dec 2014 04:43:18 -0800 (PST)
In-Reply-To: <1418117801-9614-1-git-send-email-kai.kang@windriver.com>
References: <1418117801-9614-1-git-send-email-kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Dec 2014 12:43:18 +0000
Message-ID: <CAJTo0Lbd2jieDY-4zGauqxQpvZnvMPsXcr=PP=Qy1YYAvmR7pg@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] valgrind: update to 3.10.1
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
X-List-Received-Date: Tue, 09 Dec 2014 12:43:43 -0000
Content-Type: multipart/alternative; boundary=001a11c16bc26e6c120509c7e4c2

--001a11c16bc26e6c120509c7e4c2
Content-Type: text/plain; charset=UTF-8

On 9 December 2014 at 09:36, Kai Kang <kai.kang@windriver.com> wrote:

> Add dependency perl-module-file-glob for ptest subpackage.
>

A build here results in:

WARNING: QA Issue: valgrind-ptest rdepends on boost-system, but it isn't a
build dependency? [build-deps]
WARNING: QA Issue: valgrind-ptest rdepends on boost-thread, but it isn't a
build dependency? [build-deps]

Ross

--001a11c16bc26e6c120509c7e4c2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 December 2014 at 09:36, Kai Kang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:kai.kang@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-=
left-style:solid;padding-left:1ex"><div id=3D":14g" class=3D"" style=3D"ove=
rflow:hidden">Add dependency perl-module-file-glob for ptest subpackage.<br=
></div></blockquote></div><div class=3D"gmail_extra"><br></div>A build here=
 results in:</div><div class=3D"gmail_extra"><br><div class=3D"gmail_extra"=
>WARNING: QA Issue: valgrind-ptest rdepends on boost-system, but it isn&#39=
;t a build dependency? [build-deps]</div><div class=3D"gmail_extra">WARNING=
: QA Issue: valgrind-ptest rdepends on boost-thread, but it isn&#39;t a bui=
ld dependency? [build-deps]</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">Ross</div></div></div>

--001a11c16bc26e6c120509c7e4c2--
