Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id A673871989
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 13:04:12 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id n127so95354484qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 05:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=s2HbtVOsHlLV2AsAZN8bRsiVcvhKv97HzU/JDTOJIOk=;
	b=zgGJvQuq/Rs+5lo27p9wTypi7KSYDENZRqa044v7tf4Y9dxh1kq8uO0QXuhMH+dX4M
	QtoZSlOfqlYWUIrG4+w9X4bK0qZzdsNKm4C2QkRiB3zH5hJ2Rh0GwqOz32dX8d+DKDnW
	P3UVB4TtgUw+gY0zPiu7rm3+hu6uShXboAgJtHJG3FXdalyEHN/j2GS/2Vis+rPxEmBb
	1NOunB8hnFGkAyx+hxEbZlZPIFnEXoxnReixsn4ccWS5QdXqsgSGEJnu7CrzWtBesCjn
	ojQRxzK4zCyCgVD7ZiTBtZTKPOJtgAhrhOW58bo2ujJ4UI2fNE3HQXJbzbNNPlnIqVFJ
	J4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=s2HbtVOsHlLV2AsAZN8bRsiVcvhKv97HzU/JDTOJIOk=;
	b=mgbWks5cU1udvoIfK1xDZY6ICr5yW76e92g61soswaf04D53E6PffuAgiE8w4umRof
	GSQsxPuJaJymx+P2QU9CE3vuwdutdi0lPtfPX9p+yh/iNHpj1ADzisHB2sUJQsvmYQ83
	agYfC3MjVMM5By4yj8CfIiV0IJFoWemxAH0H7IkwhajAERTUJjBk0+eKGR+RAifPyMB/
	2FbosltrZyZtb7CpBi8chYJLreVlg0FS0eajEedKAOBpY/ZDw/Y5RJS0DtfmMmPevfI0
	gpCQMM/b95OytG5q+qpG+ripOV2ZmZmvYKOhl+tQMj0yzqMEZz8z29lBeBTJNnoYzAyl
	ZP1Q==
X-Gm-Message-State: AMke39m11pDcRSnkykCwNMx4TZmczT/y936ht88lxF7S30pS5atJco/YYns83vrxr5kMHrhHoJxv/fhzeLaE3Vcx
X-Received: by 10.237.53.9 with SMTP id a9mr14279446qte.188.1488200653585;
	Mon, 27 Feb 2017 05:04:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 27 Feb 2017 05:03:53 -0800 (PST)
In-Reply-To: <a5310e60c77c5a1037d7111056e526d6e63aaf18.1488046239.git.raj.khem@gmail.com>
References: <cover.1488046239.git.raj.khem@gmail.com>
	<a5310e60c77c5a1037d7111056e526d6e63aaf18.1488046239.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Feb 2017 13:03:53 +0000
Message-ID: <CAJTo0LbH34veAaCtJtvC+dQ-mUFYQtP0J=KGdE8KKVpo9ZKr3g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Mon, 27 Feb 2017 13:04:12 -0000
Content-Type: multipart/alternative; boundary=001a11c0285e4ff3de054982b7ae

--001a11c0285e4ff3de054982b7ae
Content-Type: text/plain; charset=UTF-8

On 25 February 2017 at 18:13, Khem Raj <raj.khem@gmail.com> wrote:

> This is converging the recipes for go from
> meta-virtualization and oe-meta-go
>

ERROR: go-cross-x86_64-1.7.4-r0 do_compile: Function failed: do_compile
(log file is located at
/data/poky-master/tmp/work/x86_64-linux/go-cross-x86_64/1.7.4-r0/temp/log.do_compile.21270)
ERROR: Logfile of failure stored in:
/data/poky-master/tmp/work/x86_64-linux/go-cross-x86_64/1.7.4-r0/temp/log.do_compile.21270
Log data follows:
| DEBUG: Executing shell function do_compile
| ##### Building Go bootstrap tool.
| cmd/dist
| #
_/data/poky-master/tmp/work/x86_64-linux/go-cross-x86_64/1.7.4-r0/go/src/cmd/dist
|
/data/poky-master/tmp/work/x86_64-linux/go-cross-x86_64/1.7.4-r0/recipe-sysroot-native/usr/lib/go/pkg/tool/linux_amd64/6l:
readsym out of sync

Also, can you squash the fixing up patches so we just have a single commit
that actually works.

Ross

--001a11c0285e4ff3de054982b7ae
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 February 2017 at 18:13, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-st=
yle:solid;padding-left:1ex"><div id=3D"gmail-:4tc" class=3D"gmail-a3s gmail=
-aXjCH gmail-m15a767aeae226157">This is converging the recipes for <span cl=
ass=3D"gmail-il">go</span> from<br>
meta-virtualization and oe-meta-<span class=3D"gmail-il">go</span><br></div=
></blockquote></div><br><div class=3D"gmail_extra">ERROR: go-cross-x86_64-1=
.7.4-r0 do_compile: Function failed: do_compile (log file is located at /da=
ta/poky-master/tmp/work/x86_64-linux/go-cross-x86_64/1.7.4-r0/temp/log.do_c=
ompile.21270)</div><div class=3D"gmail_extra">ERROR: Logfile of failure sto=
red in: /data/poky-master/tmp/work/x86_64-linux/go-cross-x86_64/1.7.4-r0/te=
mp/log.do_compile.21270</div><div class=3D"gmail_extra">Log data follows:</=
div><div class=3D"gmail_extra">| DEBUG: Executing shell function do_compile=
</div><div class=3D"gmail_extra">| ##### Building Go bootstrap tool.</div><=
div class=3D"gmail_extra">| cmd/dist</div><div class=3D"gmail_extra">| # _/=
data/poky-master/tmp/work/x86_64-linux/go-cross-x86_64/1.7.4-r0/go/src/cmd/=
dist</div><div class=3D"gmail_extra">| /data/poky-master/tmp/work/x86_64-li=
nux/go-cross-x86_64/1.7.4-r0/recipe-sysroot-native/usr/lib/go/pkg/tool/linu=
x_amd64/6l: readsym out of sync</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Also, can you squash the fixing up patches so we =
just have a single commit that actually works.</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div></div>

--001a11c0285e4ff3de054982b7ae--
