Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id A480D73EDC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 15:44:46 +0000 (UTC)
Received: by qgeb100 with SMTP id b100so83208417qge.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 May 2015 08:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=6yOtDOSYizEnBgymVRSnCQwT1xXB6+Dd2VjobrhP/ZA=;
	b=Pa1eSekhp8TzVNMGs1N/UAPzOygZfK2vH8vogzx8lQl4zBvusFCEk/RP3SBGs9xuS6
	G60dS0lgF4zlq1T0+mmQnn/Ow5G92kKOV4UETuQDxjJx94gNd8vRKAXbbRXpQE0FvAF6
	gWcX31A6Y4ecirFzrV8l0i4Y6o1fRW9d6MX3QOkfwzCkrbbWI401kdhv8aJMhQv+k37D
	o1yV3GCYBJwEM8nrXV8uahglxwxSSY51W68ANtP5gH3ydhR5J35giczbjTeTSDTxA7bu
	H1153NYwfs7oBlzMpV3HJiIcfixeaEQROCzGR8V6g7PC/YlG/mE4La6XH3gAVLZy9vAK
	xOyg==
X-Gm-Message-State: ALoCoQnRRnhj6mtUWo4UHw16qny5h2JypWJsFwPwhYv8XC6f5w0hxg9cVYQ5J6d666a/IHsRuZk2
X-Received: by 10.229.110.10 with SMTP id l10mr15328217qcp.5.1430840687471;
	Tue, 05 May 2015 08:44:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 5 May 2015 08:44:27 -0700 (PDT)
In-Reply-To: <78a8e0beb1dd78a8461b994816267ec8848b2ca7.1427262046.git.liezhi.yang@windriver.com>
References: <cover.1427262046.git.liezhi.yang@windriver.com>
	<78a8e0beb1dd78a8461b994816267ec8848b2ca7.1427262046.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 May 2015 16:44:27 +0100
Message-ID: <CAJTo0LZ+i0JH957CCT-mkt3T7iFEPj-gbiNYE1+ckoO6O2bsCw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libarchive: set CLEANBROKEN
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
X-List-Received-Date: Tue, 05 May 2015 15:44:48 -0000
Content-Type: multipart/alternative; boundary=001a11344c84e849a70515578e84

--001a11344c84e849a70515578e84
Content-Type: text/plain; charset=UTF-8

On 25 March 2015 at 05:41, Robert Yang <liezhi.yang@windriver.com> wrote:

> Errors when rebuild:
> checking for xml2-config...
> /path/to/tmp/sysroots/qemux86-64/usr/bin/crossscripts/xml2-config
> checking for xmlInitParser in -lxml2... no
> configure: error: in
> `/path/to/tmp/work/core2-64-poky-linux/libarchive/3.1.2-r0/libarchive-3.1.2':
> configure: error: Missing xml2 library
>

I haven't managed to fix autotools.bbclass but I have just submitted a
patch to let libarchive use autotools (not -brokensep).

Ross

--001a11344c84e849a70515578e84
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 March 2015 at 05:41, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":c0v" cl=
ass=3D"a3s" style=3D"overflow:hidden">Errors when rebuild:<br>
checking for xml2-config... /path/to/tmp/sysroots/qemux86-64/usr/bin/crosss=
cripts/xml2-config<br>
checking for xmlInitParser in -lxml2... no<br>
configure: error: in `/path/to/tmp/work/core2-64-poky-linux/libarchive/3.1.=
2-r0/libarchive-3.1.2&#39;:<br>
configure: error: Missing xml2 library<br></div></blockquote></div><br>I ha=
ven&#39;t managed to fix autotools.bbclass but I have just submitted a patc=
h to let libarchive use autotools (not -brokensep).</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11344c84e849a70515578e84--
