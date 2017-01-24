Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yw0-f175.google.com (mail-yw0-f175.google.com
	[209.85.161.175])
	by mail.openembedded.org (Postfix) with ESMTP id D0C117723D
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 10:18:26 +0000 (UTC)
Received: by mail-yw0-f175.google.com with SMTP id v200so157156627ywc.3
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 02:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pcqShV2X0SjOvU7D+91CjolVd96/prPGqil0kHG4AJY=;
	b=wqQE9+DTDhdbU2PKTdF0KdRUt70mfrKzUaBfj/8wX6ICNsIPcIpc/vmma5NQHX91AI
	xzEYBdIEW5hkAPe1bWitdqHdcilp71mi9QIlIliU0zbDEkf6kPUX5i2VHQWTKfVSniC+
	lA0w+/0/diVGS93YV8jAoTlG6qXoQKtYgjUtpsU2MMnuH3MynXNBC/nMh1zVl9SVarJb
	etjL0FYknRbhgkWABln26R89AFccZIuEcXWB+2EUj/BP31KKttLrzsQX7ccUUX9Q0pFB
	ee69B1np9/0RP8z3bdxU+CMoJ16tVYIDZilJqmN0lSvKnq3x1sjNTBbN/Fxz3WMpZKcS
	qWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pcqShV2X0SjOvU7D+91CjolVd96/prPGqil0kHG4AJY=;
	b=A2vQ+a/x9f5VdFrvdoyyWL4MBdweasCmK9xrO57NivkQLXtFHck0mB8sJ3ilRbXEvs
	9ghH2JxcwEMJJXVUinNk8zlCZcBimzSnyRLMLuzKB/YBWurQUScUhRNvqOwfH+/LRZ+j
	PxmpIK+1MpKqZ1SRSW9vwxomxGA6GCC0uLvD5iiLvanh8R/56kmi8A6IMaVhAPToKnol
	c4fw7a81ziDmrlvnfRh9IHCzaQQO1ducx0AH8X3BIXizvRpzg9TpCX7kCAcTzh1YK92+
	zYaU0gg4csz94Qyi8upUZuJoxiISWq20RHpvVoyB3q1M09R3cxHpZW73AUmfD483WIXF
	kfRg==
X-Gm-Message-State: AIkVDXIdHraXILmy1q14TIHbDX7dcEv2a6fqDAOmmc/w+GJxYmGCMyGJJ2Nvb56qNV2aoNjcFPEc+gIZNyLvSfTH
X-Received: by 10.129.111.194 with SMTP id k185mr27769668ywc.328.1485253106756;
	Tue, 24 Jan 2017 02:18:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.13.234.11 with HTTP; Tue, 24 Jan 2017 02:17:56 -0800 (PST)
In-Reply-To: <502e675a-bdaa-3acd-5343-5cb2f40f2a7a@mender.io>
References: <502e675a-bdaa-3acd-5343-5cb2f40f2a7a@mender.io>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 24 Jan 2017 12:17:56 +0200
Message-ID: <CAHiDW_HwmNybt8AuLWBtMSW=8R1SO3GBChRmwtCkWkmq3bFB0g@mail.gmail.com>
To: Kristian Amlie <kristian.amlie@mender.io>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Subject: Re: Recipe specific sysroots: New failure to compile Go
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
X-List-Received-Date: Tue, 24 Jan 2017 10:18:27 -0000
Content-Type: multipart/alternative; boundary=001a1147194ad49caa0546d46fe3

--001a1147194ad49caa0546d46fe3
Content-Type: text/plain; charset=UTF-8

On 24 January 2017 at 11:36, Kristian Amlie <kristian.amlie@mender.io>
wrote:
[snip]

> /home/jenkins/workspace/yoctobuild/build-qemu/tmp/
> work/x86_64-linux/go-native/1.7.4-r0/recipe-sysroot-native/
> usr/lib/go-bootstrap-native-1.4.3/pkg/tool/linux_amd64/6l:
> readsym out of sync
> | WARNING: exit code 2 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at
> /home/jenkins/workspace/yoctobuild/build-qemu/tmp/
> work/x86_64-linux/go-native/1.7.4-r0/temp/log.do_compile.10566)
> ERROR: Task
> (virtual:native:/home/jenkins/workspace/yoctobuild/oe-meta-
> go/recipes-devtools/go/go_1.7.4.bb:do_compile)
> failed with exit code '1'
> -----------------------------------------------
>
> Note in particular the "readsym out of sync", which appears to be the
> heart of the problem.
>
> Using git bisect I have verified that it is the commit
> 9107d6ca144ac1f6169830dee25dae2dad775333, the introduction of recipe
> specific sysroots, that breaks the build. However, I cannot see an
> obvious link between the two, the error looks very internal to Go. Any
> clue what's going on?
>

This could be a symptom of a missing dependency in the go (or go-bootstrap)
recipe: the recipe specific sysroot only contains the specified build
dependencies unlike the previous system where the sysroot typically
contained loads of other things as well.

I'm afraid I don't have any more specific suggestions.

 Jussi

--001a1147194ad49caa0546d46fe3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
4 January 2017 at 11:36, Kristian Amlie <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:kristian.amlie@mender.io" target=3D"_blank">kristian.amlie@mender.io</=
a>&gt;</span> wrote:</div><div class=3D"gmail_quote">[snip]<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">/home/jenkins/workspace/<wbr>yoctobuild/build-qemu/tmp/<=
wbr>work/x86_64-linux/go-native/1.<wbr>7.4-r0/recipe-sysroot-native/<wbr>us=
r/lib/go-bootstrap-native-1.<wbr>4.3/pkg/tool/linux_amd64/6l:<br>
readsym out of sync<br>
| WARNING: exit code 2 from a shell command.<br>
| ERROR: Function failed: do_compile (log file is located at<br>
/home/jenkins/workspace/<wbr>yoctobuild/build-qemu/tmp/<wbr>work/x86_64-lin=
ux/go-native/1.<wbr>7.4-r0/temp/log.do_compile.<wbr>10566)<br>
ERROR: Task<br>
(virtual:native:/home/jenkins/<wbr>workspace/yoctobuild/oe-meta-<wbr>go/rec=
ipes-devtools/go/go_1.7.<wbr>4.bb:do_compile)<br>
failed with exit code &#39;1&#39;<br>
------------------------------<wbr>-----------------<br>
<br>
Note in particular the &quot;readsym out of sync&quot;, which appears to be=
 the<br>
heart of the problem.<br>
<br>
Using git bisect I have verified that it is the commit<br>
9107d6ca144ac1f6169830dee25dae<wbr>2dad775333, the introduction of recipe<b=
r>
specific sysroots, that breaks the build. However, I cannot see an<br>
obvious link between the two, the error looks very internal to Go. Any<br>
clue what&#39;s going on?<br></blockquote><div><br></div><div>This could be=
 a symptom of a missing dependency in the go (or go-bootstrap) recipe: the =
recipe specific sysroot only contains the specified build dependencies unli=
ke the previous system where the sysroot typically contained loads of other=
 things as well.</div><div><br></div><div>I&#39;m afraid I don&#39;t have a=
ny more specific suggestions.</div><div>=C2=A0</div><div>=C2=A0Jussi<br></d=
iv><div>=C2=A0</div></div></div></div>

--001a1147194ad49caa0546d46fe3--
