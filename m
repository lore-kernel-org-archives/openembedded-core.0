Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
	[209.85.210.44])
	by mail.openembedded.org (Postfix) with ESMTP id 725D774CB4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 12:02:29 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id l1so22212793otj.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 05:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hoiOcavxAlXN2r6iGon74VFFoXHrBjxL9PhGyDx0sDk=;
	b=c7Mjbz0tZVerEqDcoa1i60vd+GWkm2SZAt+BkXZ+E2W8Ndq6SowaVWMHHOf6uGfrKD
	okzTA//uHL0/sOBVNAeHNiwue1zh8HD1RZU5siTTZgQIGILc3ZXeYslRJ6+fbFpgVSY8
	qWhWJgsCDE/dLZnlVzkSnyOgtEYmKWXPXwj6AZmXqUYqV28zNdBy1w4h6pK/LT85ObaZ
	PnFzwidEe+zEWYW08gkg4BEzqrL8qkEd67rfwXQw7bD7ay6aWeWuQrJ0/qEDlJdG8QKO
	ppI62T+G2FIfETYQr9QyFTyp1lLc4/15hqUXnm48KrEpp/WJLx35KuabesnYITKJ7+57
	+MvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hoiOcavxAlXN2r6iGon74VFFoXHrBjxL9PhGyDx0sDk=;
	b=AIfW+8Gv0NMaav0cc3ciw6VIyX7ZBmtFByRSC7EfvnEMGdm0nE1fEUWrXWZYJVnqMO
	gD+rKgTKakMAlg5wwdyByFugOT3nr7IwUuNsxXtDgiwYOGr0yeI03cXh30GgYc0PAJdy
	VqCYFGapH1XqLTNZazkSJSF/a/5rS7hECkMM/Lv1vleJj5nPrQNvmVYCjzngef5Fkvlk
	a6jHQX+Q8u7trZ8IfxfVL/ntKvjRMLTjxc0B0uVWIDGPELYwamVF+5Cs3m/9THZUZKCs
	iZwzRy3Dv4stmJZFdLtoCfaHwT8Tt04JhxH7kIgOVl6tlqgkltVYAsbqBDpm6Xos16nv
	yXxQ==
X-Gm-Message-State: ABuFfohc/xEtpcE/M46WEs2b4/w7LPtKgpVdBp/WtrlPv12BfMg+JnJ2
	RcOIULLBFUt7KoXdWfV+aMcrWWAmS8JybwOWXDsT0w==
X-Google-Smtp-Source: ACcGV62KGyiFwCwhrHtJlaUqfBLC9S4M0O2FzZ2rmzzD0mUeHSO1vMrjg7prbmYEsL6DmEoTzq286fd+by1ZtgEExuc=
X-Received: by 2002:a9d:30ae:: with SMTP id s46mr14755586otc.132.1539691350341;
	Tue, 16 Oct 2018 05:02:30 -0700 (PDT)
MIME-Version: 1.0
References: <1539581457-120937-1-git-send-email-changqing.li@windriver.com>
	<CAJTo0LZ+U1t=rnLcrZMDD+AoS-SbJ23Hc1fd9twa4qRFh=N1sQ@mail.gmail.com>
	<4b65d79c-906c-63dd-53c8-bb9c297f72e3@windriver.com>
In-Reply-To: <4b65d79c-906c-63dd-53c8-bb9c297f72e3@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Oct 2018 13:02:18 +0100
Message-ID: <CAJTo0Lbxw5uv=8oQKWG1aN3i13Y4RfcgKyEeqjF_eUr+mZ8boQ@mail.gmail.com>
To: changqing.li@windriver.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] freetype: remove compile of windows resource files
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
X-List-Received-Date: Tue, 16 Oct 2018 12:02:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Oct 2018 at 04:36, Changqing Li <changqing.li@windriver.com> wrote:
> do_compile failed with below error:
> x86_64-wrs-linux-libtool: compile:  x86_64-wrs-linux-windres
> --include-dir=work/corei7-64-wrs-linux/freetype/2.9.1-r0/recipe-sysroot/usr/include
> /work/corei7-64-wrs-linux/freetype/2.9.1-r0/freetype-2.9.1/src/base/ftver.rc
> -o work/corei7-64-wrs-linux/freetype/2.9.1-r0/build/.libs/ftver.o
> work/corei7-64-wrs-linux/freetype/2.9.1-r0/build//x86_64-wrs-linux-libtool:
> line 1752: x86_64-wrs-linux-windres: command not found
> work/corei7-64-wrs-linux/freetype/2.9.1-r0/freetype-2.9.1/builds/freetype.mk:263:
> recipe for target
> 'work/corei7-64-wrs-linux/freetype/2.9.1-r0/build/ftver.lo' failed
> make: *** [work/corei7-64-wrs-linux/freetype/2.9.1-r0/build/ftver.lo]
> Error 1
> ERROR: oe_runmake failed

Right, so I'd say a better fix would be in meta-mingw to stop RC being
exported in target builds.

Ross

