Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6F64D72A78
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 11:03:41 +0000 (UTC)
Received: by qgeg42 with SMTP id g42so49105550qge.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 04:03:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=uAZJTzcES73tRsoJcs9HD1cWsWViKxwab+mf+Ejg768=;
	b=JYIcWcCtnMDK+Psvmlm6SywuKmvZcCU1XJQl7UpSoIz0SNh0ncMnlOuL/Qin9vqMI7
	6Z3RO/K/66pPhv68/SK/7zpPN0E1ZgxyHkUI4H7eJjMsriIwuuId+HIx4y548Ja4IyGu
	akg1BwJxsyWjVDlwKywQe7lUW+UkIDz6CV7QefjQS26LcnNUNQQiZa9MmtZZR0Txckcf
	k3Dq740qMFWena+YajX98K4MjEumYpDpJ4OmsBjdsP7XhdbMtOsbe9M2xOW/8bViFwqG
	8PoKq/n3PpBs9yBo59KJJ1BqWacx9h3xpkx18B2Hn67ADK/4zfM+ipsPOn8Yl94p6Uv0
	+YVg==
X-Gm-Message-State: ALoCoQlOV7J7ZWa4mJc5eNjrhQcJ3UwLZOAfhBVPagIZpnCW9gR057NN5p4KLRFF/kZ3999aP1s3
X-Received: by 10.141.28.6 with SMTP id f6mr82469487qhe.64.1439550221472; Fri,
	14 Aug 2015 04:03:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Fri, 14 Aug 2015 04:03:21 -0700 (PDT)
In-Reply-To: <12971906.mb086C5zve@peggleto-mobl.ger.corp.intel.com>
References: <cover.1439281753.git.patrick.ohly@intel.com>
	<616705173b62954740a1893c672c67eb5ce088f2.1439281753.git.patrick.ohly@intel.com>
	<CAJTo0LbnRjSYpz5F41QjR_93Ex0YdVH+QKQChbRTGLXGrRumBQ@mail.gmail.com>
	<12971906.mb086C5zve@peggleto-mobl.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Aug 2015 12:03:21 +0100
Message-ID: <CAJTo0La2Q-jeFBRND7pYoWW5HQByu7pgEcOzexqJw1FSe2fQiA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] tar-replacement-native: avoid race condition with host tar
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
X-List-Received-Date: Fri, 14 Aug 2015 11:03:44 -0000
Content-Type: multipart/alternative; boundary=001a11422ff496631e051d4367fc

--001a11422ff496631e051d4367fc
Content-Type: text/plain; charset=UTF-8

On 14 August 2015 at 12:01, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> Or install the buildtools perhaps.
>

Yes, I had that in my head but someone failed to write it down.  There's a
fair chance that a host with a sufficiently old tar also needs other
updates, and that's when buildtools is used (which includes tar).

Ross

--001a11422ff496631e051d4367fc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 August 2015 at 12:01, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"=
mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linux=
.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":2e7" class=3D"a3s" style=3D"overflow:hidden">Or install the buildtools=
 perhaps.<br></div></blockquote><div><br></div><div>Yes, I had that in my h=
ead but someone failed to write it down.=C2=A0 There&#39;s a fair chance th=
at a host with a sufficiently old tar also needs other updates, and that&#3=
9;s when buildtools is used (which includes tar).</div><div><br></div><div>=
Ross=C2=A0</div></div></div></div>

--001a11422ff496631e051d4367fc--
