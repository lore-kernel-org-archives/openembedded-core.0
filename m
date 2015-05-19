Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 80BC2601DF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 14:42:56 +0000 (UTC)
Received: by qkgv12 with SMTP id v12so11068969qkg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 07:42:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Unx5DvyZUH3T98s6GbYEakgMJlPpxh4S/FTQf7s55w0=;
	b=jxi+mw7T42xd9eMkgR4K0AV1DUG6xjMABnEDe082o3vTDMFgrGN5opqaNWfogXcGst
	kaT/7xaUrP7MuSCqJiOYeZcQtIDb/WRsRyEElUbUtLoi44loISQc3VqQuIVVsmR37BLI
	sshrNts44KmtSyyrU7zBmcyHb7gDUt3YUhI+Uy8GTxc0ONRFgWMUIlI4wTJ9NHAcN1cc
	hsuF4tyV6UrqYwfo3NcUZsH/eOIh+pmzt0XLM1PiD+/w2AE0g2UGwMuAMtOXCmS7MoJb
	hVguwDtBN7T1DMNIb5TBXUesOhfTa0msL3CHoJaydcbW57WjnSMLkAo1UwvIF+7lDnTw
	5IFw==
X-Gm-Message-State: ALoCoQkigYP0Kq8CUy5iiQ/VCvBcIHqdRqR67XOnUXgbEmZOfWEu+eXfq5FnRu4gwHdFJvicws/J
X-Received: by 10.140.88.35 with SMTP id s32mr35638064qgd.59.1432046576630;
	Tue, 19 May 2015 07:42:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 19 May 2015 07:42:36 -0700 (PDT)
In-Reply-To: <CAJTo0LYgeSkvr+U1OZG70PvH-OXY9suxkK=7wHM4ecOY8jbKCQ@mail.gmail.com>
References: <1431952843-25139-1-git-send-email-tanu.kaskinen@linux.intel.com>
	<1431952843-25139-2-git-send-email-tanu.kaskinen@linux.intel.com>
	<CAJTo0LYgeSkvr+U1OZG70PvH-OXY9suxkK=7wHM4ecOY8jbKCQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 May 2015 15:42:36 +0100
Message-ID: <CAJTo0Lbf1chJC0WqbwHFVomgc6r2i_kxsEnzXv3uN6M9sOvzmg@mail.gmail.com>
To: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] alsa-plugins: initial recipe
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
X-List-Received-Date: Tue, 19 May 2015 14:42:57 -0000
Content-Type: multipart/alternative; boundary=001a11c11d028093670516705357

--001a11c11d028093670516705357
Content-Type: text/plain; charset=UTF-8

On 19 May 2015 at 15:31, Burton, Ross <ross.burton@intel.com> wrote:

> On 18 May 2015 at 13:40, Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
> wrote:
>
>> +# The resampler plugins create some symlinks, which have to be added to
>> FILES
>> +# manually, since do_split_packages() rejects symlinks. The symlinks
>> also cause
>> +# QA errors, but those errors are false positives, so we disable the QA
>> checks.
>>
>
> Not true, there's an allow_symlink (default False) option to
> do_split_packages, so this can be cleaned up.
>
> Assuming that those symlinks are versioning (and so pointless for loadable
> modules), a neater fix might be to patch in libtool -avoid-version.
>

Investigate *before* sending, Ross.

Just pass allow_links=True to do_split_packages() and all of this can be
deleted.

Ross

--001a11c11d028093670516705357
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 May 2015 at 15:31, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mail=
to:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra"><=
div class=3D"gmail_quote"><span class=3D"">On 18 May 2015 at 13:40, Tanu Ka=
skinen <span dir=3D"ltr">&lt;<a href=3D"mailto:tanu.kaskinen@linux.intel.co=
m" target=3D"_blank">tanu.kaskinen@linux.intel.com</a>&gt;</span> wrote:<br=
></span><span class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div style=3D"overf=
low:hidden">+# The resampler plugins create some symlinks, which have to be=
 added to FILES<br>
+# manually, since do_split_packages() rejects symlinks. The symlinks also =
cause<br>
+# QA errors, but those errors are false positives, so we disable the QA ch=
ecks.<br></div></blockquote></span></div><br>Not true, there&#39;s an allow=
_symlink (default False) option to do_split_packages, so this can be cleane=
d up.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
Assuming that those symlinks are versioning (and so pointless for loadable =
modules), a neater fix might be to patch in libtool -avoid-version.</div></=
blockquote></div><br>Investigate *before* sending, Ross.</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">Just pass allow_links=3D=
True to do_split_packages() and all of this can be deleted.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c11d028093670516705357--
