Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id B126E74CF6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 12:55:42 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id j186-v6so3230440ita.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 05:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hLNVRkGpTsrEz0HoaSfH2tGZTo3QqATjxTEi7dgZaL4=;
	b=KbxgJHARsbpGimFKueMPK8ZNMZ51mShu4nzi+qkG9i++c8etkxL6ydTsi6fA5V4KBI
	AF+LXr86DibO/N/Uv1Wfv3s3fX00MFRbl9uGQS+QzYmvDj664JrF/nuCYyMbE14ku50B
	nfnhiyjvjsCFhaVRjUG4aBjI/Yjp1f15nh1dQbOozkjkDT7drkomaAiz+7frJHSQyNj+
	Yj+VQ6VXjcNz9oC+LQl0pOZvZbQ7kdVZsyL0ir6/kVI8d4HBeN4rmV9YHPa8QU92wJfo
	unKGqagGxZsJQAp9MXn8pWFmLeKi+f+zO1iQGdRGIX75UlZcSW0zLMS6/vMRsmdioO/r
	ZQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hLNVRkGpTsrEz0HoaSfH2tGZTo3QqATjxTEi7dgZaL4=;
	b=e6M+vKbxWEI/94ZG3Qx6FQY6NUUmgdo/rQCs9sNv8EtRXSuUQVvN6mKfW5tMtLwtMz
	OHGtN2/zZ2BLRDl+jBTVaQwK1yN5/BPeJGsZlfshmRtu+KKoR/JtP9fzZhbN97W3DclX
	pY+MPYXOSc5tXudo8YFVvLpNk6Kzo+6OAwPKYPfRR0ikOF2IdSnzntTItlToaP+JPyud
	uN4Tt55Po8XRJBbpbjs0SsIn40f4kYsr+fjuOKuH9YRdxN44AtbwRFQGvrO/qTcWqHWk
	D7ARLla3+T2I6JN5w7iCCG1Z6/cffpLlrhmqmDfYHPdFcM4AiehJ6awG2hUvp5HzYFIp
	g+JA==
X-Gm-Message-State: ALQs6tCMZgs98BWYAoznbL5yNWkgX19xMvvsMiIOjFFJnZr+Q4LSOZ1R
	/DETMoCrRm8l7wr5kImyBYB/MzStyhH3s5PDhQYFFw==
X-Google-Smtp-Source: AB8JxZpDXyMCBYSJqssnrfljVbVr8FVU+s1CV2+4iJARrYUb3c6i6+nl1Z/ZFmepazYIlIfKGsqUrXxi7e6+K5YxpEw=
X-Received: by 2002:a24:b803:: with SMTP id
	m3-v6mr27629468ite.131.1525438543357; 
	Fri, 04 May 2018 05:55:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.29.203 with HTTP; Fri, 4 May 2018 05:55:23 -0700 (PDT)
In-Reply-To: <CAJO0J4hyjRyj+Zzz2Y7BTg0aB-dfEQXX4pJSi11n4Vc2iYkrJw@mail.gmail.com>
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
	<20180504123244.43049-14-alexander.kanavin@linux.intel.com>
	<CAJO0J4hyjRyj+Zzz2Y7BTg0aB-dfEQXX4pJSi11n4Vc2iYkrJw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 May 2018 13:55:23 +0100
Message-ID: <CAJTo0LZSDUfpXvE9VA59wZVyTJFDW4sixh++DrdWdORrLKz4NA@mail.gmail.com>
To: Paulo Neves <ptsneves@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 14/14] babeltrace: switch over to git
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
X-List-Received-Date: Fri, 04 May 2018 12:55:42 -0000
Content-Type: multipart/alternative; boundary="000000000000811d6b056b60d641"

--000000000000811d6b056b60d641
Content-Type: text/plain; charset="UTF-8"

On 4 May 2018 at 13:46, Paulo Neves <ptsneves@gmail.com> wrote:

> I always wondered, what is the rationale for not always using the git
> repositories? If there is one why did we change for this specific
> recipe?
>

Tarballs are easier to mirror, smaller, have checksums to verify the
download at both fetch and unpack time, and often contain generated files
which otherwise require yet more tools to regenerate (for example, man
pages may require a documentation toolchain to build from git but will be
included in a tarball).


> I ask this because I am in the process of creating a massive layer,
> whose only purpose is to have the software come from the git
> repository and not from the tarballs of the original poky recipes.


I certainly hope this is using devupstream.bbclass or similar and isn't a
giant copy/paste!

Ross

--000000000000811d6b056b60d641
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 4 May 2018 at 13:46, Paulo Neves <span dir=3D"ltr">&lt;=
<a href=3D"mailto:ptsneves@gmail.com" target=3D"_blank">ptsneves@gmail.com<=
/a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">I always wondered, what is the rationale=
 for not always using the git<br>
repositories? If there is one why did we change for this specific<br>
recipe?<br></blockquote><div><br></div><div>Tarballs are easier to mirror, =
smaller, have checksums to verify the download at both fetch and unpack tim=
e, and often contain generated files which otherwise require yet more tools=
 to regenerate (for example, man pages may require a documentation toolchai=
n to build from git but will be included in a tarball).</div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
I ask this because I am in the process of creating a massive layer,<br>
whose only purpose is to have the software come from the git<br>
repository and not from the tarballs of the original poky recipes.</blockqu=
ote><div><br></div><div>I certainly hope this is using devupstream.bbclass =
or similar and isn&#39;t a giant copy/paste!</div><div><br></div><div>Ross<=
/div></div></div></div>

--000000000000811d6b056b60d641--
